: $#<Imm1b26:Imm3b14:Imm8b7>
   s" ,"  $>���O
   s" #"  $>���O
  ���O_Code @ 26 rshift
  0x1 and
  ���O_Code @
  0xFF and
  +
  dup
  0 =
  if
   drop
   0 0  <# # #> $>���O    
  else   
   0 <# # # # # # # # # # #> $>���O
  then        
  ;


: $#<Imm1b26:Imm8b7>
   s" ,"  $>���O
   s" #"  $>���O
  ���O_Code @ 26 rshift
  0x1 and
  ���O_Code @
  0xFF and
  +
  dup
  0 =
  if
   drop
   0 0  <# # #> $>���O    
  else   
   0 <# # # # # # # # # # #> $>���O
  then        
  ;

: $#<imm8b7>
   s" ,"  $>���O
   s" #"  $>���O
  ���O_Code @ 
  0xFF and
  dup
  0 =
  if
   drop
   0 0 <# # #> $>���O   
  else    
   0 <# # # # # # # # # #> $>���O
  then        
  ; 
  
: $#<imm5b10>
   s" ,"  $>���O
   s" #"  $>���O
  ���O_Code @ 6 rshift 
  0x1F and
  dup
  0 =
  if
   drop
   0 0 <# # #> $>���O
  else 
  0 <# # # # # # # #> $>���O
  then           
  ; 