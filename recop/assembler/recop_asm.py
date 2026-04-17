#!/usr/bin/env python3
"""
ReCOP Assembler  -  recop_asm.py  (v2 – matches classmates' opcodes.vhd)
Converts ReCOP assembly source (.asm) to Altera/Intel .mif for FPGA PM loading.

━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━
 INSTRUCTION ENCODING  (32-bit word)  — matches opcodes.vhd / hardware
━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━
  Bits 31–30 : AM      (2-bit addressing mode)     ← HIGH bits
  Bits 29–24 : OP      (6-bit opcode)
  Bits 23–20 : Rz      (4-bit destination / address register)
  Bits 19–16 : Rx      (4-bit source register)
  Bits 15–0  : OPERAND (16-bit immediate value or memory address)

  AM codes:  00 = inherent   (no explicit operand)
             01 = immediate  (#value in OPERAND field)
             10 = direct     ($addr  in OPERAND field)
             11 = register   (value from Rx; OPERAND unused)

  NOTE: v1 assembler used [OP:6][AM:2] order (AM in low bits of upper byte).
        v2 (this file) uses [AM:2][OP:6] order (AM in high bits) to match
        the hardware control_signal_generator.vhd.

━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━
 ASSEMBLY SOURCE SYNTAX
━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━
  [label[:]]  MNEMONIC  [operands]  [; comment]

  Registers   : R0 – R15   (R0 is always 0 in hardware)
  Immediate   : #<value>   decimal / 0x hex / 0b binary / 0o octal
  Direct addr : $<value>   same literal formats
  Label ref   : bare name or #name  (resolves to instruction address)

  Directives:
    .ORG  <addr>          – set program counter (default 0)
    .EQU  <name> <value>  – define a named constant
    .WORD <value>         – insert a raw 32-bit word at current PC

  Source terminators (optional):
    ENDPROG / END         – stop assembling (same as end-of-file)

━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━
 USAGE
━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━
  python recop_asm.py  source.asm  [-o out.mif]  [-l out.lst]  [--depth 512]

  Outputs:
    <source>.mif   Altera MIF file for PM initialisation in Quartus
    <source>.lst   Human-readable listing with decoded field values
"""

import sys
import re
import argparse
from pathlib import Path

# ── Addressing Mode Constants ─────────────────────────────────────────────────
AM_INHERENT  = 0b00
AM_IMMEDIATE = 0b01
AM_DIRECT    = 0b10
AM_REGISTER  = 0b11

# ── Opcode Table  (matches opcodes.vhd constants) ────────────────────────────
OP = {
    # Core data-transfer
    'LDR':      0b000000,
    'STR':      0b000010,
    # Arithmetic
    'SUBV':     0b000011,
    'SUB':      0b000100,
    'AND':      0b001000,
    'OR':       0b001100,
    'ADD':      0b111000,
    'MAX':      0b011110,
    # Flags / control
    'CLFZ':     0b010000,
    'SZ':       0b010100,
    # Jumps
    'JMP':      0b011000,
    'PRESENT':  0b011100,
    'STRPC':    0b011101,
    # Data-process interface
    'DATACALL':     0b101000,   # register AM: DATACALL Rx
    'DATACALL_IMM': 0b101001,   # immediate AM: DATACALL Rx #val  (datacall2)
    'SRES':         0b101010,
    # No-operation
    'NOOP':     0b110100,
    # Special-register access
    'LER':      0b110110,   # direct AM: load ER into Rz
    'LSIP':     0b110111,   # direct AM: load SIP into Rz
    'SSOP':     0b111010,   # direct AM: store Rx to SOP
    'SSVOP':    0b111011,   # direct AM: store Rx to SVOP
    # Thread / interrupt control
    'CER':      0b111100,
    'CEOT':     0b111110,
    'SEOT':     0b111111,
}

_MNEMONICS = set(OP.keys()) | {'.ORG', '.EQU', '.WORD', 'ENDPROG', 'END'}


