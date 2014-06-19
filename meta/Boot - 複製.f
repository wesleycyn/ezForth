( Resolve metacompiler forward references )
' ."|           RESOLVES <(.")>
' _abort"       RESOLVES <(ABORT")>
' doVOC         RESOLVES <VOCABULARY> 
' INTO-LOCAL    RESOLVES INTO-LOCAL

( Initialize User Variables )

=SPP         SP0         ROM_USER + !  \ (SP0)      Pointer to bottom of the data stack.
=RPP         RP0         ROM_USER + !  \ (RP0)      Pointer to bottom of the return stack.
' ?RX        '?KEY       ROM_USER + !  \ ('?KEY)    Execution vector of ?KEY.
' TX!        'EMIT       ROM_USER + !  \ ('EMIT)    Execution vector of EMIT.
' accept     'EXPECT     ROM_USER + !  \ ('EXPECT)  Execution vector of EXPECT.
' kTAP       'TAP        ROM_USER + !  \ ('TAP)     Execution vector of TAP.
' TX!        'ECHO       ROM_USER + !  \ ('ECHO)    Execution vector of ECHO.
' .OK        'PROMPT     ROM_USER + !  \ ('PROMPT)  Execution vector of PROMPT.
=BASEE       BASE        ROM_USER + !  \ (BASE)     Storage of the radix base for numeric I/O.
                                       \ (tmp)      A temporary storage location used in parse and find.
                                       \ (SPAN)     Hold character count received by EXPECT.
                                       \ (>IN)      Hold the character pointer while parsing input stream.
                                       \ (#TIB)     Hold the current count. 
=TIB         #TIB CELL+  ROM_USER + !  \            Pointer to TIB 
                                       \ (CSP)      Hold the stack pointer for error checking.
' $INTERPRET 'EVAL       ROM_USER + !  \ ('EVAL)    Execution vector of EVAL.
' NUMBER?    'NUMBER     ROM_USER + !  \ ('NUMBER)  Execution vector of NUMBER?.
                                       \ (HLD)      Hold a pointer in building a numeric output string.
                                       \ (HANDLER)  Hold the return stack pointer for error handling.
                                       \ (CONTEXTA) Area to specify vocabulary search order.
                                       \            Vocabulary stack 
                                       \ (CURRENT)  Point to the vocabulary to be extended.
                                       \            vocabulary link pointer
CP-T @       CP          ROM_USER + !  \ (CP)       Point to the top of the code dictionary.
NP-T @       NP          ROM_USER + !  \ (NP)       Point to the bottom of the name dictionary.
LAST-T @     LAST        ROM_USER + !  \ (LAST)     Point to the last name in the name dictionary.


MEM_BASE ORG 
ASSEMBLER
(
\ SP, 80000000 #  ,MOV                         \ SP :=80000000
\ SP<-#$80000000
0xF8BF0000 0x800000000
\s

\ SP, SP, 0200 #  ,ADD                         \ SP :=80000200
SP<- SP + #$0200
\ WP, FF #        ,MOV                         \ WP :=FF
WP<- #FF
\ [] WP, SP       ,STR                         \ [SP] := WP
[SP]->WP
\ SP, 0 #         ,MOV                         \ SP :=0
SP<- #0
\ RP, $60000000 # ,MOV                         \ RP :=$60000000
RP<-  #$60000000
LABEL: SYSTEM_MOVE
\ [] WP,  SP, 4 # ,LDR                         \ WP := [SP], SP:=SP+4  
[SP]->WP,SP+4->SP
\ [] WP,  RP, 4 # ,STR                         \ [RP] := WP, RP:=RP+4
WP->[RP],RP+4->RP
\ SP, $8000 #     ,CMP                         \ Finish?

\ NE, SYSTEM_MOVE # ,B                         \ do again      

\ [P] SP, PC, 4 # ,LDR                         \ SP := [PC] (=SPP)
[PC]->SPP,PC+4->PC
\ [P] RP, PC, 4 # ,LDR                         \ RP := [PC] (=RPP)
[PC]->RP,PC+4->PC
\ [P] PC, PC, 4 # ,LDR                         \ Jump to COLD
[PC]->PC,PC+4->PC
)
=SPP ,
=RPP ,
' COLD ,