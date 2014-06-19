0xFBE08000  constant Mark_XOR_<Rd4b11>,<Rn4b19>,#<Imm1b26:Imm3b14:Imm8b7>
0xF0800000  constant code_XOR_<Rd4b11>,<Rn4b19>,#<Imm1b26:Imm3b14:Imm8b7>  
: $XOR_<Rd4b11>,<Rn4b19>,#<Imm1b26:Imm3b14:Imm8b7> ( -- )   
  s" XOR" $>指令   
  $<Rd4b11>,<Rn4b19>,#<Imm1b26:Imm3b14:Imm8b7> 
  0 指令_flag ! 
  ;

0xFFC0      constant Mark_XOR_<Rdn3b2>,<Rm3b5>                
0x4040      constant code_XOR_<Rdn3b2>,<Rm3b5>
: $XOR_<Rdn3b2>,<Rm3b5> ( -- )   
  s" XOR" $>指令   
  $<Rdn3b2>,<Rm3b5> 
  0 指令_flag ! 
  ; 