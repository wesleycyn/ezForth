0xF800  constant Mark_MOV_<Rd3b10>,#<Imm8b7> 
0x2000  constant code_MOV_<Rd3b10>,#<Imm8b7>  
: $MOV_<Rd3b10>,#<Imm8b7> ( -- )   
  s" MOV" $>���O   
  $<Rd3b10>,#<imm8b7> 
  0 ���O_flag ! 
  ;

0xFF0      constant Mark_MOV_<D1b7Rd3b2>,<Rm4b6>                
0x4600      constant code_MOV_<D1b7Rd3b2>,<Rm4b6>
: $MOV_<D1b7Rd3b2>,<Rm4b6> ( -- )   
  s" MOV" $>���O   
  $<D1b7Rd3b2>,<Rm4b6> 
  0 ���O_flag ! 
  ; 