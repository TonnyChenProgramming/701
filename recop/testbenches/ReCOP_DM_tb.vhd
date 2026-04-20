-- ============================================================================
-- ReCOP_DM_tb.vhd  –  Self-checking testbench for ReCOP Data Memory
--
-- Tests performed:
--   1. Power-up zero  – unwritten addresses read as 0x00000000
--   2. Write / read   – write then read back at multiple addresses
--   3. Boundary       – first (0x000) and last (0x1FF) addresses
--   4. Read-before-write – same address, same cycle: old data returned
--   5. Write inhibit  – wr_en='0' does not corrupt existing data
--
-- Expected result: 0 FAILURES in the transcript.
-- ============================================================================

library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.NUMERIC_STD.ALL;

entity ReCOP_DM_tb is
end entity ReCOP_DM_tb;

architecture sim of ReCOP_DM_tb is

    -- ── DUT signals ───────────────────────────────────────────────────────
    signal clock    : std_logic := '0';
    signal addr     : std_logic_vector(8 downto 0) := (others => '0');
    signal wr_en    : std_logic := '0';
    signal data_in  : std_logic_vector(31 downto 0) := (others => '0');
    signal data_out : std_logic_vector(31 downto 0);

    -- ── Clock: 50 MHz (20 ns period) ─────────────────────────────────────
    constant CLK_PERIOD : time := 20 ns;

    -- ── Helper: check and report one data word ────────────────────────────
    procedure check_data(
        constant a    : in integer;
        signal   got  : in std_logic_vector(31 downto 0);
        constant exp  : in std_logic_vector(31 downto 0);
        variable pass : inout integer;
        variable fail : inout integer
    ) is begin
        if got = exp then
            report "[PASS] addr=0x" & to_hstring(std_logic_vector(to_unsigned(a, 9))) &
                   "  data=0x" & to_hstring(got)
            severity note;
            pass := pass + 1;
        else
            report "[FAIL] addr=0x" & to_hstring(std_logic_vector(to_unsigned(a, 9))) &
                   "  expected=0x" & to_hstring(exp) &
                   "  got=0x"      & to_hstring(got)
            severity error;
            fail := fail + 1;
        end if;
    end procedure;

    -- ── Helper: one write cycle ───────────────────────────────────────────
    procedure do_write(
        constant a   : in integer;
        constant val : in std_logic_vector(31 downto 0);
        signal   clk : in std_logic;
        signal   adr : out std_logic_vector(8 downto 0);
        signal   we  : out std_logic;
        signal   din : out std_logic_vector(31 downto 0)
    ) is begin
        adr  <= std_logic_vector(to_unsigned(a, 9));
        din  <= val;
        we   <= '1';
        wait until rising_edge(clk);
        we   <= '0';
    end procedure;

    -- ── Helper: one read cycle (returns after output is valid) ────────────
    procedure do_read(
        constant a   : in integer;
        signal   clk : in std_logic;
        signal   adr : out std_logic_vector(8 downto 0);
        signal   we  : out std_logic
    ) is begin
        adr <= std_logic_vector(to_unsigned(a, 9));
        we  <= '0';
        wait until rising_edge(clk);   -- address registered
        wait until rising_edge(clk);   -- data appears at output
        wait for 1 ns;                 -- combinatorial settle
    end procedure;

