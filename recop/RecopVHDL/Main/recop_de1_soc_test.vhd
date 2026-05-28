library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;
use work.recop_types.all;

entity recop_de1_soc_test is
    port(
        CLOCK_50 : in  std_logic;
        KEY      : in  std_logic_vector(3 downto 0);
        SW       : in  std_logic_vector(9 downto 0);

        LEDR     : out std_logic_vector(9 downto 0);

        HEX0     : out std_logic_vector(6 downto 0);
        HEX1     : out std_logic_vector(6 downto 0);
        HEX2     : out std_logic_vector(6 downto 0);
        HEX3     : out std_logic_vector(6 downto 0);
        HEX4     : out std_logic_vector(6 downto 0);
        HEX5     : out std_logic_vector(6 downto 0)
    );
end recop_de1_soc_test;

architecture beh of recop_de1_soc_test is

    signal pll_clk       : std_logic;
    signal pll_locked    : std_logic;

    signal reset_cpu     : bit_1;
    signal init          : bit_1;
    signal sip_r         : bit_16;
    signal current_state : bit_3;
    signal dprr_r        : bit_2;
    signal dpcr_r        : bit_32;
    signal sop_r         : bit_16;

    signal key2_prev     : bit_1 := '1';
    signal display_mode  : bit_2 := "00";
    signal hex_data      : bit_16;

    function hex_to_7seg(nibble : std_logic_vector(3 downto 0))
        return std_logic_vector is
    begin
        case nibble is
            when "0000" => return "1000000";
            when "0001" => return "1111001";
            when "0010" => return "0100100";
            when "0011" => return "0110000";
            when "0100" => return "0011001";
            when "0101" => return "0010010";
            when "0110" => return "0000010";
            when "0111" => return "1111000";
            when "1000" => return "0000000";
            when "1001" => return "0010000";
            when "1010" => return "0001000";
            when "1011" => return "0000011";
            when "1100" => return "1000110";
            when "1101" => return "0100001";
            when "1110" => return "0000110";
            when "1111" => return "0001110";
            when others => return "1111111";
        end case;
    end function;

begin

    ----------------------------------------------------------------
    -- PLL: 50 MHz -> 25 MHz
    ----------------------------------------------------------------
    u_pll : entity work.PLL
        port map(
            refclk   => CLOCK_50,
            rst      => '0',
            outclk_0 => pll_clk,
            locked   => pll_locked
        );

    ----------------------------------------------------------------
    -- control signals
    ----------------------------------------------------------------
    init      <= not KEY(1);
    reset_cpu <= bit_1((not pll_locked) or (not KEY(0)));
    sip_r     <= "000000" & SW;

    ----------------------------------------------------------------
    -- CPU instance
    ----------------------------------------------------------------
    u_recop : entity work.recop_top_v1
        port map(
            clk                  => bit_1(pll_clk),
            init                 => init,
            reset                => reset_cpu,
            sip                  => sip_r,
            current_state_output => current_state,
            dprr                 => dprr_r,
            dpcr                 => dpcr_r,
            sop                  => sop_r
        );

    ----------------------------------------------------------------
    -- display mode control: KEY(2) cycles display
    ----------------------------------------------------------------
    p_display_mode : process(pll_clk, reset_cpu)
    begin
        if reset_cpu = '1' then
            key2_prev    <= '1';
            display_mode <= "00";
        elsif rising_edge(pll_clk) then
            key2_prev <= bit_1(KEY(2));
            if (key2_prev = '1') and (bit_1(KEY(2)) = '0') then
                display_mode <= bit_2(unsigned(display_mode) + 1);
            end if;
        end if;
    end process;

    ----------------------------------------------------------------
    -- HEX display source select
    -- 00: SIP
    -- 01: SOP
    -- 10: DPCR low 16 bits
    -- 11: packed debug {11'b0, current_state, dprr}
    ----------------------------------------------------------------
    with display_mode select
        hex_data <= sip_r                               when "00",
                    sop_r                               when "01",
                    dpcr_r(15 downto 0)                when "10",
                    "00000000000" & current_state & dprr_r when others;

    ----------------------------------------------------------------
    -- LED mapping
    ----------------------------------------------------------------
    LEDR(9)          <= pll_locked;
    LEDR(8 downto 7) <= dprr_r;
    LEDR(6 downto 5) <= display_mode;
    LEDR(4 downto 2) <= current_state;
    LEDR(1 downto 0) <= sop_r(1 downto 0);

    ----------------------------------------------------------------
    -- HEX mapping
    ----------------------------------------------------------------
    HEX0 <= hex_to_7seg(hex_data(3 downto 0));
    HEX1 <= hex_to_7seg(hex_data(7 downto 4));
    HEX2 <= hex_to_7seg(hex_data(11 downto 8));
    HEX3 <= hex_to_7seg(hex_data(15 downto 12));

    -- no PC output available from recop_top_v1, so use blank
    HEX4 <= "1111111";
    HEX5 <= "1111111";

end beh;