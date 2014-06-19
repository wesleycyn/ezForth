0xFBE08000      constant Mark_BIC<S1b20>_<Rd4b11>,<Rn4b19>,#<imm1b26:imm3b14:imm2b7>
0xF0200000      constant code_BIC<S1b20>_<Rd4b11>,<Rn4b19>,#<imm1b26:imm3b14:imm2b7>
0xF0300000      constant code_BICS_<Rd4b11>,<Rn4b19>,#<imm1b26:imm3b14:imm2b7>
0xF0200000      constant code_BIC_<Rd4b11>,<Rn4b19>,#<imm1b26:imm3b14:imm2b7>
0xFFC0      constant Mark_BIC_<Rdn3b2>,<Rm3b5>
0x4380      constant code_BIC_<Rdn3b2>,<Rm34b5>

: _BICS ( -- )
  arg
  ?Arg_BIC_<Rdn3b2>,<Rm3b5>|<Rd4b11>,<Rn4b19>,#<imm1b26:imm3b14:imm2b7>
  case
\   code_Arg_<Rdn3b2>,<Rm3b5> of code_BIC_<Rdn3b2>,<Rm3b5> <Rdn3b2>,<Rm3b5> endof   
   code_Arg_<Rd4b11>,<Rn4b19>,#<imm1b26:imm3b14:imm2b7> of code_BICS_<Rd4b11>,<Rn4b19>,#<imm1b26:imm3b14:imm2b7> <Rd4b11>,<Rn4b19>,#<imm1b26:imm3b14:imm2b7> endof                    
  endcase
;

: _BIC ( -- )
  arg
  ?Arg_BIC_<Rdn3b2>,<Rm3b5>|<Rd4b11>,<Rn4b19>,#<imm1b26:imm3b14:imm2b7>
  case
   code_Arg_<Rdn3b2>,<Rm3b5> of code_BIC_<Rdn3b2>,<Rm3b5> <Rdn3b2>,<Rm3b5> endof   
   code_Arg_<Rd4b11>,<Rn4b19>,#<imm1b26:imm3b14:imm2b7> of code_BIC_<Rd4b11>,<Rn4b19>,#<imm1b26:imm3b14:imm2b7> <Rd4b11>,<Rn4b19>,#<imm1b26:imm3b14:imm2b7> endof                    
  endcase
;
      
: BIC	( --- )
	state @ 
	if
   \ _BIC [COMPILE]  .case
  else
   _BIC
  then
  ; IMMEDIATE
  
  
: BICS	( --- )
	state @ 
	if
   \ _BICS [COMPILE]  .case
  else
   _BICS
  then
  ; IMMEDIATE  