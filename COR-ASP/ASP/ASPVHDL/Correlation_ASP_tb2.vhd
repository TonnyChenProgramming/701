LIBRARY ieee;
USE ieee.std_logic_1164.all;
USE ieee.numeric_std.all;

USE work.asp_types.all;
USE work.TdmaMinTypes.all;
USE work.asp_packet_pkg.all;

ENTITY Correlation_ASP_tb IS
END Correlation_ASP_tb;

ARCHITECTURE sim OF Correlation_ASP_tb IS

    constant CLK_PERIOD       : time := 20 ns;
    constant MAX_WAIT_CYCLES  : natural := 300;
    constant MAX_IDLE_CYCLES  : natural := 300;

    signal clock : bit_1 := '0';
    signal reset : bit_1 := '0';
    signal init  : bit_1 := '0';

    signal send : tdma_min_port;
    signal recv : tdma_min_port;

    --------------------------------------------------------------------
    -- Packet construction helper.
    -- Keep using make_packet() because this matches asp_packet_pkg.
    --------------------------------------------------------------------
    function make_tagged_packet(
        kind  : std_logic_vector(3 downto 0);
        code  : std_logic_vector(3 downto 0);
        dest  : std_logic_vector(3 downto 0);
        tag   : std_logic_vector(3 downto 0);
        value : natural
    ) return packet_word_t is
        variable payload : payload20_t;
    begin
        payload(19 downto 16) := tag;
        payload(15 downto 0)  := std_logic_vector(to_unsigned(value, 16));

        return make_packet(
            kind    => kind,
            code    => code,
            dest    => dest,
            payload => payload
        );
    end function;

    function make_data_packet(
        sample_value : natural
    ) return packet_word_t is
    begin
        return make_tagged_packet(
            kind  => PKT_KIND_DATA,
            code  => TAG_DIRECT_DATA,
            dest  => "0101",
            tag   => TAG_DIRECT_DATA,
            value => sample_value
        );
    end function;

    function get_payload20(
        pkt : packet_word_t
    ) return natural is
    begin
        return to_integer(unsigned(pkt(19 downto 0)));
    end function;

