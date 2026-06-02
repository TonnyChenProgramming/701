library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;
use work.recop_types.all;

entity status_decoder is
    port(
        CLOCK : in  bit_1; 
        RESET : in bit_1;

        recv  : in  tdma_min_port;

        DPRR_ld : in bit_1;
        sop_ld : in bit_1

    );
end status_decoder;

architecture beh of status_decoder is 

begin
    

end architecture;