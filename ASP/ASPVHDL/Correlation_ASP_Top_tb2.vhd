LIBRARY ieee;
USE ieee.std_logic_1164.all;
USE ieee.numeric_std.all;
USE work.asp_types.all;
USE work.asp_constants.all;

ENTITY Correlation_ASP_Top_tb IS
END Correlation_ASP_Top_tb;

ARCHITECTURE sim OF Correlation_ASP_Top_tb IS

    constant CLK_PERIOD : time := 20 ns;

    signal clock : bit_1 := '0';
    signal reset : bit_1 := '0';
    signal init  : bit_1 := '0';

    signal dm_data_in : bit_16 := (others => '0');
    signal dm_wr_addr : bit_9  := (others => '0');
    signal dm_wren    : bit_1  := '0';

    signal calculate : bit_1 := '0';
    signal new_ave_data_addr : bit_9 := (others => '0');

    signal config_en : bit_1 := '0';
    signal correlation_window_n : bit_9 := (others => '0');
    signal offset_h : bit_16 := (others => '0');

    signal correlation : bit_36;
    signal correlation_rdy : bit_1;

    function to_bit_9(x : natural) return bit_9 is
    begin
        return bit_9(to_unsigned(x, 9));
    end function;

    function to_bit_16(x : natural) return bit_16 is
    begin
        return bit_16(to_unsigned(x, 16));
    end function;

