library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

use work.asp_packet_pkg.all;
use work.TdmaMinTypes.all;

-- Minimal Avalon-MM to TDMA-MIN bridge for Nios II.
--
-- Avalon address is word-based:
--   0 = TX_PACKET       byte offset 0x00
--   1 = TX_CONTROL      byte offset 0x04
--   2 = TX_STATUS       byte offset 0x08
--   3 = RX_PACKET       byte offset 0x0C
--   4 = RX_CONTROL      byte offset 0x10
--   5 = RX_STATUS       byte offset 0x14
--   6 = ADAPTER_STATUS  byte offset 0x18
--   7 = ADAPTER_CONTROL byte offset 0x1C
entity avalon_noc_adapter is
    port (
        clk           : in  std_logic;
        reset         : in  std_logic;

        avs_address   : in  std_logic_vector(2 downto 0);
        avs_read      : in  std_logic;
        avs_write     : in  std_logic;
        avs_writedata : in  std_logic_vector(31 downto 0);
        avs_readdata  : out std_logic_vector(31 downto 0);

        irq           : out std_logic;

        send          : out tdma_min_port;
        recv          : in  tdma_min_port
    );
end entity avalon_noc_adapter;

architecture rtl of avalon_noc_adapter is
    constant REG_TX_PACKET       : std_logic_vector(2 downto 0) := "000";
    constant REG_TX_CONTROL      : std_logic_vector(2 downto 0) := "001";
    constant REG_TX_STATUS       : std_logic_vector(2 downto 0) := "010";
    constant REG_RX_PACKET       : std_logic_vector(2 downto 0) := "011";
    constant REG_RX_CONTROL      : std_logic_vector(2 downto 0) := "100";
    constant REG_RX_STATUS       : std_logic_vector(2 downto 0) := "101";
    constant REG_ADAPTER_STATUS  : std_logic_vector(2 downto 0) := "110";
    constant REG_ADAPTER_CONTROL : std_logic_vector(2 downto 0) := "111";

    signal tx_packet_r        : packet_word_t := (others => '0');
    signal tx_pending_r       : std_logic := '0';
    signal tx_error_r         : std_logic := '0';
    signal tx_last_accepted_r : std_logic := '0';
    signal tx_irq_en_r        : std_logic := '0';

    signal rx_packet_r   : packet_word_t := (others => '0');
    signal rx_valid_r    : std_logic := '0';
    signal rx_overflow_r : std_logic := '0';
    signal rx_error_r    : std_logic := '0';
    signal rx_irq_en_r   : std_logic := '0';

    signal loopback_en_r : std_logic := '0';

    signal tx_status      : std_logic_vector(31 downto 0);
    signal rx_status      : std_logic_vector(31 downto 0);
    signal adapter_status : std_logic_vector(31 downto 0);

    function route_addr(packet : packet_word_t) return addr8_t is
    begin
        return "0000" & packet_dest(packet);
    end function;
begin
    send.addr <= route_addr(tx_packet_r) when tx_pending_r = '1' else NULL_ADDR;
    send.data <= tx_packet_r when tx_pending_r = '1' else (others => '0');

    tx_status <= (
        0 => not tx_pending_r,
        1 => tx_pending_r,
        2 => tx_error_r,
        3 => tx_last_accepted_r,
        others => '0'
    );

    rx_status <= (
        0 => rx_valid_r,
        1 => rx_overflow_r,
        2 => rx_error_r,
        others => '0'
    );

    adapter_status <= (
        0 => tx_pending_r,
        1 => rx_valid_r,
        2 => tx_error_r,
        3 => rx_overflow_r,
        4 => loopback_en_r,
        others => '0'
    );

    irq <= (tx_irq_en_r and not tx_pending_r) or (rx_irq_en_r and rx_valid_r);

    process(avs_address, avs_read, tx_packet_r, tx_status, rx_packet_r, rx_status, adapter_status)
    begin
        avs_readdata <= (others => '0');

        if avs_read = '1' then
            case avs_address is
                when REG_TX_PACKET =>
                    avs_readdata <= tx_packet_r;
                when REG_TX_STATUS =>
                    avs_readdata <= tx_status;
                when REG_RX_PACKET =>
                    avs_readdata <= rx_packet_r;
                when REG_RX_STATUS =>
                    avs_readdata <= rx_status;
                when REG_ADAPTER_STATUS =>
                    avs_readdata <= adapter_status;
                when others =>
                    null;
            end case;
        end if;
    end process;

    process(clk)
        variable rx_ack_now : boolean;
    begin
        if rising_edge(clk) then
            if reset = '1' then
                tx_packet_r        <= (others => '0');
                tx_pending_r       <= '0';
                tx_error_r         <= '0';
                tx_last_accepted_r <= '0';
                tx_irq_en_r        <= '0';
                rx_packet_r        <= (others => '0');
                rx_valid_r         <= '0';
                rx_overflow_r      <= '0';
                rx_error_r         <= '0';
                rx_irq_en_r        <= '0';
                loopback_en_r      <= '0';
            else
                rx_ack_now := avs_write = '1'
                              and avs_address = REG_RX_CONTROL
                              and avs_writedata(0) = '1';

                -- A pending packet occupies one TDMA send cycle.
                if tx_pending_r = '1' then
                    tx_pending_r <= '0';
                end if;

                if avs_write = '1' then
                    case avs_address is
                        when REG_TX_PACKET =>
                            tx_packet_r <= avs_writedata;

                        when REG_TX_CONTROL =>
                            tx_irq_en_r <= avs_writedata(2);

                            if avs_writedata(1) = '1' then
                                tx_error_r         <= '0';
                                tx_last_accepted_r <= '0';
                            end if;

                            if avs_writedata(0) = '1' then
                                if tx_pending_r = '0' then
                                    tx_pending_r       <= '1';
                                    tx_last_accepted_r <= '1';

                                    if loopback_en_r = '1' then
                                        if rx_valid_r = '0' or rx_ack_now then
                                            rx_packet_r <= tx_packet_r;
                                            rx_valid_r  <= '1';
                                        else
                                            rx_overflow_r <= '1';
                                        end if;
                                    end if;
                                else
                                    tx_error_r <= '1';
                                end if;
                            end if;

                        when REG_RX_CONTROL =>
                            rx_irq_en_r <= avs_writedata(2);

                            if avs_writedata(0) = '1' then
                                rx_valid_r <= '0';
                            end if;

                            if avs_writedata(1) = '1' then
                                rx_overflow_r <= '0';
                                rx_error_r    <= '0';
                            end if;

                        when REG_ADAPTER_CONTROL =>
                            if avs_writedata(0) = '1' then
                                tx_pending_r       <= '0';
                                tx_error_r         <= '0';
                                tx_last_accepted_r <= '0';
                                rx_valid_r         <= '0';
                                rx_overflow_r      <= '0';
                                rx_error_r         <= '0';
                            end if;

                            loopback_en_r <= avs_writedata(1);

                        when others =>
                            null;
                    end case;
                end if;

                -- TDMA-MIN routes packets for Nios II to address 0x5.
                if recv.addr = NIOS_II_ADDR then
                    if rx_valid_r = '0' or rx_ack_now then
                        rx_packet_r <= recv.data;
                        rx_valid_r  <= '1';
                    else
                        rx_overflow_r <= '1';
                    end if;
                end if;
            end if;
        end if;
    end process;
end architecture rtl;
