library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

use work.recop_types.all;
use work.various_constants.all;
use work.TdmaMinTypes.all;
use work.asp_packet_pkg.all;

entity recop_and_peripherals_top_tb is
end;

architecture sim of recop_and_peripherals_top_tb is

    signal CLOCK_50 : std_logic := '0';

    signal recv : tdma_min_port := (
        addr => (others => '0'),
        data => (others => '0')
    );

    signal send : tdma_min_port;

    -- DE1-SoC KEY:
    -- not pressed = '1'
    -- pressed     = '0'
    signal KEY  : std_logic_vector(3 downto 0) := "1111";
    signal SW   : std_logic_vector(9 downto 0) := (others => '0');
    signal LEDR : std_logic_vector(9 downto 0);

    constant CLK_PERIOD : time := 20 ns;  -- 50 MHz

begin

    --------------------------------------------------------------------
    -- DUT
    --------------------------------------------------------------------
    u_dut : entity work.recop_and_peripherals_top
        port map (
            CLOCK_50 => CLOCK_50,

            recv => recv,
            send => send,

            KEY  => KEY,
            SW   => SW,
            LEDR => LEDR
        );

    --------------------------------------------------------------------
    -- Clock generation
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
    -- Stimulus
    --------------------------------------------------------------------
    stim_process : process
    begin

        ----------------------------------------------------------------
        -- Reset
        -- Top-level:
        -- init_s    <= not KEY(0);
        -- reset_cpu <= not KEY(0);
        --
        -- KEY(0) = 0 means reset active.
        ----------------------------------------------------------------
        KEY <= "1110";  -- KEY(0) pressed
        SW  <= (others => '0');
        recv.addr <= (others => '0');
        recv.data <= (others => '0');
        wait for 5 * CLK_PERIOD;

        KEY <= "1111";  -- release reset
        wait for 20 * CLK_PERIOD;

        ----------------------------------------------------------------
        -- ADC STATUS: enabled = 1
        -- ADC SOP bit should be LEDR(3)
        --
        -- ADC status payload:
        -- recv.data(15) = enabled
        ----------------------------------------------------------------
        recv.addr <= ADC_ADDR;
        recv.data <= make_packet(
            PKT_KIND_STATUS,
            TAG_STATUS,
            ADC_ADDR(3 downto 0),
            "0000" & '1' & "000000000000000"
        );

        wait for CLK_PERIOD;

        recv.addr <= (others => '0');
        recv.data <= (others => '0');

        wait for 20 * CLK_PERIOD;

        ----------------------------------------------------------------
        -- ADC STATUS: enabled = 0
        -- LEDR(3) should turn off
        ----------------------------------------------------------------
        recv.addr <= ADC_ADDR;
        recv.data <= make_packet(
            PKT_KIND_STATUS,
            TAG_STATUS,
            ADC_ADDR(3 downto 0),
            "0000" & '0' & "000000000000000"
        );

        wait for CLK_PERIOD;

        recv.addr <= (others => '0');
        recv.data <= (others => '0');

        wait for 20 * CLK_PERIOD;

        ----------------------------------------------------------------
        -- AVE / AVG STATUS: enabled = 1
        -- AVE SOP bit should be LEDR(2)
        --
        -- AVE status payload:
        -- recv.data(15) = enabled
        ----------------------------------------------------------------
        recv.addr <= AVE_ASP_ADDR;
        recv.data <= make_packet(
            PKT_KIND_STATUS,
            TAG_STATUS,
            AVE_ASP_ADDR(3 downto 0),
            "0000" & '1' & "000000000000000"
        );

        wait for CLK_PERIOD;

        recv.addr <= (others => '0');
        recv.data <= (others => '0');

        wait for 20 * CLK_PERIOD;

        ----------------------------------------------------------------
        -- AVE / AVG STATUS: enabled = 0
        -- LEDR(2) should turn off
        ----------------------------------------------------------------
        recv.addr <= AVE_ASP_ADDR;
        recv.data <= make_packet(
            PKT_KIND_STATUS,
            TAG_STATUS,
            AVE_ASP_ADDR(3 downto 0),
            "0000" & '0' & "000000000000000"
        );

        wait for CLK_PERIOD;

        recv.addr <= (others => '0');
        recv.data <= (others => '0');

        wait for 20 * CLK_PERIOD;

        ----------------------------------------------------------------
        -- PK STATUS: enabled = 1
        -- PK SOP bit should be LEDR(0)
        --
        -- PK status payload:
        -- recv.data(15) = enabled_r
        ----------------------------------------------------------------
        recv.addr <= PK_ADDR;
        recv.data <= make_packet(
            PKT_KIND_STATUS,
            TAG_STATUS,
            PK_ADDR(3 downto 0),
            "0000" & '1' & "000000000000000"
        );

        wait for CLK_PERIOD;

        recv.addr <= (others => '0');
        recv.data <= (others => '0');

        wait for 20 * CLK_PERIOD;

        ----------------------------------------------------------------
        -- PK STATUS: enabled = 0
        -- LEDR(0) should turn off
        ----------------------------------------------------------------
        recv.addr <= PK_ADDR;
        recv.data <= make_packet(
            PKT_KIND_STATUS,
            TAG_STATUS,
            PK_ADDR(3 downto 0),
            "0000" & '0' & "000000000000000"
        );

        wait for CLK_PERIOD;

        recv.addr <= (others => '0');
        recv.data <= (others => '0');

        wait for 20 * CLK_PERIOD;

        ----------------------------------------------------------------
        -- Optional: all three ON together
        ----------------------------------------------------------------
        recv.addr <= ADC_ADDR;
        recv.data <= make_packet(
            PKT_KIND_STATUS,
            TAG_STATUS,
            ADC_ADDR(3 downto 0),
            "0000" & '1' & "000000000000000"
        );
        wait for CLK_PERIOD;
        recv.addr <= (others => '0');
        recv.data <= (others => '0');
        wait for 10 * CLK_PERIOD;

        recv.addr <= AVE_ASP_ADDR;
        recv.data <= make_packet(
            PKT_KIND_STATUS,
            TAG_STATUS,
            AVE_ASP_ADDR(3 downto 0),
            "0000" & '1' & "000000000000000"
        );
        wait for CLK_PERIOD;
        recv.addr <= (others => '0');
        recv.data <= (others => '0');
        wait for 10 * CLK_PERIOD;

        recv.addr <= PK_ADDR;
        recv.data <= make_packet(
            PKT_KIND_STATUS,
            TAG_STATUS,
            PK_ADDR(3 downto 0),
            "0000" & '1' & "000000000000000"
        );
        wait for CLK_PERIOD;
        recv.addr <= (others => '0');
        recv.data <= (others => '0');
        wait for 30 * CLK_PERIOD;

        ----------------------------------------------------------------
        -- End simulation
        ----------------------------------------------------------------
        wait;
    end process;

end sim;