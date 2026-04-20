# COMPSYS 701 Group Project — ReCOP Reconfigurable Coprocessor

**University of Auckland · COMPSYS 701 · Project A**

This repository contains the VHDL implementation of the ReCOP (Reconfigurable Coprocessor) GP-1, an assembler, program/data memory IPs, verification testbenches, and the synthesisable IP wrapper required by the project tasks.

---

## Repository Branches

| Branch | Owner | Contents |
|--------|-------|----------|
| `main` | Team (Tonny) | Core ReCOP datapath: recop_top, multicycle FSM, ALU, regfile, registers, execute, decode, fetch, program counter, instruction/data memory IPs, opcodes, Quartus project (DE2-115 / Cyclone IV E) |
| `Eric` | Eric | Early DE1-SoC (Cyclone V) development: fetch, decode, execute stages — branched from initial datapath commit |
| `solomon` | Solomon | Task A assembler v2, Task B ReCOP_IP wrapper, Task C memory IPs, DM/PM testbenches |

---

## Project Tasks

### Task A — ReCOP Assembler (solomon branch: `recop/assembler/`)

A Python assembler that converts ReCOP assembly source (`.asm`) into Quartus Memory Initialisation Files (`.mif`) for loading into program memory.

**Instruction encoding** (matches `opcodes.vhd`):

```
[AM:2][OP:6][Rz:4][Rx:4][OPERAND:16]   (32-bit instruction word)
```

| Field | Bits | Description |
|-------|------|-------------|
| AM | 31–30 | Addressing mode: 00=inherent, 01=immediate, 10=direct, 11=register |
| OP | 29–24 | Opcode (6 bits) |
| Rz | 23–20 | Destination / source register address |
| Rx | 19–16 | Source register address |
| OPERAND | 15–0 | 16-bit immediate or direct address |

**Files:**

| File | Description |
|------|-------------|
| `recop/assembler/recop_asm.py` | Assembler v2 — produces `.mif` and listing output |
| `recop/assembler/example2.asm` | Example program exercising all 31 ISA instructions |
| `recop/assembler/pm_test.mif` | Pre-assembled MIF for the example program |

**Usage:**

```bash
cd recop/assembler
python recop_asm.py example2.asm
# Outputs: example2.mif  (rename to program.mif before synthesis)
```

The MIF uses HEX radix and initialises unused locations with `0x34000000` (NOOP).

---

### Task B — ReCOP IP Wrapper (solomon branch: `recop/IP/`)

`ReCOP_IP.vhd` is a self-contained, synthesisable coprocessor component with a clean seven-signal external interface. All internal details (FSM, register file, ALU, memories) are encapsulated.

**External interface:**

| Port | Direction | Width | Description |
|------|-----------|-------|-------------|
| `clock` | in | 1 | 50 MHz system clock |
| `reset` | in | 1 | Synchronous reset, active-high |
| `init` | in | 1 | Re-initialise PC and registers |
| `sip` | in | 16 | Serial Input Port (host → ReCOP) |
| `sop` | out | 16 | Serial Output Port (ReCOP → host) |
| `dpcr` | out | 32 | Data Path Control Register (upper 16 = Rx, lower 16 = immediate or R7) |
| `dprr` | out | 2 | Data Path Result Register (bit 1 = IRQ, bit 0 = result flag) |
| `debug_state` | out | 3 | Current FSM state — tie to `open` in synthesis |

**Instantiation example:**

```vhdl
recop : entity work.ReCOP_IP
    port map (
        clock       => sys_clk,
        reset       => sys_reset,
        init        => recop_init,
        sip         => host_to_recop,
        sop         => recop_to_host,
        dpcr        => recop_dpcr,
        dprr        => recop_dprr,
        debug_state => open
    );
```

**Internal architecture:**

```
FETCH     : program_counter  +  ReCOP_PM (512 × 32-bit ROM)
DECODE    : regfile (16 × 16-bit)  +  multicycle_moore_machine (6-state FSM)
EXECUTE   : execute (ALU + 16-bit DM + MAX comparator)
REGISTERS : DPCR (32-bit), ER, EOT, SIP, SOP, DPRR, SVOP
```

FSM states: `FETCH → DECODE → EXECUTE → [MEM_READ | MEM_WRITE] → WRITEBACK`

**Data path width:** 16-bit (registers, ALU, DM). Instructions and DPCR are 32-bit. This is the agreed team design matching the ReCOP lecture notes.

**Required source files from `main` branch** (must be in Quartus project along with `ReCOP_IP.vhd`):

- `recop_types.vhd`, `various_constants.vhd`, `opcodes.vhd`
- `program_counter.vhd`
- `ReCOP_PM.vhd` (use DE1-SoC or DE2-115 version from Task C)
- `multicycle_moore_machine.vhd`
- `regfile.vhd`, `registers.vhd`
- `execute.vhd`, `ALU.vhd`, `data_memory_ip.vhd`

---

### Task C — Memory IPs (solomon branch: `recop/memory/`)

Quartus `altsyncram`-based PM (ROM) and DM (RAM) instantiated as standalone VHDL components, one set per target board.

| Folder | Target Device | Capacity |
|--------|---------------|----------|
| `recop/memory/DE1-SoC/` | Cyclone V — 5CSEMA5F31C6 (DE1-SoC) | 512 × 32-bit (2 × M10K) |
| `recop/memory/DE2-115/` | Cyclone IV E — EP4CE115F29C7 (DE2-115) | 512 × 32-bit (2 × M9K) |

