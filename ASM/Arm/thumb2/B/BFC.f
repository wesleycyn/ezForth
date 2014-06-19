0xFFFF8020      constant Mark_BFC_<Rd4b11>,#<imm3b14:imm2b7>,#<Imm5b4>
0xF36F0000      constant code_BFC_<Rd4b11>,#<imm3b14:imm2b7>,#<Imm5b4>

: _BFC ( -- )
  arg
  ?Arg_<Rd4b11>,#<imm3b14:imm2b7>,#<Imm5b4>
  case
   code_Arg_<Rd4b11>,#<imm3b14:imm2b7>,#<Imm5b4> of code_BFC_<Rd4b11>,#<imm3b14:imm2b7>,#<Imm5b4> <Rd4b11>,#<imm3b14:imm2b7>,#<Imm5b4> endof                      
  endcase
;
      
: BFC	( --- )
	state @ 
	if
   \ _BFC [COMPILE]  .case
  else
   _BFC
  then
  ; IMMEDIATE