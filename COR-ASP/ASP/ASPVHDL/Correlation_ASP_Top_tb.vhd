LIBRARY ieee;
USE ieee.std_logic_1164.all;
USE ieee.numeric_std.all;
USE work.asp_types.all;
USE work.asp_constants.all;

ENTITY Correlation_ASP_Top_tb IS
END Correlation_ASP_Top_tb;

ARCHITECTURE sim OF Correlation_ASP_Top_tb IS

    constant CLK_PERIOD : time := 20 ns;
    constant MEM_DEPTH  : integer := 512;

    --------------------------------------------------------------------
    -- DUT signals
    --------------------------------------------------------------------
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

    --------------------------------------------------------------------
    -- Software-side memory model for expected-value calculation
    --------------------------------------------------------------------
    type mem_model_t is array (0 to MEM_DEPTH - 1) of integer;
    signal dummy : bit_1 := '0';

    --------------------------------------------------------------------
    -- Conversion helpers
    --------------------------------------------------------------------
    function to_bit_9(x : natural) return bit_9 is
    begin
        return bit_9(to_unsigned(x, 9));
    end function;

    function to_bit_16(x : natural) return bit_16 is
    begin
        return bit_16(to_unsigned(x, 16));
    end function;

    function wrap512(x : integer) return integer is
        variable r : integer;
    begin
        r := x mod 512;

        if r < 0 then
            r := r + 512;
        end if;

        return r;
    end function;

    function expected_corr(
        mem         : mem_model_t;
        latest_addr : integer;
        window_n    : integer;
        h           : integer
    ) return integer is
        variable origin     : integer;
        variable left_addr  : integer;
        variable right_addr : integer;
        variable sum        : integer := 0;
        variable left_data  : integer;
        variable right_data : integer;
    begin
        origin := wrap512(latest_addr - 1 - window_n);

        for k in 0 to window_n - 1 loop
            right_addr := wrap512(origin + k);
            left_addr  := wrap512(origin - k - 1);

            left_data  := mem(left_addr) + h;
            right_data := mem(right_addr) + h;

            sum := sum + left_data * right_data;
        end loop;

        return sum;
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
    -- Stimulus and scoreboard
    --------------------------------------------------------------------
    stim_proc : PROCESS

        variable mem_model  : mem_model_t := (others => 0);
        variable pass_count : integer := 0;
        variable fail_count : integer := 0;

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

            mem_model(addr) := data;

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

        procedure wait_for_ready(
            constant max_cycles : natural
        ) is
            variable found : boolean := false;
        begin
            for i in 1 to max_cycles loop
                WAIT UNTIL rising_edge(clock);

                if correlation_rdy = '1' then
                    found := true;
                    exit;
                end if;
            end loop;

            if not found then
                REPORT "FAIL: Timeout waiting for correlation_rdy" SEVERITY error;
                fail_count := fail_count + 1;
            end if;
        end procedure;

        procedure run_test(
            constant test_name   : string;
            constant latest_addr : natural;
            constant window_n    : natural;
            constant h_value     : natural
        ) is
            variable expected : integer;
            variable actual   : integer;
        begin
            expected := expected_corr(mem_model, latest_addr, window_n, h_value);

            REPORT "------------------------------------------------------------";
            REPORT "Running " & test_name;
            REPORT "latest_addr = " & integer'image(latest_addr);
            REPORT "window_n    = " & integer'image(window_n);
            REPORT "offset_h    = " & integer'image(h_value);
            REPORT "expected    = " & integer'image(expected);

            configure_corr(window_n, h_value);
            wait_cycles(2);

            start_calculation(latest_addr);

            wait_for_ready(200);

            actual := to_integer(unsigned(correlation));

            if actual = expected then
                REPORT "PASS: " & test_name &
                       " | actual = " & integer'image(actual) &
                       " | expected = " & integer'image(expected);
                pass_count := pass_count + 1;
            else
                REPORT "FAIL: " & test_name &
                       " | actual = " & integer'image(actual) &
                       " | expected = " & integer'image(expected)
                       SEVERITY error;
                fail_count := fail_count + 1;
            end if;

            wait_cycles(5);
        end procedure;

    BEGIN

        ----------------------------------------------------------------
        -- Reset
        ----------------------------------------------------------------
        REPORT "============================================================";
        REPORT "STARTING MASSIVE CORRELATION ASP TESTBENCH";
        REPORT "============================================================";

        WAIT UNTIL falling_edge(clock);
        reset <= '1';

        wait_cycles(5);

        WAIT UNTIL falling_edge(clock);
        reset <= '0';

        wait_cycles(3);

        ----------------------------------------------------------------
        -- Init pulse
        ----------------------------------------------------------------
        WAIT UNTIL falling_edge(clock);
        init <= '1';

        WAIT UNTIL rising_edge(clock);

        WAIT UNTIL falling_edge(clock);
        init <= '0';

        wait_cycles(3);

        ----------------------------------------------------------------
        -- Load deterministic RAM pattern
        ----------------------------------------------------------------
        REPORT "============================================================";
        REPORT "Loading RAM pattern A";
        REPORT "RAM[addr] = small deterministic values";
        REPORT "============================================================";

        write_ram(0,  1);
        write_ram(1,  2);
        write_ram(2,  5);
        write_ram(3,  7);
        write_ram(4,  3);
        write_ram(5,  4);
        write_ram(6,  6);
        write_ram(7,  8);
        write_ram(8,  9);
        write_ram(9,  10);
        write_ram(10, 11);
        write_ram(11, 12);
        write_ram(12, 13);
        write_ram(13, 14);
        write_ram(14, 15);
        write_ram(15, 16);

        wait_cycles(5);

        ----------------------------------------------------------------
        -- Non-wraparound tests
        ----------------------------------------------------------------
        REPORT "============================================================";
        REPORT "NON-WRAPAROUND TESTS";
        REPORT "============================================================";

        -- Test 1:
        -- latest=3, window=1, h=0
        -- origin=1
        -- left=0, right=1
        -- expected = 1*2 = 2
        run_test("T1 basic window=1 h=0", 3, 1, 0);

        -- Test 2:
        -- latest=3, window=1, h=1
        -- expected = (1+1)*(2+1) = 6
        run_test("T2 basic window=1 h=1", 3, 1, 1);

        -- Test 3:
        -- latest=5, window=2, h=0
        -- origin=2
        -- k=0: left=1 right=2 => 2*5 = 10
        -- k=1: left=0 right=3 => 1*7 = 7
        -- expected = 17
        run_test("T3 window=2 h=0", 5, 2, 0);

        -- Test 4:
        -- latest=5, window=2, h=1
        -- k=0: (2+1)*(5+1)=3*6=18
        -- k=1: (1+1)*(7+1)=2*8=16
        -- expected = 34
        run_test("T4 window=2 h=1", 5, 2, 1);

        -- Test 5:
        -- latest=7, window=3, h=2
        -- origin=3
        -- k=0: left=2 right=3 => (5+2)*(7+2)=7*9=63
        -- k=1: left=1 right=4 => (2+2)*(3+2)=4*5=20
        -- k=2: left=0 right=5 => (1+2)*(4+2)=3*6=18
        -- expected = 101
        run_test("T5 window=3 h=2", 7, 3, 2);

        -- Test 6:
        -- larger non-wraparound
        run_test("T6 window=4 h=0", 9, 4, 0);

        -- Test 7:
        -- larger non-wraparound with offset
        run_test("T7 window=4 h=3", 9, 4, 3);

        ----------------------------------------------------------------
        -- Circular wraparound tests
        ----------------------------------------------------------------
        REPORT "============================================================";
        REPORT "CIRCULAR BUFFER WRAPAROUND TESTS";
        REPORT "============================================================";

        write_ram(511, 20);
        write_ram(510, 19);
        write_ram(509, 18);
        write_ram(508, 17);

        wait_cycles(3);

        -- Test 8:
        -- latest=2, window=1
        -- origin=0
        -- k=0: left=511 right=0
        -- expected = RAM[511]*RAM[0] = 20*1 = 20
        run_test("T8 wrap window=1 h=0", 2, 1, 0);

        -- Test 9:
        -- same but h=1
        -- expected = (20+1)*(1+1)=21*2=42
        run_test("T9 wrap window=1 h=1", 2, 1, 1);

        -- Test 10:
        -- latest=3, window=2
        -- origin=0
        -- k=0: left=511 right=0
        -- k=1: left=510 right=1
        -- expected = 20*1 + 19*2 = 58
        run_test("T10 wrap window=2 h=0", 3, 2, 0);

        -- Test 11:
        -- latest=4, window=3
        -- origin=0
        -- k=0: left=511 right=0
        -- k=1: left=510 right=1
        -- k=2: left=509 right=2
        run_test("T11 wrap window=3 h=0", 4, 3, 0);

        -- Test 12:
        -- wrap with offset
        run_test("T12 wrap window=3 h=2", 4, 3, 2);

        ----------------------------------------------------------------
        -- Change RAM data after previous tests
        ----------------------------------------------------------------
        REPORT "============================================================";
        REPORT "LOADING RAM PATTERN B";
        REPORT "============================================================";

        write_ram(0,  3);
        write_ram(1,  1);
        write_ram(2,  4);
        write_ram(3,  1);
        write_ram(4,  5);
        write_ram(5,  9);
        write_ram(6,  2);
        write_ram(7,  6);
        write_ram(8,  5);
        write_ram(9,  3);
        write_ram(10, 5);
        write_ram(11, 8);
        write_ram(12, 9);
        write_ram(13, 7);
        write_ram(14, 9);
        write_ram(15, 3);

        wait_cycles(5);

        ----------------------------------------------------------------
        -- Regression tests on new data
        ----------------------------------------------------------------
        REPORT "============================================================";
        REPORT "REGRESSION TESTS WITH NEW DATA";
        REPORT "============================================================";

        run_test("T13 patternB window=1 h=0", 3, 1, 0);
        run_test("T14 patternB window=2 h=0", 5, 2, 0);
        run_test("T15 patternB window=3 h=1", 7, 3, 1);
        run_test("T16 patternB window=4 h=2", 9, 4, 2);
        run_test("T17 patternB window=5 h=0", 11, 5, 0);
        run_test("T18 patternB window=5 h=3", 11, 5, 3);

        ----------------------------------------------------------------
        -- Final summary
        ----------------------------------------------------------------
        REPORT "============================================================";
        REPORT "TESTBENCH FINISHED";
        REPORT "PASS COUNT = " & integer'image(pass_count);
        REPORT "FAIL COUNT = " & integer'image(fail_count);
        REPORT "============================================================";

        if fail_count = 0 then
            REPORT "OVERALL RESULT: PASS";
        else
            REPORT "OVERALL RESULT: FAIL" SEVERITY error;
        end if;

        WAIT;

    END PROCESS;

END sim;