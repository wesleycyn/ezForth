: Thumb2_MOV_BNF ( -- )
	arg
  cr
  a1$ count type a1$ ." ::=" Rn?             2dup   ." op1=" . ." Rn=" . cr   
\  .s
  2 *
\  .s
  a2$ count type a2$ ." ::=" Rn/Imm5/8?           2dup   ." op2=" . ." Rn=" . cr
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




: _MOV ( -- )

  Thumb2_MOV_BNF  .s 
  case
   32 of 0x2000 <Rd3b10>,#<imm8b7>  endof
   0x18 of 0x4600 <D1b7Rd3b2>,<Rm4b6> endof               
  endcase

      s"  MOV" type   dup u. cr
  
  ;  
  
  


: MOV	( --- )
	state @ 
	if
   \ _MOV [COMPILE]  .case
  else
   _MOV  w,
  then
  ; IMMEDIATE	 
        
        
: Thumb2_MOV.W_BNF ( -- )
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




: _MOV.W ( -- )

  Thumb2_MOV.W_BNF  .s 
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

      s"  MOV.W" type   dup u. cr
  
  ;  
  
  


: MOV.W	( --- )
	state @ 
	if
   \ _MOV.w [COMPILE]  .case
  else
   _MOV.W
  then
  ; IMMEDIATE	         
