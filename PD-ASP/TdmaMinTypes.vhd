library ieee;
use ieee.std_logic_1164.all;

use work.asp_packet_pkg.all;

-- Minimal TDMA-MIN port type used by GP2 ASP top-level wrappers.
-- The NoC routes by addr, while data carries the 32-bit shared ASP packet.
package TdmaMinTypes is
    type tdma_min_port is record
        addr : addr8_t;
        data : packet_word_t;
    end record;
end package TdmaMinTypes;
