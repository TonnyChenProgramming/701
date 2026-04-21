-- sim_dm.vhd
-- Behavioural 512-word x 16-bit Data Memory for QuestaSim simulation
-- Replaces data_memory_ip (altsyncram) which requires altera_mf library

library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;
use work.recop_types.all;

entity sim_dm is
    port (
        address  : in  bit_12;   -- 12-bit address (matches data_memory_ip)
        clock    : in  bit_1;
        data     : in  bit_16;
        wren     : in  bit_1;
        q        : out bit_16
    );
end sim_dm;

architecture beh of sim_dm is
    type ram_t is array (0 to 4095) of bit_16;
    signal ram : ram_t := (others => x"0000");
begin
    process(clock)
    begin
        if rising_edge(clock) then
            if wren = '1' then
                ram(to_integer(unsigned(address))) <= data;
            end if;
            q <= ram(to_integer(unsigned(address)));
        end if;
    end process;
end beh;
