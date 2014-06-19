0000 CONSTANT op_<Rd3b2>,<Rn3b5>,#<imm3b8> 
0000 CONSTANT op_<Rdn3b10>,#<imm8b7>       
0000 CONSTANT op_<Rd3b2>,<Rn3b5>,<Rm3b8>   
0000 CONSTANT op_<Rdn3b2>,<Rm3b6>          
0000 CONSTANT op_<Rd3b10>,SP,#<Imm8b7>     
0000 CONSTANT op_SP,SP,#<Imm7b6>           
0000 CONSTANT op_<Rdm3b2>,SP,<Rdm3b2>      
0000 CONSTANT op_SP,<Rm4b6>                
\ 0000 CONSTANT op_<Rd3b2>,<Rn3b5>,#<imm3b8>
\ 0000 CONSTANT op_<Rdn3b10>,#<imm8b7>      
\ 0000 CONSTANT op_<Rd3b2>,<Rn3b5>,<Rm3b8>  
0000 CONSTANT op_<Rd4b11>,<Rn4b19>,#<Imm1b26+Imm3b14+Imm8b7>                            
0000 CONSTANT op_<Rd4b11>,<Rn4b19>,<Rm4b3>{,type2b5_#imm3b14+imm2b7}
0000 CONSTANT op_<Rd4b11>,SP,#<Imm1b26+Imm3b14+Imm8b7>              
0000 CONSTANT op_<Rd4b11>,SP,<Rm4b3>{,type2b5_#imm3b14+imm2b7}      
\ 0000 CONSTANT op_<Rd4b11>,<Rn4b19>,#<Imm1b26+Imm3b14+Imm8b7>
\ 0000 CONSTANT op_<Rd4b11>,SP,#<Imm1b26+Imm3b14+Imm8b7>      





: Thumb2_ADD_BNF ( -- )
	arg
  cr
  a1$ count type a1$ ." ::=" Rn?           \ 2dup   ." op1=" . ." Rn=" . cr   
\  .s
  2 *
\  .s
  a2$ count type a2$ ." ::=" Rn/Imm8?      \ 2dup   ." op2=" . ." Rn/Imm=" . cr
  rot + 
\  .s
  8 *
\  .s
  a3$ count type a3$ ." ::=" Rn/Imm8/7?   \ 2dup   ." op3=" . ." Num=" . cr 
  rot +
  \ . . . .
  \ a4$ count type cr
  cr
  ;

: _ADD ( -- )
  Thumb2_ADD_BNF
  case  
   op_<Rd3b2>,<Rn3b5>,#<imm3b8> of 0x1C00 <Rd3b2>,<Rn3b5>,#<imm3b8> endof
   op_<Rdn3b10>,#<imm8b7>       of 0x3000 <Rdn3b10>,#<imm8b7>       endof
   op_<Rd3b2>,<Rn3b5>,<Rm3b8>   of 0x1800 <Rd3b2>,<Rn3b5>,<Rm3b8>   endof
   op_<Rdn3b2>,<Rm3b6>          of 0x4400 <Rdn3b2>,<Rm3b6>          endof \ DN1b7
   op_<Rd3b10>,SP,#<Imm8b7>     of 0xA800 <Rd3b10>,SP,#<Imm8b7>     endof
   op_SP,SP,#<Imm7b6>           of 0xB000 SP,SP,#<Imm7b6>           endof
   op_<Rdm3b2>,SP,<Rdm3b2>      of 0x4468 <Rdm3b2>,SP,<Rdm3b2>      endof \ DM1b7
   op_SP,<Rm4b6>                of 0x4485 SP,<Rm4b6>                endof
  endcase
  ;

: ADD	( --- )
	state @ 
	if
   \ _ADD [COMPILE]  .case
  else
   _ADD
  then
  ; IMMEDIATE



: Thumb2_ADDS_BNF ( -- )
	arg
  cr
  a1$ count type a1$ ." ::=" Rn?           \ 2dup   ." op1=" . ." Rn=" . cr   
\  .s
  2 *
\  .s
  a2$ count type a2$ ." ::=" Rn/Imm7?      \ 2dup   ." op2=" . ." Rn/Imm=" . cr
  rot + 
\  .s
  8 *
\  .s
  a3$ count type a3$ ." ::=" Rn/Imm8/7?   \ 2dup   ." op3=" . ." Num=" . cr 
  rot +
  \ . . . .
  \ a4$ count type cr
  cr
;

: _ADDS ( -- )
  Thumb2_ADDS_BNF
  case  
   op_<Rd3b2>,<Rn3b5>,#<imm3b8> of 0x1C00 <Rd3b2>,<Rn3b5>,#<imm3b8> endof
   op_<Rdn3b10>,#<imm8b7>       of 0x3000 <Rdn3b10>,#<imm8b7>       endof
   op_<Rd3b2>,<Rn3b5>,<Rm3b8>   of 0x1800 <Rd3b2>,<Rn3b5>,<Rm3b8>   endof
  endcase
 ;

: ADDS	( --- )
	state @ 
	if
   \ _ADDS [COMPILE]  .case
  else
   _ADDS
  then
  ; IMMEDIATE


: Thumb2_ADD.W_BNF ( -- )
	arg
  cr
  a1$ count type a1$ ." ::=" Rn?           \ 2dup   ." op1=" . ." Rn=" . cr   
\  .s
  2 *
\  .s
  a2$ count type a2$ ." ::=" Rn?      \ 2dup   ." op2=" . ." Rn/Imm=" . cr
  rot + 
\  .s
  8 *
\  .s
  a3$ count type a3$ ." ::=" Rn/Imm12?   \ 2dup   ." op3=" . ." Num=" . cr 
  rot +
  \ . . . .
  a4$ count type a3$ ." ::=" Rn/Imm12/type2imm5?   \ 2dup   ." op4=" . ." Num=" . cr 
  cr
;


: _ADD.W ( -- )
  Thumb2_ADD.W_BNF
  case 
   op_<Rd4b11>,<Rn4b19>,#<Imm1b26+Imm3b14+Imm8b7>         of 0xF1000000 <Rd4b11>,<Rn4b19>,#<Imm1b26+Imm3b14+Imm8b7>         endof \ S1b20=0"
   op_<Rd4b11>,<Rn4b19>,<Rm4b3>{,type2b5_#imm3b14+imm2b7} of 0xEB000000 <Rd4b11>,<Rn4b19>,<Rm4b3>{,type2b5_#imm3b14+imm2b7} endof \ S1b20=0"
   op_<Rd4b11>,SP,#<Imm1b26+Imm3b14+Imm8b7>               of 0xF010D000 <Rd4b11>,SP,#<Imm1b26+Imm3b14+Imm8b7>               endof \ S1b20=0"
   op_<Rd4b11>,SP,<Rm4b3>{,type2b5_#imm3b14+imm2b7}       of 0xEB0D0000 <Rd4b11>,SP,<Rm4b3>{,type2b5_#imm3b14+imm2b7}       endof \ S1b20=0"
  endcase
 ;
 
: ADD.W	( --- )
	state @ 
	if
   \ _ADD.W [COMPILE]  .case
  else
   _ADD.W
  then
  ; IMMEDIATE 
 
: Thumb2_ADDS.W_BNF ( -- ) 
  Thumb2_ADD.W_BNF ( -- ) 
  ;
  
: _ADDS.W ( -- )
  Thumb2_ADDS.W_BNF
  case  
   op_<Rd4b11>,<Rn4b19>,<Rm4b3>{,type2b5_#imm3b14+imm2b7} of 0xEB100000 <Rd4b11>,<Rn4b19>,<Rm4b3>{,type2b5_#imm3b14+imm2b7} endof \ S1b20=1"
   op_<Rd4b11>,<Rn4b19>,#<Imm1b26+Imm3b14+Imm8b7>         of 0xF1100000 <Rd4b11>,<Rn4b19>,#<Imm1b26+Imm3b14+Imm8b7>         endof \ S1b20=1 
   op_<Rd4b11>,SP,#<Imm1b26+Imm3b14+Imm8b7>               of 0xF11D0000 <Rd4b11>,SP,#<Imm1b26+Imm3b14+Imm8b7>               endof \ S1b20=1
   op_<Rd4b11>,SP,<Rm4b3>{,type2b5_#imm3b14+imm2b7}       of 0xEB1D0000 <Rd4b11>,SP,<Rm4b3>{,type2b5_#imm3b14+imm2b7}       endof \ S1b20=1
  endcase
  ;
  
: ADDS.W	( --- )
	state @ 
	if
   \ _ADD.W [COMPILE]  .case
  else
   _ADDS.W
  then
  ; IMMEDIATE   
  
  
  
  
: Thumb2_ADDW_BNF ( -- )
	arg
  cr
  a1$ count type a1$ ." ::=" Rn?           \ 2dup   ." op1=" . ." Rn=" . cr   
\  .s
  2 *
\  .s
  a2$ count type a2$ ." ::=" Rn?      \ 2dup   ." op2=" . ." Rn/Imm=" . cr
  rot + 
\  .s
  8 *
\  .s
  a3$ count type a3$ ." ::=" Rn/Imm12?   \ 2dup   ." op3=" . ." Num=" . cr 
  rot +
  \ . . . .
  \ a4$ count type cr
  cr
;  
  
  
: _ADDW ( -- )
  Thumb2_ADDW_BNF
  case    
   op_<Rd4b11>,<Rn4b19>,#<Imm1b26+Imm3b14+Imm8b7> of 0xF2000000 <Rd4b11>,<Rn4b19>,#<Imm1b26+Imm3b14+Imm8b7> endof
   op_<Rd4b11>,SP,#<Imm1b26+Imm3b14+Imm8b7>       of 0xF20D0000 <Rd4b11>,SP,#<Imm1b26+Imm3b14+Imm8b7>       endof
  endcase
  ;

: ADDW	( --- )
	state @ 
	if
   \ _ADDW [COMPILE]  .case
  else
   _ADDW
  then
  ; IMMEDIATE 
	 
        

    

  
