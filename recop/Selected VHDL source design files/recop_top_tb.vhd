library ieee;
use ieee.std_logic_1164.all;

entity recop_top_tb is
end;

architecture sim of recop_top_tb is

    signal clk   : std_logic := '0';
    signal reset : std_logic := '1';
    signal init  : std_logic := '0';
    signal sip   : std_logic_vector(15 downto 0) := x"0000";

begin

    -- DUT
    uut: entity work.recop_top
        port map(
            clk   => clk,
            reset => reset,
            init  => init,
            sip   => sip
        );

    ------------------------------------------------
    -- clock generation (20 ns period / 50mhz)
    ------------------------------------------------
    clk_process : process
    begin
        while true loop
            clk <= '0';
            wait for 10 ns;
            clk <= '1';
            wait for 10 ns;
        end loop;
    end process;

    ------------------------------------------------
    -- reset sequence
    ------------------------------------------------
    stim_proc : process
    begin
        reset <= '0';
        init <= '1';
        wait for 45 ns;
        init <= '0';

        -- run enough cycles
        wait for 5000 ns;
        reset <= '1';
        wait for 45 ns; 
        reset <= '0';

        wait for 5000 ns;

        wait;
    end process;

end;