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

    constant RX_FIFO_DEPTH : natural := 16;
    type rx_fifo_t is array (0 to RX_FIFO_DEPTH - 1) of packet_word_t;

    signal tx_packet_r        : packet_word_t := (others => '0');
    signal tx_pending_r       : std_logic := '0';
    signal tx_error_r         : std_logic := '0';
    signal tx_last_accepted_r : std_logic := '0';
    signal tx_irq_en_r        : std_logic := '0';

    signal rx_fifo_r     : rx_fifo_t := (others => (others => '0'));
    signal rx_rd_index_r : natural range 0 to RX_FIFO_DEPTH - 1 := 0;
    signal rx_wr_index_r : natural range 0 to RX_FIFO_DEPTH - 1 := 0;
    signal rx_count_r    : natural range 0 to RX_FIFO_DEPTH := 0;
    signal rx_overflow_r : std_logic := '0';
    signal rx_error_r    : std_logic := '0';
    signal rx_irq_en_r   : std_logic := '0';
    signal rx_valid_i    : std_logic;

    signal loopback_en_r : std_logic := '0';
    signal recv_active_r : std_logic := '0';

    signal tx_status      : std_logic_vector(31 downto 0);
    signal rx_status      : std_logic_vector(31 downto 0);
    signal adapter_status : std_logic_vector(31 downto 0);

    function route_addr(packet : packet_word_t) return addr8_t is
    begin
        return "0000" & packet_dest(packet);
    end function;

    function is_protocol_packet(packet : packet_word_t) return boolean is
        variable kind_v : nibble_t;
    begin
        kind_v := packet_kind(packet);
        return kind_v = PKT_KIND_CMD
            or kind_v = PKT_KIND_DATA
            or kind_v = PKT_KIND_STATUS
            or kind_v = PKT_KIND_EVENT;
    end function;

    function is_nios_packet(packet : packet_word_t) return boolean is
    begin
        return is_protocol_packet(packet)
            and packet_dest(packet) = NIOS_II_ADDR(3 downto 0);
    end function;

    function inc_fifo_index(index : natural) return natural is
    begin
        if index = RX_FIFO_DEPTH - 1 then
            return 0;
        else
            return index + 1;
        end if;
    end function;
