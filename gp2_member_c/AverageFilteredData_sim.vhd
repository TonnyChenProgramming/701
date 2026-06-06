library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

-- Portable simulation model for the COR-ASP AverageFilteredData RAM.
--
-- The production COR-ASP file instantiates Intel altsyncram. This behavioural
-- entity has the same port list so the standalone Member C integration test can
-- run in ModelSim/GHDL without requiring the Intel simulation libraries.
entity AverageFilteredData is
    port (
        clock     : in  std_logic := '1';
        data      : in  std_logic_vector(15 downto 0);
        rdaddress : in  std_logic_vector(8 downto 0);
        wraddress : in  std_logic_vector(8 downto 0);
        wren      : in  std_logic := '0';
        q         : out std_logic_vector(15 downto 0)
    );
end entity AverageFilteredData;

architecture sim of AverageFilteredData is
    type ram_t is array (0 to 511) of std_logic_vector(15 downto 0);
    signal ram : ram_t := (others => (others => '0'));
    signal q_r : std_logic_vector(15 downto 0) := (others => '0');
begin
    process(clock)
    begin
        if rising_edge(clock) then
            if wren = '1' then
                ram(to_integer(unsigned(wraddress))) <= data;
            end if;

            q_r <= ram(to_integer(unsigned(rdaddress)));
        end if;
    end process;

    q <= q_r;
end architecture sim;
