library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;
use work.recop_types.all;

entity recop_de1_soc_test is
    port(
        CLOCK_50       : in  bit_1;
        KEY            : in  std_logic_vector(3 downto 0);
        SW             : in  std_logic_vector(9 downto 0);

        LEDR           : out std_logic_vector(9 downto 0);

        HEX0           : out std_logic_vector(6 downto 0);
        HEX1           : out std_logic_vector(6 downto 0);
        HEX2           : out std_logic_vector(6 downto 0);
        HEX3           : out std_logic_vector(6 downto 0);
        HEX4           : out std_logic_vector(6 downto 0);
        HEX5           : out std_logic_vector(6 downto 0)
    );
end recop_de1_soc_test;
architecture beh of recop_de1_soc_test is
    signal init : bit_1;
    signal reset : bit_1;
    signal sip_r : bit_16;
    signal current_state : bit_3;
    signal dprr_r : bit_2;
    signal dpcr_r : bit_32;
    signal sop_r    : bit_16; 

begin
    init  <= not KEY(1); 
    reset <= not KEY(0);
    sip_r <= "000000" & SW;
    LEDR <= sop_r(9 downto 0);
    u_recop : entity work.recop_top_v1
    port map(
        clk          => CLOCK_50,
        init         => init,
        reset        => reset,
        sip          => sip_r,
        current_state_output => current_state,
        dprr         => dprr_r,
        dpcr         => dpcr_r,
        sop          => sop_r
    );

end beh;