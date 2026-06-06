library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

-- Common packet helpers for the Task 1 / GP2 ASPs.
--
-- Packet format:
--
--   [31:28] kind
--   [27:24] code
--   [23:20] dest / logical destination / source field
--   [19:0]  payload
--
-- In some COR-ASP packets, payload may be further interpreted as:
--
--   [19:16] tag
--   [15:0]  value
--
-- For 36-bit correlation result packets, the full 20-bit payload may be
-- used as data. In that case, packet_code distinguishes LOW/HIGH.
package asp_packet_pkg is
    subtype nibble_t      is std_logic_vector(3 downto 0);
    subtype addr8_t       is std_logic_vector(7 downto 0);
    subtype packet_word_t is std_logic_vector(31 downto 0);
    subtype payload20_t   is std_logic_vector(19 downto 0);
    subtype sample16_t    is signed(15 downto 0);
    subtype sample20_t    is signed(19 downto 0);
    subtype sample32_t    is signed(31 downto 0);

    -- TDMA-MIN node map:
    --   0: ReCOP/control source
    --   1: ADC-ASP
    --   2: AVG-ASP
    --   3: Correlation-ASP
    --   4: Peak-detection ASP
    --   5: Avalon-MM bridge for Nios II
    --   6: idle/debug sink
    --   7: null/drop sink
    constant RECOP_ADDR   : addr8_t := "00000000";
    constant ADC_ADDR     : addr8_t := "00000001";
    constant AVE_ASP_ADDR : addr8_t := "00000010";
    constant COR_ASP_ADDR : addr8_t := "00000011";
    constant PK_ADDR      : addr8_t := "00000100";
    constant NIOS_II_ADDR : addr8_t := "00000101";
    constant IDLE_ADDR    : addr8_t := "00000110";
    constant NULL_ADDR    : addr8_t := "00000111";

    constant PKT_KIND_CMD    : nibble_t := "0001";
    constant PKT_KIND_DATA   : nibble_t := "0010";
    constant PKT_KIND_STATUS : nibble_t := "0011";
    constant PKT_KIND_EVENT  : nibble_t := "0100";

    constant CMD_NOP    : nibble_t := "0000";
    constant CMD_CONFIG : nibble_t := "0001";
    constant CMD_START  : nibble_t := "0010";
    constant CMD_STOP   : nibble_t := "0011";
    constant CMD_CLEAR  : nibble_t := "0100";

    constant EVENT_MAX_PEAK : nibble_t := "0001";
    constant EVENT_MIN_PEAK : nibble_t := "0010";
    constant EVENT_PEAK_VALUE : nibble_t := "0011";

    constant TAG_WINDOW      : nibble_t := "0000";
    constant TAG_OFFSET      : nibble_t := "0001";
    constant TAG_DIRECT_DATA : nibble_t := "0000";
    constant TAG_RESULT_LOW  : nibble_t := "0001";
    constant TAG_RESULT_HIGH : nibble_t := "0010";
    constant TAG_STATUS      : nibble_t := "0000";

    constant MODE_PASS_THROUGH : std_logic := '1';
    constant MODE_CORRELATION  : std_logic := '0';

    constant EMPTY_PAYLOAD : sample20_t := "00000000000000000000";

    function packet_kind(pkt : packet_word_t) return nibble_t;
    function packet_code(pkt : packet_word_t) return nibble_t;
    function packet_dest(pkt : packet_word_t) return nibble_t;
    function packet_tag(pkt : packet_word_t) return nibble_t;
    function packet_payload(pkt : packet_word_t) return payload20_t;
    function packet_sample(pkt : packet_word_t) return sample16_t;
    function packet_sample20(pkt : packet_word_t) return sample20_t;
    function payload_from_sample16(sample : sample16_t) return payload20_t;
    function payload_from_sample20(sample : sample20_t) return payload20_t;

    function make_packet(
        kind    : nibble_t;
        code    : nibble_t;
        dest    : nibble_t;
        payload : payload20_t
    ) return packet_word_t;
end package asp_packet_pkg;

package body asp_packet_pkg is
    function packet_kind(pkt : packet_word_t) return nibble_t is
    begin
        return pkt(31 downto 28);
    end function;

    function packet_code(pkt : packet_word_t) return nibble_t is
    begin
        return pkt(27 downto 24);
    end function;

    function packet_dest(pkt : packet_word_t) return nibble_t is
    begin
        return pkt(23 downto 20);
    end function;

    function packet_tag(pkt : packet_word_t) return nibble_t is
    begin
        return pkt(19 downto 16);
    end function;

    function packet_payload(pkt : packet_word_t) return payload20_t is
    begin
        return pkt(19 downto 0);
    end function;

    function packet_sample(pkt : packet_word_t) return sample16_t is
    begin
        return signed(pkt(15 downto 0));
    end function;

    function packet_sample20(pkt : packet_word_t) return sample20_t is
    begin
        return signed(pkt(19 downto 0));
    end function;

    function payload_from_sample16(sample : sample16_t) return payload20_t is
    begin
        return std_logic_vector(resize(sample, 20));
    end function;

    function payload_from_sample20(sample : sample20_t) return payload20_t is
    begin
        return std_logic_vector(sample);
    end function;

    function make_packet(
        kind    : nibble_t;
        code    : nibble_t;
        dest    : nibble_t;
        payload : payload20_t
    ) return packet_word_t is
        variable pkt : packet_word_t;
    begin
        pkt(31 downto 28) := kind;
        pkt(27 downto 24) := code;
        pkt(23 downto 20) := dest;
        pkt(19 downto 0)  := payload;
        return pkt;
    end function;
end package body asp_packet_pkg;
