0xFFE08000      constant Mark_BIC<S1b20>.W_<Rd4b11>,<Rn4b19>,<Rm4b3>,<shift2b5>_#<imm3b14:imm2b7>
0xEA200000      constant code_BIC<S1b20>.W_<Rd4b11>,<Rn4b19>,<Rm4b3>,<shift2b5>_#<imm3b14:imm2b7>
0xEA300000      constant code_BICS.W_<Rd4b11>,<Rn4b19>,<Rm4b3>,<shift2b5>_#<imm3b14:imm2b7>
0xEA200000      constant code_BIC.W_<Rd4b11>,<Rn4b19>,<Rm4b3>,<shift2b5>_#<imm3b14:imm2b7>

: _BICS.W ( -- )
  arg
  ?Arg_<Rd4b11>,<Rn4b19>,<Rm4b3>,<shift2b5>_#<imm3b14:imm2b7>
  case  
   code_Arg_<Rd4b11>,<Rn4b19>,<Rm4b3>,<shift2b5>_#<imm3b14:imm2b7> of BICS.W_<Rd4b11>,<Rn4b19>,<Rm4b3>,<shift2b5>_#<imm3b14:imm2b7> <Rd4b11>,<Rn4b19>,<Rm4b3>,<shift2b5>_#<imm3b14:imm2b7> endof                    
  endcase
  ;
      
: _BIC.W ( -- )
  arg
  ?Arg_<Rd4b11>,<Rn4b19>,<Rm4b3>,<shift2b5>_#<imm3b14:imm2b7>
  case  
   code_Arg_<Rd4b11>,<Rn4b19>,<Rm4b3>,<shift2b5>_#<imm3b14:imm2b7> of BIC.W_<Rd4b11>,<Rn4b19>,<Rm4b3>,<shift2b5>_#<imm3b14:imm2b7> <Rd4b11>,<Rn4b19>,<Rm4b3>,<shift2b5>_#<imm3b14:imm2b7> endof                    
  endcase
  ;      
      
: BICS.W	( -- )
	state @ 
	if
   \ _BIC.W [COMPILE]  .case
  else
   _BICS.W
  then
  ; IMMEDIATE      
      
      
: BIC.W	( -- )
	state @ 
	if
   \ _BIC.W [COMPILE]  .case
  else
   _BIC.W
  then
  ; IMMEDIATE  