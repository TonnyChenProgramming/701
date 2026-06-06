library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

use work.asp_types.all;
use work.TdmaMinTypes.all;
use work.asp_packet_pkg.all;

entity gp2_final_hwloop0_tb is
end entity gp2_final_hwloop0_tb;

architecture sim of gp2_final_hwloop0_tb is
    constant CLK_PERIOD : time := 20 ns;
    constant NULL_TDMA_PORT : tdma_min_port := (
        addr => NULL_ADDR,
        data => (others => '0')
    );

    constant REG_TX_PACKET       : std_logic_vector(2 downto 0) := "000";
    constant REG_TX_CONTROL      : std_logic_vector(2 downto 0) := "001";
    constant REG_RX_PACKET       : std_logic_vector(2 downto 0) := "011";
    constant REG_RX_CONTROL      : std_logic_vector(2 downto 0) := "100";
    constant REG_RX_STATUS       : std_logic_vector(2 downto 0) := "101";
    constant REG_ADAPTER_STATUS  : std_logic_vector(2 downto 0) := "110";
    constant REG_ADAPTER_CONTROL : std_logic_vector(2 downto 0) := "111";

    signal clock : bit_1 := '0';
    signal reset : bit_1 := '1';

    signal avs_address   : std_logic_vector(2 downto 0) := (others => '0');
    signal avs_read      : std_logic := '0';
    signal avs_write     : std_logic := '0';
    signal avs_writedata : std_logic_vector(31 downto 0) := (others => '0');
    signal avs_readdata  : std_logic_vector(31 downto 0);
    signal irq           : std_logic;

    signal nios_send  : tdma_min_port := NULL_TDMA_PORT;
    signal nios_recv  : tdma_min_port := NULL_TDMA_PORT;
    signal recop_send : tdma_min_port := NULL_TDMA_PORT;
    signal recop_recv : tdma_min_port := NULL_TDMA_PORT;

    signal key : std_logic_vector(3 downto 0) := "1111";
    signal sw  : std_logic_vector(9 downto 0) := (others => '0');
    signal recop_ledr : std_logic_vector(9 downto 0);

    signal debug_route      : tdma_min_port := NULL_TDMA_PORT;
    signal debug_nios_send  : tdma_min_port := NULL_TDMA_PORT;
    signal debug_recop_send : tdma_min_port := NULL_TDMA_PORT;
    signal debug_adc_send   : tdma_min_port := NULL_TDMA_PORT;
    signal debug_avg_send   : tdma_min_port := NULL_TDMA_PORT;
    signal debug_cor_send   : tdma_min_port := NULL_TDMA_PORT;
    signal debug_pk_send    : tdma_min_port := NULL_TDMA_PORT;

    procedure wait_clocks(signal clk : in bit_1; count : natural) is
    begin
        for i in 1 to count loop
            wait until rising_edge(clk);
        end loop;
    end procedure;

    procedure avalon_write(
        signal clk       : in bit_1;
        signal address   : out std_logic_vector(2 downto 0);
        signal write     : out std_logic;
        signal writedata : out std_logic_vector(31 downto 0);
        constant reg     : in std_logic_vector(2 downto 0);
        constant value   : in std_logic_vector(31 downto 0)
    ) is
    begin
        address <= reg;
        writedata <= value;
        write <= '1';
        wait until rising_edge(clk);
        write <= '0';
        writedata <= (others => '0');
        wait until rising_edge(clk);
    end procedure;

    procedure avalon_read(
        signal clk      : in bit_1;
        signal address  : out std_logic_vector(2 downto 0);
        signal read     : out std_logic;
        signal readdata : in std_logic_vector(31 downto 0);
        constant reg    : in std_logic_vector(2 downto 0);
        variable value  : out std_logic_vector(31 downto 0)
    ) is
    begin
        address <= reg;
        read <= '1';
        wait for 1 ns;
        value := readdata;
        wait until rising_edge(clk);
        read <= '0';
        wait until rising_edge(clk);
    end procedure;

    procedure adapter_send_packet(
        signal clk       : in bit_1;
        signal address   : out std_logic_vector(2 downto 0);
        signal write     : out std_logic;
        signal writedata : out std_logic_vector(31 downto 0);
        constant packet  : in packet_word_t
    ) is
    begin
        avalon_write(clk, address, write, writedata, REG_TX_PACKET, packet);
        avalon_write(clk, address, write, writedata, REG_TX_CONTROL, x"00000001");
        wait_clocks(clk, 12);
    end procedure;

    procedure pulse_recop_start(
        signal clk : in bit_1;
        signal key_signal : out std_logic_vector(3 downto 0);
        signal sw_signal : out std_logic_vector(9 downto 0);
        constant dest_select : in std_logic_vector(1 downto 0)
    ) is
    begin
        sw_signal(1 downto 0) <= dest_select;
        wait until rising_edge(clk);
        key_signal <= "0111";
        wait_clocks(clk, 3);
        key_signal <= "1111";
        wait_clocks(clk, 12);
    end procedure;
