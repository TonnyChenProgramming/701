library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

use work.recop_types.all;
use work.various_constants.all;
use work.TdmaMinTypes.all;

entity gp2_recop_control_io is
    port (
        clk   : in  std_logic;
        reset : in  std_logic;

        key   : in  std_logic_vector(3 downto 0);
        sw    : in  std_logic_vector(9 downto 0);

        recv  : in  tdma_min_port;
        send  : out tdma_min_port;

        ledr  : out std_logic_vector(9 downto 0)
    );
end entity gp2_recop_control_io;

architecture rtl of gp2_recop_control_io is

    signal init_s     : bit_1;
    signal reset_cpu  : bit_1;

    signal sip_s      : bit_16;
    signal sop_s      : bit_16;
    signal dprr_s     : bit_2;

    signal current_state_output_s : bit_4;

begin

    ----------------------------------------------------------------
    -- Reset / init mapping
    --
    -- This wrapper already receives reset from the upper-level design.
    -- Therefore reset_cpu follows reset directly.
    ----------------------------------------------------------------
    init_s    <= reset;
    reset_cpu <= reset;

    ----------------------------------------------------------------
    -- SIP mapping
    -- 16 bits total:
    -- "00" + sw(9 downto 0) + key(3 downto 0)
    ----------------------------------------------------------------
    sip_s <= "00" & sw & key;

    ----------------------------------------------------------------
    -- ReCOP CPU instance
    ----------------------------------------------------------------
    u_recop : entity work.recop_top
        port map(
            clk                  => clk,
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
    ledr <= sop_s(9 downto 0);

end architecture rtl;