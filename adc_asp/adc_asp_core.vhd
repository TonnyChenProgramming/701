library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

use work.asp_packet_pkg.all;

-- ADC-ASP core
--
-- This block emulates an analogue-to-digital converter for early HMPSoC/NoC
-- integration work. Instead of reading a real ADC pin, it emits deterministic
-- sample streams from four virtual channels. That makes simulation repeatable
-- and lets ReCOP/NoC development continue before physical ADC hardware is used.
entity adc_asp_core is
    port(
        clk         : in  std_logic;
        reset       : in  std_logic;

        cmd_valid   : in  std_logic;
        cmd_ready   : out std_logic;
        cmd_word    : in  packet_word_t;

        out_valid   : out std_logic;
        out_ready   : in  std_logic;
        out_word    : out packet_word_t;

        status_word : out packet_word_t
    );
end entity adc_asp_core;

architecture rtl of adc_asp_core is
    signal enabled       : std_logic := '0';
    signal channel_sel   : unsigned(1 downto 0) := (others => '0');
    signal sample_div    : unsigned(3 downto 0) := (others => '0');
    signal div_count     : unsigned(3 downto 0) := (others => '0');
    signal phase         : unsigned(5 downto 0) := (others => '0');
    signal dest_node     : nibble_t := AVE_ASP_ADDR(3 downto 0);
    signal sample_reg    : sample16_t := (others => '0');
    signal out_valid_reg : std_logic := '0';

    type wave_rom_t is array (0 to 15) of sample16_t;
    constant SINE_LIKE_ROM : wave_rom_t := (
        to_signed(0, 16),    to_signed(383, 16),  to_signed(707, 16),  to_signed(924, 16),
        to_signed(1000, 16), to_signed(924, 16),  to_signed(707, 16),  to_signed(383, 16),
        to_signed(0, 16),    to_signed(-383, 16), to_signed(-707, 16), to_signed(-924, 16),
        to_signed(-1000, 16),to_signed(-924, 16), to_signed(-707, 16), to_signed(-383, 16)
    );

    function next_sample(ch : unsigned(1 downto 0); ph : unsigned(5 downto 0)) return sample16_t is
        variable low4 : integer range 0 to 15;
        variable saw  : integer;
    begin
        low4 := to_integer(ph(3 downto 0));

        case to_integer(ch) is
            when 0 =>
                return SINE_LIKE_ROM(low4);
            when 1 =>
                saw := (to_integer(ph) * 64) - 2048;
                return to_signed(saw, 16);
            when 2 =>
                if ph(5) = '0' then
                    return to_signed(1200, 16);
                else
                    return to_signed(-1200, 16);
                end if;
            when others =>
                if ph(0) = '0' then
                    return to_signed(300 + (low4 * 20), 16);
                else
                    return to_signed(-300 - (low4 * 20), 16);
                end if;
        end case;
    end function;
begin
    cmd_ready <= '1';
    out_valid <= out_valid_reg;
    out_word <= make_packet(PKT_KIND_DATA, TAG_DIRECT_DATA, dest_node, payload_from_sample16(sample_reg));

    status_word <= make_packet(
        PKT_KIND_STATUS,
        TAG_STATUS,
        ADC_ADDR(3 downto 0),
        "0000" & enabled & std_logic_vector(channel_sel) & std_logic_vector(sample_div) & std_logic_vector(phase) & "000"
    );

    process(clk)
    begin
        if rising_edge(clk) then
            if reset = '1' then
                enabled       <= '0';
                channel_sel   <= (others => '0');
                sample_div    <= (others => '0');
                div_count     <= (others => '0');
                phase         <= (others => '0');
                dest_node     <= AVE_ASP_ADDR(3 downto 0);
                sample_reg    <= (others => '0');
                out_valid_reg <= '0';
            else
                if out_valid_reg = '1' and out_ready = '1' then
                    out_valid_reg <= '0';
                end if;

                if cmd_valid = '1' and packet_kind(cmd_word) = PKT_KIND_CMD then
                    case packet_code(cmd_word) is
                        when CMD_CONFIG =>
                            dest_node   <= cmd_word(19 downto 16);
                            channel_sel <= unsigned(cmd_word(15 downto 14));
                            sample_div  <= unsigned(cmd_word(13 downto 10));
                        when CMD_START =>
                            enabled <= '1';
                        when CMD_STOP =>
                            enabled <= '0';
                        when CMD_CLEAR =>
                            phase <= (others => '0');
                            div_count <= (others => '0');
                            out_valid_reg <= '0';
                        when others =>
                            null;
                    end case;
                end if;

                if enabled = '1' and out_valid_reg = '0' then
                    if div_count = sample_div then
                        div_count <= (others => '0');
                        sample_reg <= next_sample(channel_sel, phase);
                        phase <= phase + 1;
                        out_valid_reg <= '1';
                    else
                        div_count <= div_count + 1;
                    end if;
                end if;
            end if;
        end if;
    end process;
end architecture rtl;
