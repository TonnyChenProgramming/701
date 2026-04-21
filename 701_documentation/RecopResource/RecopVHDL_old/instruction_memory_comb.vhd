-- instruction_memory_comb.vhd
-- Combinational ROM for QuestaSim simulation
-- Contains the GP1 test program covering all required instructions

library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;
use work.recop_types.all;

entity instruction_memory_comb is
    port (
        address : in  bit_16;
        q       : out bit_32
    );
end entity;

architecture beh of instruction_memory_comb is

    type rom_t is array (0 to 2047) of bit_32;

    constant ROM : rom_t := (
        -- ── Setup ────────────────────────────────────────────────────────────
        0  => x"40100005",  -- LDR R1 #5          R1 = 5
        1  => x"407000AB",  -- LDR R7 #0xAB       R7 = 0x00AB  (for DATACALL reg)
        2  => x"402000CD",  -- LDR R2 #0xCD       R2 = 0x00CD

        -- ── DATACALL register ────────────────────────────────────────────────
        -- DATACALL Rx: DPCR[31:16]=Rx  DPCR[15:0]=R7
        3  => x"E8020000",  -- DATACALL R2     dpcr = R2 & R7 = 0x00CD_00AB

        -- ── DATACALL immediate ───────────────────────────────────────────────
        -- DATACALL Rx #Op: DPCR[31:16]=Rx  DPCR[15:0]=Operand
        4  => x"69025678",  -- DATACALL R2 #0x5678  dpcr = R2 & 0x5678 = 0x00CD_5678

        -- ── PRESENT: Rz != 0  (no jump) ─────────────────────────────────────
        5  => x"40400001",  -- LDR R4 #1          R4 = 1
        6  => x"5C40000F",  -- PRESENT R4 #15     R4 != 0 -> NO jump

        -- ── PRESENT: Rz == 0  (jump to 15) ──────────────────────────────────
        7  => x"40500000",  -- LDR R5 #0          R5 = 0
        8  => x"5C50000F",  -- PRESENT R5 #15     R5 == 0 -> JUMP to addr 15

        -- 9-14: skipped by PRESENT
        9  => x"34000000",  -- NOOP
        10 => x"34000000",  -- NOOP
        11 => x"34000000",  -- NOOP
        12 => x"34000000",  -- NOOP
        13 => x"34000000",  -- NOOP
        14 => x"34000000",  -- NOOP

        -- ── Z flag + SZ: Z=1 (jump taken) ───────────────────────────────────
        15 => x"40600005",  -- LDR R6 #5          R6 = 5
        16 => x"44600005",  -- SUB R6 #5          5-5=0 -> Z=1
        17 => x"54000015",  -- SZ #21             Z=1 -> JUMP to addr 21

        18 => x"34000000",  -- NOOP (skipped)
        19 => x"34000000",  -- NOOP (skipped)
        20 => x"34000000",  -- NOOP (skipped)

        -- ── SZ: Z=0 (no jump) ───────────────────────────────────────────────
        21 => x"40600003",  -- LDR R6 #3          R6 = 3
        22 => x"44600005",  -- SUB R6 #5          3-5=-2 -> Z=0
        23 => x"5400000A",  -- SZ #10             Z=0 -> NO jump

        -- ── JMP immediate ────────────────────────────────────────────────────
        24 => x"5800001A",  -- JMP #26            unconditional jump to 26
        25 => x"34000000",  -- NOOP (skipped)

        -- ── JMP register ─────────────────────────────────────────────────────
        26 => x"4080001C",  -- LDR R8 #28         R8 = 28
        27 => x"D8080000",  -- JMP R8             PC = 28

        28 => x"34000000",  -- NOOP (skipped by JMP R8)

        -- ── LSIP / SSOP / STRPC ──────────────────────────────────────────────
        29 => x"409000BB",  -- LDR R9 #0xBB       R9 = 0x00BB
        30 => x"B7A00000",  -- LSIP R10           R10 = SIP (= 0x1234 from testbench)
        31 => x"BA090000",  -- SSOP R9            SOP = R9 = 0x00BB
        32 => x"9D000050",  -- STRPC $0x50        DM[0x50] = PC = 32

        -- ── Infinite loop ────────────────────────────────────────────────────
        33 => x"58000021",  -- JMP #33            loop forever

        others => x"34000000"   -- NOOP for all unused locations
    );

begin
    q <= ROM(to_integer(unsigned(address(10 downto 0))));
end architecture;
