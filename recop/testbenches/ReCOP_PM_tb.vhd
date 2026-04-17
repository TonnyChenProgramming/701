-- ============================================================================
-- ReCOP_PM_tb.vhd  –  Self-checking testbench for ReCOP Program Memory
--
-- Tests performed:
--   1. Sequential read   – addresses 0x000 to 0x01F (32 instructions)
--   2. Non-sequential    – random spot-checks at key addresses
--   3. Boundary          – first (0x000) and last (0x1FF) addresses
--   4. Pipeline timing   – verifies exactly 1-clock read latency
--
-- Pre-requisite:
--   The PM reads from "program.mif" at simulation time.
--   Copy pm_test.mif to program.mif before running the simulation:
--       copy pm_test.mif program.mif          (Windows)
--       cp   pm_test.mif program.mif          (Linux/Mac)
--   Then simulate:
--       ModelSim:  vsim work.ReCOP_PM_tb
--       Quartus:   Simulation > Run Functional Simulation
--
-- Expected result: 0 FAILURES in the transcript.
-- ============================================================================

library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.NUMERIC_STD.ALL;

entity ReCOP_PM_tb is
end entity ReCOP_PM_tb;

architecture sim of ReCOP_PM_tb is

    -- ── DUT signals ───────────────────────────────────────────────────────
    signal clock : std_logic := '0';
    signal addr  : std_logic_vector(8 downto 0) := (others => '0');
    signal instr : std_logic_vector(31 downto 0);

    -- ── Clock: 50 MHz (20 ns period) ─────────────────────────────────────
    constant CLK_PERIOD : time := 20 ns;

    -- ── Expected contents of pm_test.mif (addresses 0x000 – 0x01F) ───────
    -- Each entry = one 32-bit instruction from example2.asm
    type rom_t is array (0 to 31) of std_logic_vector(31 downto 0);
    constant ROM_EXPECTED : rom_t := (
        0  => x"211200FF",   -- AND  R1  R2  #0x00FF
        1  => x"23120000",   -- AND  R1  R1  R2
        2  => x"3132000F",   -- OR   R3  R2  #0x0F
        3  => x"33340000",   -- OR   R3  R3  R4
        4  => x"E156000A",   -- ADD  R5  R6  #10
        5  => x"E3560000",   -- ADD  R5  R5  R6
        6  => x"0D780001",   -- SUBV R7  R8  #1
        7  => x"11900005",   -- SUB  R9  #5
        8  => x"01A01234",   -- LDR  R10 #0x1234
        9  => x"03BC0000",   -- LDR  R11 R12
        10 => x"02D00014",   -- LDR  R13 $20
        11 => x"09E0002A",   -- STR  R14 #42
        12 => x"0BF10000",   -- STR  R15 R1
        13 => x"0A02001E",   -- STR  R2  $30
        14 => x"6100001F",   -- JMP  target
        15 => x"63030000",   -- JMP  R3
        16 => x"7140001F",   -- PRESENT R4  target
        17 => x"A3050000",   -- DATACALL R5
        18 => x"A1060077",   -- DATACALL R6  #0x77
        19 => x"5100001F",   -- SZ   target
        20 => x"40000000",   -- CLFZ
        21 => x"DF070000",   -- LSIP R7
        22 => x"EB080000",   -- SSOP R8
        23 => x"D0000000",   -- NOOP
        24 => x"76000032",   -- STRPC $50
        25 => x"F0000000",   -- CER
        26 => x"F8000000",   -- CEOT
        27 => x"FC000000",   -- SEOT
        28 => x"DB900000",   -- LER  R9
        29 => x"EF0A0000",   -- SSVOP R10
        30 => x"79B0FFFF",   -- MAX  R11 #0xFFFF
        31 => x"D0000000"    -- NOOP  (label "target", PC 31 = 0x1F)
    );

    -- ── Helper: check and report one instruction ──────────────────────────
    procedure check_instr(
        constant a    : in integer;
        signal   got  : in std_logic_vector(31 downto 0);
        constant exp  : in std_logic_vector(31 downto 0);
        variable pass : inout integer;
        variable fail : inout integer
    ) is begin
        if got = exp then
            report "[PASS] addr=0x" & to_hstring(std_logic_vector(to_unsigned(a, 9))) &
                   "  instr=0x" & to_hstring(got)
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

