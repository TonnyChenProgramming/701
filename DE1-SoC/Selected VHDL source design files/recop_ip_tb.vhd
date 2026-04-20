library ieee;
use ieee.std_logic_1164.all;
use work.recop_types.all;

entity recop_ip_tb is
end recop_ip_tb;

architecture sim of recop_ip_tb is
    signal clock       : bit_1 := '0';
    signal reset       : bit_1 := '1';
    signal init        : bit_1 := '0';
    signal sip         : bit_16 := x"1234";
    signal sop         : bit_16;
    signal dpcr        : bit_32;
    signal dprr        : bit_2;
    signal debug_state : bit_3;
begin
    uut : entity work.ReCOP_IP
        port map (clock => clock, reset => reset, init => init,
                  sip => sip, sop => sop, dpcr => dpcr,
                  dprr => dprr, debug_state => debug_state);

    clock <= not clock after 10 ns;

    stim : process
    begin
        reset <= '1'; init <= '0';
        wait for 40 ns;
        reset <= '0'; init <= '1';
        wait for 20 ns;
        init <= '0';
        wait for 8000 ns;
        report "Done. Check waveform.";
        wait;
    end process;
end sim;
