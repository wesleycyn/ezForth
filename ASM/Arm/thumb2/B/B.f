0xFF87      constant Mark_BLX_<Rm4b6>
0x4780      constant code_BLX_<Rm4b6>  

: Op_BLX_<Rm4b6>
  \ case
  \  run  time of Rm4b6->PC endof
  \  list time of PC+2->PC  endof
  \ endcase
  ;
       
: $BLX_<Rm4b6> ( -- )   
  s" BLX "                       $>«ü¥O   
  $<Rm4b6> 
  0 «ü¥O_flag !   
  Op_BLX_<Rm4b6>
  ;