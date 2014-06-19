0x6800      constant code_LDR_<Rt3b2>,[<Rn3b5>,#<imm5b10>]         
: $LDR_<Rt3b2>,[<Rn3b5>,#<imm5b10>] ( -- )   
  s" LDR"                       $>指令   
  $<Rt3b2>,[<Rn3b5>,#<imm5b10> 
  0 指令_flag ! 
  ;
 
0x4800      constant code_LDR_<Rt3b10>,[PC,#<imm8b7>]
: $LDR_<Rt3b10>,[PC,#<imm8b7>] ( -- )   
  s" LDR" $>指令   
  $<Rt3b10>,[PC,#<imm8b7>] 
  0 指令_flag ! 
  ;  
           
0x9800      constant code_LDR_<Rt3b10>,[SP,#<imm8b7>]
: $LDR_<Rt3b10>,[SP,#<imm8b7>] ( -- )   
  s" LDR" $>指令   
  $<Rt3b10>,[SP,#<imm8b7>] 
  0 指令_flag ! 
  ; 
                          
0xF8500800  constant code_LDR_<Rt4b15>,[<Rn4b19>,#<imm8b7>]  
: $LDR_<Rt4b15>,[<Rn4b19>,#<imm8b7>] ( -- )   
  s" LDR" $>指令   
  $<Rt4b15>,[<Rn4b19>,#<imm8b7>] 
  0 指令_flag ! 
  ;
   
0xF8500800  constant code_LDR_<Rt4b15>,[<Rn4b19>,#<imm8b7>]!  
: $LDR_<Rt4b15>,[<Rn4b19>,#<imm8b7>] ( -- )   
  s" LDR" $>指令   
  $<Rt4b15>,[<Rn4b19>,#<imm8b7>]! 
  0 指令_flag ! 
  ;

0xF8500800  constant code_LDR_<Rt4b15>,[<Rn4b19>],#<imm8b7>  
: $LDR_<Rt4b15>,[<Rn4b19>],#<imm8b7> ( -- )   
  s" LDR" $>指令   
  $<Rt4b15>,[<Rn4b19>],#<imm8b7> 
  0 指令_flag ! 
  ;
                
0x5C00      constant code_LDR_<Rt3b2>,[<Rn3b5>,<Rm3b8>] 
: $LDR_<Rt3b2>,[<Rn3b5>,<Rm3b8>] ( -- )   
  s" LDR" $>指令   
  $<Rt3b2>,[<Rn3b5>,<Rm3b8>] 
  0 指令_flag ! 
  ; 
        