0xFBE08000  constant Mark_AND_<Rd4b11>,<Rn4b19>,#<Imm1b26:Imm3b14:Imm8b7>
0xF0000000  constant code_AND_<Rd4b11>,<Rn4b19>,#<Imm1b26:Imm3b14:Imm8b7>  
: $AND_<Rd4b11>,<Rn4b19>,#<Imm1b26:Imm3b14:Imm8b7> ( -- )   
  s" AND" $>指令   
  $<Rd4b11>,<Rn4b19>,#<Imm1b26:Imm3b14:Imm8b7> 
  0 指令_flag ! 
  ;

0xFFC0      constant Mark_AND_<Rdn3b2>,<Rm3b5>                
0x4000      constant code_AND_<Rdn3b2>,<Rm3b5>
: $AND_<Rdn3b2>,<Rm3b5> ( -- )   
  s" AND" $>指令   
  $<Rdn3b2>,<Rm3b5> 
  0 指令_flag ! 
  ; 