: Thumb2_XOR_BNF ( -- )
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
  
: _XOR ( -- )
  Thumb2_XOR_BNF     
  case
   op_<Rd4b11>,<Rn4b19>,#<i1b26+imm8b7>                  of 0xF0800000     <Rd4b11>,<Rn4b19>,#<i1b26+imm8b7> endof
   op_<Rdn3b2>,<Rm3b5>                                   of 0x4040         <Rdn3b2>,<Rm3b5>                  endof
  endcase  
  ;

: Thumb2_XORS_BNF ( -- )
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

: _XORS ( -- )
  Thumb2_XORS_BNF   
  case  
   op_<Rd4b11>,<Rn4b19>,#<i1b26+imm8b7>                  of 0xF0900000    <Rd4b11>,<Rn4b19>,#<i1b26+imm8b7>  endof
   op_<Rdn3b2>,<Rm3b5>                                   of 0x4040        <Rdn3b2>,<Rm3b5>                   endof
  endcase  
  ;

: Thumb2_XOR.W_BNF ( -- )
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

: _XOR.W ( -- )
  Thumb2_XOR.W_BNF   
  case 
   op_<Rd4b11>,<Rn4b19>,<Rm4b3>                          of 0xEA800000   <Rd4b11>,<Rn4b19>,<Rm4b3>                           endof   
   op_<Rd4b11>,<Rn4b19>,<Rm4b3>{,type2b5_imm3b14+imm2b7} of 0xEA800000   <Rd4b11>,<Rn4b19>,<Rm4b3>{,type2b5_imm3b14+imm2b7}  endof
  endcase  
  ;



: Thumb2_XORS.W_BNF ( -- )
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

  
: _XORS.W ( -- )
  Thumb2_XORS.W_BNF
  case  
   op_<Rd4b11>,<Rn4b19>,<Rm4b3>{,type2b5_imm3b14+imm2b7} of 0xEA900000  <Rd4b11>,<Rn4b19>,<Rm4b3>{,type2b5_imm3b14+imm2b7} endof 
  endcase  
  ;
  
: XOR	( --- )
	state @ 
	if
   \ _XOR [COMPILE]  .case
  else
   _XOR
  then
  ; IMMEDIATE

 : XORS	( --- )
	state @ 
	if
   \ _XORS [COMPILE]  .case
  else
   _XORS
  then
  ; IMMEDIATE
  
: XOR.W	( --- )
	state @ 
	if
   \ _XOR.W [COMPILE]  .case
  else
   _XOR.W
  then
  ; IMMEDIATE  

: XORS.W	( --- )
	state @ 
	if
   \ _XORS.W [COMPILE]  .case
  else
   _XORS.W
  then
  ; IMMEDIATE
  
 