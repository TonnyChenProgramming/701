library ieee;
use ieee.std_logic_1164.all;

-- Basic vector aliases used by the GP2 ASP wrappers.
-- These names match the Lab 2 / teammate code style.
package asp_types is
    subtype bit_1  is std_logic;
    subtype bit_4  is std_logic_vector(3 downto 0);
    subtype bit_8  is std_logic_vector(7 downto 0);
    subtype bit_9  is std_logic_vector(8 downto 0);
    subtype bit_16 is std_logic_vector(15 downto 0);
    subtype bit_20 is std_logic_vector(19 downto 0);
    subtype bit_32 is std_logic_vector(31 downto 0);
    subtype bit_36 is std_logic_vector(35 downto 0);
end package asp_types;
