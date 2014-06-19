0xF800D000      constant Mark_BLX_<S1b26:I1b13:i2b11:Imm10b25:Imm11b10:00>
0xF000D000      constant code_BLX_<S1b26:I1b13:i2b11:Imm10b25:Imm11b10:00>  

: _BXJ ( -- )
  arg
  Arg_#<S1b26:I1b13:i2b11:Imm10b25:Imm11b10:00>?     
  case
   code_Arg_#<S1b26:I1b13:i2b11:Imm10b25:Imm11b10:00> of code_BXJ_<S1b26:I1b13:i2b11:Imm10b25:Imm11b10:00> <S1b26:I1b13:i2b11:Imm10b25:Imm11b10:00> endof                    
  endcase
;
      
: BLX	( --- )
	state @ 
	if
   \ _BLX [COMPILE]  .case
  else
   _BLX
  then
  ; IMMEDIATE  