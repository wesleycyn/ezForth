0xF800      constant Mark_B_#<Imm11b10>
0xE000      constant code_B_#<Imm11b10> 

: Op_B_#<Imm11b10>
  \ case
  \  run  time of #<Imm11b10> ->PC endof
  \  list time of PC+2->PC  endof
  \ endcase
  ;
       
: $B_#<Imm11b10> ( -- )   
  s" B "                       $>«ü¥O   
  $#<Imm11b10> 
  0 «ü¥O_flag !   
  Op_B_<Imm11b10>
  ;