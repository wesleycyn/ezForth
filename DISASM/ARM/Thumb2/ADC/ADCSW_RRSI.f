: $ADCS.W_Rd4b11,Rn4b19,Rm4b3,shift2b5:Imm3b14:Imm2b7  ( --  )
  s" ADCS.W"                            $>指令
  指令_Code @ $Rd4b11                  $>指令
  指令_Code @ $Rn4b19                  $>指令
  指令_Code @ $shift2b5:Imm3b14:Imm2b7 $>指令
  0 指令_Code ! 
  ;