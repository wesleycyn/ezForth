: $<D1b7Rd3b2>,<Rm4b6>
  s"  "  $>���O
  $<D1b7Rd3b2>
  s" ,"  $>���O 
  $<Rm4b6>
  ;

: $<Rd3b10>,#<imm8b7> 
  s"  "  $>���O
  $<Rd3b10>
  $#<imm8b7>
  ;

: $<Rd4b11>,<Rn4b19>,#<Imm1b26:Imm3b14:Imm8b7>
  s"  "  $>���O
  $<Rd4b11>
  s" ,"  $>���O  
  $<Rn4b19> 
  $#<Imm1b26:Imm3b14:Imm8b7>
  ;

: $<Rd4b11>,<Rn4b19>,#<Imm1b26:Imm8b7>
  s"  "  $>���O
  $<Rd4b11>
  s" ,"  $>���O  
  $<Rn4b19> 
  $#<Imm1b26:Imm8b7>
  ;

: $<Rdn3b2>,<Rm3b5>
  s"  "  $>���O
  $<Rdn3b2>
  s" ,"  $>���O  
  $<Rm3b5>
  ;
  
  
: $[PC,#<imm8b7>]
  s" ["  $>���O
  s" PC"  $>���O
  $#<imm8b7>  
  s" ]"  $>���O
  ; 
  
: $[SP,#<imm8b7>]
  s" ["  $>���O
  s" SP"  $>���O
  $#<imm8b7>  
  s" ]"  $>���O
  ;   
  
  
: $[<Rn3b5>,#<imm5b10>]
  s" ["  $>���O
  $<Rn3b5>
  $#<imm5b10>
  s" ]"  $>���O  
  ; 
  
: $<Rt3b2>,[<Rn3b5>,#<imm5b10>]
  s"  "  $>���O
  $<Rt3b2>
  s" ,"  $>���O  
  $[<Rn3b5>,#<imm5b10>]
  ;  
  
  
: $<Rt3b10>,[PC,#<imm8b7>]       
  s"  "  $>���O
  $<Rt3b10>
  s" ,"  $>���O   
  $[PC,#<imm8b7>]       
  ; 
  
: $<Rt3b10>,[SP,#<imm8b7>]
  s"  "  $>���O
  $<Rt3b10>
  s" ,"  $>���O   
  $[SP,#<imm8b7>]       
  ;  
    
: $[<Rn4b19>,#<imm8b7>]
  s" ["  $>���O
  $<Rn4b19>
  $#<imm8b7>     
  s" ]"  $>���O 
  ;  
  
: $<Rt4b15>,[<Rn4b19>,#<imm8b7>] 
  s"  "  $>���O
  $<Rt4b15>
  s" ,"  $>���O
  $[<Rn4b19>,#<imm8b7>]    
  ;  
  
: $<Rt4b15>,[<Rn4b19>,#<imm8b7>]!
  $<Rt4b15>,[<Rn4b19>,#<imm8b7>]
  s" !"  $>���O   
  ;
    
: $[<Rn4b19>]
  s" ["  $>���O 
  $<Rn4b19>
  s" ]"  $>���O    
  ;
    
 
        
: $<Rt4b15>,[<Rn4b19>],#<imm8b7>
  s"  "  $>���O
  $<Rt4b15>
  s" ,"  $>���O  
  $[<Rn4b19>]
  $#<imm8b7> 
  ;  
    

  
: $[<Rn3b5>,<Rm3b8>]
  s" ["  $>���O  
  $<Rn3b5>
  s" ,"  $>���O   
  $<Rm3b8>
  s" ]"  $>���O 
 ;
    
: $<Rt3b2>,[<Rn3b5>,<Rm3b8>]
  s"  "  $>���O
  $<Rt3b2>
  s" ,"  $>���O  
  $[<Rn3b5>,<Rm3b8>]    
  ;    
  
  