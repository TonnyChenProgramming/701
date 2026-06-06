library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

use work.asp_types.all;
use work.TdmaMinTypes.all;
use work.asp_packet_pkg.all;

entity gp2_asp_noc_tb is
end entity gp2_asp_noc_tb;

architecture sim of gp2_asp_noc_tb is
    constant CLK_PERIOD : time := 20 ns;
    constant NULL_TDMA_PORT : tdma_min_port := (
        addr => NULL_ADDR,
        data => (others => '0')
    );

    signal clock : bit_1 := '0';
    signal reset : bit_1 := '1';
    signal init  : bit_1 := '1';

    signal mock_send : tdma_min_port := NULL_TDMA_PORT;
    signal mock_recv : tdma_min_port := NULL_TDMA_PORT;

    signal debug_route    : tdma_min_port := NULL_TDMA_PORT;
    signal debug_adc_send : tdma_min_port := NULL_TDMA_PORT;
    signal debug_avg_send : tdma_min_port := NULL_TDMA_PORT;
    signal debug_cor_send : tdma_min_port := NULL_TDMA_PORT;
    signal debug_pk_send  : tdma_min_port := NULL_TDMA_PORT;

    procedure wait_clocks(signal clk : in bit_1; count : natural) is
    begin
        for i in 1 to count loop
            wait until rising_edge(clk);
        end loop;
    end procedure;

    procedure send_mock_packet(
        signal clk : in bit_1;
        signal tx  : out tdma_min_port;
        constant addr : in addr8_t;
        constant data : in packet_word_t
    ) is
    begin
        tx <= (addr => addr, data => data);
        wait until rising_edge(clk);
        tx <= NULL_TDMA_PORT;
        wait_clocks(clk, 8);
    end procedure;
begin
    clock <= not clock after CLK_PERIOD / 2;

    u_dut : entity work.gp2_asp_noc_top
        port map (
            clock => clock,
            reset => reset,
            init  => init,

            mock_send => mock_send,
            mock_recv => mock_recv,

            debug_route    => debug_route,
            debug_adc_send => debug_adc_send,
            debug_avg_send => debug_avg_send,
            debug_cor_send => debug_cor_send,
            debug_pk_send  => debug_pk_send
        );

    stim : process
        variable saw_adc_data        : boolean := false;
        variable saw_avg_data        : boolean := false;
        variable saw_cor_to_peak     : boolean := false;
        variable saw_output_event    : boolean := false;
        variable first_adc_cycle     : natural := 0;
        variable output_event_cycle  : natural := 0;
        variable elapsed_cycles      : natural := 0;
        variable rx_word             : packet_word_t;
    begin
        wait_clocks(clock, 5);
        reset <= '0';
        init  <= '0';
        wait_clocks(clock, 5);

        -- mock ReCOP/Nios setup packets. They match the shared packet table:
        -- ADC -> AVG, AVG -> COR, Peak -> Nios, then START each streaming ASP.
        send_mock_packet(
            clock,
            mock_send,
            ADC_ADDR,
            make_packet(PKT_KIND_CMD, CMD_CONFIG, ADC_ADDR(3 downto 0), x"21000")
        );

        send_mock_packet(
            clock,
            mock_send,
            AVE_ASP_ADDR,
            make_packet(PKT_KIND_CMD, CMD_CONFIG, AVE_ASP_ADDR(3 downto 0), x"30000")
        );

        send_mock_packet(
            clock,
            mock_send,
            PK_ADDR,
            make_packet(PKT_KIND_CMD, CMD_CONFIG, PK_ADDR(3 downto 0), x"50000")
        );

        send_mock_packet(
            clock,
            mock_send,
            AVE_ASP_ADDR,
            make_packet(PKT_KIND_CMD, CMD_START, AVE_ASP_ADDR(3 downto 0), (others => '0'))
        );

        send_mock_packet(
            clock,
            mock_send,
            PK_ADDR,
            make_packet(PKT_KIND_CMD, CMD_START, PK_ADDR(3 downto 0), (others => '0'))
        );

        send_mock_packet(
            clock,
            mock_send,
            ADC_ADDR,
            make_packet(PKT_KIND_CMD, CMD_START, ADC_ADDR(3 downto 0), (others => '0'))
        );

        -- Observe the data path and measure latency from the first ADC data
        -- packet observed at the NoC boundary to the first PK event delivered
        -- to the output sink/Nios address.
        for i in 0 to 8000 loop
            wait until rising_edge(clock);
            elapsed_cycles := elapsed_cycles + 1;

            if debug_adc_send.addr = AVE_ASP_ADDR
               and packet_kind(debug_adc_send.data) = PKT_KIND_DATA then
                if not saw_adc_data then
                    saw_adc_data := true;
                    first_adc_cycle := elapsed_cycles;
                    report "First ADC DATA packet observed at cycle "
                         & natural'image(first_adc_cycle);
                end if;
            end if;

            if debug_avg_send.addr = COR_ASP_ADDR
               and packet_kind(debug_avg_send.data) = PKT_KIND_DATA then
                saw_avg_data := true;
            end if;

            if debug_cor_send.addr = PK_ADDR
               and packet_kind(debug_cor_send.data) = PKT_KIND_DATA then
                saw_cor_to_peak := true;
            end if;

            rx_word := mock_recv.data;
            if mock_recv.addr = NIOS_II_ADDR
               and packet_kind(rx_word) = PKT_KIND_EVENT then
                saw_output_event := true;
                output_event_cycle := elapsed_cycles;
                report "First output EVENT packet observed at cycle "
                     & natural'image(output_event_cycle);
                exit;
            end if;
        end loop;

        assert saw_adc_data
            report "No ADC DATA packet was observed on the NoC"
            severity failure;

        assert saw_avg_data
            report "No AVG DATA packet was observed on the NoC"
            severity failure;

        assert saw_cor_to_peak
            report "No COR-to-Peak DATA packet was observed on the NoC"
            severity failure;

        assert saw_output_event
            report "No output EVENT packet reached the Nios/output sink"
            severity failure;

        report "Measured ASP pipeline latency = "
             & natural'image(output_event_cycle - first_adc_cycle)
             & " NoC clock cycles from first ADC DATA to first output EVENT";

        report "GP2 Member C ASP/NoC standalone integration test PASSED";
        wait;
    end process;
end architecture sim;
