-- PeakDetector_ASP.vhd
--
-- GP2 TDMA-MIN facing wrapper for the IP-stage PD-ASP.
--
-- This wrapper keeps the verified pd_asp / pd_core implementation unchanged
-- and adapts it to the Lab 2 style ASP entity with send/recv ports.
--
-- Assumption from the Lab 2 TDMA-MIN package:
--   tdma_min_port has fields:
--     addr : addr8_t
--     data : 32-bit std_logic_vector subtype
--
-- If your team's TdmaMinTypes package uses different field names, only the
-- recv.addr/recv.data and send.addr/send.data assignments below need changing.

library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

use work.asp_types.all;
use work.TdmaMinTypes.all;
use work.asp_packet_pkg.all;

entity PeakDetector_ASP is
    port (
        clock : in  bit_1;
        reset : in  bit_1;
        init  : in  bit_1;

        send  : out tdma_min_port;
        recv  : in  tdma_min_port
    );
end entity PeakDetector_ASP;

architecture rtl of PeakDetector_ASP is
    constant MY_PORT4    : std_logic_vector(3 downto 0) := PK_ADDR(3 downto 0);
    constant RECOP_PORT4 : std_logic_vector(3 downto 0) := RECOP_ADDR(3 downto 0);

    signal pd_reset     : std_logic;
    signal pd_in_valid  : std_logic;
    signal pd_in_ready  : std_logic;
    signal pd_in_word   : packet_word_t;
    signal pd_out_valid : std_logic;
    signal pd_out_ready : std_logic;
    signal pd_out_word  : packet_word_t;
    signal pd_out_fire  : std_logic;

    -- The final GP2 router gives the Peak source one slot per six-cycle TDMA
    -- round. Pace output packets so paired MAX_PEAK/PEAK_VALUE events are not
    -- dropped by the one-entry source mailbox.
    constant SEND_GAP_CYCLES : natural := 6;
    signal send_cooldown_r : natural range 0 to SEND_GAP_CYCLES := 0;

    signal cor_low_payload_r : payload20_t := (others => '0');
    signal cor_low_seen_r    : std_logic := '0';

    function port4_to_addr8(port4 : std_logic_vector(3 downto 0)) return addr8_t is
    begin
        case port4 is
            when "0000" => return RECOP_ADDR;
            when "0001" => return ADC_ADDR;
            when "0010" => return AVE_ASP_ADDR;
            when "0011" => return COR_ASP_ADDR;
            when "0100" => return PK_ADDR;
            when "0101" => return NIOS_II_ADDR;
            when "0110" => return IDLE_ADDR;
            when others => return NULL_ADDR;
        end case;
    end function;

    function route_packet_to_pd(data_word : std_logic_vector(31 downto 0))
        return packet_word_t is
        variable pkt : packet_word_t;
    begin
        pkt := packet_word_t(data_word);

        -- The TDMA-MIN route address is carried outside the 32-bit data word.
        -- The IP-stage pd_asp still checks the packet destination field, so
        -- inject this ASP's local 4-bit address before forwarding internally.
        pkt(23 downto 20) := MY_PORT4;
        return pkt;
    end function;

    function pd_packet_to_tdma_data(pd_packet : packet_word_t)
        return packet_word_t is
        variable pkt : packet_word_t;
    begin
        pkt := pd_packet;

        -- STATUS packets are routed to ReCOP, so keep the packet nibble
        -- available as the source ASP id for the ReCOP LED decoder.
        -- EVENT packets keep their logical Nios destination so the Nios
        -- console records peak_count correctly.
        if packet_kind(pkt) = PKT_KIND_STATUS then
            pkt(23 downto 20) := MY_PORT4;
        end if;

        return pkt;
    end function;

