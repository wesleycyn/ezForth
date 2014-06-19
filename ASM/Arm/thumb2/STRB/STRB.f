: Thumb2_STRB_BNF ( -- )
	arg
  cr
  a1$ count type a1$ ." ::=" Rn?             2dup   ." op1=" . ." Rn=" . cr   
\  .s
  2 *
\  .s
  a2$ count type a2$ ." ::=" [Rn]?           2dup   ." op2=" . ." Rn=" . cr
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

 
: _STRB ( -- )
  Thumb2_STRB_BNF   .s
  case   
   0x1A of 0x6000 <Rt3b2>,[<Rn3b5>,#<imm5b10>]   endof  
\   0x2B of STRB_<Rt3b10>,[PC,#<imm8b7>]           endof
   0x23 of 0x9000 <Rt3b10>,[SP,#<imm8b7>]        endof   
   0x1C of 0xF8400000 <Rt4b15>,[<Rn4b19>,#+/-<imm8b7>]  endof
   0x1F of 0xF8400000 <Rt4b15>,[<Rn4b19>,#+/-<imm8b7>]! endof 
   0x33 of 0xF8400000 <Rt4b15>,[<Rn4b19>],#+/-<imm8b7>  endof
   48   of 0xF8400000 <Rt4b15>,[<Rn4b19>]               endof   
\   0x1C of 0xF8400000 <Rt4b15>,[<Rn4b19>,#-<imm8b7>]    endof
   0x19 of 0x500 <Rt3b2>,[<Rn3b5>,<Rm3b8>]          endof                  
  endcase
  
    s"  STRB" type   dup u. cr
  ;

: STRB	( -- )
	state @ 
	if
   \ _STRB [COMPILE]  .case
  else
   _STRB
  then
  ; IMMEDIATE	



  