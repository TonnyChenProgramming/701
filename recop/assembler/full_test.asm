; ============================================================================
; recop_full_test_reduced.asm  –  ReCOP reduced full-system validation
;
; Coverage:
;   1. LDR immediate / direct / register
;   2. STR immediate / direct / register
;   3. ADD / AND / OR immediate
;   4. ADD / AND / OR register
;   5. SUBV
;   6. SUB (Z flag only)
;   7. SZ
;   8. PRESENT
;   9. JMP immediate / JMP register
;   10. DATACALL register / immediate
;   11. CLFZ
;   12. STRPC
;   13. LSIP / SSOP
;
; Excluded:
;   MAX, CER, CEOT, SEOT, LER, SSVOP
;
; Expected final observations:
;   R1  = 5
;   R2  = PC value captured by STRPC then loaded from M[22]
;   R3  = 33          ; immediate JMP worked
;   R4  = 20          ; holds jump_target_2 address used by JMP R4
;   R5  = 44          ; register JMP worked
;   R6  = 0x0012      ; DATACALL register source preserved
;   R7  = 0x0034      ; DATACALL immediate source preserved
;   R8  = 5           ; loaded from M[20]
;   R9  = SIP         ; LSIP copies external sip into R9
;   R10 = 30          ; address used for immediate STR
;   R11 = 42          ; loaded from M[30]
;   R12 = 31          ; address used for register STR
;   R13 = 99          ; source used for register STR
;   R14 = 99          ; loaded back from M[31]
;   R15 = 0x00AA      ; final success marker
;
; Expected memory observations:
;   M[20] = 5
;   M[21] = 3
;   M[22] = PC value written by STRPC
;   M[30] = 42
;   M[31] = 99
;
; Expected control-flow observations:
;   SZ after SUB R4 #5 with R4=6 is NOT taken
;   SZ after SUB R4 #5 with R4=5 is taken
;   PRESENT with R6=0 is taken
;   JMP jump_target_1 is taken
;   JMP R4 to jump_target_2 is taken
;
; Final state:
;   execution loops forever at label done
; ============================================================================

ORG 0

; ----------------------------------------------------------------------------
; Section 1: basic initialization
; ----------------------------------------------------------------------------
LDR   R1  #5          ; R1 = 5
LDR   R2  #3          ; R2 = 3
LDR   R3  #10         ; R3 = 10
LDR   R4  #0          ; R4 = 0
LDR   R5  #15         ; R5 = 15
LDR   R6  #1          ; R6 = 1

; ----------------------------------------------------------------------------
; Section 2: immediate ALU tests
; ----------------------------------------------------------------------------
ADD   R7  R1  #2      ; R7 = 7
AND   R8  R5  #7      ; R8 = 7
OR    R9  R2  #4      ; R9 = 7
SUBV  R10 R3  #4      ; R10 = 6

; ----------------------------------------------------------------------------
; Section 3: register ALU tests
; register form semantics: OP Rz Rz Rx
; ----------------------------------------------------------------------------
LDR   R12 #5
LDR   R13 #3
ADD   R12 R12 R13     ; R12 = 8

LDR   R14 #5
AND   R14 R14 R13     ; R14 = 1

LDR   R15 #5
OR    R15 R15 R13     ; R15 = 7

; ----------------------------------------------------------------------------
; Section 4: SUB / Z flag / SZ tests
; ----------------------------------------------------------------------------
LDR   R4  #6
SUB   R4  #5          ; 6 - 5 != 0, expect Z = 0
SZ    skip_sz_fail    ; should NOT jump

LDR   R4  #99         ; executes only if SZ was correctly not taken

skip_sz_fail:
CLFZ                  ; clear Z
LDR   R4  #5
SUB   R4  #5          ; 5 - 5 = 0, expect Z = 1
SZ    sz_taken        ; should jump

LDR   R5  #99         ; should be skipped

sz_taken:
LDR   R5  #55         ; marker that SZ branch worked

; ----------------------------------------------------------------------------
; Section 5: PRESENT test
; PRESENT jumps if Rz == 0
; ----------------------------------------------------------------------------
LDR   R6  #0
PRESENT R6 present_taken

LDR   R7  #123        ; should be skipped

present_taken:
LDR   R7  #77         ; marker that PRESENT worked

; ----------------------------------------------------------------------------
; Section 6: direct / register / immediate store-load tests
; ----------------------------------------------------------------------------
STR   R1  $20         ; M[20] = 5
STR   R2  $21         ; M[21] = 3
LDR   R8  $20         ; R8 = 5
LDR   R9  $21         ; R9 = 3

LDR   R10 #30
STR   R10 #42         ; M[30] = 42
LDR   R11 $30         ; R11 = 42

LDR   R12 #31
LDR   R13 #99
STR   R12 R13         ; M[31] = 99
LDR   R14 R12         ; R14 = 99

LDR   R15 #20
LDR   R1  R15         ; R1 = M[20] = 5

; ----------------------------------------------------------------------------
; Section 7: STRPC test
; ----------------------------------------------------------------------------
STRPC $22             ; M[22] = current PC value
LDR   R2  $22         ; R2 = stored PC value

; ----------------------------------------------------------------------------
; Section 8: jump tests
; ----------------------------------------------------------------------------
JMP   jump_target_1

LDR   R3  #222        ; should be skipped

jump_target_1:
LDR   R3  #33         ; marker that immediate jump worked

LDR   R4  #jump_target_2
JMP   R4

LDR   R5  #222        ; should be skipped

jump_target_2:
LDR   R5  #44         ; marker that register jump worked

; ----------------------------------------------------------------------------
; Section 9: DATACALL tests
; ----------------------------------------------------------------------------
LDR   R6  #0x12
DATACALL R6

LDR   R7  #0x34
DATACALL R7 #0x56

; ----------------------------------------------------------------------------
; Section 10: LSIP / SSOP tests
; ----------------------------------------------------------------------------
LSIP  R9              ; R9 = SIP input from testbench / top-level
SSOP  R1              ; SOP = R1 = 5

; ----------------------------------------------------------------------------
; Section 11: final mixed-path check
; ----------------------------------------------------------------------------
LDR   R10 #8
LDR   R11 #2
ADD   R10 R10 R11     ; 10
SUBV  R12 R10 #3      ; 7
OR    R13 R12 #8      ; 15
AND   R14 R13 #6      ; 6
SUB   R14 #6          ; expect Z = 1
SZ    final_pass

LDR   R15 #0xEEEE     ; should be skipped

final_pass:
LDR   R15 #0x00AA     ; final success marker

; ----------------------------------------------------------------------------
; Endless loop for stable observation
; ----------------------------------------------------------------------------
done:
JMP   done

END