0xF800D000      constant Mark_BL_#<S1b26:I1b13:i2b11:Imm10b25:Imm11b10:0>
0xF000D000      constant code_BL_#<S1b26:I1b13:i2b11:Imm10b25:Imm11b10:0>  
   
: _BL ( -- )
  arg
  ?Arg_#<S1b26:I1b13:i2b11:Imm10b25:Imm11b10:0>
  case  
   code_Arg_#<S1b26:I1b13:i2b11:Imm10b25:Imm11b10:0> of code_BL_#<S1b26:I1b13:i2b11:Imm10b25:Imm11b10:0> #<S1b26:I1b13:i2b11:Imm10b25:Imm11b10:0> endof                    
  endcase
  ;
      
: BL	( -- )
	state @ 
	if
   \ _BL [COMPILE]  .case
  else
   _BL
  then
  ; IMMEDIATE