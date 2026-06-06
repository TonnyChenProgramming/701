library ieee;
use ieee.std_logic_1164.all;

use work.recop_types.all;
use work.asp_packet_pkg.all;
use work.TdmaMinTypes.all;

-- Board-friendly ReCOP control/status bridge.
--
-- This uses Member A's SIP command encoder and NoC status decoder directly:
--   SW(1 downto 0) chooses ASP address: 00 ADC, 01 AVG, 10 COR, 11 PK
--   KEY3 pulse sends START
--   KEY2 pulse sends STOP
--   KEY1 pulse sends CLEAR
--   KEY0 is board reset at the wrapper level
--
-- The one-cycle pulse guard prevents a held active-low key from flooding NoC.
entity gp2_recop_control_io is
    port (
        clk   : in  std_logic;
        reset : in  std_logic;

        key   : in  std_logic_vector(3 downto 0);
        sw    : in  std_logic_vector(9 downto 0);

        recv  : in  tdma_min_port;
        send  : out tdma_min_port;

        ledr  : out std_logic_vector(9 downto 0)
    );
end entity gp2_recop_control_io;

architecture rtl of gp2_recop_control_io is
    constant NULL_TDMA_PORT : tdma_min_port := (
        addr => NULL_ADDR,
        data => (others => '0')
    );

    signal sip_s           : bit_16;
    signal raw_command     : tdma_min_port := NULL_TDMA_PORT;
    signal send_r          : tdma_min_port := NULL_TDMA_PORT;
    signal command_active_r : std_logic := '0';

    signal sop_from_status : bit_16 := (others => '0');
    signal sop_status_flag : bit_1 := '0';
    signal sop_update_done : bit_1 := '0';
    signal ledr_r          : std_logic_vector(9 downto 0) := (others => '0');
begin
    sip_s <= "00" & sw & key;
    send <= send_r;
    ledr <= ledr_r;

    u_encoder : entity work.sip_to_noc_command_encoder
        port map (
            sip_r => sip_s,
            recop_command => raw_command
        );

    u_status : entity work.noc_status_to_sop_decoder
        port map (
            clk => clk,
            reset => reset,
            recv => recv,
            sop_from_status => sop_from_status,
            sop_status_flag => sop_status_flag,
            sop_update_done => sop_update_done
        );

    process(clk)
    begin
        if rising_edge(clk) then
            if reset = '1' then
                send_r <= NULL_TDMA_PORT;
                command_active_r <= '0';
            else
                send_r <= NULL_TDMA_PORT;

                if raw_command.addr /= NULL_ADDR then
                    if command_active_r = '0' then
                        send_r <= raw_command;
                    end if;
                    command_active_r <= '1';
                else
                    command_active_r <= '0';
                end if;
            end if;
        end if;
    end process;

    process(clk)
    begin
        if rising_edge(clk) then
            if reset = '1' then
                ledr_r <= (others => '0');
                sop_update_done <= '0';
            else
                sop_update_done <= '0';

                if sop_status_flag = '1' then
                    ledr_r <= sop_from_status(9 downto 0);
                    sop_update_done <= '1';
                end if;
            end if;
        end if;
    end process;
end architecture rtl;