begin
    -- GP2 uses active-high reset/init. The IP-stage PD-ASP already uses a
    -- synchronous active-high reset, so combine both system reset sources.
    pd_reset <= reset or init;

    -- Decode TDMA-MIN packets for the verified IP-stage pd_asp wrapper.
    --
    -- Commands are routed through directly after injecting this ASP's local
    -- 4-bit destination nibble for the old wrapper.
    --
    -- COR-ASP sends a 36-bit result as two packets:
    --   TAG_RESULT_LOW  carries correlation(19 downto 0)
    --   TAG_RESULT_HIGH carries "0000" & correlation(35 downto 20)
    --
    -- PD needs one monotonic 20-bit sample per correlation result, so use
    -- correlation(35 downto 16) = high(15 downto 0) & low(19 downto 16).
    process(clock)
        variable recv_word_v : packet_word_t;
        variable payload_v   : payload20_t;
    begin
        if rising_edge(clock) then
            if pd_reset = '1' then
                pd_in_valid       <= '0';
                pd_in_word        <= (others => '0');
                cor_low_payload_r <= (others => '0');
                cor_low_seen_r    <= '0';
            else
                pd_in_valid <= '0';
                pd_in_word  <= (others => '0');
                recv_word_v := packet_word_t(std_logic_vector(recv.data));

                if recv.addr = PK_ADDR then
                    case packet_kind(recv_word_v) is
                        when PKT_KIND_CMD =>
                            pd_in_word  <= route_packet_to_pd(std_logic_vector(recv.data));
                            pd_in_valid <= '1';

                        when PKT_KIND_DATA =>
                            case packet_code(recv_word_v) is
                                when TAG_RESULT_LOW =>
                                    cor_low_payload_r <= packet_payload(recv_word_v);
                                    cor_low_seen_r    <= '1';

                                when TAG_RESULT_HIGH =>
                                    if cor_low_seen_r = '1' then
                                        payload_v := packet_payload(recv_word_v)(15 downto 0)
                                                   & cor_low_payload_r(19 downto 16);
                                    else
                                        -- Fallback if the high packet is seen first:
                                        -- still forward the high magnitude bits.
                                        payload_v := packet_payload(recv_word_v);
                                    end if;

                                    pd_in_word  <= make_packet(PKT_KIND_DATA,
                                                               TAG_RESULT_HIGH,
                                                               MY_PORT4,
                                                               payload_v);
                                    pd_in_valid <= '1';
                                    cor_low_seen_r <= '0';

                                when TAG_DIRECT_DATA =>
                                    payload_v := "0000" & packet_payload(recv_word_v)(15 downto 0);
                                    pd_in_word  <= make_packet(PKT_KIND_DATA,
                                                               TAG_DIRECT_DATA,
                                                               MY_PORT4,
                                                               payload_v);
                                    pd_in_valid <= '1';

                                when others =>
                                    -- Single-packet fallback for early smoke tests.
                                    pd_in_word  <= route_packet_to_pd(std_logic_vector(recv.data));
                                    pd_in_valid <= '1';
                            end case;

                        when others =>
                            null;
                    end case;
                end if;
            end if;
        end if;
    end process;

    -- There is no explicit ready/ack signal on the simple Lab 2 send port.
    -- Emit one-cycle pulses, then pause long enough for the router source
    -- mailbox to drain before accepting the next PD output packet.
    pd_out_ready <= '1' when send_cooldown_r = 0 else '0';
    pd_out_fire  <= pd_out_valid and pd_out_ready;

    process(clock)
    begin
        if rising_edge(clock) then
            if pd_reset = '1' then
                send_cooldown_r <= 0;
            elsif pd_out_fire = '1' then
                send_cooldown_r <= SEND_GAP_CYCLES;
            elsif send_cooldown_r > 0 then
                send_cooldown_r <= send_cooldown_r - 1;
            end if;
        end if;
    end process;

    u_pd_asp : entity work.pd_asp
        generic map (
            MY_PORT    => MY_PORT4,
            RECOP_PORT => RECOP_PORT4
        )
        port map (
            clk       => clock,
            reset     => pd_reset,
            in_valid  => pd_in_valid,
            in_ready  => pd_in_ready,
            in_word   => pd_in_word,
            out_valid => pd_out_valid,
            out_ready => pd_out_ready,
            out_word  => pd_out_word
        );

    send.addr <= port4_to_addr8(packet_dest(pd_out_word)) when pd_out_fire = '1'
                 else NULL_ADDR;
    send.data <= pd_packet_to_tdma_data(pd_out_word) when pd_out_fire = '1'
                 else (others => '0');

end architecture rtl;