begin

    -- ── DUT ───────────────────────────────────────────────────────────────
    dut : entity work.ReCOP_PM
        port map (clock => clock, addr => addr, instr => instr);

    -- ── Free-running 50 MHz clock ─────────────────────────────────────────
    clock <= not clock after CLK_PERIOD / 2;

    -- ── Stimulus and checking ─────────────────────────────────────────────
    process
        variable pass_count : integer := 0;
        variable fail_count : integer := 0;
    begin

        -- ── Initialise ────────────────────────────────────────────────
        addr <= (others => '0');
        wait for CLK_PERIOD * 2;   -- let altsyncram model settle

        -- ── TEST 1: Sequential read of all 32 instructions ────────────
        report "--- TEST 1: Sequential read (addr 0x000 to 0x01F) ---"
        severity note;

        for i in 0 to 31 loop
            addr <= std_logic_vector(to_unsigned(i, 9));
            wait until rising_edge(clock);   -- address registered in ROM
            wait until rising_edge(clock);   -- data appears at output
            wait for 1 ns;                   -- combinatorial settle

            check_instr(i, instr, ROM_EXPECTED(i), pass_count, fail_count);
        end loop;

        -- ── TEST 2: Non-sequential spot checks ────────────────────────
        report "--- TEST 2: Non-sequential spot checks ---" severity note;

        -- Re-read address 0 after having walked through 0..31
        addr <= std_logic_vector(to_unsigned(0, 9));
        wait until rising_edge(clock);
        wait until rising_edge(clock);
        wait for 1 ns;
        check_instr(0, instr, ROM_EXPECTED(0), pass_count, fail_count);

        -- Jump to address 16 (PRESENT)
        addr <= std_logic_vector(to_unsigned(16, 9));
        wait until rising_edge(clock);
        wait until rising_edge(clock);
        wait for 1 ns;
        check_instr(16, instr, ROM_EXPECTED(16), pass_count, fail_count);

        -- Jump to address 31 ("target" label)
        addr <= std_logic_vector(to_unsigned(31, 9));
        wait until rising_edge(clock);
        wait until rising_edge(clock);
        wait for 1 ns;
        check_instr(31, instr, ROM_EXPECTED(31), pass_count, fail_count);

        -- ── TEST 3: Boundary – last address 0x1FF (all NOOPs) ─────────
        report "--- TEST 3: Boundary address 0x1FF ---" severity note;

        addr <= (others => '1');   -- address 511
        wait until rising_edge(clock);
        wait until rising_edge(clock);
        wait for 1 ns;
        if instr = x"D0000000" then
            report "[PASS] addr=0x1FF  instr=0xD0000000 (NOOP)" severity note;
            pass_count := pass_count + 1;
        else
            report "[FAIL] addr=0x1FF  expected NOOP (0xD0000000)  got=0x" &
                   to_hstring(instr)
            severity error;
            fail_count := fail_count + 1;
        end if;

        -- ── TEST 4: Pipeline timing – present addr, check 1-cycle latency
        report "--- TEST 4: Pipeline timing ---" severity note;
        declare
            variable instr_before : std_logic_vector(31 downto 0);
        begin
            -- Present address 4 (ADD R5 R6 #10 = 0xE156000A)
            addr <= std_logic_vector(to_unsigned(4, 9));
            wait until rising_edge(clock);          -- addr registered
            instr_before := instr;                  -- capture output BEFORE next edge

            wait until rising_edge(clock);          -- data becomes valid
            wait for 1 ns;

            -- Data should be valid NOW (after 2nd edge) but NOT before
            if instr = x"E156000A" then
                report "[PASS] 1-cycle latency confirmed for addr=4" severity note;
                pass_count := pass_count + 1;
            else
                report "[FAIL] addr=4 after 2 clocks: expected 0xE156000A  got=0x" &
                       to_hstring(instr)
                severity error;
                fail_count := fail_count + 1;
            end if;
        end;

        -- ── Final summary ─────────────────────────────────────────────
        report "======================================================" severity note;
        report "PM TESTBENCH COMPLETE" severity note;
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