Each folder contains:

| File | Description |
|------|-------------|
| `ReCOP_PM.vhd` | Program Memory — ROM mode, loads `program.mif` at synthesis |
| `ReCOP_DM.vhd` | Data Memory — SINGLE_PORT RAM, read-before-write, power-up zeros |

**PM port map:**

```vhdl
pm : entity work.ReCOP_PM
    port map (clock => clk, addr => pc(8 downto 0), instr => ir);
```

**DM port map:**

```vhdl
dm : entity work.ReCOP_DM
    port map (clock => clk, addr => addr, wr_en => wr, data_in => din, data_out => dout);
```

To target DE1-SoC: copy `memory/DE1-SoC/ReCOP_PM.vhd` and `ReCOP_DM.vhd` into the Quartus project and change `intended_device_family` if needed.

---

## Testbenches (solomon branch: `recop/testbenches/`)

| File | What it tests |
|------|---------------|
| `ReCOP_PM_tb.vhd` | Program Memory — sequential read, boundary addresses, instruction word integrity |
| `ReCOP_DM_tb.vhd` | Data Memory — power-up zeros, write/read-back, boundary addresses (0x000, 0x1FF), read-before-write (OLD_DATA), write-inhibit |

Both are self-checking with PASS/FAIL reports. Simulate using ModelSim/QuestaSim:

```tcl
vlib work
vcom recop_types.vhd various_constants.vhd ReCOP_DM.vhd ReCOP_DM_tb.vhd
vsim ReCOP_DM_tb
run -all
```

---

## Core Processor Source (main branch)

The `main` branch holds the team's Quartus project targeting the **DE2-115 (Cyclone IV E)**:

```
recop/Selected VHDL source design files/
├── recop_top.vhd              Top-level (fetch + decode + execute + registers)
├── multicycle_moore_machine.vhd  6-state control FSM
├── ALU.vhd                    16-bit arithmetic/logic unit
├── regfile.vhd                16 × 16-bit register file
├── registers.vhd              DPCR, ER, EOT, SIP, SOP, SVOP, DPRR
├── execute.vhd                Execute stage (ALU + DM + MAX)
├── decode.vhd                 Decode stage
├── fetch.vhd                  Fetch stage
├── program_counter.vhd        PC with pc_write stall gate
├── instruction_memory_ip.vhd  PM ROM (altsyncram, Cyclone IV E)
├── data_memory_ip.vhd         DM RAM (altsyncram, 16-bit)
├── opcodes.vhd                Opcode constants
├── recop_types.vhd            Type aliases (bit_1, bit_16, bit_32, …)
└── various_constants.vhd      pc_sel, rf_input_sel, alu_operation constants
```

Quartus project file: `recop/Recop_Project.qpf`

---

## Instruction Set Summary

| Mnemonic | AM | OP | Operation |
|----------|----|----|-----------|
| NOOP | 00 | 110100 | No operation |
| ADD Rz Rx #imm | 01 | 011110 | Rz ← Rx + imm |
| SUB Rz Rx #imm | 01 | 001111 | Rz ← Rx – imm |
| AND Rz Rx #imm | 00 | 001000 | Rz ← Rx AND imm |
| OR  Rz Rx #imm | 00 | 001001 | Rz ← Rx OR imm |
| LD  Rz #addr   | 10 | 000001 | Rz ← DM[addr] |
| ST  Rx #addr   | 10 | 000011 | DM[addr] ← Rx |
| JMP #addr      | 01 | 010110 | PC ← addr |
| BRZ #addr      | 01 | 010111 | if Z: PC ← addr |
| LSIP Rz        | 10 | 010100 | Rz ← SIP register |
| SSOP Rx        | 10 | 010101 | SOP ← Rx |
| DATACALL Rx    | 10 | 101000 | Assert DPCR/IRQ with Rx |
| DATACALL #val  | 01 | 101001 | Assert DPCR/IRQ with immediate |
| CLFZ           | 00 | 010000 | Clear Z flag |
| … (see opcodes.vhd for full list) | | | |

---

## Hardware Requirements

| Board | Device | Quartus Version |
|-------|--------|-----------------|
| DE1-SoC | Intel Cyclone V — 5CSEMA5F31C6 | Quartus Prime Lite 18.1+ |
| DE2-115 | Intel Cyclone IV E — EP4CE115F29C7 | Quartus Prime Lite 18.1+ |

Clock: 50 MHz. Memory: 2 M10K / M9K blocks per memory (PM and DM each).

---

## Status

| Component | Status |
|-----------|--------|
| Core datapath (main branch) | Functional — testbench passing |
| Multicycle FSM | Implemented, testbench passing |
| Assembler v2 | Complete |
| Memory IPs (DE1-SoC + DE2-115) | Complete |
| Testbenches (PM + DM) | Complete, self-checking |
| ReCOP_IP wrapper | Complete (Task B deliverable) |
| FPGA system integration (top-level with board I/O) | **In progress — may have bugs** |

---

## Team

| Member | Branch | Responsibilities |
|--------|--------|-----------------|
| Tonny (TonnyChen) | main | Core VHDL, multicycle FSM, Quartus project |
| Eric | Eric | DE1-SoC port, fetch/decode/execute stages |
| Solomon | solomon | Assembler, memory IPs, testbenches, IP wrapper |