BEGIN

    --------------------------------------------------------------------
    -- DUT
    --------------------------------------------------------------------
    DUT : ENTITY work.Correlation_ASP_Top
        PORT MAP (
            clock => clock,
            init  => init,
            reset => reset,

            dm_data_in => dm_data_in,
            dm_wr_addr => dm_wr_addr,
            dm_wren    => dm_wren,

            calculate => calculate,
            new_ave_data_addr => new_ave_data_addr,
            config_en => config_en,
            correlation_window_n => correlation_window_n,
            offset_h => offset_h,

            correlation => correlation,
            correlation_rdy => correlation_rdy
        );

    --------------------------------------------------------------------
    -- Clock generation
    --------------------------------------------------------------------
    clock_process : PROCESS
    BEGIN
        WHILE true LOOP
            clock <= '0';
            WAIT FOR CLK_PERIOD / 2;
            clock <= '1';
            WAIT FOR CLK_PERIOD / 2;
        END LOOP;
    END PROCESS;

    --------------------------------------------------------------------
    -- Stimulus
    --------------------------------------------------------------------
    stim_proc : PROCESS

        procedure wait_cycles(constant n : natural) is
        begin
            for i in 1 to n loop
                WAIT UNTIL rising_edge(clock);
            end loop;
        end procedure;

        procedure write_ram(
            constant addr : natural;
            constant data : natural
        ) is
        begin
            WAIT UNTIL falling_edge(clock);

            dm_wr_addr <= to_bit_9(addr);
            dm_data_in <= to_bit_16(data);
            dm_wren <= '1';

            WAIT UNTIL rising_edge(clock);

            WAIT UNTIL falling_edge(clock);
            dm_wren <= '0';

            WAIT UNTIL rising_edge(clock);
        end procedure;

        procedure configure_corr(
            constant window_n : natural;
            constant h_value  : natural
        ) is
        begin
            WAIT UNTIL falling_edge(clock);

            correlation_window_n <= to_bit_9(window_n);
            offset_h <= to_bit_16(h_value);
            config_en <= '1';

            WAIT UNTIL rising_edge(clock);

            WAIT UNTIL falling_edge(clock);
            config_en <= '0';

            WAIT UNTIL rising_edge(clock);
        end procedure;

        procedure start_calculation(
            constant latest_addr : natural
        ) is
        begin
            WAIT UNTIL falling_edge(clock);

            new_ave_data_addr <= to_bit_9(latest_addr);
            calculate <= '1';

            WAIT UNTIL rising_edge(clock);

            WAIT UNTIL falling_edge(clock);
            calculate <= '0';

            WAIT UNTIL rising_edge(clock);
        end procedure;

    BEGIN

        ----------------------------------------------------------------
        -- Reset
        ----------------------------------------------------------------
        REPORT "===== RESET =====";

        WAIT UNTIL falling_edge(clock);
        reset <= '1';

        wait_cycles(3);

        WAIT UNTIL falling_edge(clock);
        reset <= '0';

        wait_cycles(2);

        ----------------------------------------------------------------
        -- Load RAM data
        ----------------------------------------------------------------
        REPORT "===== LOAD RAM DATA =====";
        REPORT "RAM[0]=1, RAM[1]=2, RAM[2]=5, RAM[3]=7, RAM[4]=3";
        REPORT "RAM[5]=4, RAM[6]=6, RAM[7]=8, RAM[8]=9, RAM[9]=10";

        write_ram(0, 1);
        write_ram(1, 2);
        write_ram(2, 5);
        write_ram(3, 7);
        write_ram(4, 3);
        write_ram(5, 4);
        write_ram(6, 6);
        write_ram(7, 8);
        write_ram(8, 9);
        write_ram(9, 10);

        wait_cycles(3);

        ----------------------------------------------------------------
        -- TEST 1
        --
        -- window = 1
        -- latest_addr = 3
        -- h = 1
        --
        -- origin = 3 - 1 - 1 = 1
        --
        -- left_addr  = 0
        -- right_addr = 1
        --
        -- expected = (RAM[0]+1) * (RAM[1]+1)
        --          = (1+1) * (2+1)
        --          = 2 * 3
        --          = 6
        ----------------------------------------------------------------
        REPORT "===== TEST 1 =====";
        REPORT "window=1, latest_addr=3, h=1";
        REPORT "Expected correlation = 6";

        configure_corr(1, 1);
        wait_cycles(2);

        start_calculation(3);

        wait_cycles(35);

        REPORT "===== END TEST 1: expected correlation = 6 when rdy pulses =====";

        wait_cycles(10);

        ----------------------------------------------------------------
        -- TEST 2
        --
        -- window = 2
        -- latest_addr = 5
        -- h = 1
        --
        -- origin = 5 - 1 - 2 = 2
        --
        -- counter 0:
        --   left_addr  = 1
        --   right_addr = 2
        --   product = (RAM[1]+1) * (RAM[2]+1)
        --           = (2+1) * (5+1)
        --           = 3 * 6 = 18
        --
        -- counter 1:
        --   left_addr  = 0
        --   right_addr = 3
        --   product = (RAM[0]+1) * (RAM[3]+1)
        --           = (1+1) * (7+1)
        --           = 2 * 8 = 16
        --
        -- expected = 18 + 16 = 34
        ----------------------------------------------------------------
        REPORT "===== TEST 2 =====";
        REPORT "window=2, latest_addr=5, h=1";
        REPORT "Expected correlation = 34";

        configure_corr(2, 1);
        wait_cycles(2);

        start_calculation(5);

        wait_cycles(50);

        REPORT "===== END TEST 2: expected correlation = 34 when rdy pulses =====";

        wait_cycles(10);

        ----------------------------------------------------------------
        -- TEST 3
        --
        -- window = 3
        -- latest_addr = 7
        -- h = 2
        --
        -- origin = 7 - 1 - 3 = 3
        --
        -- counter 0:
        --   left_addr  = 2
        --   right_addr = 3
        --   product = (RAM[2]+2) * (RAM[3]+2)
        --           = (5+2) * (7+2)
        --           = 7 * 9 = 63
        --
        -- counter 1:
        --   left_addr  = 1
        --   right_addr = 4
        --   product = (RAM[1]+2) * (RAM[4]+2)
        --           = (2+2) * (3+2)
        --           = 4 * 5 = 20
        --
        -- counter 2:
        --   left_addr  = 0
        --   right_addr = 5
        --   product = (RAM[0]+2) * (RAM[5]+2)
        --           = (1+2) * (4+2)
        --           = 3 * 6 = 18
        --
        -- expected = 63 + 20 + 18 = 101
        ----------------------------------------------------------------
        REPORT "===== TEST 3 =====";
        REPORT "window=3, latest_addr=7, h=2";
        REPORT "Expected correlation = 101";

        configure_corr(3, 2);
        wait_cycles(2);

        start_calculation(7);

        wait_cycles(70);

        REPORT "===== END TEST 3: expected correlation = 101 when rdy pulses =====";

        wait_cycles(20);

        ----------------------------------------------------------------
        -- End simulation
        ----------------------------------------------------------------
        REPORT "===== SIMULATION FINISHED =====";

        WAIT;

    END PROCESS;

END sim;