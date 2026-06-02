library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

use work.recop_types.all;
use work.various_constants.all;
use work.TdmaMinTypes.all;

entity recop_and_peripherals_top is
    port(
        CLOCK_50 : in  std_logic;

        recv     : in  tdma_min_port;
        send     : out tdma_min_port;

        KEY      : in  std_logic_vector(3 downto 0);
        SW       : in  std_logic_vector(9 downto 0);
        LEDR     : out std_logic_vector(9 downto 0)
    );
end recop_and_peripherals_top;

architecture beh of recop_and_peripherals_top is

    signal pll_clk    : std_logic;
    signal pll_locked : std_logic;

    signal init_s     : bit_1;
    signal reset_cpu  : bit_1;

    signal sip_s      : bit_16;
    signal sop_s      : bit_16;
    signal dprr_s     : bit_2;

    signal current_state_output_s : bit_4;

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
    -- Control signals
    -- DE1-SoC KEY is active-low:
    -- pressed     = 0
    -- not pressed = 1
    ----------------------------------------------------------------
    init_s <= not KEY(0);

    reset_cpu <= (not pll_locked) or (not KEY(0));

    ----------------------------------------------------------------
    -- SIP mapping
    -- 16 bits total:
    -- "00" + SW(9 downto 0) + KEY(3 downto 0)
    ----------------------------------------------------------------
    sip_s <= "00" & SW & KEY;

    ----------------------------------------------------------------
    -- CPU instance
    ----------------------------------------------------------------
    u_recop : entity work.recop_top_v1
        port map(
            clk                  => pll_clk,
            init                 => init_s,
            reset                => reset_cpu,

            sip                  => sip_s,
            recv                 => recv,

            dprr                 => dprr_s,
            dpcr                 => send,
            sop                  => sop_s,

            current_state_output => current_state_output_s
        );

    ----------------------------------------------------------------
    -- LED output
    ----------------------------------------------------------------
    LEDR <= sop_s(9 downto 0);

end beh;