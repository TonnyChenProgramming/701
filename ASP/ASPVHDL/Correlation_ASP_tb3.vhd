LIBRARY ieee;
USE ieee.std_logic_1164.all;
USE ieee.numeric_std.all;

USE work.asp_types.all;
USE work.TdmaMinTypes.all;
USE work.asp_packet_pkg.all;

ENTITY Correlation_ASP_tb IS
END Correlation_ASP_tb;

ARCHITECTURE sim OF Correlation_ASP_tb IS

    constant CLK_PERIOD : time := 20 ns;

    signal clock : bit_1 := '0';
    signal reset : bit_1 := '0';
    signal init  : bit_1 := '0';

    signal send : tdma_min_port;
    signal recv : tdma_min_port;

    --------------------------------------------------------------------
    -- Helper function:
    -- Build packet with:
    --
    -- [31:28] kind
    -- [27:24] code
    -- [23:20] dest
    -- [19:16] tag
    -- [15:0]  value
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

BEGIN

    --------------------------------------------------------------------
    -- DUT
    --------------------------------------------------------------------
    DUT : ENTITY work.Correlation_ASP
        PORT MAP (
            clock => clock,
            reset => reset,
            init  => init,

            send => send,
            recv => recv
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

        ----------------------------------------------------------------
        -- Send one packet for one clock only.
        -- Important: recv has no valid bit, so we must clear recv.data
        -- after one clock to avoid repeated decoding.
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
            REPORT "Send CMD_CLEAR: soft reset";

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

    BEGIN

        ----------------------------------------------------------------
        -- Initial idle
        ----------------------------------------------------------------
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
        -- Test 0: direct passthrough
        --
        -- Default mode should be direct passthrough.
        -- Send DATA sample 99.
        --
        -- Expected:
        --   DUT.direct_passthrough_en = 1
        --   send.addr = PK_ADDR
        --   send.data is DATA packet carrying sample 99
        --   internal RAM should NOT write if your decoder only writes in
        --   correlation mode.
        ----------------------------------------------------------------
        REPORT "===== TEST 0: direct passthrough mode =====";
        REPORT "Expected: send forwards sample 99 to PK_ADDR";

        send_data(99);

        wait_cycles(10);

        ----------------------------------------------------------------
        -- Test 1: configure COR-ASP
        --
        -- window = 1
        -- offset = 0
        --
        -- Expected:
        --   config_en becomes 1 after config packet
        --   core enters S_CONFIG
        --   config_done pulses
        --   config_en clears
        ----------------------------------------------------------------
        REPORT "===== TEST 1: configure window=1, offset=0 =====";

        send_config_window(1);
        wait_cycles(10);

        send_config_offset(0);
        wait_cycles(10);

        ----------------------------------------------------------------
        -- Test 2: start correlation mode
        --
        -- Expected:
        --   direct_passthrough_en goes to 0
        ----------------------------------------------------------------
        REPORT "===== TEST 2: CMD_START =====";

        send_start;
        wait_cycles(5);

         ----------------------------------------------------------------
        -- Test 3: Correlation-mode data stream
        --
        -- Purpose:
        --   Verify that each newly written DATA sample triggers one
        --   correlation calculation using the configured window and offset.
        --
        -- Stimulus:
        --   Send the following DATA samples:
        --     DATA 1 -> expected RAM[0] = 1
        --     DATA 2 -> expected RAM[1] = 2
        --     DATA 3 -> expected RAM[2] = 3
        --     DATA 4 -> expected RAM[3] = 4
        --     DATA 5 -> expected RAM[4] = 5
        --
        -- Configuration:
        --   window = 1
        --   offset = 0
        --
        -- Algorithm behaviour:
        --   Every new DATA write triggers a correlation calculation.
        --   Therefore, after DATA 5 is written, the active write address
        --   used by the calculation is expected to be 4.
        --
        -- Expected calculation after DATA 5:
        --   new_ave_data_addr = 4
        --   origin            = 4 - 1 - 1 = 2
        --   left_addr         = 1
        --   right_addr        = 2
        --
        --   correlation = RAM[1] * RAM[2]
        --               = 2 * 3
        --               = 6
        --
        -- Expected output:
        --   - One LOW result packet carrying correlation[19:0] = 6.
        --   - One HIGH result packet carrying correlation[35:20] = 0.
        ----------------------------------------------------------------
        REPORT "===== TEST 3: correlation mode data stream =====";
        REPORT "Expected final useful correlation after DATA 5 = 2";

        send_data(1);
        wait_cycles(45);

        send_data(2);
        wait_cycles(45);

        send_data(3);
        wait_cycles(45);

        send_data(4);
        wait_cycles(45);

        send_data(5);
        wait_cycles(70);
        REPORT "CHECK: After DATA 5, when correlation_rdy pulses, correlation should be 2";
        REPORT "CHECK: Encoder should send LOW result packet then HIGH result packet";

        wait_cycles(20);

        ----------------------------------------------------------------
        -- Test 4: stop back to passthrough
        ----------------------------------------------------------------
        REPORT "===== TEST 4: CMD_STOP back to direct passthrough =====";

        send_stop;
        wait_cycles(8);

        send_data(123);
        wait_cycles(20);

        REPORT "Expected: direct_passthrough_en = 1, sample 123 forwarded to PK_ADDR";

        ----------------------------------------------------------------
        -- Test 5: clear command
        ----------------------------------------------------------------
        REPORT "===== TEST 5: CMD_CLEAR =====";

        send_clear;
        wait_cycles(20);

        REPORT "Expected: reset_request/reset_done handshake occurs, decoder state resets";

        ----------------------------------------------------------------
        -- End
        ----------------------------------------------------------------
        REPORT "===== SIMULATION FINISHED =====";

        WAIT;

    END PROCESS;

END sim;