0xFFF0FFFF constant Mark_BXJ_<Rm4b19>
0xF3C08F00 constant code_BXJ_<Rm4b19> 
    

: _BXJ ( -- )

	arg
  ?Arg_<Rm4b19>  
  case
   code_Arg_<Rm4b19> of code_BXJ_<Rm4b19> <Rm4b19>      endof                    
  endcase

;
      
: BXJ	( --- )
	state @ 
	if
   \ _BXJ [COMPILE]  .case
  else
   _BXJ
  then
  ; IMMEDIATE	

      