# ─────────────────────────────────────────────────────────────────────────────
#  Error class
# ─────────────────────────────────────────────────────────────────────────────

class AsmError(Exception):
    def __init__(self, msg, lineno=None, src=None):
        super().__init__(msg)
        self.lineno = lineno
        self.src    = src

    def __str__(self):
        s = super().__str__()
        if self.lineno:
            s = f"Line {self.lineno}: {s}"
        if self.src:
            s += f"\n    >> {self.src.strip()}"
        return s


# ─────────────────────────────────────────────────────────────────────────────
#  Helper utilities
# ─────────────────────────────────────────────────────────────────────────────

def parse_int(tok, lineno=None, src=None):
    t = tok.strip()
    neg = t.startswith('-')
    if neg:
        t = t[1:]
    try:
        if   t.startswith(('0x', '0X')): v = int(t, 16)
        elif t.startswith(('0b', '0B')): v = int(t, 2)
        elif t.startswith(('0o', '0O')): v = int(t, 8)
        else:                            v = int(t)
        return -v if neg else v
    except ValueError:
        raise AsmError(f"Invalid integer literal: '{tok}'", lineno, src)


def parse_reg(tok, lineno=None, src=None):
    m = re.fullmatch(r'[Rr](\d{1,2})', tok)
    if not m:
        raise AsmError(f"Expected register R0–R15, got '{tok}'", lineno, src)
    n = int(m.group(1))
    if n > 15:
        raise AsmError(f"Register out of range: '{tok}' (max R15)", lineno, src)
    return n


def is_reg(tok):
    return bool(re.match(r'^[Rr]\d{1,2}$', tok))


def pack(op, am, rz, rx, operand):
    """Assemble fields into a 32-bit instruction word.
    Layout: [AM:2][OP:6][Rz:4][Rx:4][OPERAND:16]
    Matches classmates' opcodes.vhd and control_signal_generator.vhd.
    """
    return (
        ((am      & 0x03) << 30) |   # AM in bits 31-30
        ((op      & 0x3F) << 24) |   # OP in bits 29-24
        ((rz      & 0x0F) << 20) |
        ((rx      & 0x0F) << 16) |
         (operand & 0xFFFF)
    )


def b32(word):
    return format(word & 0xFFFFFFFF, '032b')


def tokenise(line):
    return line.split(';')[0].split()


# ─────────────────────────────────────────────────────────────────────────────
#  Two-pass Assembler
# ─────────────────────────────────────────────────────────────────────────────