begin
    send.addr <= route_addr(tx_packet_r) when tx_pending_r = '1' else NULL_ADDR;
    send.data <= tx_packet_r when tx_pending_r = '1' else (others => '0');

    rx_valid_i <= '1' when rx_count_r > 0 else '0';

    tx_status <= (
        0 => not tx_pending_r,
        1 => tx_pending_r,
        2 => tx_error_r,
        3 => tx_last_accepted_r,
        others => '0'
    );

    rx_status <= (
        0 => rx_valid_i,
        1 => rx_overflow_r,
        2 => rx_error_r,
        others => '0'
    );

    adapter_status <= x"A5"
                    & std_logic_vector(recv.addr)
                    & packet_kind(recv.data)
                    & packet_dest(recv.data)
                    & "000"
                    & loopback_en_r
                    & rx_overflow_r
                    & tx_error_r
                    & rx_valid_i
                    & tx_pending_r;

    irq <= (tx_irq_en_r and not tx_pending_r) or (rx_irq_en_r and rx_valid_i);

    process(avs_address, avs_read, tx_packet_r, tx_status, rx_fifo_r,
            rx_rd_index_r, rx_count_r, rx_status, adapter_status)
    begin
        avs_readdata <= (others => '0');

        if avs_read = '1' then
            case avs_address is
                when REG_TX_PACKET =>
                    avs_readdata <= tx_packet_r;
                when REG_TX_STATUS =>
                    avs_readdata <= tx_status;
                when REG_RX_PACKET =>
                    if rx_count_r > 0 then
                        avs_readdata <= rx_fifo_r(rx_rd_index_r);
                    end if;
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
        variable rx_clear_now : boolean;
        variable adapter_reset_now : boolean;
        variable recv_qual_now : boolean;
        variable recv_push_now : boolean;
        variable loopback_push_now : boolean;
        variable count_v : natural range 0 to RX_FIFO_DEPTH;
        variable rd_index_v : natural range 0 to RX_FIFO_DEPTH - 1;
        variable wr_index_v : natural range 0 to RX_FIFO_DEPTH - 1;
    begin
        if rising_edge(clk) then
            if reset = '1' then
                tx_packet_r        <= (others => '0');
                tx_pending_r       <= '0';
                tx_error_r         <= '0';
                tx_last_accepted_r <= '0';
                tx_irq_en_r        <= '0';
                rx_fifo_r          <= (others => (others => '0'));
                rx_rd_index_r      <= 0;
                rx_wr_index_r      <= 0;
                rx_count_r         <= 0;
                rx_overflow_r      <= '0';
                rx_error_r         <= '0';
                rx_irq_en_r        <= '0';
                loopback_en_r      <= '0';
                recv_active_r      <= '0';
            else
                rx_ack_now := avs_write = '1'
                              and avs_address = REG_RX_CONTROL
                              and avs_writedata(0) = '1';
                rx_clear_now := avs_write = '1'
                                and avs_address = REG_RX_CONTROL
                                and avs_writedata(1) = '1';
                adapter_reset_now := avs_write = '1'
                                     and avs_address = REG_ADAPTER_CONTROL
                                     and avs_writedata(0) = '1';
                recv_qual_now := recv.addr = NIOS_II_ADDR
                                  and is_nios_packet(recv.data);
                recv_push_now := recv_qual_now and recv_active_r = '0';
                loopback_push_now := false;
                count_v := rx_count_r;
                rd_index_v := rx_rd_index_r;
                wr_index_v := rx_wr_index_r;

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
                                        loopback_push_now := true;
                                    end if;
                                else
                                    tx_error_r <= '1';
                                end if;
                            end if;

                        when REG_RX_CONTROL =>
                            rx_irq_en_r <= avs_writedata(2);

                            if rx_clear_now then
                                rx_overflow_r <= '0';
                                rx_error_r    <= '0';
                            end if;

                        when REG_ADAPTER_CONTROL =>
                            if adapter_reset_now then
                                tx_packet_r        <= (others => '0');
                                tx_pending_r       <= '0';
                                tx_error_r         <= '0';
                                tx_last_accepted_r <= '0';
                                tx_irq_en_r        <= '0';
                                rx_fifo_r          <= (others => (others => '0'));
                                count_v            := 0;
                                rd_index_v         := 0;
                                wr_index_v         := 0;
                                rx_overflow_r      <= '0';
                                rx_error_r         <= '0';
                                rx_irq_en_r        <= '0';
                                recv_active_r      <= '0';
                            end if;

                            loopback_en_r <= avs_writedata(1);

                        when others =>
                            null;
                    end case;
                end if;

                if not adapter_reset_now then
                    if rx_ack_now and count_v > 0 then
                        rd_index_v := inc_fifo_index(rd_index_v);
                        count_v := count_v - 1;
                    end if;

                    if loopback_push_now then
                        if count_v < RX_FIFO_DEPTH then
                            rx_fifo_r(wr_index_v) <= tx_packet_r;
                            wr_index_v := inc_fifo_index(wr_index_v);
                            count_v := count_v + 1;
                        else
                            rx_overflow_r <= '1';
                        end if;
                    end if;

                    -- TDMA-MIN routes packets for Nios II to address 0x5.
                    -- The recv_active guard prevents a held receive word from
                    -- being inserted into the FIFO more than once.
                    if recv_push_now then
                        if count_v < RX_FIFO_DEPTH then
                            rx_fifo_r(wr_index_v) <= recv.data;
                            wr_index_v := inc_fifo_index(wr_index_v);
                            count_v := count_v + 1;
                        else
                            rx_overflow_r <= '1';
                        end if;
                    end if;

                    if recv_qual_now then
                        recv_active_r <= '1';
                    else
                        recv_active_r <= '0';
                    end if;
                end if;

                rx_count_r    <= count_v;
                rx_rd_index_r <= rd_index_v;
                rx_wr_index_r <= wr_index_v;
            end if;
        end if;
    end process;
end architecture rtl;
