

:  $<Rt3b2>
  s" R" $>���O
  ���O_Code @ 0x7 and 0 <# # #> $>���O
    
  ;

: $<Rt3b10>
  s" R" $>���O
  ���O_Code @ 8 rshift 0x7 and 0 <# # #> $>���O    
  ;
      
:  $<Rn3b5>
  s" R" $>���O
  ���O_Code @ 3 rshift 0x7 and 0 <# # #> $>���O    
  ;  

:  $<Rm3b8>
  s" R" $>���O
  ���O_Code @ 6 rshift 0x7 and 0 <# # #> $>���O    
  ;

: $<Rdn3b2>
  s" R" $>���O
  ���O_Code @ 0x7 and 0 <# # #> $>���O  
  ;
  
:  $<Rm3b5>
  s" R" $>���O
  ���O_Code @ 2 rshift 0x7 and 0 <# # #> $>���O   
  ;

: $<Rd3b10>
  s" R" $>���O
  ���O_Code @ 8 rshift 0x7 and 0 <# # #> $>���O   
  ;
  
: $<D1b7Rd3b2>
  s" R" $>���O
  ���O_Code @  0x7 and 0 <# # #> $>���O   
  ;

: num1>$
  dup
  9 > 
  if
   0 <# # # #>
  else
   0 <# # #>
  then 
  ;


: $<Rd4b11>
  s" R" $>���O
  ���O_Code @ 8 rshift 0xF and 
  num1>$  $>���O   
  ;
  
: $<Rn4b19>
  s" R" $>���O
  ���O_Code @ 16 rshift 0xF and
  num1>$  $>���O   
  ;


: $<Rt4b15>
  s" R" $>���O
  ���O_Code @ 12 rshift 0xF and
  num1>$  $>���O       
  ;
  

  
: $<Rm4b6>
  s" R" $>���O
  ���O_Code @ 3 rshift 0xF and
  num1>$  $>���O      
  ;      