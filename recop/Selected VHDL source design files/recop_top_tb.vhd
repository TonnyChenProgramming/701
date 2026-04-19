library ieee;
use ieee.std_logic_1164.all;
use work.recop_types.all;
 
entity recop_top_tb is
end;

architecture sim of recop_top_tb is

    signal clk   : std_logic := '0';
    signal reset : std_logic := '0';
    signal init  : std_logic := '0';
    signal sip   : std_logic_vector(15 downto 0) := x"0050";
	 
	 signal KEY_tb : std_logic_vector(3 downto 0) := "1111";
	 signal SW_tb  : std_logic_vector(9 downto 0) := "0000000000";
	 
    -- Outputs we want to observe in the waveform
    signal LEDR_tb : std_logic_vector(9 downto 0);
    signal HEX0_tb : std_logic_vector(6 downto 0);
    signal HEX1_tb : std_logic_vector(6 downto 0);
    signal HEX2_tb : std_logic_vector(6 downto 0);
    signal HEX3_tb : std_logic_vector(6 downto 0);
    signal HEX4_tb : std_logic_vector(6 downto 0);
    signal HEX5_tb : std_logic_vector(6 downto 0);
    signal dprr_tb : bit_2;
    signal dpcr_tb : bit_32;
    signal sop_tb  : bit_16;

begin

	 KEY_tb(0) <= not reset;
    KEY_tb(1) <= not init;
    KEY_tb(3 downto 2) <= "11";  -- unused keys, leave released
	 
	 -- SW drives lower 10 bits of SIP (upper 6 bits unused)
    SW_tb <= sip(9 downto 0);

    -- DUT
    uut : entity work.recop_top
        port map(
            CLOCK_50 => clk,
            KEY      => KEY_tb,
            SW       => SW_tb,
            LEDR     => LEDR_tb,
            HEX0     => HEX0_tb,
            HEX1     => HEX1_tb,
            HEX2     => HEX2_tb,
            HEX3     => HEX3_tb,
            HEX4     => HEX4_tb,
            HEX5     => HEX5_tb,
            dprr     => dprr_tb,
            dpcr     => dpcr_tb,
            sop      => sop_tb
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
        -- Assert init, leave reset deasserted
        reset <= '0';
        init  <= '1';
        wait for 45 ns;
        init  <= '0';
 
        -- Run program
        wait for 5000 ns;
 
        -- Pulse reset
        reset <= '1';
        wait for 45 ns;
        reset <= '0';
 
        wait for 5000 ns;
        wait;
    end process;

end;