library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

use work.asp_types.all;
use work.TdmaMinTypes.all;
use work.asp_packet_pkg.all;

entity gp2_asp_noc_real_pipeline_tb is
end entity gp2_asp_noc_real_pipeline_tb;

architecture sim of gp2_asp_noc_real_pipeline_tb is
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
        variable saw_adc_data       : boolean := false;
        variable saw_avg_data       : boolean := false;
        variable saw_cor_low        : boolean := false;
        variable saw_cor_high       : boolean := false;
        variable saw_pk_event       : boolean := false;
        variable first_adc_cycle    : natural := 0;
        variable first_avg_cycle    : natural := 0;
        variable first_cor_cycle    : natural := 0;
        variable first_event_cycle  : natural := 0;
        variable elapsed_cycles     : natural := 0;
        variable cor_word           : packet_word_t;
        variable rx_word            : packet_word_t;
    begin
        wait_clocks(clock, 5);
        reset <= '0';
        init  <= '0';
        wait_clocks(clock, 5);

        -- Real ASP pipeline configuration:
        --   ADC -> AVG, channel 0, divider 4
        --     The standalone NoC harness gives ADC one forwarding slot per
        --     TDMA frame. Divider 4 paces the ADC so AVG receives consecutive
        --     ROM samples instead of an oversubscribed/skipped stream.
        --   AVG -> COR, window 4
        --   COR window 4, offset 100, then START correlation mode
        --   Peak -> Nios, spacing 0, threshold 0
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
            make_packet(PKT_KIND_CMD, CMD_CONFIG, AVE_ASP_ADDR(3 downto 0), x"30200")
        );

        send_mock_packet(
            clock,
            mock_send,
            COR_ASP_ADDR,
            make_packet(PKT_KIND_CMD, CMD_CONFIG, COR_ASP_ADDR(3 downto 0), x"00004")
        );

        send_mock_packet(
            clock,
            mock_send,
            COR_ASP_ADDR,
            make_packet(PKT_KIND_CMD, CMD_CONFIG, COR_ASP_ADDR(3 downto 0), x"10064")
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
            COR_ASP_ADDR,
            make_packet(PKT_KIND_CMD, CMD_START, COR_ASP_ADDR(3 downto 0), (others => '0'))
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

        for i in 0 to 20000 loop
            wait until rising_edge(clock);
            elapsed_cycles := elapsed_cycles + 1;

            if debug_adc_send.addr = AVE_ASP_ADDR
               and packet_kind(debug_adc_send.data) = PKT_KIND_DATA then
                if not saw_adc_data then
                    saw_adc_data := true;
                    first_adc_cycle := elapsed_cycles;
                    report "REAL PIPE: first ADC raw DATA at cycle "
                         & natural'image(first_adc_cycle)
                         & " packet=0x"
                         & to_hstring(debug_adc_send.data);
                    assert debug_adc_send.data = x"20200000"
                        report "Expected paced ADC stream to start with ROM sample 0"
                        severity failure;
                end if;
            end if;

            if debug_avg_send.addr = COR_ASP_ADDR
               and packet_kind(debug_avg_send.data) = PKT_KIND_DATA then
                if not saw_avg_data then
                    saw_avg_data := true;
                    first_avg_cycle := elapsed_cycles;
                    report "REAL PIPE: first AVG window-4 DATA at cycle "
                         & natural'image(first_avg_cycle)
                         & " packet=0x"
                         & to_hstring(debug_avg_send.data);
                    assert debug_avg_send.data = x"203001F7"
                        report "Expected AVG of consecutive samples 0,383,707,924"
                        severity failure;
                end if;
            end if;

            cor_word := debug_cor_send.data;
            if debug_cor_send.addr = PK_ADDR
               and packet_kind(cor_word) = PKT_KIND_DATA
               and packet_code(cor_word) = TAG_RESULT_LOW then
                if not saw_cor_low then
                    saw_cor_low := true;
                    first_cor_cycle := elapsed_cycles;
                    report "REAL PIPE: first COR RESULT_LOW at cycle "
                         & natural'image(first_cor_cycle)
                         & " packet=0x"
                         & to_hstring(cor_word);
                end if;
            end if;

            if debug_cor_send.addr = PK_ADDR
               and packet_kind(cor_word) = PKT_KIND_DATA
               and packet_code(cor_word) = TAG_RESULT_HIGH then
                if not saw_cor_high then
                    saw_cor_high := true;
                    report "REAL PIPE: first COR RESULT_HIGH at cycle "
                         & natural'image(elapsed_cycles)
                         & " packet=0x"
                         & to_hstring(cor_word);
                end if;
            end if;

            rx_word := mock_recv.data;
            if mock_recv.addr = NIOS_II_ADDR
               and packet_kind(rx_word) = PKT_KIND_EVENT then
                saw_pk_event := true;
                first_event_cycle := elapsed_cycles;
                report "REAL PIPE: first Peak EVENT to Nios at cycle "
                     & natural'image(first_event_cycle)
                     & " packet=0x"
                     & to_hstring(rx_word);
                exit;
            end if;
        end loop;

        assert saw_adc_data
            report "REAL PIPE: no ADC raw DATA packet observed"
            severity failure;

        assert saw_avg_data
            report "REAL PIPE: no AVG window-4 DATA packet observed"
            severity failure;

        assert saw_cor_low
            report "REAL PIPE: no COR RESULT_LOW packet observed"
            severity failure;

        assert saw_cor_high
            report "REAL PIPE: no COR RESULT_HIGH packet observed"
            severity failure;

        assert saw_pk_event
            report "REAL PIPE: no Peak EVENT reached Nios/output sink"
            severity failure;

        report "REAL PIPE: ADC raw to first COR result latency = "
             & natural'image(first_cor_cycle - first_adc_cycle)
             & " NoC clock cycles";

        report "REAL PIPE: ADC raw to first Peak EVENT latency = "
             & natural'image(first_event_cycle - first_adc_cycle)
             & " NoC clock cycles";

        report "GP2 Member C REAL ASP pipeline integration test PASSED";
        wait;
    end process;
end architecture sim;
