; ============================================================================
; recop_full_instruction_test_v2.asm  –  Full instruction functional test
;
; Goal:
;   Verify the normal operation of the ReCOP ISA instructions, assuming:
;     1. all registers are initially 0
;     2. all data memory locations are initially 0
;
; Important ISA note:
;   Register-type ALU instructions are assumed to follow this form:
;
;       ADD Rz Rz Rx    => Rz = Rz + Rx
;       AND Rz Rz Rx    => Rz = Rz AND Rx
;       OR  Rz Rz Rx    => Rz = Rz OR Rx
;
;   Therefore, for register ALU operations, the first and second registers
;   must be the same.
;
; Covered instructions:
;   - LDR   (immediate, register, direct)
;   - STR   (immediate, register, direct)
;   - ADD   (immediate, register)
;   - AND   (immediate, register)
;   - OR    (immediate, register)
;   - SUBV  (immediate)
;   - SUB   (immediate)
;   - JMP   (immediate, register)
;   - PRESENT
;   - DATACALL (register, immediate)
;   - SZ
;   - STRPC
;   - CLFZ
;   - LSIP
;   - SSOP
;   - NOOP
;
; Excluded instructions:
;   - MAX
;   - CER
;   - CEOT
;   - SEOT
;   - LER
;   - SSVOP
;
; Initial assumptions:
;   Registers:
;     R0~R15 = 0x0000
;   Data memory:
;     DM[x] = 0x0000 for all x
;
; Main expected values after execution:
;   R1  = 0x0005
;   R2  = 0x0003
;   R3  = 0x0011
;   R4  = 0x0007         ; ADD immediate
;   R5  = 0x0001         ; AND immediate
;   R6  = 0x0007         ; OR immediate
;   R7  = 0x0003         ; SUBV immediate
;   R8  = 0x0008         ; after ADD R8 R8 R2, starting from 5
;   R9  = 0x0001         ; after AND R9 R9 R2, starting from 5
;   R10 = 0x0007         ; after OR  R10 R10 R2, starting from 5
;   R11 = 0x0005         ; LDR direct result
;   R12 = 0x0003         ; LDR register result
;   R14 = SIP            ; after LSIP
;
; Memory expected:
;   DM[0x0010] = 0x0005
;   DM[0x0011] = 0x0003
;   DM[0x0012] = 0x00AA
;   DM[0x0013] = PC at STRPC
; ============================================================================

ORG 0

; ----------------------------------------------------------------------------
; Section 1: Basic literal setup
; ----------------------------------------------------------------------------
LDR   R1  #5              ; R1 = 0x0005
LDR   R2  #3              ; R2 = 0x0003
LDR   R3  #0x0011         ; R3 = 0x0011, used as memory pointer
LDR   R15 #0x0012         ; R15 = 0x0012, used as another memory pointer

; ----------------------------------------------------------------------------
; Section 2: Immediate ALU tests
; ----------------------------------------------------------------------------
ADD   R4  R1  #2          ; R4 = 5 + 2 = 7
AND   R5  R1  #1          ; R5 = 5 AND 1 = 1
OR    R6  R2  #4          ; R6 = 3 OR 4 = 7
SUBV  R7  R1  #2          ; R7 = 5 - 2 = 3

; ----------------------------------------------------------------------------
; Section 3: Register ALU tests
; IMPORTANT: first and second register must be the same
; ----------------------------------------------------------------------------
LDR   R8  #5
LDR   R9  #5
LDR   R10 #5

ADD   R8  R8  R2          ; R8  = 5 + 3 = 8
AND   R9  R9  R2          ; R9  = 5 AND 3 = 1
OR    R10 R10 R2          ; R10 = 5 OR 3 = 7

; ----------------------------------------------------------------------------
; Section 4: Store tests
; ----------------------------------------------------------------------------
STR   R1  $0x0010         ; DM[0x0010] = 0x0005
STR   R2  R3              ; DM[0x0011] = 0x0003
STR   R15 #0x00AA         ; DM[0x0012] = 0x00AA

; ----------------------------------------------------------------------------
; Section 5: Load tests
; ----------------------------------------------------------------------------
LDR   R11 $0x0010         ; R11 = DM[0x0010] = 0x0005
LDR   R12 R3              ; R12 = DM[0x0011] = 0x0003
LDR   R13 #0x0028         ; preload jump target address for JMP register

; ----------------------------------------------------------------------------
; Section 6: DATACALL tests
; ----------------------------------------------------------------------------
DATACALL R1  R2           ; DPCR = R1 & R2, DPRR(1) = 0
DATACALL R1  #0x0015      ; DPCR = R1 & 0x0015, DPRR(1) = 0

; ----------------------------------------------------------------------------
; Section 7: PRESENT tests
; ----------------------------------------------------------------------------
PRESENT R2  #present_taken
NOOP                      ; should be skipped if PRESENT works

present_taken:
PRESENT R0  #present_not_taken
NOOP                      ; should execute because R0 = 0 so no jump

present_not_taken:
NOOP

; ----------------------------------------------------------------------------
; Section 8: JMP immediate test
; ----------------------------------------------------------------------------
JMP   #jmp_imm_target
NOOP                      ; should be skipped

jmp_imm_target:
NOOP

; ----------------------------------------------------------------------------
; Section 9: JMP register test
; ----------------------------------------------------------------------------
JMP   R13
NOOP                      ; should be skipped

ORG 0x0028
jmp_reg_target:
NOOP

; ----------------------------------------------------------------------------
; Section 10: STRPC test
; ----------------------------------------------------------------------------
STRPC $0x0013             ; DM[0x0013] = current PC

; ----------------------------------------------------------------------------
; Section 11: Z flag + SZ test
; ----------------------------------------------------------------------------
LDR   R14 #5              ; R14 = 5
SUB   R14 #5              ; R14 = 0, expect Z = 1
SZ    #sz_taken           ; should jump
NOOP                      ; should be skipped

sz_taken:
CLFZ                      ; Z = 0

; ----------------------------------------------------------------------------
; Section 12: LSIP / SSOP tests
; ----------------------------------------------------------------------------
LSIP  R14                 ; R14 = SIP
SSOP  R2                  ; SOP = R2 = 0x0003

; ----------------------------------------------------------------------------
; Section 13: End
; ----------------------------------------------------------------------------
NOOP
NOOP