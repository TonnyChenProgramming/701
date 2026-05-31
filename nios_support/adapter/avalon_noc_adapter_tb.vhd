library ieee;
use ieee.std_logic_1164.all;

use work.asp_packet_pkg.all;
use work.TdmaMinTypes.all;

entity avalon_noc_adapter_tb is
end entity avalon_noc_adapter_tb;

architecture sim of avalon_noc_adapter_tb is
    signal clk           : std_logic := '0';
    signal reset         : std_logic := '1';
    signal avs_address   : std_logic_vector(2 downto 0) := (others => '0');
    signal avs_read      : std_logic := '0';
    signal avs_write     : std_logic := '0';
    signal avs_writedata : std_logic_vector(31 downto 0) := (others => '0');
    signal avs_readdata  : std_logic_vector(31 downto 0);
    signal irq           : std_logic;
    signal send          : tdma_min_port := (addr => NULL_ADDR, data => (others => '0'));
    signal recv          : tdma_min_port := (addr => NULL_ADDR, data => (others => '0'));
    signal test_done     : std_logic := '0';

    constant REG_TX_PACKET  : std_logic_vector(2 downto 0) := "000";
    constant REG_TX_CONTROL : std_logic_vector(2 downto 0) := "001";
    constant REG_TX_STATUS  : std_logic_vector(2 downto 0) := "010";
    constant REG_RX_PACKET  : std_logic_vector(2 downto 0) := "011";
    constant REG_RX_CONTROL : std_logic_vector(2 downto 0) := "100";
    constant REG_RX_STATUS  : std_logic_vector(2 downto 0) := "101";

    constant ADC_CONFIG_PACKET : packet_word_t := x"11120000";
    constant PK_EVENT_PACKET   : packet_word_t := x"41500140";
begin
    clk <= not clk after 5 ns;

    u_adapter : entity work.avalon_noc_adapter
        port map (
            clk           => clk,
            reset         => reset,
            avs_address   => avs_address,
            avs_read      => avs_read,
            avs_write     => avs_write,
            avs_writedata => avs_writedata,
            avs_readdata  => avs_readdata,
            irq           => irq,
            send          => send,
            recv          => recv
        );

    process
        procedure avalon_write(
            constant address : in std_logic_vector(2 downto 0);
            constant data    : in std_logic_vector(31 downto 0)
        ) is
        begin
            avs_address   <= address;
            avs_writedata <= data;
            avs_write     <= '1';
            wait until rising_edge(clk);
            wait for 1 ns;
            avs_write     <= '0';
            avs_writedata <= (others => '0');
        end procedure;

        procedure avalon_expect(
            constant address  : in std_logic_vector(2 downto 0);
            constant expected : in std_logic_vector(31 downto 0);
            constant message  : in string
        ) is
        begin
            avs_address <= address;
            avs_read    <= '1';
            wait for 1 ns;
            assert avs_readdata = expected report message severity failure;
            avs_read <= '0';
        end procedure;
    begin
        wait until rising_edge(clk);
        wait until rising_edge(clk);
        reset <= '0';
        wait until rising_edge(clk);
        wait for 1 ns;

        avalon_expect(REG_TX_STATUS, x"00000001", "TX should be ready after reset");

        avalon_write(REG_TX_PACKET, ADC_CONFIG_PACKET);
        avalon_write(REG_TX_CONTROL, x"00000001");

        assert send.addr = ADC_ADDR report "TX route address should be ADC" severity failure;
        assert send.data = ADC_CONFIG_PACKET report "TX packet should match Avalon write" severity failure;
        avalon_expect(REG_TX_STATUS, x"0000000A", "TX should be busy and accepted");

        wait until rising_edge(clk);
        wait for 1 ns;
        avalon_expect(REG_TX_STATUS, x"00000009", "TX should return to ready");

        recv.addr <= NIOS_II_ADDR;
        recv.data <= PK_EVENT_PACKET;
        wait until rising_edge(clk);
        wait for 1 ns;
        recv.addr <= NULL_ADDR;
        recv.data <= (others => '0');

        avalon_expect(REG_RX_STATUS, x"00000001", "RX valid should hold until ACK");
        avalon_expect(REG_RX_PACKET, PK_EVENT_PACKET, "RX packet should match NoC input");

        avalon_write(REG_RX_CONTROL, x"00000001");
        avalon_expect(REG_RX_STATUS, x"00000000", "RX ACK should clear valid");

        recv.addr <= NIOS_II_ADDR;
        recv.data <= x"31544000";
        wait until rising_edge(clk);
        wait for 1 ns;
        recv.data <= PK_EVENT_PACKET;
        wait until rising_edge(clk);
        wait for 1 ns;
        recv.addr <= NULL_ADDR;
        recv.data <= (others => '0');

        avalon_expect(REG_RX_STATUS, x"00000003", "Second unacknowledged RX should set overflow");
        avalon_write(REG_RX_CONTROL, x"00000003");
        avalon_expect(REG_RX_STATUS, x"00000000", "RX clear should clear valid and overflow");

        test_done <= '1';
        report "avalon_noc_adapter_tb PASS" severity note;
        wait;
    end process;
end architecture sim;
