library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

-- Common packet helpers for the Task 1 ASPs.
--
-- The goal of this package is to make every ASP speak the same small protocol.
-- A later Network Interface can wrap these 32-bit packets into the real
-- TDMA-MIN flits without changing the ASP datapaths.
package asp_packet_pkg is
    constant RECOP_ADDR           : std_logic_vector(7 downto 0) := "00000000";
    constant NIOS_II_ADDR         : std_logic_vector(7 downto 0):= "00000001";
    constant SIG_GENERATOR_ADDR   : std_logic_vector(7 downto 0) := "00000010";
    constant AVE_ASP_ADDR         : std_logic_vector(7 downto 0) := "00000011";
    constant COR_ASP_ADDR         : std_logic_vector(7 downto 0) := "00000100";
    constant PK_ADDR              : std_logic_vector(7 downto 0) := "00000101";

    subtype packet_word_t is std_logic_vector(31 downto 0);
    subtype payload20_t   is std_logic_vector(19 downto 0);
    subtype sample16_t    is signed(15 downto 0);
    subtype sample20_t    is signed(19 downto 0);

    constant PKT_KIND_CMD    : std_logic_vector(3 downto 0) := "0001";
    constant PKT_KIND_DATA   : std_logic_vector(3 downto 0) := "0010";
    constant PKT_KIND_STATUS : std_logic_vector(3 downto 0) := "0011";
    constant PKT_KIND_EVENT  : std_logic_vector(3 downto 0) := "0100";

    constant CMD_NOP       : std_logic_vector(3 downto 0) := "0000";
    constant CMD_CONFIG    : std_logic_vector(3 downto 0) := "0001";
    constant CMD_START     : std_logic_vector(3 downto 0) := "0010";
    constant CMD_STOP      : std_logic_vector(3 downto 0) := "0011";
    constant CMD_CLEAR     : std_logic_vector(3 downto 0) := "0100";

    -- peak detection related
    constant EVENT_MAX_PEAK : std_logic_vector(3 downto 0) := "0001";
    constant EVENT_MIN_PEAK : std_logic_vector(3 downto 0) := "0010";

    -- PKT_KIND_CMD|CMD_CONFIG|DEST|TAG correlation related
    constant TAG_WINDOW : std_logic_vector(3 downto 0) := "0000";
    constant TAG_OFFSET : std_logic_vector(3 downto 0) := "0001";

    --PKT_KIND_DATA|TAG|SOURCE|PAYLOAD[19:0]
    constant TAG_DIRECT_DATA :   std_logic_vector(3 downto 0) := "0000";
    constant TAG_RESULT_LOW  : std_logic_vector(3 downto 0) := "0001";
    constant TAG_RESULT_HIGH : std_logic_vector(3 downto 0) := "0010";

    --PKT_KIND_STATUS|TAG|SOURCE|STATUS[19:0]
    constant TAG_STATUS      : std_logic_vector(3 downto 0) := "0000";

    -- PASS THROUGH MACRO
    constant MODE_PASS_THROUGH : std_logic := '1';
    constant MODE_CORRELATION  : std_logic := '0';

    function packet_kind(pkt : packet_word_t) return std_logic_vector;
    function packet_code(pkt : packet_word_t) return std_logic_vector;
    function packet_dest(pkt : packet_word_t) return std_logic_vector;
    function packet_tag(pkt : packet_word_t) return std_logic_vector;
    function packet_payload(pkt : packet_word_t) return payload20_t;
    function packet_sample(pkt : packet_word_t) return sample16_t;
    function packet_sample20(pkt : packet_word_t) return sample20_t;
    function payload_from_sample16(sample : sample16_t) return payload20_t;
    function payload_from_sample20(sample : sample20_t) return payload20_t;

    function make_packet(
        kind    : std_logic_vector(3 downto 0);
        code    : std_logic_vector(3 downto 0);
        dest    : std_logic_vector(3 downto 0);
        payload : payload20_t
    ) return packet_word_t;
end package asp_packet_pkg;

package body asp_packet_pkg is
    function packet_kind(pkt : packet_word_t) return std_logic_vector is
    begin
        return pkt(31 downto 28);
    end function;

    function packet_code(pkt : packet_word_t) return std_logic_vector is
    begin
        return pkt(27 downto 24);
    end function;

    function packet_dest(pkt : packet_word_t) return std_logic_vector is
    begin
        return pkt(23 downto 20);
    end function;

    function packet_tag(pkt : packet_word_t) return std_logic_vector is
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
        kind    : std_logic_vector(3 downto 0);
        code    : std_logic_vector(3 downto 0);
        dest    : std_logic_vector(3 downto 0);
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
