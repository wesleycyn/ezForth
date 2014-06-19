: LDRB_<Rt3b2>,[<Rn3b5>,<Rm3b8>]
  n3b8 
  swap n3b5 or
  swap n3b8 or  
  0x5C00 or
  AsmCode2! 
  ;
   
: LDRB.W_<Rt>,[<Rn>,#<imm12>]
  0xF8D00000
  A1$ count $>reg   n4b15 or
  A3$ count $>reg   n4b19 or    
  A4$ count $>imm8  n12b11 or   
  AsmCode2!  
 ;

: LDRB.W_<Rt>,[PC,#+/-<imm12>] ( -- )
  0xF8BF0000
  A1$ count $>reg ( dup rt ! )  n4b15 or \ a$1---> Rt43b15
  A3$ count $>U      
  A4$ count $>imm12             n12b11 or \ a$4---> Rn4b19  
  AsmCode2!   
  ;

: LDRB.W_<Rt4b15>,[<Rn4b19>,<Rm4b3>{,LSL#<shift2b5>}>] ( -- )
  0xF0600000
  A1$ count $>reg ( dup rt ! ) n4b15 or \ a$1---> Rt43b15
  A2$ count $>reg ( dup rn ! ) n4b19 or \ a$2---> Rn4b19
  A3$ count $>reg ( dup rm ! ) n4b3  or \ a$3---> Rm4b3
  A4$ count $>shift            n2b5  or \ a$4---> s2b5       
  AsmCode4!
  ;
 
: LDRB.W_<Rt4b15>,[<Rn4b19>,<Rm4b3>] ( -- )
  0xF0600000
  A1$ count $>reg ( dup rt ! ) n4b15 or \ a$1---> Rt43b15
  A2$ count $>reg ( dup rn ! ) n4b19 or \ a$2---> Rn4b19
  A3$ count $>reg ( dup rm ! ) n4b3  or \ a$3---> Rm4b3
\  A4$ count $>shift  ( 0 )    n2b5  or \ a$4---> s2b5       
  AsmCode4!
  ; 
 
: LDRB_BNF ( -- )

  ;

: LDRB.W_BNF ( -- )
  ;

: Thumb2_LDRB_BNF ( -- )
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


: _LDRB ( -- )

  Thumb2_LDRB_BNF    .s
  case
   0x1A of 0x6800 <Rt3b2>,[<Rn3b5>,#<imm5b10>]      endof    
   0x2B of 0x4800 <Rt3b10>,[PC,#<imm8b7>]           endof
   0x23 of 0x9800 <Rt3b10>,[SP,#<imm8b7>]           endof   
   0x1C of 0xF8500800 <Rt4b15>,[<Rn4b19>,#+/-<imm8b7>]  endof
   0x1F of 0xF8500800 <Rt4b15>,[<Rn4b19>,#+/-<imm8b7>]! endof 
   
   0x33 of 0xF8500800 <Rt4b15>,[<Rn4b19>],#+/-<imm8b7>  endof
   48   of 0xF8500800 <Rt4b15>,[<Rn4b19>]               endof
   
\   0x1C of 0xF8500800 <Rt4b15>,[<Rn4b19>,#-<imm8b7>]    endof
   0x19 of 0x5C00 <Rt3b2>,[<Rn3b5>,<Rm3b8>]          endof                  
  endcase

  s"  LDRB" type   dup u. cr  
  ;  
  
  


: LDRB	( --- )
	state @ 
	if
   \ _LDRB [COMPILE]  .case
  else
   _LDRB
  then
  ; IMMEDIATE	 
        
: _LDRB.W ( -- )
	arg
  LDRB.W_BNF
  case  
   1 of LDRB.W_<Rt4b15>,[<Rn4b19>,<Rm4b3>{,LSL#<shift2b5>}>] endof
   2 of LDRB.W_<Rt4b15>,[<Rn4b19>,<Rm4b3>] endof  
  
\ "LDRB<c>.W <Rt>,[<Rn>,<Rm>{,LSL #<shift>}]"
\ "LDRB<c>.W <Rt>,[PC,#+/-<imm12>]"
\ "LDRB<c>.W <Rt>,[<Rn>,#<imm12>]"                 
  endcase
 ;    
    
: LDRB.W	( --- )
	state @ 
	if
   \ _LDRB.W [COMPILE]  .case
  else
   _LDRB.W
  then
  ; IMMEDIATE
  
  
