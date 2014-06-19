: Thumb2_ORR_BNF ( -- )
	arg
  cr
  a1$ count type a1$ ." ::=" Rn?             2dup   ." op1=" . ." Rn=" . cr   
\  .s
  2 *
\  .s
  a2$ count type a2$ ." ::=" Rn?           2dup   ." op2=" . ." Rn=" . cr
  rot + 
\  .s
  8 *
\  .s
  a3$ count type a3$ ." ::=" Rn/Imm5/8]!?    2dup   ." op3=" . ." Num=" . cr 
  rot +
  \ . . . .
  \ a4$ count type cr
  cr
;
  
: _ORR ( -- )
  Thumb2_ORR_BNF  .s   
  case
   op_<Rd4b11>,<Rn4b19>,#<i1b26+imm8b7>                  of 0xF0400000 <Rd4b11>,<Rn4b19>,#<i1b26+imm8b7> endof
   op_<Rdn3b2>,<Rm3b5>                                   of 0x4300     <Rdn3b2>,<Rm3b5> endof
  endcase
  
    s"  ORR" type   dup u. cr 
  ;

: Thumb2_ORRS_BNF ( -- )
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

: _ORRS ( -- )
  Thumb2_ORRS_BNF   
  case  
   op_<Rd4b11>,<Rn4b19>,#<i1b26+imm8b7>                  of 0xF0500000    <Rd4b11>,<Rn4b19>,#<i1b26+imm8b7> endof 
   op_<Rdn3b2>,<Rm3b5>                                   of 0x4300        <Rdn3b2>,<Rm3b5> endof
  endcase  
  ;

: Thumb2_ORR.W_BNF ( -- )
	arg
  cr
  a1$ count type a1$ ." ::=" Rn?             2dup   ." op1=" . ." Rn=" . cr   
\  .s
  2 *
\  .s
  a2$ count type a2$ ." ::=" Rn?           2dup   ." op2=" . ." Rn=" . cr
  rot + 
\  .s
  8 *
\  .s
  a3$ count type a3$ ." ::=" Rn?    2dup   ." op3=" . ." Num=" . cr 
  rot +
  \ . . . .
  \ a4$ count type cr
  cr
;

: _ORR.W ( -- )
  Thumb2_ORR.W_BNF   .s
  case  
   op_<Rd4b11>,<Rn4b19>,<Rm4b3>                          of 0xEA400000   <Rd4b11>,<Rn4b19>,<Rm4b3>                          endof  
   op_<Rd4b11>,<Rn4b19>,<Rm4b3>{,type2b5_imm3b14+imm2b7} of 0xEA400000   <Rd4b11>,<Rn4b19>,<Rm4b3>{,type2b5_imm3b14+imm2b7} endof
  endcase  
  
    s"  ORR" type   dup u. cr   
  ;



: Thumb2_ORRS.W_BNF ( -- )
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

  
: _ORRS.W ( -- )
  Thumb2_ORRS.W_BNF
  case  
   op_<Rd4b11>,<Rn4b19>,<Rm4b3>{,type2b5_imm3b14+imm2b7} of 0xEA500000  <Rd4b11>,<Rn4b19>,<Rm4b3>{,type2b5_imm3b14+imm2b7} endof
  endcase  
  ;
  
: ORR	( --- )
	state @ 
	if
   \ _ORR [COMPILE]  .case
  else
   _ORR
  then
  ; IMMEDIATE

 : ORRS	( --- )
	state @ 
	if
   \ _ORRS [COMPILE]  .case
  else
   _ORRS
  then
  ; IMMEDIATE
  
: ORR.W	( --- )
	state @ 
	if
   \ _ORR.W [COMPILE]  .case
  else
   _ORR.W
  then
  ; IMMEDIATE  

: ORRS.W	( --- )
	state @ 
	if
   \ _ORRS.W [COMPILE]  .case
  else
   _ORRS.W
  then
  ; IMMEDIATE
  
  