class Assembler:
    def __init__(self, pm_depth=512):
        self.pm_depth = pm_depth
        self.symbols  = {}
        self.equates  = {}
        self.code     = []

    def assemble_file(self, path):
        lines = Path(path).read_text(encoding='utf-8', errors='replace').splitlines()
        self._pass1(lines)
        self._pass2(lines)

    def _pass1(self, lines):
        pc = 0
        for lineno, raw in enumerate(lines, 1):
            toks = tokenise(raw)
            if not toks:
                continue
            first = toks[0].upper()

            if first in ('END', 'ENDPROG'):
                break
            if first in ('.ORG', 'ORG'):
                if len(toks) < 2:
                    raise AsmError("ORG requires an address", lineno, raw)
                pc = parse_int(toks[1], lineno, raw)
                continue
            if first in ('.EQU', 'EQU'):
                if len(toks) < 3:
                    raise AsmError("EQU requires name and value", lineno, raw)
                self.equates[toks[1].upper()] = parse_int(toks[2], lineno, raw)
                continue
            if first in ('.WORD', 'WORD'):
                pc += 1
                continue

            bare = first.rstrip(':')
            if bare not in OP:
                self.symbols[bare] = pc
                toks = toks[1:]
                if not toks:
                    continue
                first = toks[0].upper()

            if first.rstrip(':') in OP:
                pc += 1

    def _pass2(self, lines):
        pc = 0
        for lineno, raw in enumerate(lines, 1):
            toks = tokenise(raw)
            if not toks:
                continue
            first = toks[0].upper()

            if first in ('END', 'ENDPROG'):
                break
            if first in ('.ORG', 'ORG'):
                pc = parse_int(toks[1], lineno, raw)
                continue
            if first in ('.EQU', 'EQU'):
                continue
            if first in ('.WORD', 'WORD'):
                v = self._resolve(toks[1], lineno, raw)
                self.code.append((pc, v & 0xFFFFFFFF, raw, lineno))
                pc += 1
                continue

            bare = first.rstrip(':')
            if bare not in OP:
                toks = toks[1:]
                if not toks:
                    continue
                first = toks[0].upper()

            mnemonic = first.rstrip(':')
            if mnemonic not in OP:
                raise AsmError(f"Unknown mnemonic: '{mnemonic}'", lineno, raw)

            args = toks[1:]
            word = self._encode(mnemonic, args, lineno, raw)
            if pc >= self.pm_depth:
                raise AsmError(
                    f"Address 0x{pc:04X} exceeds PM depth ({self.pm_depth})", lineno, raw)
            self.code.append((pc, word, raw, lineno))
            pc += 1

    def _resolve(self, tok, lineno, src):
        upper = tok.upper()
        if upper in self.equates:
            return self.equates[upper]
        if upper in self.symbols:
            return self.symbols[upper]
        return parse_int(tok, lineno, src)

    def _parse_operand(self, tok, lineno, src):
        if tok.startswith('#'):
            return AM_IMMEDIATE, self._resolve(tok[1:], lineno, src)
        if tok.startswith('$'):
            return AM_DIRECT,    self._resolve(tok[1:], lineno, src)
        return AM_IMMEDIATE, self._resolve(tok, lineno, src)

    def _need(self, mnemonic, args, n, lineno, src):
        if len(args) < n:
            raise AsmError(
                f"{mnemonic} needs {n} operand(s), got {len(args)}", lineno, src)

    def _encode(self, m, args, lineno, raw):
        try:
            return self._dispatch(m, args, lineno, raw)
        except AsmError:
            raise
        except Exception as e:
            raise AsmError(str(e), lineno, raw)

    def _dispatch(self, m, args, lineno, raw):

        # ── INHERENT ──────────────────────────────────────────────────────
        if m in ('NOOP', 'CLFZ', 'CER', 'CEOT', 'SEOT'):
            return pack(OP[m], AM_INHERENT, 0, 0, 0)

        # ── LDR  Rz  #imm | $addr | Rx ───────────────────────────────────
        if m == 'LDR':
            self._need(m, args, 2, lineno, raw)
            rz = parse_reg(args[0], lineno, raw)
            a1 = args[1]
            if is_reg(a1):
                return pack(OP['LDR'], AM_REGISTER, rz, parse_reg(a1, lineno, raw), 0)
            am, v = self._parse_operand(a1, lineno, raw)
            return pack(OP['LDR'], am, rz, 0, v)

        # ── STR  Rz #imm | Rz Rx | Rx $addr ─────────────────────────────
        if m == 'STR':
            self._need(m, args, 2, lineno, raw)
            a0, a1 = args[0], args[1]
            if a1.startswith('$'):
                rx   = parse_reg(a0, lineno, raw)
                addr = self._resolve(a1[1:], lineno, raw)
                return pack(OP['STR'], AM_DIRECT, 0, rx, addr)
            rz = parse_reg(a0, lineno, raw)
            if is_reg(a1):
                return pack(OP['STR'], AM_REGISTER, rz, parse_reg(a1, lineno, raw), 0)
            imm = self._resolve(a1[1:] if a1.startswith('#') else a1, lineno, raw)
            return pack(OP['STR'], AM_IMMEDIATE, rz, 0, imm)

        # ── JMP  label | #addr | Rx ───────────────────────────────────────
        if m == 'JMP':
            self._need(m, args, 1, lineno, raw)
            a0 = args[0]
            if is_reg(a0):
                return pack(OP['JMP'], AM_REGISTER, 0, parse_reg(a0, lineno, raw), 0)
            _, addr = self._parse_operand(a0, lineno, raw)
            return pack(OP['JMP'], AM_IMMEDIATE, 0, 0, addr)

        # ── PRESENT  Rz  label | #addr ────────────────────────────────────
        if m == 'PRESENT':
            self._need(m, args, 2, lineno, raw)
            rz = parse_reg(args[0], lineno, raw)
            _, addr = self._parse_operand(args[1], lineno, raw)
            return pack(OP['PRESENT'], AM_IMMEDIATE, rz, 0, addr)

        # ── SZ  label | #addr ─────────────────────────────────────────────
        if m == 'SZ':
            self._need(m, args, 1, lineno, raw)
            _, addr = self._parse_operand(args[0], lineno, raw)
            return pack(OP['SZ'], AM_IMMEDIATE, 0, 0, addr)

        # ── AND / OR / ADD ────────────────────────────────────────────────
        if m in ('AND', 'OR', 'ADD'):
            self._need(m, args, 2, lineno, raw)
            rz = parse_reg(args[0], lineno, raw)
            if len(args) >= 3:
                a2 = args[2]
                if a2.startswith('#'):
                    rx  = parse_reg(args[1], lineno, raw)
                    imm = self._resolve(a2[1:], lineno, raw)
                    return pack(OP[m], AM_IMMEDIATE, rz, rx, imm)
                else:
                    rx = parse_reg(a2, lineno, raw)
                    return pack(OP[m], AM_REGISTER, rz, rx, 0)
            else:
                a1 = args[1]
                if a1.startswith('#'):
                    imm = self._resolve(a1[1:], lineno, raw)
                    return pack(OP[m], AM_IMMEDIATE, rz, rz, imm)
                rx = parse_reg(a1, lineno, raw)
                return pack(OP[m], AM_REGISTER, rz, rx, 0)

        # ── SUB  Rz  #imm ─────────────────────────────────────────────────
        if m == 'SUB':
            self._need(m, args, 2, lineno, raw)
            rz  = parse_reg(args[0], lineno, raw)
            a1  = args[1]
            imm = self._resolve(a1[1:] if a1.startswith('#') else a1, lineno, raw)
            return pack(OP['SUB'], AM_IMMEDIATE, rz, 0, imm)

        # ── SUBV  Rz Rx #imm  |  Rz Rz Rx ───────────────────────────────
        if m == 'SUBV':
            self._need(m, args, 2, lineno, raw)
            rz = parse_reg(args[0], lineno, raw)
            if len(args) >= 3:
                a2 = args[2]
                if a2.startswith('#'):
                    rx  = parse_reg(args[1], lineno, raw)
                    imm = self._resolve(a2[1:], lineno, raw)
                    return pack(OP['SUBV'], AM_IMMEDIATE, rz, rx, imm)
                else:
                    rx = parse_reg(a2, lineno, raw)
                    return pack(OP['SUBV'], AM_REGISTER, rz, rx, 0)
            else:
                a1 = args[1]
                if a1.startswith('#') or not is_reg(a1):
                    imm = self._resolve(a1[1:] if a1.startswith('#') else a1, lineno, raw)
                    return pack(OP['SUBV'], AM_IMMEDIATE, rz, rz, imm)
                rx = parse_reg(a1, lineno, raw)
                return pack(OP['SUBV'], AM_REGISTER, rz, rx, 0)

        # ── MAX  Rz  #imm ─────────────────────────────────────────────────
        if m == 'MAX':
            self._need(m, args, 2, lineno, raw)
            rz  = parse_reg(args[0], lineno, raw)
            a1  = args[1]
            imm = self._resolve(a1[1:] if a1.startswith('#') else a1, lineno, raw)
            return pack(OP['MAX'], AM_IMMEDIATE, rz, 0, imm)

        # ── STRPC  $addr ──────────────────────────────────────────────────
        if m == 'STRPC':
            self._need(m, args, 1, lineno, raw)
            a0   = args[0]
            addr = self._resolve(a0[1:] if a0.startswith('$') else a0, lineno, raw)
            return pack(OP['STRPC'], AM_DIRECT, 0, 0, addr)

        # ── LER  Rz ───────────────────────────────────────────────────────
        # AM=direct, destination register in Rz field (matches CU sel_z writeback)
        if m == 'LER':
            self._need(m, args, 1, lineno, raw)
            return pack(OP['LER'], AM_DIRECT, parse_reg(args[0], lineno, raw), 0, 0)

        # ── LSIP  Rz ──────────────────────────────────────────────────────
        # AM=direct, destination register in Rz field (CU writes to sel_z)
        if m == 'LSIP':
            self._need(m, args, 1, lineno, raw)
            return pack(OP['LSIP'], AM_DIRECT, parse_reg(args[0], lineno, raw), 0, 0)

        # ── SSOP  Rx ──────────────────────────────────────────────────────
        # AM=direct, source register in Rx field (registers.vhd reads rx for SOP)
        if m == 'SSOP':
            self._need(m, args, 1, lineno, raw)
            return pack(OP['SSOP'], AM_DIRECT, 0, parse_reg(args[0], lineno, raw), 0)

        # ── SSVOP  Rx ─────────────────────────────────────────────────────
        # AM=direct, source register in Rx field
        if m == 'SSVOP':
            self._need(m, args, 1, lineno, raw)
            return pack(OP['SSVOP'], AM_DIRECT, 0, parse_reg(args[0], lineno, raw), 0)

        # ── DATACALL  Rx  |  DATACALL Rx #val ────────────────────────────
        # Register:  OP=101000 (datacall),  AM=register
        # Immediate: OP=101001 (datacall2), AM=immediate
        if m == 'DATACALL':
            self._need(m, args, 1, lineno, raw)
            rx = parse_reg(args[0], lineno, raw)
            if len(args) >= 2 and args[1].startswith('#'):
                imm = self._resolve(args[1][1:], lineno, raw)
                return pack(OP['DATACALL_IMM'], AM_IMMEDIATE, 0, rx, imm)
            return pack(OP['DATACALL'], AM_REGISTER, 0, rx, 0)

        # ── SRES  Rz ──────────────────────────────────────────────────────
        if m == 'SRES':
            self._need(m, args, 1, lineno, raw)
            return pack(OP['SRES'], AM_REGISTER, parse_reg(args[0], lineno, raw), 0, 0)

        raise AsmError(f"Unhandled mnemonic: '{m}'", lineno, raw)

    # ── Output: Altera .mif  (HEX radix) ─────────────────────────────────────

    def write_mif(self, path):
        addr_bits = max(1, (self.pm_depth - 1).bit_length())
        code_map  = {a: w for a, w, _, _ in self.code}
        with open(path, 'w') as f:
            f.write("-- Generated by ReCOP Assembler v2  [AM:2][OP:6] encoding\n")
            f.write(f"DEPTH = {self.pm_depth};\n")
            f.write(f"WIDTH = 32;\n")
            f.write(f"ADDRESS_RADIX = HEX;\n")
            f.write(f"DATA_RADIX = HEX;\n")
            f.write(f"CONTENT\nBEGIN\n")
            for addr in range(self.pm_depth):
                word = code_map.get(addr, 0x34000000)   # unused = NOOP
                f.write(f"{addr:0{addr_bits}X} : {word:08X};\n")
            f.write("END;\n")

    # ── Output: human-readable .lst listing ──────────────────────────────────

    def write_listing(self, path):
        am_name = {0: 'INH', 1: 'IMM', 2: 'DIR', 3: 'REG'}
        # Build reverse map; skip DATACALL_IMM (it shows as DATACALL in listing)
        op_name = {}
        for k, v in OP.items():
            if k != 'DATACALL_IMM':
                op_name[v] = k

        with open(path, 'w') as f:
            f.write("ReCOP Assembly Listing  (v2 – [AM:2][OP:6] encoding)\n")
            f.write("=" * 72 + "\n\n")

            if self.symbols:
                f.write("Symbol Table:\n")
                for name, addr in sorted(self.symbols.items(), key=lambda x: x[1]):
                    f.write(f"  {name:<24}  0x{addr:04X}  ({addr})\n")
                f.write("\n")

            if self.equates:
                f.write("Equates (.EQU):\n")
                for name, val in sorted(self.equates.items()):
                    f.write(f"  {name:<24}  {val}  (0x{val & 0xFFFF:04X})\n")
                f.write("\n")

            f.write(
                f"{'ADDR':>6}  {'HEX':>8}  "
                f"{'AM':>3}  {'OPCODE':<8}  {'Rz':>3}  {'Rx':>3}  "
                f"{'OPERAND':>8}    SOURCE\n"
            )
            f.write("-" * 80 + "\n")

            for addr, word, src, _lineno in self.code:
                # v2 layout: AM in bits 31-30, OP in bits 29-24
                am      =  (word >> 30) & 0x03
                op_bits =  (word >> 24) & 0x3F
                rz      =  (word >> 20) & 0x0F
                rx      =  (word >> 16) & 0x0F
                operand =   word        & 0xFFFF
                f.write(
                    f"0x{addr:04X}  {word:08X}  "
                    f"{am_name[am]:>3}  {op_name.get(op_bits, f'?{op_bits:06b}'):<8}"
                    f"  R{rz:<2}  R{rx:<2}  {operand:>8}    {src.strip()}\n"
                )


