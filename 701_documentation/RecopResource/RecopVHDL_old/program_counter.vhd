library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

use work.recop_types.all;
use work.various_constants.all;

entity program_counter is
    port(
        clk : in bit_1;
        init : in bit_1;
        reset : in bit_1;

        pc_write : in bit_1;

        next_pc : in bit_16;
        current_pc:    out bit_16
    );
end program_counter;
architecture beh of program_counter is
    begin

        process (clk, reset)
            begin
                if reset = '1' then
                    current_pc <= x"0000";
                elsif init = '1' then
                    current_pc <= x"0000";
                elsif rising_edge(clk) then 
                    if pc_write = '1' then
                        current_pc <= next_pc;
                    end if;
                end if;
        end process;	
end beh;