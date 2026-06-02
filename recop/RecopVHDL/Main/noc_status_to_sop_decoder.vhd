library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

use work.recop_types.all;
use work.various_constants.all;
use work.asp_packet_pkg.all;
use work.TdmaMinTypes.all;

entity noc_status_to_sop_decoder is
    port (
        clk   : in bit_1;
        reset : in bit_1;

        recv  : in tdma_min_port;
        sop_from_status   : out bit_16;
        sop_status_flag : out bit_1;
        sop_update_done : in bit_1
    );
end noc_status_to_sop_decoder;

architecture beh of noc_status_to_sop_decoder is
    signal sop_reg : bit_16 := (others => '0');
    constant SOP_PK_BIT  : integer := 0;
    constant SOP_COR_BIT : integer := 1;
    constant SOP_AVE_BIT : integer := 2;
    constant SOP_ADC_BIT : integer := 3;

begin

    sop_from_status <= sop_reg;

    process(clk, reset)
    begin
        if reset = '1' then
            sop_reg <= (others => '0');
            sop_status_flag <= '0';
        elsif rising_edge(clk) then

            -- Only respond to STATUS packets
            if recv.data(31 downto 28) = PKT_KIND_STATUS then
                sop_status_flag <= '1';
                case recv.addr is

                    when ADC_ADDR =>
                        -- AVG status payload:
                        -- recv.data(15) = enabled
                        -- enabled = '1' means AVE is operating
                        sop_reg(SOP_AVE_BIT) <= recv.data(15);

                    when AVE_ASP_ADDR =>
                        -- AVG status:
                        -- recv.data(15) = enabled
                        sop_reg(SOP_AVE_BIT) <= recv.data(15);

                    when COR_ASP_ADDR =>
                        -- recv.data(1 downto 0)
                        -- = direct_passthrough_en & reset_done_reg
                        --
                        -- "00" => operating     => SOP COR bit ON
                        -- others => not running => SOP COR bit OFF
                        if recv.data(1 downto 0) = "00" then
                            sop_reg(SOP_COR_BIT) <= '1';
                        else
                            sop_reg(SOP_COR_BIT) <= '0';
                        end if;

                    when PK_ADDR =>
                        -- Leave blank for now
                        null;

                    when others =>
                        null;

                end case;
            else
                if sop_update_done = '1' then
                    sop_status_flag<= '0';
                end if;
            end if;
        end if;
    end process;

end beh;