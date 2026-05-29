library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

use work.asp_types.all;
use work.TdmaMinTypes.all;
use work.asp_packet_pkg.all;

-- TDMA-MIN facing wrapper for the ADC-ASP core.
entity adc_asp is
    port (
        clock : in  bit_1;
        reset : in  bit_1;
        init  : in  bit_1;

        send  : out tdma_min_port;
        recv  : in  tdma_min_port
    );
end entity adc_asp;

architecture rtl of adc_asp is
    signal asp_reset        : bit_1;
    signal recv_word        : packet_word_t;
    signal cmd_valid        : std_logic;
    signal cmd_ready        : std_logic;
    signal out_valid        : std_logic;
    signal out_ready        : std_logic;
    signal out_word         : packet_word_t;
    signal status_word      : packet_word_t;
    signal status_pending_r : std_logic := '0';

    function port4_to_addr8(port4 : std_logic_vector(3 downto 0)) return addr8_t is
    begin
        case port4 is
            when "0000" => return RECOP_ADDR;
            when "0001" => return ADC_ADDR;
            when "0010" => return AVE_ASP_ADDR;
            when "0011" => return COR_ASP_ADDR;
            when "0100" => return PK_ADDR;
            when "0101" => return NIOS_II_ADDR;
            when "0110" => return IDLE_ADDR;
            when others => return NULL_ADDR;
        end case;
    end function;
begin
    asp_reset <= reset or init;
    recv_word <= packet_word_t(std_logic_vector(recv.data));

    cmd_valid <= '1' when recv.addr = ADC_ADDR
                      and packet_kind(recv_word) = PKT_KIND_CMD
                 else '0';

    out_ready <= not status_pending_r;

    u_core : entity work.adc_asp_core
        port map (
            clk         => clock,
            reset       => asp_reset,
            cmd_valid   => cmd_valid,
            cmd_ready   => cmd_ready,
            cmd_word    => recv_word,
            out_valid   => out_valid,
            out_ready   => out_ready,
            out_word    => out_word,
            status_word => status_word
        );

    process(clock)
    begin
        if rising_edge(clock) then
            if asp_reset = '1' then
                status_pending_r <= '0';
            else
                if status_pending_r = '1' then
                    status_pending_r <= '0';
                end if;

                if cmd_valid = '1' then
                    status_pending_r <= '1';
                end if;
            end if;
        end if;
    end process;

    send.addr <= port4_to_addr8(packet_dest(status_word)) when status_pending_r = '1'
                 else port4_to_addr8(packet_dest(out_word)) when out_valid = '1'
                 else NULL_ADDR;

    send.data <= status_word when status_pending_r = '1'
                 else out_word when out_valid = '1'
                 else (others => '0');

end architecture rtl;
