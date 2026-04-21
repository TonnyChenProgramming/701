# COMPSYS 701 Group Project — ReCOP Reconfigurable Coprocessor

**University of Auckland · COMPSYS 701 · Group 6 **

This repository contains the VHDL implementation of the ReCOP (Reconfigurable Coprocessor) GP-1 targeting the DE1-SoC (Cyclone V) FPGA board. It includes the full multicycle datapath, control signal generator, ALU, register file, memory IPs, a Python assembler, simulation testbenches, a synthesisable IP wrapper, and supporting documentation.

---

## Repository Structure

```
701/
├── 701_documentation/          Design documents, diagrams, and project specs
├── recop/                      Quartus project root (DE1-SoC)
│   ├── Recop_Project.qpf       Quartus project file
│   ├── Recop_Project.qsf       Quartus settings (pin assignments, device)
│   ├── Recop_Project.out.sdc   Timing constraints
│   ├── Selected VHDL source design files/   All synthesisable and simulation VHDL
│   ├── assembler/              Python assembler and test programs
│   ├── db/                     Quartus compilation database (generated)
│   ├── greybox_tmp/            Quartus greybox temp files (generated)
│   ├── incremental_db/         Quartus incremental compilation DB (generated)
│   ├── output_files/           Compilation reports and .sof bitstream
│   └── testbenches/            (solomon branch) standalone PM/DM testbenches
└── README.md
```

---

## VHDL Source Files (`recop/Selected VHDL source design files/`)

### Core Datapath

| File | Description |
|------|-------------|
| `recop_top.vhd` | Top-level: connects fetch, decode, execute, and register stages |
| `fetch.vhd` | Fetch stage — drives PC and reads instruction memory |
| `decode.vhd` | Decode stage — register file reads, immediate extraction |
| `execute.vhd` | Execute stage — ALU, data memory access, MAX comparator |
| `ALU.vhd` | 16-bit arithmetic and logic unit |
| `regfile.vhd` | 16 × 16-bit register file |
| `registerfile.vhd` | Alternative register file implementation |
| `registers.vhd` | Special-purpose registers: DPCR, ER, EOT, SIP, SOP, SVOP, DPRR |
| `program_counter.vhd` | PC with `pc_write` stall gate |
| `multicycle_moore_machine.vhd` | 6-state Moore FSM: FETCH → DECODE → EXECUTE → [MEM_READ\|MEM_WRITE] → WRITEBACK |
| `control_signal_generator.vhd` | Combinational control signal decoder |

### Memory

| File | Description |
|------|-------------|
| `instruction_memory_ip.vhd` | Program Memory ROM — altsyncram, Cyclone IV E, 512 × 32-bit |
| `instruction_memory_comb.vhd` | Combinational (simulation) instruction memory model |
| `data_memory_ip.vhd` | Data Memory RAM — altsyncram, 16-bit, read-before-write |
| `data_mem.vhd` | Behavioural data memory (for simulation) |
| `prog_mem.vhd` | Behavioural program memory (for simulation) |
| `sim_dm.vhd` | Simulation-only DM wrapper |
| `memory_model.vhd` | Generic memory model for testbench use |
| `memory_arbiter.vhd` | Memory arbitration logic |
| `data_memory_ip.cmp` / `.qip` | Quartus IP component files for DM |
| `instruction_memory_ip.cmp` / `.qip` | Quartus IP component files for PM |
| `cpu_mif.mif` | Default memory initialisation file |

### IP Wrapper

| File | Description |
|------|-------------|
| `ReCOP_IP.vhd` | Synthesisable coprocessor IP with 7-signal external interface (Task B deliverable) |

### Type and Constant Packages

| File | Description |
|------|-------------|
| `recop_types.vhd` | Type aliases: `bit_1`, `bit_16`, `bit_32`, etc. |
| `opcodes.vhd` | Opcode constants (6-bit OP field values) |
| `various_constants.vhd` | Control signal constants: `pc_sel`, `rf_input_sel`, `alu_operation` |

### Clock / PLL

| File | Description |
|------|-------------|
| `pll.vhd` | Altera PLL megafunction instantiation |
| `recop_pll.vhd` | Top-level PLL wrapper for the ReCOP system |

### Testbenches

| File | Description |
|------|-------------|
| `recop_top_tb.vhd` | System-level testbench for `recop_top` |
| `recop_ip_tb.vhd` | Testbench for the `ReCOP_IP` wrapper |

---

## Assembler (`recop/assembler/`)

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

**Usage:**

```bash
cd recop/assembler
python recop_asm.py example2.asm
# Outputs: example2.mif  (rename to program.mif before synthesis)
```

The MIF uses HEX radix and initialises unused locations with `0x34000000` (NOOP).

**Test programs:**

| File | Description |
|------|-------------|
| `recop_asm.py` | Assembler v2 — produces `.mif` and listing output |
| `example2.asm` | Example program exercising all 31 ISA instructions |
| `pm_test.mif` | Pre-assembled MIF for `example2.asm` |
| `alu_basic_test.asm` | Basic ALU operations test |
| `full_test.asm` | Comprehensive ISA coverage test |
| `exmaple_full_test.asm` | Extended full-system test |
| `test_program.asm` | General test program |
| `*.lst` | Assembler listing files (human-readable instruction decode) |
| `*.mif` | Compiled memory initialisation files |

---