BEGIN

    --------------------------------------------------------------------
    -- DUT
    --------------------------------------------------------------------
    DUT : ENTITY work.Correlation_ASP
        PORT MAP (
            clock => clock,
            reset => reset,
            init  => init,
            send  => send,
            recv  => recv
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

        procedure wait_cycles(
            constant n : natural
        ) is
        begin
            for i in 1 to n loop
                WAIT UNTIL rising_edge(clock);
            end loop;
        end procedure;

        procedure check_equal_nat(
            constant actual   : natural;
            constant expected : natural;
            constant msg      : string
        ) is
        begin
            assert actual = expected
                report msg &
                       " | expected = " & integer'image(expected) &
                       ", actual = " & integer'image(actual)
                severity error;
        end procedure;

        procedure check_equal_slv(
            constant actual   : std_logic_vector;
            constant expected : std_logic_vector;
            constant msg      : string
        ) is
        begin
            assert actual = expected
                report msg
                severity error;
        end procedure;

        ----------------------------------------------------------------
        -- Send one packet for one clock only.
        ----------------------------------------------------------------
        procedure send_packet(
            constant pkt : packet_word_t
        ) is
        begin
            WAIT UNTIL falling_edge(clock);

            recv.addr <= COR_ASP_ADDR;
            recv.data <= pkt;

            WAIT UNTIL rising_edge(clock);

            WAIT UNTIL falling_edge(clock);

            recv.addr <= (others => '0');
            recv.data <= (others => '0');

            WAIT UNTIL rising_edge(clock);
        end procedure;

        procedure send_config_window(
            constant window_value : natural
        ) is
        begin
            REPORT "Send CMD_CONFIG: window = " & integer'image(window_value);

            send_packet(
                make_tagged_packet(
                    kind  => PKT_KIND_CMD,
                    code  => CMD_CONFIG,
                    dest  => "0101",
                    tag   => TAG_WINDOW,
                    value => window_value
                )
            );
        end procedure;

        procedure send_config_offset(
            constant offset_value : natural
        ) is
        begin
            REPORT "Send CMD_CONFIG: offset_h = " & integer'image(offset_value);

            send_packet(
                make_tagged_packet(
                    kind  => PKT_KIND_CMD,
                    code  => CMD_CONFIG,
                    dest  => "0101",
                    tag   => TAG_OFFSET,
                    value => offset_value
                )
            );
        end procedure;

        procedure send_start is
        begin
            REPORT "Send CMD_START: enter correlation mode";

            send_packet(
                make_tagged_packet(
                    kind  => PKT_KIND_CMD,
                    code  => CMD_START,
                    dest  => "0101",
                    tag   => "0000",
                    value => 0
                )
            );
        end procedure;

        procedure send_stop is
        begin
            REPORT "Send CMD_STOP: return to direct passthrough mode";

            send_packet(
                make_tagged_packet(
                    kind  => PKT_KIND_CMD,
                    code  => CMD_STOP,
                    dest  => "0101",
                    tag   => "0000",
                    value => 0
                )
            );
        end procedure;

        procedure send_clear is
        begin
            REPORT "Send CMD_CLEAR: soft reset / clear internal state";

            send_packet(
                make_tagged_packet(
                    kind  => PKT_KIND_CMD,
                    code  => CMD_CLEAR,
                    dest  => "0101",
                    tag   => "0000",
                    value => 0
                )
            );
        end procedure;

        procedure send_data(
            constant sample_value : natural
        ) is
        begin
            REPORT "Send DATA sample = " & integer'image(sample_value);
            send_packet(make_data_packet(sample_value));
        end procedure;

        ----------------------------------------------------------------
        -- Wait until DUT produces a non-idle send packet.
        ----------------------------------------------------------------
        procedure wait_for_send_active(
            constant max_cycles : natural;
            variable timed_out  : out boolean
        ) is
        begin
            timed_out := true;

            for i in 1 to max_cycles loop
                WAIT UNTIL rising_edge(clock);

                if send.addr /= (send.addr'range => '0') then
                    timed_out := false;
                    exit;
                end if;
            end loop;
        end procedure;

        ----------------------------------------------------------------
        -- Wait until DUT output has returned to idle.
        -- Timeout prevents testbench from hanging forever.
        ----------------------------------------------------------------
        procedure wait_for_send_idle(
            constant stable_cycles : natural
        ) is
            variable count      : natural := 0;
            variable wait_count : natural := 0;
        begin
            count      := 0;
            wait_count := 0;

            while count < stable_cycles loop
                WAIT UNTIL rising_edge(clock);

                if send.addr = (send.addr'range => '0') then
                    count := count + 1;
                else
                    count := 0;
                end if;

                wait_count := wait_count + 1;

                if wait_count >= MAX_IDLE_CYCLES then
                    REPORT "WARNING: Timeout waiting for send interface to become idle. Continuing simulation."
                        SEVERITY warning;
                    exit;
                end if;
            end loop;
        end procedure;

        ----------------------------------------------------------------
        -- Preload helper.
        ----------------------------------------------------------------
        procedure send_data_and_drain(
            constant sample_value  : natural;
            constant settle_cycles : natural
        ) is
        begin
            send_data(sample_value);
            wait_cycles(settle_cycles);
            wait_for_send_idle(3);
        end procedure;

        ----------------------------------------------------------------
        -- Expect one packet by checking payload[19:0].
        ----------------------------------------------------------------
        procedure expect_packet_payload20(
            constant expected_addr      : std_logic_vector;
            constant expected_payload20 : natural;
            constant msg                : string
        ) is
            variable timeout        : boolean;
            variable actual_payload : natural;
        begin
            wait_for_send_active(MAX_WAIT_CYCLES, timeout);

            assert timeout = false
                report msg & " | timeout waiting for output packet"
                severity error;

            if timeout = false then
                actual_payload := get_payload20(send.data);

                check_equal_slv(
                    actual   => send.addr,
                    expected => expected_addr,
                    msg      => msg & " | address mismatch"
                );

                check_equal_nat(
                    actual   => actual_payload,
                    expected => expected_payload20,
                    msg      => msg & " | payload20 mismatch"
                );
            end if;
        end procedure;

        procedure expect_correlation_result(
            constant expected_low20  : natural;
            constant expected_high20 : natural;
            constant msg             : string
        ) is
        begin
            expect_packet_payload20(
                expected_addr      => PK_ADDR,
                expected_payload20 => expected_low20,
                msg                => msg & " | LOW result packet"
            );

            expect_packet_payload20(
                expected_addr      => PK_ADDR,
                expected_payload20 => expected_high20,
                msg                => msg & " | HIGH result packet"
            );
        end procedure;

        ----------------------------------------------------------------
        -- Configure and start one correlation round.
        ----------------------------------------------------------------
        procedure configure_and_start(
            constant window_value : natural;
            constant offset_value : natural;
            constant round_name   : string
        ) is
        begin
            REPORT "===== " & round_name & ": CONFIG WINDOW=" &
                   integer'image(window_value) & " OFFSET=" &
                   integer'image(offset_value) & " =====";

            send_config_window(window_value);
            wait_cycles(30);
            wait_for_send_idle(3);

            send_config_offset(offset_value);
            wait_cycles(30);
            wait_for_send_idle(3);

            REPORT "===== " & round_name & ": START =====";

            send_start;
            wait_cycles(20);
            wait_for_send_idle(3);
        end procedure;

    BEGIN

        ----------------------------------------------------------------
        -- Initial idle
        ----------------------------------------------------------------
        REPORT "===== MULTI-ROUND OFFSET-SUM CORRELATION TESTBENCH START =====";

        recv.addr <= (others => '0');
        recv.data <= (others => '0');

        wait_cycles(3);

        ----------------------------------------------------------------
        -- Hardware reset
        ----------------------------------------------------------------
        REPORT "===== RESET =====";

        WAIT UNTIL falling_edge(clock);
        reset <= '1';

        wait_cycles(4);

        WAIT UNTIL falling_edge(clock);
        reset <= '0';

        wait_cycles(5);

        ----------------------------------------------------------------
        -- Init pulse
        ----------------------------------------------------------------
        REPORT "===== INIT =====";

        WAIT UNTIL falling_edge(clock);
        init <= '1';

        WAIT UNTIL rising_edge(clock);

        WAIT UNTIL falling_edge(clock);
        init <= '0';

        wait_cycles(5);

        ----------------------------------------------------------------
        -- Clear before any configuration/start/data traffic.
        ----------------------------------------------------------------
        REPORT "===== CMD_CLEAR BEFORE PRELOAD CONFIG =====";

        send_clear;
        wait_cycles(80);
        wait_for_send_idle(3);

        ----------------------------------------------------------------
        -- Phase 1: preload small deterministic data.
        --
        -- RAM[0]  = 1
        -- RAM[1]  = 2
        -- ...
        -- RAM[39] = 40
        ----------------------------------------------------------------
        REPORT "===== PHASE 1: CONFIG PRELOAD MODE WINDOW=1 OFFSET=0 =====";

        send_config_window(1);
        wait_cycles(20);
        wait_for_send_idle(3);

        send_config_offset(0);
        wait_cycles(20);
        wait_for_send_idle(3);

        REPORT "===== PHASE 1: START PRELOAD MODE =====";

        send_start;
        wait_cycles(10);
        wait_for_send_idle(3);

        REPORT "===== PHASE 1: PRELOAD RAM[0..39] WITH SMALL VALUES =====";

        send_data_and_drain(1, 40);
        send_data_and_drain(2, 40);
        send_data_and_drain(3, 40);
        send_data_and_drain(4, 40);
        send_data_and_drain(5, 40);
        send_data_and_drain(6, 40);
        send_data_and_drain(7, 40);
        send_data_and_drain(8, 40);
        send_data_and_drain(9, 40);
        send_data_and_drain(10, 40);
        send_data_and_drain(11, 40);
        send_data_and_drain(12, 40);
        send_data_and_drain(13, 40);
        send_data_and_drain(14, 40);
        send_data_and_drain(15, 40);
        send_data_and_drain(16, 40);
        send_data_and_drain(17, 40);
        send_data_and_drain(18, 40);
        send_data_and_drain(19, 40);
        send_data_and_drain(20, 40);
        send_data_and_drain(21, 40);
        send_data_and_drain(22, 40);
        send_data_and_drain(23, 40);
        send_data_and_drain(24, 40);
        send_data_and_drain(25, 40);
        send_data_and_drain(26, 40);
        send_data_and_drain(27, 40);
        send_data_and_drain(28, 40);
        send_data_and_drain(29, 40);
        send_data_and_drain(30, 40);
        send_data_and_drain(31, 40);
        send_data_and_drain(32, 40);
        send_data_and_drain(33, 40);
        send_data_and_drain(34, 40);
        send_data_and_drain(35, 40);
        send_data_and_drain(36, 40);
        send_data_and_drain(37, 40);
        send_data_and_drain(38, 40);
        send_data_and_drain(39, 40);
        send_data_and_drain(40, 40);

        wait_for_send_idle(3);

        REPORT "===== PHASE 1: STOP PRELOAD MODE =====";

        send_stop;
        wait_cycles(40);
        wait_for_send_idle(3);

        ----------------------------------------------------------------
        -- ADDRESS ALGORITHM USED BY CURRENT address_generator:
        --
        --   new_ave_data_addr = latest written address
        --
        --   origin = latest_written_addr - 1 - window
        --
        --   addr_left  = origin - counter - 1
        --   addr_right = origin + counter
        --
        --   counter = 0 to window - 1
        --
        -- CORRELATION VALUE ALGORITHM:
        --
        --   correlation += (RAM[addr_left] + offset_h)
        --                * (RAM[addr_right] + offset_h)
        ----------------------------------------------------------------

        ----------------------------------------------------------------
        -- ROUND 1
        --
        -- Trigger:
        --   DATA 41 -> RAM[40] = 41
        --   latest_written_addr = 40
        --
        -- Config:
        --   window = 4
        --   offset = 100
        --
        -- origin = 40 - 1 - 4 = 35
        --
        -- Pairs:
        --   c=0: (RAM[34] + 100) * (RAM[35] + 100)
        --        = (35 + 100) * (36 + 100)
        --        = 135 * 136 = 18,360
        --
        --   c=1: (RAM[33] + 100) * (RAM[36] + 100)
        --        = 134 * 137 = 18,358
        --
        --   c=2: (RAM[32] + 100) * (RAM[37] + 100)
        --        = 133 * 138 = 18,354
        --
        --   c=3: (RAM[31] + 100) * (RAM[38] + 100)
        --        = 132 * 139 = 18,348
        --
        -- total = 73,420
        -- LOW20 = 73,420
        -- HIGH20 = 0
        ----------------------------------------------------------------
        configure_and_start(4, 100, "ROUND 1");

        REPORT "===== ROUND 1: ASSERT WINDOW=4 OFFSET=100 =====";

        send_data(41);

        expect_correlation_result(
            expected_low20  => 73420,
            expected_high20 => 0,
            msg             => "Round 1 correlation after DATA 41"
        );

        wait_cycles(30);
        wait_for_send_idle(3);

        send_stop;
        wait_cycles(40);
        wait_for_send_idle(3);

        ----------------------------------------------------------------
        -- ROUND 2
        --
        -- Trigger:
        --   DATA 42 -> RAM[41] = 42
        --   latest_written_addr = 41
        --
        -- Config:
        --   window = 6
        --   offset = 200
        --
        -- origin = 41 - 1 - 6 = 34
        --
        -- Pairs:
        --   c=0: (RAM[33] + 200) * (RAM[34] + 200)
        --        = 234 * 235 = 54,990
        --
        --   c=1: (RAM[32] + 200) * (RAM[35] + 200)
        --        = 233 * 236 = 54,988
        --
        --   c=2: (RAM[31] + 200) * (RAM[36] + 200)
        --        = 232 * 237 = 54,984
        --
        --   c=3: (RAM[30] + 200) * (RAM[37] + 200)
        --        = 231 * 238 = 54,978
        --
        --   c=4: (RAM[29] + 200) * (RAM[38] + 200)
        --        = 230 * 239 = 54,970
        --
        --   c=5: (RAM[28] + 200) * (RAM[39] + 200)
        --        = 229 * 240 = 54,960
        --
        -- total = 329,870
        -- LOW20 = 329,870
        -- HIGH20 = 0
        ----------------------------------------------------------------
        configure_and_start(6, 200, "ROUND 2");

        REPORT "===== ROUND 2: ASSERT WINDOW=6 OFFSET=200 =====";

        send_data(42);

        expect_correlation_result(
            expected_low20  => 329870,
            expected_high20 => 0,
            msg             => "Round 2 correlation after DATA 42"
        );

        wait_cycles(30);
        wait_for_send_idle(3);

        send_stop;
        wait_cycles(40);
        wait_for_send_idle(3);

        ----------------------------------------------------------------
        -- ROUND 3
        --
        -- Trigger:
        --   DATA 43 -> RAM[42] = 43
        --   latest_written_addr = 42
        --
        -- Config:
        --   window = 8
        --   offset = 1000
        --
        -- origin = 42 - 1 - 8 = 33
        --
        -- Pairs:
        --   c=0: (RAM[32] + 1000) * (RAM[33] + 1000)
        --        = 1033 * 1034 = 1,067,? included in total
        --
        --   c=1: (RAM[31] + 1000) * (RAM[34] + 1000)
        --        = 1032 * 1035
        --
        --   c=2: (RAM[30] + 1000) * (RAM[35] + 1000)
        --        = 1031 * 1036
        --
        --   c=3: (RAM[29] + 1000) * (RAM[36] + 1000)
        --        = 1030 * 1037
        --
        --   c=4: (RAM[28] + 1000) * (RAM[37] + 1000)
        --        = 1029 * 1038
        --
        --   c=5: (RAM[27] + 1000) * (RAM[38] + 1000)
        --        = 1028 * 1039
        --
        --   c=6: (RAM[26] + 1000) * (RAM[39] + 1000)
        --        = 1027 * 1040
        --
        --   c=7: (RAM[25] + 1000) * (RAM[40] + 1000)
        --        = 1026 * 1041
        --
        -- total = 8,544,808
        --
        -- Split:
        --   8,544,808 = 8 * 2^20 + 156,200
        --
        -- LOW20 = 156,200
        -- HIGH20 = 8
        ----------------------------------------------------------------
        configure_and_start(8, 1000, "ROUND 3");

        REPORT "===== ROUND 3: ASSERT WINDOW=8 OFFSET=1000 =====";

        send_data(43);

        expect_correlation_result(
            expected_low20  => 156200,
            expected_high20 => 8,
            msg             => "Round 3 correlation after DATA 43"
        );

        wait_cycles(30);
        wait_for_send_idle(3);

        send_stop;
        wait_cycles(40);
        wait_for_send_idle(3);

        ----------------------------------------------------------------
        -- End
        ----------------------------------------------------------------
        REPORT "===== MULTI-ROUND OFFSET-SUM CORRELATION TEST FINISHED =====";
        REPORT "Simulation finished successfully.";

        assert false
            report "INTENTIONAL END OF TESTBENCH: Simulation finished successfully."
            severity failure;

        WAIT;

    END PROCESS;

END sim;