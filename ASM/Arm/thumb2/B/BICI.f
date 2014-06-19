0xFBE08000      constant Mark_BIC<S1b20>_<Rd4b11>,<Rn4b19>,#<imm1b26:imm3b14:imm2b7>
0xF0200000      constant code_BIC<S1b20>_<Rd4b11>,<Rn4b19>,#<imm1b26:imm3b14:imm2b7>

: Op_BIC<S1b20>_<Rd4b11>,<Rn4b19>,#<imm1b26:imm3b14:imm2b7>
  \ case
  \  run  time of  endof 
  \  list time of PC+2->PC  endof
  \ endcase
  ;
       
: $BIC<S1b20>_<Rd4b11>,<Rn4b19>,#<imm1b26:imm3b14:imm2b7> ( -- )   
  s" BIC"             $>指令
  $<S1b20>
  $<Rd4b11>
  s" ,"              $>指令 
  $<Rn4b19>
  s" ,"              $>指令      
  $#<imm3b14:imm2b7>
  s" ,"              $>指令
  $#<Imm5b4> 
  0 指令_flag !   
  Op_BIC_<Rd4b11>,<Rn4b19>,#<imm3b14:imm2b7>,#<Imm5b4>
  ;