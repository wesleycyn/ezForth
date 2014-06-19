

0000 CONSTANT op_<Rd4b11>,<Rn4b19>,<Rm4b3>{,type2b5_imm3b14+imm2b7}


: Thumb2_ADC_BNF ( -- )
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
  
: _ADC ( -- )
  Thumb2_ADC_BNF .s    
  case
   op_<Rd4b11>,<Rn4b19>,#<i1b26+imm8b7>                  of 0xF1400000 <Rd4b11>,<Rn4b19>,#<i1b26+imm8b7> endof
   op_<Rdn3b2>,<Rm3b5>                                   of 0x4140     <Rdn3b2>,<Rm3b5>                  endof
  endcase 
  
    s"  ADC" type   dup u. cr 
  ;

: ADC	( --- )
	state @ 
	if
   \ _ADC [COMPILE]  .case
  else
   _ADC
  then
  ; IMMEDIATE
  
  


: Thumb2_ADCS_BNF ( -- )
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

: _ADCS ( -- )
  Thumb2_ADCS_BNF   
  case  
   op_<Rd4b11>,<Rn4b19>,#<i1b26+imm8b7>                  of 0xF1500000 <Rd4b11>,<Rn4b19>,#<i1b26+imm8b7> endof 
   op_<Rdn3b2>,<Rm3b5>                                   of 0x4150     <Rdn3b2>,<Rm3b5>                  endof
  endcase  
  ;




: Thumb2_ADC.W_BNF ( -- )
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



: _ADC.W ( -- )
  Thumb2_ADC.W_BNF  .s
  case
   op_<Rd4b11>,<Rn4b19>,<Rm4b3>                           of 0xEB400000 <Rd4b11>,<Rn4b19>,<Rm4b3> endof    
   op_<Rd4b11>,<Rn4b19>,<Rm4b3>{,type2b5_imm3b14+imm2b7}  of 0xEB400000 <Rd4b11>,<Rn4b19>,<Rm4b3>{,type2b5_imm3b14+imm2b7} endof
  endcase 
  
  s"  ADC.W" type   dup u. cr
  ;


 
: Thumb2_ADCS.W_BNF ( -- )
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

  
: _ADCS.W ( -- )
  Thumb2_ADCS.W_BNF
  case  
\   op_<Rd4b11>,<Rn4b19>,<Rm4b3>{,type2b5_imm3b14+imm2b7} of 0xEB500000 <Rd4b11>,<Rn4b19>,<Rm4b3>{,type2b5_imm3b14+imm2b7} endof
  endcase  
  ;
  


 : ADCS	( --- )
	state @ 
	if
   \ _ADCS [COMPILE]  .case
  else
   _ADCS
  then
  ; IMMEDIATE
  
: ADC.W	( --- )
	state @ 
	if
   \ _ADC.W [COMPILE]  .case
  else
   _ADC.W
  then
  ; IMMEDIATE  

: ADCS.W	( --- )
	state @ 
	if
   \ _ADCS.W [COMPILE]  .case
  else
   _ADCS.W
  then
  ; IMMEDIATE
  
    