begin

    -- ── DUT ───────────────────────────────────────────────────────────────
    dut : entity work.ReCOP_DM
        port map (
            clock    => clock,
            addr     => addr,
            wr_en    => wr_en,
            data_in  => data_in,
            data_out => data_out
        );

    -- ── Free-running 50 MHz clock ─────────────────────────────────────────
    clock <= not clock after CLK_PERIOD / 2;

    -- ── Stimulus and checking ─────────────────────────────────────────────
    process
        variable pass_count : integer := 0;
        variable fail_count : integer := 0;
    begin

        -- ── Initialise ────────────────────────────────────────────────
        addr    <= (others => '0');
        wr_en   <= '0';
        data_in <= (others => '0');
        wait for CLK_PERIOD * 2;   -- let altsyncram model settle

        -- ── TEST 1: Power-up zeros at unwritten addresses ─────────────
        report "--- TEST 1: Power-up zero initialisation ---" severity note;

        do_read(0,   clock, addr, wr_en);
        check_data(0,   data_out, x"00000000", pass_count, fail_count);

        do_read(100, clock, addr, wr_en);
        check_data(100, data_out, x"00000000", pass_count, fail_count);

        do_read(511, clock, addr, wr_en);
        check_data(511, data_out, x"00000000", pass_count, fail_count);

        -- ── TEST 2: Write then read back ──────────────────────────────
        report "--- TEST 2: Write / read-back ---" severity note;

        -- Write several addresses
        do_write(  0, x"DEADBEEF", clock, addr, wr_en, data_in);
        do_write( 16, x"CAFEBABE", clock, addr, wr_en, data_in);
        do_write(255, x"12345678", clock, addr, wr_en, data_in);
        do_write(511, x"ABCD1234", clock, addr, wr_en, data_in);

        -- Allow one extra cycle between last write and first read
        wait until rising_edge(clock);

        -- Read back and verify
        do_read(  0, clock, addr, wr_en);
        check_data(  0, data_out, x"DEADBEEF", pass_count, fail_count);

        do_read( 16, clock, addr, wr_en);
        check_data( 16, data_out, x"CAFEBABE", pass_count, fail_count);

        do_read(255, clock, addr, wr_en);
        check_data(255, data_out, x"12345678", pass_count, fail_count);

        do_read(511, clock, addr, wr_en);
        check_data(511, data_out, x"ABCD1234", pass_count, fail_count);

        -- ── TEST 3: Boundary addresses ────────────────────────────────
        report "--- TEST 3: Boundary addresses (0x000 and 0x1FF) ---" severity note;

        do_write(  0, x"00000001", clock, addr, wr_en, data_in);
        wait until rising_edge(clock);
        do_read(  0, clock, addr, wr_en);
        check_data(  0, data_out, x"00000001", pass_count, fail_count);

        do_write(511, x"FFFFFFFF", clock, addr, wr_en, data_in);
        wait until rising_edge(clock);
        do_read(511, clock, addr, wr_en);
        check_data(511, data_out, x"FFFFFFFF", pass_count, fail_count);

        -- ── TEST 4: Read-before-write (same address, same clock) ──────
        -- altsyncram "OLD_DATA" mode: read issued same cycle as write
        -- returns the DATA that was there BEFORE the write.
        report "--- TEST 4: Read-before-write (OLD_DATA) ---" severity note;

        -- Write a known value to address 42 first
        do_write(42, x"11111111", clock, addr, wr_en, data_in);
        wait until rising_edge(clock);

        -- Now write a NEW value AND read simultaneously
        addr    <= std_logic_vector(to_unsigned(42, 9));
        data_in <= x"22222222";
        wr_en   <= '1';
        wait until rising_edge(clock);   -- write 0x22222222, but output should be OLD
        wr_en   <= '0';
        wait for 1 ns;

        -- After one clock the old data (0x11111111) should be at data_out
        if data_out = x"11111111" then
            report "[PASS] read-before-write: addr=42 returned old value 0x11111111"
            severity note;
            pass_count := pass_count + 1;
        else
            report "[FAIL] read-before-write: addr=42 expected 0x11111111 got=0x" &
                   to_hstring(data_out)
            severity error;
            fail_count := fail_count + 1;
        end if;

        -- Confirm the new value is now stored
        wait until rising_edge(clock);
        wait for 1 ns;
        if data_out = x"22222222" then
            report "[PASS] new value 0x22222222 visible on next read cycle"
            severity note;
            pass_count := pass_count + 1;
        else
            report "[FAIL] new value at addr=42: expected 0x22222222 got=0x" &
                   to_hstring(data_out)
            severity error;
            fail_count := fail_count + 1;
        end if;

        -- ── TEST 5: Write inhibit (wr_en='0' does not change data) ────
        report "--- TEST 5: Write inhibit (wr_en=0) ---" severity note;

        -- Write a sentinel value to address 10
        do_write(10, x"AABBCCDD", clock, addr, wr_en, data_in);
        wait until rising_edge(clock);

        -- Attempt to overwrite with wr_en held low
        addr    <= std_logic_vector(to_unsigned(10, 9));
        data_in <= x"DEADBEEF";
        wr_en   <= '0';
        wait until rising_edge(clock);
        wait until rising_edge(clock);
        wait for 1 ns;

        check_data(10, data_out, x"AABBCCDD", pass_count, fail_count);

        -- ── Final summary ─────────────────────────────────────────────
        report "======================================================" severity note;
        report "DM TESTBENCH COMPLETE" severity note;
        report "  PASS : " & integer'image(pass_count) severity note;
        report "  FAIL : " & integer'image(fail_count) severity note;
        if fail_count = 0 then
            report "  RESULT : ALL TESTS PASSED" severity note;
        else
            report "  RESULT : " & integer'image(fail_count) & " TEST(S) FAILED"
            severity failure;
        end if;
        report "======================================================" severity note;

        wait;   -- hold simulation
    end process;

end architecture sim;
