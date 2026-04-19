; ============================================================================
; ReCOP GP1 Test Program
; Tests: DATACALL (reg + imm), PRESENT (taken + not-taken),
;        JMP immediate, JMP register, Z flag, SZ (taken + not-taken),
;        LSIP, SSOP, STRPC
; ============================================================================

.ORG 0

; ── Setup registers ──────────────────────────────────────────────────────────
        LDR  R1  #5         ; R1 = 5
        LDR  R7  #0xAB      ; R7 = 0x00AB  (used by DATACALL register form)
        LDR  R2  #0xCD      ; R2 = 0x00CD

; ── DATACALL register form ───────────────────────────────────────────────────
; DATACALL Rx  ->  DPCR[31:16] = Rx,  DPCR[15:0] = R7
        DATACALL R2         ; DPCR = R2 & R7 = 0x00CD_00AB

; ── DATACALL immediate form ──────────────────────────────────────────────────
; DATACALL Rx #Op  ->  DPCR[31:16] = Rx,  DPCR[15:0] = Operand
        DATACALL R2 #0x5678 ; DPCR = R2 & 0x5678 = 0x00CD_5678

; ── PRESENT: Rz != 0, no jump ────────────────────────────────────────────────
        LDR  R4  #1         ; R4 = 1  (non-zero)
        PRESENT R4  #target_present ; R4 != 0 -> NO jump, continue

; ── PRESENT: Rz == 0, take jump ──────────────────────────────────────────────
        LDR  R5  #0         ; R5 = 0
        PRESENT R5  #target_present ; R5 == 0 -> JUMP to target_present

; ── Skipped by PRESENT ───────────────────────────────────────────────────────
        NOOP
        NOOP
        NOOP
        NOOP
        NOOP
        NOOP

; ── PRESENT jump target ──────────────────────────────────────────────────────
target_present:
; ── Z flag test: SUB sets Z=1 ────────────────────────────────────────────────
        LDR  R6  #5         ; R6 = 5
        SUB  R6  #5         ; 5 - 5 = 0  ->  Z = 1

; ── SZ taken (Z=1) ───────────────────────────────────────────────────────────
        SZ   #target_sz     ; Z=1 -> JUMP to target_sz

; ── Skipped by SZ ────────────────────────────────────────────────────────────
        NOOP
        NOOP
        NOOP

; ── SZ jump target ───────────────────────────────────────────────────────────
target_sz:
; ── Z flag test: SUB sets Z=0 ────────────────────────────────────────────────
        LDR  R6  #3         ; R6 = 3
        SUB  R6  #5         ; 3 - 5 = -2  ->  Z = 0

; ── SZ not-taken (Z=0) ───────────────────────────────────────────────────────
        SZ   #target_present ; Z=0 -> NO jump, continue

; ── JMP immediate ────────────────────────────────────────────────────────────
        JMP  #target_jmp_reg ; unconditional jump

; ── Skipped by JMP ───────────────────────────────────────────────────────────
        NOOP

; ── JMP register ─────────────────────────────────────────────────────────────
target_jmp_reg:
        LDR  R8  #target_lsip ; R8 = address of target_lsip
        JMP  R8               ; PC = R8 -> jump to target_lsip

; ── Skipped by JMP R8 ────────────────────────────────────────────────────────
        NOOP

; ── LSIP / SSOP / STRPC ──────────────────────────────────────────────────────
target_lsip:
        LDR  R9  #0xBB      ; R9 = 0x00BB
        LSIP R10            ; R10 = SIP  (= 0x1234 from testbench)
        SSOP R9             ; SOP = R9  = 0x00BB
        STRPC $0x50         ; DM[0x50] = PC (current program counter)

; ── Infinite loop ────────────────────────────────────────────────────────────
loop:
        JMP  #loop          ; stay here forever

