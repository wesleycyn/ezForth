: LDR_<Rt3b2>,[<Rn3b5>,<Rm3b8>]
  n3b8 
  swap n3b5 or
  swap n3b8 or  
  0x5C00 or
  AsmCode2! 
  ;
   
: LDR.W_<Rt>,[<Rn>,#<imm12>]
  0xF8D00000
  A1$ count $>reg   n4b15 or
  A3$ count $>reg   n4b19 or    
  A4$ count $>imm8  n12b11 or   
  AsmCode2!  
 ;

: LDR.W_<Rt>,[PC,#+/-<imm12>] ( -- )
  0xF8BF0000
  A1$ count $>reg ( dup rt ! )  n4b15 or \ a$1---> Rt43b15
  A3$ count $>U      
  A4$ count $>imm12             n12b11 or \ a$4---> Rn4b19  
  AsmCode2!   
  ;

: LDR.W_<Rt4b15>,[<Rn4b19>,<Rm4b3>{,LSL#<shift2b5>}>] ( -- )
  0xF0600000
  A1$ count $>reg ( dup rt ! ) n4b15 or \ a$1---> Rt43b15
  A2$ count $>reg ( dup rn ! ) n4b19 or \ a$2---> Rn4b19
  A3$ count $>reg ( dup rm ! ) n4b3  or \ a$3---> Rm4b3
  A4$ count $>shift            n2b5  or \ a$4---> s2b5       
  AsmCode4!
  ;
 
: LDR.W_<Rt4b15>,[<Rn4b19>,<Rm4b3>] ( -- )
  0xF0600000
  A1$ count $>reg ( dup rt ! ) n4b15 or \ a$1---> Rt43b15
  A2$ count $>reg ( dup rn ! ) n4b19 or \ a$2---> Rn4b19
  A3$ count $>reg ( dup rm ! ) n4b3  or \ a$3---> Rm4b3
\  A4$ count $>shift  ( 0 )    n2b5  or \ a$4---> s2b5       
  AsmCode4!
  ; 
 
: LDR_BNF ( -- )

  ;

: LDR.W_BNF ( -- )
  ;

: Thumb2_LDR_BNF ( -- )
	arg
  cr
  a1$ count type a1$ ." ::=" Rn?            \ 2dup   ." op1=" . ." Rn=" . cr   
\  .s
  2 *
\  .s
  a2$ count type a2$ ." ::=" [Rn]?          \ 2dup   ." op2=" . ." Rn=" . cr
  rot + 
\  .s
  8 *
\  .s
  a3$ count type a3$ ." ::=" Rn/Imm5/8]!?   \ 2dup   ." op3=" . ." Num=" . cr 
  rot +
  \ . . . .
  \ a4$ count type cr
  cr
;


: _LDR ( -- )

  Thumb2_LDR_BNF   
  case
   0x1A of 0x6800 <Rt3b2>,[<Rn3b5>,#<imm5b10>]      endof    
   0x2B of 0x4800 <Rt3b10>,[PC,#<imm8b7>]           endof
   0x23 of 0x9800 <Rt3b10>,[SP,#<imm8b7>]           endof   
   0x1C of 0xF8500800 <Rt4b15>,[<Rn4b19>,#+/-<imm8b7>]  endof
   0x1F of 0xF8500800 <Rt4b15>,[<Rn4b19>,#+/-<imm8b7>]! endof 
   0x33 of 0xF8500800 <Rt4b15>,[<Rn4b19>],#+/-<imm8b7>  endof
\   0x1C of 0xF8500800 <Rt4b15>,[<Rn4b19>,#-<imm8b7>]    endof
   0x19 of 0x5C00 <Rt3b2>,[<Rn3b5>,<Rm3b8>]          endof                  
  endcase

  
  ;  
  
  


: LDR	( --- )
	state @ 
	if
   \ _LDR [COMPILE]  .case
  else
   _LDR
  then
  ; IMMEDIATE	 
        
: _LDR.W ( -- )
	arg
  LDR.W_BNF
  case  
   1 of LDR.W_<Rt4b15>,[<Rn4b19>,<Rm4b3>{,LSL#<shift2b5>}>] endof
   2 of LDR.W_<Rt4b15>,[<Rn4b19>,<Rm4b3>] endof  
  
\ "LDR<c>.W <Rt>,[<Rn>,<Rm>{,LSL #<shift>}]"
\ "LDR<c>.W <Rt>,[PC,#+/-<imm12>]"
\ "LDR<c>.W <Rt>,[<Rn>,#<imm12>]"                 
  endcase
 ;    
    
: LDR.W	( --- )
	state @ 
	if
   \ _LDR.W [COMPILE]  .case
  else
   _LDR.W
  then
  ; IMMEDIATE
  
\s  
\ Defintion for branch Instruction
: BRANCH_INST   ( n -- )
  CONSTANT
  DOES>   ( n -- n )
     @
     SHIFT_EXPRESSION# @ SHIFT_REG# @ OR
     REG# @ OR
     SET# @ OR
     PSR_REG# @ OR
     PUBWL_WORD# @ OR
     GROUP# @ OR
     ABORT" Error: Syntax error."
     DUP F0000000 forthAND 10000000 forthAND  \ check if instruction is BRANCH class 1
       IF 01000000 OR
       THEN
     SWAP 8 - HERE-I - DUP 4 MOD              \ adjust offset since effect of prefect operation of PC
     ABORT" Error: Offset isn't 32bits boundary aligned."
     DUP 01FFFFFF > OVER -02000000 < OR
     ABORT" Error: Offset isn't in the rage between (+32M-1) and -32M."
     2 RSHIFT 00FFFFFF forthAND OR
     0FFFFFFF forthAND                    \ clean class field
     CONDITION# @
       IF OR
       ELSE E0000000 OR                   \ default condition code is AL
       THEN
     , CLEAR_ALL#                         \ reset all assembler variable
   ;



\ Branch Instruction class 0

0A000000 BRANCH_INST ,B


\ Branch Instruction class 1
1A000000 BRANCH_INST ,BL