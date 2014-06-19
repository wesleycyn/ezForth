

0000 CONSTANT op_<Rd4b11>,<Rn4b19>,<Rm4b3>{,type2b5_imm3b14+imm2b7}


: Thumb2_AND_BNF ( -- )
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
  
: _AND ( -- )
  Thumb2_AND_BNF     
  case
   op_<Rd4b11>,<Rn4b19>,#<i1b26+imm8b7>                  of 0xF0000000 <Rd4b11>,<Rn4b19>,#<i1b26+imm8b7> endof
   op_<Rdn3b2>,<Rm3b5>                                   of 0x4000     <Rdn3b2>,<Rm3b5>                  endof
  endcase  
  ;

: AND	( --- )
	state @ 
	if
   \ _AND [COMPILE]  .case
  else
   _AND
  then
  ; IMMEDIATE
  
  


: Thumb2_ANDS_BNF ( -- )
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

: _ANDS ( -- )
  Thumb2_ANDS_BNF   
  case  
   op_<Rd4b11>,<Rn4b19>,#<i1b26+imm8b7>                  of 0xF0100000 <Rd4b11>,<Rn4b19>,#<i1b26+imm8b7> endof 
   op_<Rdn3b2>,<Rm3b5>                                   of 0x4000     <Rdn3b2>,<Rm3b5>                  endof
  endcase  
  ;




: Thumb2_AND.W_BNF ( -- )
	arg
  cr
  a1$ count type a1$ ." ::=" Rn?          \ 2dup   ." op1=" . ." Rn=" . cr   
\  .s
  2 *
\  .s
  a2$ count type a2$ ." ::=" Rn?          \ 2dup   ." op2=" . ." Rn=" . cr
  rot + 
\  .s
  8 *
\  .s
  a3$ count type a3$ ." ::=" Rn?          \  2dup   ." op3=" . ." Num=" . cr 
  rot +
  \ . . . .
  \ a4$ count type cr
  cr
;



: _AND.W ( -- )
  Thumb2_AND.W_BNF  .s
  case
   op_<Rd4b11>,<Rn4b19>,<Rm4b3>                           of 0xEA000000 <Rd4b11>,<Rn4b19>,<Rm4b3> endof    
   op_<Rd4b11>,<Rn4b19>,<Rm4b3>{,type2b5_imm3b14+imm2b7}  of 0xEA000000 <Rd4b11>,<Rn4b19>,<Rm4b3>{,type2b5_imm3b14+imm2b7} endof
  endcase 
  
  s"  AND.W" type   dup u. cr
  ;


 
: Thumb2_ANDS.W_BNF ( -- )
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

  
: _ANDS.W ( -- )
  Thumb2_ANDS.W_BNF
  case  
\   op_<Rd4b11>,<Rn4b19>,<Rm4b3>{,type2b5_imm3b14+imm2b7} of 0xEA100000 <Rd4b11>,<Rn4b19>,<Rm4b3>{,type2b5_imm3b14+imm2b7} endof
  endcase  
  ;
  


 : ANDS	( --- )
	state @ 
	if
   \ _ANDS [COMPILE]  .case
  else
   _ANDS
  then
  ; IMMEDIATE
  
: AND.W	( --- )
	state @ 
	if
   \ _AND.W [COMPILE]  .case
  else
   _AND.W
  then
  ; IMMEDIATE  

: ANDS.W	( --- )
	state @ 
	if
   \ _ANDS.W [COMPILE]  .case
  else
   _ANDS.W
  then
  ; IMMEDIATE
  
  
