0xF800      constant Mark_STR_<Rt3b2>,[<Rn3b5>,#<imm5b10>]
0x6000      constant code_STR_<Rt3b2>,[<Rn3b5>,#<imm5b10>]         
: $STR_<Rt3b2>,[<Rn3b5>,#<imm5b10>] ( -- )   
  s" STR"                       $>指令   
  $<Rt3b2>,[<Rn3b5>,#<imm5b10>] 
  0 指令_flag ! 
  ;

0xF800      constant Mark_STR_<Rt3b10>,[PC,#<imm8b7>] 
0x4000      constant code_STR_<Rt3b10>,[PC,#<imm8b7>]
: $STR_<Rt3b10>,[PC,#<imm8b7>] ( -- )   
  s" STR" $>指令   
  $<Rt3b10>,[PC,#<imm8b7>] 
  0 指令_flag ! 
  ; 

0xF800      constant Mark_STR_<Rt3b10>,[SP,#<imm8b7>]
0x9000      constant code_STR_<Rt3b10>,[SP,#<imm8b7>]
: $STR_<Rt3b10>,[SP,#<imm8b7>] ( -- )   
  s" STR" $>指令   
  $<Rt3b10>,[SP,#<imm8b7>] 
  0 指令_flag ! 
  ; 

0xFFF00F00  constant Mark_STR_<Rt4b15>,[<Rn4b19>,#<imm8b7>]                          
0xF8400C00  constant code_STR_<Rt4b15>,[<Rn4b19>,#<imm8b7>]  
: $STR_<Rt4b15>,[<Rn4b19>,#<imm8b7>] ( -- )   
  s" STR" $>指令   
  $<Rt4b15>,[<Rn4b19>,#<imm8b7>] 
  0 指令_flag ! 
  ;

0xFFF00F00  constant Mark_STR_<Rt4b15>,[<Rn4b19>,#<imm8b7>]!   
0xF8400D00  constant code_STR_<Rt4b15>,[<Rn4b19>,#<imm8b7>]!  
: $STR_<Rt4b15>,[<Rn4b19>,#<imm8b7>]! ( -- )   
  s" STR" $>指令   
  $<Rt4b15>,[<Rn4b19>,#<imm8b7>]! 
  0 指令_flag ! 
  ;

0xFFF00F00  constant Mark_STR_<Rt4b15>,[<Rn4b19>],#<imm8b7>
0xF8400900  constant code_STR_<Rt4b15>,[<Rn4b19>],#<imm8b7>  
: $STR_<Rt4b15>,[<Rn4b19>],#<imm8b7> ( -- )   
  s" STR" $>指令   
  $<Rt4b15>,[<Rn4b19>],#<imm8b7> 
  0 指令_flag ! 
  ;

0xFE00      constant Mark_STR_<Rt3b2>,[<Rn3b5>,<Rm3b8>]                 
0x5000      constant code_STR_<Rt3b2>,[<Rn3b5>,<Rm3b8>] 
: $STR_<Rt3b2>,[<Rn3b5>,<Rm3b8>] ( -- )   
  s" STR" $>指令   
  $<Rt3b2>,[<Rn3b5>,<Rm3b8>] 
  0 指令_flag ! 
  ;
