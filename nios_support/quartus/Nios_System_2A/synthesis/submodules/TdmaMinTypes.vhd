library ieee;
use ieee.std_logic_1164.all;

use work.asp_packet_pkg.all;

-- Shared TDMA-MIN port type for the GP2 NoC-facing blocks.
-- The NoC route is carried by addr; data carries the 32-bit ASP packet word.
package TdmaMinTypes is
    type tdma_min_port is record
        addr : addr8_t;
        data : packet_word_t;
    end record;
end package TdmaMinTypes;
