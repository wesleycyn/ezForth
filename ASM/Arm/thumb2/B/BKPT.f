0xFF00      constant Mark_BKPT_#<Imm8b7> 
0xBE00      constant code_BKPT_#<Imm8b7>  

: _BKPT ( -- )
  arg
  ?Arg_#<Imm8b7>
  case  
   code_Arg_#<Imm8b7> of code_BKPT_#<Imm8b7> #<Imm8b7> endof                    
  endcase
  ;
      
: BKPT	( -- )
	state @ 
	if
   \ _BKPT [COMPILE]  .case
  else
   _BKPT
  then
  ; IMMEDIATE