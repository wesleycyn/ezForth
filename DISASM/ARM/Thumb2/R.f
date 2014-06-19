

:  $<Rt3b2>
  s" R" $>指令
  指令_Code @ 0x7 and 0 <# # #> $>指令
    
  ;

: $<Rt3b10>
  s" R" $>指令
  指令_Code @ 8 rshift 0x7 and 0 <# # #> $>指令    
  ;
      
:  $<Rn3b5>
  s" R" $>指令
  指令_Code @ 3 rshift 0x7 and 0 <# # #> $>指令    
  ;  

:  $<Rm3b8>
  s" R" $>指令
  指令_Code @ 6 rshift 0x7 and 0 <# # #> $>指令    
  ;

: $<Rdn3b2>
  s" R" $>指令
  指令_Code @ 0x7 and 0 <# # #> $>指令  
  ;
  
:  $<Rm3b5>
  s" R" $>指令
  指令_Code @ 2 rshift 0x7 and 0 <# # #> $>指令   
  ;

: $<Rd3b10>
  s" R" $>指令
  指令_Code @ 8 rshift 0x7 and 0 <# # #> $>指令   
  ;
  
: $<D1b7Rd3b2>
  s" R" $>指令
  指令_Code @  0x7 and 0 <# # #> $>指令   
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
  s" R" $>指令
  指令_Code @ 8 rshift 0xF and 
  num1>$  $>指令   
  ;
  
: $<Rn4b19>
  s" R" $>指令
  指令_Code @ 16 rshift 0xF and
  num1>$  $>指令   
  ;


: $<Rt4b15>
  s" R" $>指令
  指令_Code @ 12 rshift 0xF and
  num1>$  $>指令       
  ;
  

  
: $<Rm4b6>
  s" R" $>指令
  指令_Code @ 3 rshift 0xF and
  num1>$  $>指令      
  ;      