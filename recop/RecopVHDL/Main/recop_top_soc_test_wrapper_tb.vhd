library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

use work.recop_types.all;
use work.various_constants.all;
use work.TdmaMinTypes.all;
use work.asp_packet_pkg.all;

entity recop_top_soc_test_wrapper_tb is
end entity;

architecture sim of recop_top_soc_test_wrapper_tb is

    signal CLOCK_50 : std_logic := '0';

    -- DE1-SoC KEY:
    -- not pressed = '1'
    -- pressed     = '0'
    signal KEY  : std_logic_vector(3 downto 0) := "1111";
    signal SW   : std_logic_vector(9 downto 0) := (others => '0');

    signal LEDR : std_logic_vector(9 downto 0);

    signal HEX0 : std_logic_vector(6 downto 0);
    signal HEX1 : std_logic_vector(6 downto 0);
    signal HEX2 : std_logic_vector(6 downto 0);
    signal HEX3 : std_logic_vector(6 downto 0);
    signal HEX4 : std_logic_vector(6 downto 0);
    signal HEX5 : std_logic_vector(6 downto 0);

    constant CLK_PERIOD : time := 20 ns; -- 50 MHz

    --------------------------------------------------------------------
    -- helper: press one active-low KEY
    --------------------------------------------------------------------
    procedure press_key(
        signal key_sig : out std_logic_vector(3 downto 0);
        constant key_index : in integer
    ) is
        variable tmp : std_logic_vector(3 downto 0);
    begin
        tmp := "1111";
        tmp(key_index) := '0';

        key_sig <= tmp;
        wait for 5 * CLK_PERIOD;

        key_sig <= "1111";
        wait for 10 * CLK_PERIOD;
    end procedure;

    --------------------------------------------------------------------
    -- helper: select SIP target using SW1..SW0
    -- 00 = AVE
    -- 01 = ADC
    -- 10 = COR
    -- 11 = PK
    --------------------------------------------------------------------
    procedure select_sip_target(
        signal sw_sig : inout std_logic_vector(9 downto 0);
        constant target : in std_logic_vector(1 downto 0)
    ) is
    begin
        sw_sig(1 downto 0) <= target;
        wait for 3 * CLK_PERIOD;
    end procedure;

    --------------------------------------------------------------------
    -- helper: fake recv status using SW9..SW8 and SW7/SW6/SW5
    --
    -- source:
    -- 00 = AVE
    -- 01 = ADC
    -- 10 = COR
    -- 11 = PK
    --
    -- cmd:
    -- "100" = START status through SW7
    -- "010" = STOP status through SW6
    -- "001" = CLEAR status through SW5
    --------------------------------------------------------------------
    procedure fake_recv_status(
        signal sw_sig : inout std_logic_vector(9 downto 0);
        constant source : in std_logic_vector(1 downto 0);
        constant cmd    : in std_logic_vector(2 downto 0)
    ) is
    begin
        sw_sig(9 downto 8) <= source;
        wait for 2 * CLK_PERIOD;

        -- create rising edge on SW7/SW6/SW5
        sw_sig(7 downto 5) <= cmd;
        wait for 5 * CLK_PERIOD;

        -- return to zero so same command can be triggered again later
        sw_sig(7 downto 5) <= "000";
        wait for 15 * CLK_PERIOD;
    end procedure;

