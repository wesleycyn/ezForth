0xFBE08000  constant Mark_ORR_<Rd4b11>,<Rn4b19>,#<Imm1b26:Imm3b14:Imm8b7> 
0xF0400000  constant code_ORR_<Rd4b11>,<Rn4b19>,#<Imm1b26:Imm3b14:Imm8b7>  
: $ORR_<Rd4b11>,<Rn4b19>,#<Imm1b26:Imm3b14:Imm8b7> ( -- )   
  s" ORR" $>���O   
  $<Rd4b11>,<Rn4b19>,#<Imm1b26:Imm3b14:Imm8b7> 
  0 ���O_flag ! 
  ;

0xFFC0      constant Mark_ORR_<Rdn3b2>,<Rm3b5>                
0x4300      constant code_ORR_<Rdn3b2>,<Rm3b5>
: $ORR_<Rdn3b2>,<Rm3b5> ( -- )   
  s" ORR" $>���O   
  $<Rdn3b2>,<Rm3b5> 
  0 ���O_flag ! 
  ; 