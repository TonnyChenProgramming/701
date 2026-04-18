; ============================================================================
; alu_basic_test.asm  –  Basic ALU + load test for ReCOP ISA
;
; Goal:
;   1. verify LDR immediate
;   2. verify ADD / AND / OR immediate
;   3. verify ADD / AND / OR register
;   4. verify SUBV
;   5. verify SUB (Z-only)
;
; Expected values:
;   R1 = 5
;   R2 = 3
;   R3 = 7      ; 5 + 2
;   R4 = 1      ; 5 AND 1
;   R5 = 7      ; 3 OR 4
;   R6 = 3      ; 5 - 2
;   R7 = 8      ; 5 + 3
;   R8 = 1      ; 5 AND 3
;   R9 = 7      ; 5 OR 3
;   Z  = 1      ; after SUB R1 #5
; ============================================================================

ORG 0

; ── Load immediate ───────────────────────────────────────────────────────────
LDR   R1  #5
LDR   R2  #3

; ── Immediate ALU tests ─────────────────────────────────────────────────────
ADD   R3  R1  #2
AND   R4  R1  #1
OR    R5  R2  #4
SUBV  R6  R1  #2

; ── Z flag test ─────────────────────────────────────────────────────────────
SUB   R1  #5

; ── Register ALU tests ──────────────────────────────────────────────────────
LDR   R7  #5
LDR   R8  #5
LDR   R9  #5

ADD   R7  R7  R2
AND   R8  R8  R2
OR    R9  R9  R2

; ── End ─────────────────────────────────────────────────────────────────────
NOOP