## ReCOP_IP Wrapper (`ReCOP_IP.vhd`)

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
FETCH     : program_counter  +  instruction_memory_ip (512 × 32-bit ROM)
DECODE    : regfile (16 × 16-bit)  +  multicycle_moore_machine (6-state FSM)
EXECUTE   : execute (ALU + 16-bit DM + MAX comparator)
REGISTERS : DPCR (32-bit), ER, EOT, SIP, SOP, DPRR, SVOP
```

FSM states: `FETCH → DECODE → EXECUTE → [MEM_READ | MEM_WRITE] → WRITEBACK`

**Data path width:** 16-bit (registers, ALU, DM). Instructions and DPCR are 32-bit.

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
| … | | | See `opcodes.vhd` for full 31-instruction ISA |

---

## Documentation (`701_documentation/`)

| File | Description |
|------|-------------|
| `2026 COMPSYS 701 Research Projects (GP1@2 and IP)_final.pdf` | Official project specification |
| `systemLevel701.pdf` | System-level architecture overview |
| `properDocument.docx` | Main design document |
| `RecopDocs.docx` | ReCOP implementation notes |
| `ISR.xlsx` | Instruction Set Reference spreadsheet |
| `datapath.png` | Datapath block diagram |
| `taskSeperation.png` | Task allocation diagram |
| `dpcall_software.png` | DATACALL software flow diagram |
| `701systemdiagram.drawio` | System-level diagram (draw.io) |
| `701recopInterfacing.drawio` | ReCOP interfacing diagram |
| `systemArchitecture.drawio` | Overall system architecture |
| `combineddatapath.drawio` | Combined datapath diagram |
| `datapath.drawio` | Detailed datapath diagram |
| `RECOPControlFlowDiagram.drawio` | Control flow diagram |
| `StageFlowDiagram.drawio` | Pipeline stage flow |
| `ReCOPdIagram.drawio` | ReCOP component diagram |
| `ReCopmicroA.drawio` | Micro-architecture diagram |
| `NI.drawio` | Network interface diagram |

---

## Hardware Requirements

| Board | Device | Quartus Version |
|-------|--------|-----------------|
| DE2-115 | Intel Cyclone IV E — EP4CE115F29C7 | Quartus Prime Lite 18.1+ |
| DE1-SoC | Intel Cyclone V — 5CSEMA5F31C6 | Quartus Prime Lite 18.1+ |

Clock: 50 MHz. Memory: 2 M9K blocks per memory (PM and DM each).

---

## How to Run the Program

### Step 1 — Write or choose an assembly program

Create a `.asm` file in `recop/assembler/` using the ReCOP instruction set, or use one of the existing test programs (e.g. `example2.asm`, `full_test.asm`).

### Step 2 — Assemble to MIF

```bash
cd recop/assembler
python recop_asm.py example2.asm
# Produces: example2.mif and example2.lst
```

Rename the output to `program.mif` (or whatever name your `instruction_memory_ip.vhd` references) and copy it into the Quartus project folder:

```bash
cp example2.mif ../program.mif
```

### Step 3 — Open the Quartus project

Open `recop/Recop_Project.qpf` in **Quartus Prime Lite 18.1+**.

Ensure the following source files are added to the project (via *Project → Add/Remove Files*):

- `recop_types.vhd`, `opcodes.vhd`, `various_constants.vhd`
- `program_counter.vhd`, `regfile.vhd`, `registers.vhd`
- `instruction_memory_ip.vhd`, `data_memory_ip.vhd`
- `ALU.vhd`, `execute.vhd`, `decode.vhd`, `fetch.vhd`
- `multicycle_moore_machine.vhd`, `control_signal_generator.vhd`
- `recop_top.vhd` (set as top-level entity)

### Step 4 — Compile and program the FPGA

1. In Quartus, run **Processing → Start Compilation** (or press Ctrl+L).
2. Once complete, open the **Programmer** (*Tools → Programmer*).
3. Connect the DE2-115 board via USB-Blaster.
4. Select `output_files/Recop_Project.sof` and click **Start**.

The ReCOP processor will begin executing the program loaded into program memory at power-up / reset.

### Step 5 — Reset and observe

- Assert `reset` (SW0 or KEY0 depending on pin assignments in `Recop_Project.qsf`) to reset the processor.
- Release reset — the processor fetches from address `0x000` and runs.
- Observe `SOP` output and any LED/GPIO outputs wired in `recop_top.vhd`.

---

## Simulation (ModelSim / QuestaSim)

To compile and simulate the top-level testbench:

```tcl
vlib work
vcom recop_types.vhd opcodes.vhd various_constants.vhd
vcom program_counter.vhd regfile.vhd registers.vhd
vcom instruction_memory_ip.vhd data_memory_ip.vhd
vcom ALU.vhd execute.vhd decode.vhd fetch.vhd
vcom multicycle_moore_machine.vhd recop_top.vhd
vcom recop_top_tb.vhd
vsim recop_top_tb
run -all
```

To simulate the IP wrapper:

```tcl
vcom ReCOP_IP.vhd recop_ip_tb.vhd
vsim recop_ip_tb
run -all
```

---

## Status

| Component | Status |
|-----------|--------|
| Core datapath (`recop_top`) | Functional — testbench passing |
| Multicycle FSM | Implemented, testbench passing |
| Control signal generator | Complete |
| ALU | Complete |
| Register file | Complete |
| Memory IPs (Cyclone IV E) | Complete |
| ReCOP_IP wrapper | Complete (Task B deliverable) |
| Assembler v2 | Complete |
| Testbenches (top + IP) | Present in repository |
| FPGA system integration (board I/O, PLL) | In progress — may have bugs |


