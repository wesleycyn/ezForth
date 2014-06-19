0xF800      constant Mark_LDR_<Rt3b2>,[<Rn3b5>,#<Imm5b10>]
0x6800      constant code_LDR_<Rt3b2>,[<Rn3b5>,#<Imm5b10>]  
       
: $LDR_<Rt3b2>,[<Rn3b5>,#<Imm5b10>] ( -- )   
  s" LDR"                       $>指令   
  $<Rt3b2>,[<Rn3b5>,#<Imm5b10>] 
  0 指令_flag ! 
  
\  Op_LDR_<Rt3b2>,[<Rn3b5>,#<Imm5b10>]
  ;
  
0xF800      constant Mark_LDR_<Rt3b10>,[PC,#<Imm8b7>] 
0x4800      constant code_LDR_<Rt3b10>,[PC,#<Imm8b7>]

: $LDR_<Rt3b10>,[PC,#<Imm8b7>] ( -- )   
  s" LDR" $>指令   
  $<Rt3b10>,[PC,#<imm8b7>] 
  0 指令_flag ! 
  ;  
0xF800      constant Mark_LDR_<Rt3b10>,[SP,#<imm8b7>]           
0x9800      constant code_LDR_<Rt3b10>,[SP,#<imm8b7>]
: $LDR_<Rt3b10>,[SP,#<imm8b7>] ( -- )   
  s" LDR" $>指令   
  $<Rt3b10>,[SP,#<imm8b7>] 
  0 指令_flag ! 
  ;
   
0xFFF00F00  constant Mark_LDR_<Rt4b15>,[<Rn4b19>,#<imm8b7>]                          
0xF8500C00  constant code_LDR_<Rt4b15>,[<Rn4b19>,#<imm8b7>]  
: $LDR_<Rt4b15>,[<Rn4b19>,#<imm8b7>] ( -- )   
  s" LDR" $>指令   
  $<Rt4b15>,[<Rn4b19>,#<imm8b7>] 
  0 指令_flag ! 
  ;
0xFFF00F00  constant Mark_LDR_<Rt4b15>,[<Rn4b19>,#<Imm8b7>]!   
0xF8500D00  constant code_LDR_<Rt4b15>,[<Rn4b19>,#<Imm8b7>]!  
: $LDR_<Rt4b15>,[<Rn4b19>,#<Imm8b7>]! ( -- )   
  s" LDR" $>指令   
  $<Rt4b15>,[<Rn4b19>,#<imm8b7>]! 
  0 指令_flag ! 
  ;
0xFFF00F00  constant Mark_LDR_<Rt4b15>,[<Rn4b19>],#<imm8b7>  
0xF8500900  constant code_LDR_<Rt4b15>,[<Rn4b19>],#<imm8b7>  
: $LDR_<Rt4b15>,[<Rn4b19>],#<imm8b7> ( -- )   
  s" LDR" $>指令   
  $<Rt4b15>,[<Rn4b19>],#<imm8b7> 
  0 指令_flag ! 
  ;

0xFE00      constant Mark_LDR_<Rt3b2>,[<Rn3b5>,<Rm3b8>]                 
0x5800      constant code_LDR_<Rt3b2>,[<Rn3b5>,<Rm3b8>] 
: $LDR_<Rt3b2>,[<Rn3b5>,<Rm3b8>] ( -- )   
  s" LDR" $>指令   
  $<Rt3b2>,[<Rn3b5>,<Rm3b8>] 
  0 指令_flag ! 
  ; 
        