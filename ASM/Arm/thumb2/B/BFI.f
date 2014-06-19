0xFFF08020      constant Mark_BFI_<Rd4b11>,<Rn4b19>,#<imm3b14:imm2b7>,#<Imm5b4>
0xF3600000      constant code_BFI_<Rd4b11>,<Rn4b19>,#<imm3b14:imm2b7>,#<Imm5b4>

: _BFI ( -- )
  arg
  ?Arg_<Rd4b11>,<Rn4b19>,#<imm3b14:imm2b7>,#<Imm5b4>
  case
   code_Arg_<Rd4b11>,<Rn4b19>,#<imm3b14:imm2b7>,#<Imm5b4> of code_BFI_<Rd4b11>,<Rn4b19>,#<imm3b14:imm2b7>,#<Imm5b4> <Rd4b11>,<Rn4b19>,#<imm3b14:imm2b7>,#<Imm5b4> endof                     
  endcase
;
      
: BFI	( --- )
	state @ 
	if
   \ _BFI [COMPILE]  .case
  else
   _BFI
  then
  ; IMMEDIATE