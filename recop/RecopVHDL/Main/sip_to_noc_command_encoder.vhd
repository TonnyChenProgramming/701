library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

use work.recop_types.all;
use work.various_constants.all;
use work.asp_packet_pkg.all;
use work.TdmaMinTypes.all;

entity sip_to_noc_command_encoder is
    port (
        sip_r : in bit_16;
        recop_command : out tdma_min_port
    );
end sip_to_noc_command_encoder;

architecture beh of sip_to_noc_command_encoder is
begin

    process (sip_r)
        variable dest_addr_v   : std_logic_vector(7 downto 0);
        variable dest_nibble_v : std_logic_vector(3 downto 0);
    begin
        dest_addr_v := std_logic_vector(resize(unsigned(sip_r(5 downto 4)), 8) + 1);
        dest_nibble_v := dest_addr_v(3 downto 0);

        recop_command.addr <= dest_addr_v;

        case sip_r(3 downto 1) is
            when "011" =>
                -- start command
                recop_command.data <= make_packet(
                    PKT_KIND_CMD,
                    CMD_START,
                    dest_nibble_v,
                    std_logic_vector(EMPTY_PAYLOAD)
                );

            when "101" =>
                -- stop command
                recop_command.data <= make_packet(
                    PKT_KIND_CMD,
                    CMD_STOP,
                    dest_nibble_v,
                    std_logic_vector(EMPTY_PAYLOAD)
                );

            when "110" =>
                -- clear command
                recop_command.data <= make_packet(
                    PKT_KIND_CMD,
                    CMD_CLEAR,
                    dest_nibble_v,
                    std_logic_vector(EMPTY_PAYLOAD)
                );

            when others =>
                -- no operation / idle command
                recop_command.addr <= NULL_ADDR;
                recop_command.data <= make_packet(
                    PKT_KIND_CMD,
                    CMD_NOP,
                    dest_nibble_v,
                    std_logic_vector(EMPTY_PAYLOAD)
                );
        end case;
    end process;

end beh;