begin

    --------------------------------------------------------------------
    -- DUT
    --------------------------------------------------------------------
    u_dut : entity work.recop_top_soc_test_wrapper
        port map (
            CLOCK_50 => CLOCK_50,
            KEY      => KEY,
            SW       => SW,
            LEDR     => LEDR,
            HEX0     => HEX0,
            HEX1     => HEX1,
            HEX2     => HEX2,
            HEX3     => HEX3,
            HEX4     => HEX4,
            HEX5     => HEX5
        );

    --------------------------------------------------------------------
    -- 50 MHz clock
    --------------------------------------------------------------------
    clk_process : process
    begin
        while true loop
            CLOCK_50 <= '0';
            wait for CLK_PERIOD / 2;
            CLOCK_50 <= '1';
            wait for CLK_PERIOD / 2;
        end loop;
    end process;

    --------------------------------------------------------------------
    -- stimulus
    --------------------------------------------------------------------
    stim_process : process
    begin
        ----------------------------------------------------------------
        -- reset
        -- KEY0 pressed => reset active
        ----------------------------------------------------------------
        KEY <= "1110";
        SW  <= (others => '0');
        wait for 10 * CLK_PERIOD;

        KEY <= "1111";
        wait for 20 * CLK_PERIOD;

        ----------------------------------------------------------------
        -- SIP command test:
        -- SW1..SW0 select ASP.
        -- KEY3 START, KEY2 STOP, KEY1 CLEAR.
        --
        -- Expected:
        -- HEX4 shows send.addr low nibble.
        -- HEX3..HEX0 show send.data low 16 bits.
        ----------------------------------------------------------------

        -- AVE START / STOP / CLEAR
        -- select_sip_target(SW, "00");
        -- press_key(KEY, 3); -- START
        -- press_key(KEY, 2); -- STOP
        -- press_key(KEY, 1); -- CLEAR

        -- -- ADC START / STOP / CLEAR
        -- select_sip_target(SW, "01");
        -- press_key(KEY, 3);
        -- press_key(KEY, 2);
        -- press_key(KEY, 1);

        -- -- COR START / STOP / CLEAR
        -- select_sip_target(SW, "10");
        -- press_key(KEY, 3);
        -- press_key(KEY, 2);
        -- press_key(KEY, 1);

        -- -- PK START / STOP / CLEAR
        -- select_sip_target(SW, "11");
        -- press_key(KEY, 3);
        -- press_key(KEY, 2);
        -- press_key(KEY, 1);

        -- wait for 20 * CLK_PERIOD;

        ----------------------------------------------------------------
        -- fake recv status test:
        --
        -- LEDR3 = ADC
        -- LEDR2 = AVE
        -- LEDR1 = COR
        -- LEDR0 = PK
        ----------------------------------------------------------------

        -- AVE ON then OFF
        fake_recv_status(SW, "00", "100"); -- AVE START status
        fake_recv_status(SW, "00", "010"); -- AVE STOP status

        -- ADC ON then OFF
        fake_recv_status(SW, "01", "100"); -- ADC START status
        fake_recv_status(SW, "01", "010"); -- ADC STOP status

        -- COR ON then OFF
        fake_recv_status(SW, "10", "100"); -- COR START status
        fake_recv_status(SW, "10", "010"); -- COR STOP status

        -- PK ON then OFF
        fake_recv_status(SW, "11", "100"); -- PK START status
        fake_recv_status(SW, "11", "010"); -- PK STOP status

        ----------------------------------------------------------------
        -- turn all four status LEDs ON
        -- expected final LEDR(3 downto 0) = "1111"
        ----------------------------------------------------------------
        fake_recv_status(SW, "00", "100"); -- AVE ON, LEDR2
        fake_recv_status(SW, "01", "100"); -- ADC ON, LEDR3
        fake_recv_status(SW, "10", "100"); -- COR ON, LEDR1
        fake_recv_status(SW, "11", "100"); -- PK ON, LEDR0

        wait for 50 * CLK_PERIOD;

        ----------------------------------------------------------------
        -- clear all four status LEDs
        -- expected final LEDR(3 downto 0) = "0000"
        ----------------------------------------------------------------
        fake_recv_status(SW, "00", "001"); -- AVE CLEAR/off
        fake_recv_status(SW, "01", "001"); -- ADC CLEAR/off
        fake_recv_status(SW, "10", "001"); -- COR CLEAR/off
        fake_recv_status(SW, "11", "001"); -- PK CLEAR/off

        wait for 50 * CLK_PERIOD;

        wait;
    end process;

end architecture sim;