library ieee;
use ieee.std_logic_1164.all;
use work.asp_types.all;

package asp_constants is
    constant ADDR_SEL_ORIGIN_INIT : bit_2 := "00";
    constant ADDR_SEL_LEFT        : bit_2 := "01";
    constant ADDR_SEL_LEFT_WAIT   : bit_2 := "10";
    constant ADDR_SEL_RIGHT       : bit_2 := "11";
end asp_constants;
