0x6800 constant code_LDR_Rt3b2,Rn3b5,#Imm5b10  

: $LDR_Rt3b2,Rn3b5,#Imm5b10 ( --  )
  s" LDR"                             $>指令
  指令_Code @ $Rt3b2                  $>指令
  指令_Code @ $Rn3b5                  $>指令
  指令_Code @ $#Imm5b10               $>指令
  0 指令_Code !
  ;