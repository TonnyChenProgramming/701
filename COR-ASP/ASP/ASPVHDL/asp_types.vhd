--Zoran Salcic

library ieee;
use ieee.std_logic_1164.all;
package asp_types is
	
	subtype bit_36 is std_logic_vector(35 downto 0);
	subtype bit_35 is std_logic_vector(34 downto 0);
	subtype bit_34 is std_logic_vector(33 downto 0);
	subtype bit_33 is std_logic_vector(32 downto 0);
	subtype bit_32 is std_logic_vector(31 downto 0);
	subtype bit_23 is std_logic_vector(22 downto 0);
	subtype bit_22 is std_logic_vector(21 downto 0);
	subtype bit_20 is std_logic_vector(19 downto 0); -- (sungchul)
	subtype bit_19 is std_logic_vector(18 downto 0); -- (sungchul)
	subtype bit_18 is std_logic_vector(17 downto 0);
	subtype bit_17 is std_logic_vector(16 downto 0);
	subtype bit_16 is std_logic_vector(15 downto 0);
	subtype bit_13 is std_logic_vector(12 downto 0);
	subtype bit_12 is std_logic_vector(11 downto 0);
	subtype bit_11 is std_logic_vector(10 downto 0);
	subtype bit_10 is std_logic_vector(9 downto 0);
	subtype bit_9 is std_logic_vector(8 downto 0);
	subtype bit_8 is std_logic_vector(7 downto 0);
	subtype bit_7 is std_logic_vector(6 downto 0);
	subtype bit_6 is std_logic_vector(5 downto 0);
	subtype bit_5 is std_logic_vector(4 downto 0);
	subtype bit_4 is std_logic_vector(3 downto 0);
	subtype bit_3 is std_logic_vector(2 downto 0);
	subtype bit_2 is std_logic_vector(1 downto 0);
	subtype bit_1 is std_logic;

end asp_types;
