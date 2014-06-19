: $#<Imm1b26:Imm3b14:Imm8b7>
   s" ,"  $>指令
   s" #"  $>指令
  指令_Code @ 26 rshift
  0x1 and
  指令_Code @
  0xFF and
  +
  dup
  0 =
  if
   drop
   0 0  <# # #> $>指令    
  else   
   0 <# # # # # # # # # # #> $>指令
  then        
  ;


: $#<Imm1b26:Imm8b7>
   s" ,"  $>指令
   s" #"  $>指令
  指令_Code @ 26 rshift
  0x1 and
  指令_Code @
  0xFF and
  +
  dup
  0 =
  if
   drop
   0 0  <# # #> $>指令    
  else   
   0 <# # # # # # # # # # #> $>指令
  then        
  ;

: $#<imm8b7>
   s" ,"  $>指令
   s" #"  $>指令
  指令_Code @ 
  0xFF and
  dup
  0 =
  if
   drop
   0 0 <# # #> $>指令   
  else    
   0 <# # # # # # # # # #> $>指令
  then        
  ; 
  
: $#<imm5b10>
   s" ,"  $>指令
   s" #"  $>指令
  指令_Code @ 6 rshift 
  0x1F and
  dup
  0 =
  if
   drop
   0 0 <# # #> $>指令
  else 
  0 <# # # # # # # #> $>指令
  then           
  ; 