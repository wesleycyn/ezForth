: $ADCS_Rd4b11,Rn4b19,#Imm1b26:Imm3b14:Imm8b7 ( --  )
  s" ADCS"                             $>指令
  指令_Code @ $Rd4b11                  $>指令
  指令_Code @ $Rn4b19                  $>指令
  指令_Code @ $#Imm1b26:Imm3b14:Imm8b7 $>指令
  0 指令_Code ! 
  ;