begin
    clock <= not clock after CLK_PERIOD / 2;

    u_adapter : entity work.avalon_noc_adapter
        port map (
            clk => clock,
            reset => reset,
            avs_address => avs_address,
            avs_read => avs_read,
            avs_write => avs_write,
            avs_writedata => avs_writedata,
            avs_readdata => avs_readdata,
            irq => irq,
            send => nios_send,
            recv => nios_recv
        );

    u_recop_control : entity work.gp2_recop_control_io
        port map (
            clk => clock,
            reset => reset,
            key => key,
            sw => sw,
            recv => recop_recv,
            send => recop_send,
            ledr => recop_ledr
        );

    u_dut : entity work.gp2_final_noc_asp_top
        port map (
            clock => clock,
            reset => reset,
            init  => '0',
            nios_send => nios_send,
            nios_recv => nios_recv,
            recop_send => recop_send,
            recop_recv => recop_recv,
            debug_route => debug_route,
            debug_nios_send => debug_nios_send,
            debug_recop_send => debug_recop_send,
            debug_adc_send => debug_adc_send,
            debug_avg_send => debug_avg_send,
            debug_cor_send => debug_cor_send,
            debug_pk_send => debug_pk_send
        );

    stim : process
        variable adapter_status : std_logic_vector(31 downto 0);
        variable rx_status      : std_logic_vector(31 downto 0);
        variable rx_packet      : packet_word_t;
        variable saw_count_event : boolean := false;
        variable saw_value_event : boolean := false;
        variable saw_leds       : boolean := false;
        variable elapsed_cycles : natural := 0;
    begin
        wait_clocks(clock, 5);
        reset <= '0';
        wait_clocks(clock, 5);

        -- Equivalent of console command: hwclear + hwloop 0.
        avalon_write(
            clock,
            avs_address,
            avs_write,
            avs_writedata,
            REG_ADAPTER_CONTROL,
            x"00000001"
        );

        avalon_read(clock, avs_address, avs_read, avs_readdata, REG_ADAPTER_STATUS, adapter_status);
        assert adapter_status(4) = '0'
            report "Adapter local loopback should be disabled for hwloop 0"
            severity failure;
        report "FINAL HWLOOP0: adapter local loopback disabled";

        -- Nios config commands:
        --   ADC -> AVG, channel 0, divider 4
        --     Divider 4 keeps the ADC sample stream within the TDMA slot
        --     bandwidth so downstream ASPs see consecutive samples.
        --   AVG -> COR, window 4
        --   COR window 4, offset 100
        --   Peak -> Nios, spacing 0, threshold 0
        adapter_send_packet(
            clock,
            avs_address,
            avs_write,
            avs_writedata,
            make_packet(PKT_KIND_CMD, CMD_CONFIG, ADC_ADDR(3 downto 0), x"21000")
        );

        adapter_send_packet(
            clock,
            avs_address,
            avs_write,
            avs_writedata,
            make_packet(PKT_KIND_CMD, CMD_CONFIG, AVE_ASP_ADDR(3 downto 0), x"30200")
        );

        adapter_send_packet(
            clock,
            avs_address,
            avs_write,
            avs_writedata,
            make_packet(PKT_KIND_CMD, CMD_CONFIG, COR_ASP_ADDR(3 downto 0), x"00004")
        );

        adapter_send_packet(
            clock,
            avs_address,
            avs_write,
            avs_writedata,
            make_packet(PKT_KIND_CMD, CMD_CONFIG, COR_ASP_ADDR(3 downto 0), x"10064")
        );

        adapter_send_packet(
            clock,
            avs_address,
            avs_write,
            avs_writedata,
            make_packet(PKT_KIND_CMD, CMD_CONFIG, PK_ADDR(3 downto 0), x"50000")
        );

        -- ReCOP START pulses from KEY/SW, same order as the board demo:
        -- AVG, COR, PK, then ADC.
        pulse_recop_start(clock, key, sw, "01");
        pulse_recop_start(clock, key, sw, "10");
        pulse_recop_start(clock, key, sw, "11");
        pulse_recop_start(clock, key, sw, "00");

        for i in 0 to 500 loop
            wait until rising_edge(clock);
            elapsed_cycles := elapsed_cycles + 1;

            if recop_ledr(3 downto 0) = "1111" then
                saw_leds := true;
                report "FINAL HWLOOP0: ReCOP status LEDs show PK/COR/AVG/ADC running at cycle "
                     & natural'image(elapsed_cycles);
                exit;
            end if;
        end loop;

        assert saw_leds
            report "ReCOP did not receive running status from all ASPs"
            severity failure;

        for i in 0 to 5000 loop
            avalon_read(clock, avs_address, avs_read, avs_readdata, REG_RX_STATUS, rx_status);

            if rx_status(0) = '1' then
                avalon_read(clock, avs_address, avs_read, avs_readdata, REG_RX_PACKET, rx_packet);
                report "FINAL HWLOOP0: Nios adapter RX packet=0x" & to_hstring(rx_packet);

                assert packet_kind(rx_packet) = PKT_KIND_EVENT
                    report "Expected Peak EVENT packet at Nios RX"
                    severity failure;

                assert packet_dest(rx_packet) = NIOS_II_ADDR(3 downto 0)
                    report "Peak EVENT destination should be Nios II"
                    severity failure;

                if not saw_count_event then
                    assert packet_code(rx_packet) = EVENT_MAX_PEAK
                        report "Expected EVENT_MAX_PEAK at Nios RX"
                        severity failure;

                    saw_count_event := true;
                else
                    assert packet_code(rx_packet) = EVENT_PEAK_VALUE
                        report "Expected EVENT_PEAK_VALUE after EVENT_MAX_PEAK"
                        severity failure;

                    report "FINAL HWLOOP0: peak value payload="
                         & integer'image(to_integer(unsigned(packet_payload(rx_packet))));
                    saw_value_event := true;
                end if;

                avalon_write(
                    clock,
                    avs_address,
                    avs_write,
                    avs_writedata,
                    REG_RX_CONTROL,
                    x"00000001"
                );

                if saw_value_event then
                    exit;
                end if;
            end if;

            wait_clocks(clock, 4);
        end loop;

        assert saw_count_event
            report "No Peak EVENT reached the Nios adapter with hwloop 0"
            severity failure;

        assert saw_value_event
            report "No Peak value EVENT reached the Nios adapter with hwloop 0"
            severity failure;

        report "GP2 FINAL Nios/ReCOP/ASP NoC hwloop 0 integration test PASSED";
        wait;
    end process;
end architecture sim;
