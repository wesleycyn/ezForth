0x6800 constant code_LDR_Rt3b2,Rn3b5,#Imm5b10  

: $LDR_Rt3b2,Rn3b5,#Imm5b10 ( --  )
  s" LDR"                             $>���O
  ���O_Code @ $Rt3b2                  $>���O
  ���O_Code @ $Rn3b5                  $>���O
  ���O_Code @ $#Imm5b10               $>���O
  0 ���O_Code !
  ;