# ─────────────────────────────────────────────────────────────────────────────
#  Command-line interface
# ─────────────────────────────────────────────────────────────────────────────

def main():
    ap = argparse.ArgumentParser(
        description='ReCOP Assembler v2  –  [AM:2][OP:6] encoding, matches opcodes.vhd',
        formatter_class=argparse.RawDescriptionHelpFormatter,
        epilog=__doc__
    )
    ap.add_argument('input',           help='Assembly source file (.asm)')
    ap.add_argument('-o', '--output',  help='Output MIF file  (default: <input>.mif)')
    ap.add_argument('-l', '--listing', help='Output listing   (default: <input>.lst)')
    ap.add_argument('--depth', type=int, default=512,
                    help='Program Memory depth in words  (default: 512)')
    args = ap.parse_args()

    src = Path(args.input)
    if not src.exists():
        sys.exit(f"Error: source file not found: '{src}'")

    mif = Path(args.output)  if args.output  else src.with_suffix('.mif')
    lst = Path(args.listing) if args.listing else src.with_suffix('.lst')

    asm = Assembler(pm_depth=args.depth)
    try:
        asm.assemble_file(src)
    except AsmError as e:
        sys.exit(f"Assembly error: {e}")

    asm.write_mif(mif)
    asm.write_listing(lst)

    print(f"OK  {len(asm.code)} instruction(s) assembled into {asm.pm_depth}-word PM.")
    print(f"    MIF     : {mif}")
    print(f"    Listing : {lst}")
    if asm.symbols:
        col = 0
        print("    Labels  :", end="")
        for name, addr in sorted(asm.symbols.items(), key=lambda x: x[1]):
            entry = f" {name}=0x{addr:04X}"
            if col + len(entry) > 68:
                print(f"\n            ", end="")
                col = 0
            print(entry, end="")
            col += len(entry)
        print()


if __name__ == '__main__':
    main()
