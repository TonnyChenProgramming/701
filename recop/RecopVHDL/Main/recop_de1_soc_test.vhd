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

begin

    ----------------------------------------------------------------
    -- PLL: 50 MHz input -> 25 MHz output
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

    sip_r <= "000000" & SW;

    ----------------------------------------------------------------
    -- debug / output
    ----------------------------------------------------------------
    LEDR(9)          <= pll_locked;
    LEDR(8 downto 0) <= sop_r(8 downto 0);

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
    -- turn off HEX displays
    ----------------------------------------------------------------
    HEX0 <= (others => '1');
    HEX1 <= (others => '1');
    HEX2 <= (others => '1');
    HEX3 <= (others => '1');
    HEX4 <= (others => '1');
    HEX5 <= (others => '1');

end beh;