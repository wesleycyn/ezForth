0xFF87  constant Mark_BX_<Rm4b6>
0x4700  constant code_BX_<Rm4b6>  

 

 : _BX ( -- )
   arg
  ?Arg_<Rm4b6>  
  case
   code_Arg_<Rm4b6> of code_BX_<Rm4b6> <Rm4b6>      endof                    
  endcase
 ;

  
   
   
      
: BX	( -- )
	state @ 
	if
   \ _BX [COMPILE]  .case
  else
   _BX
  then
  ; IMMEDIATE
  
     
  	  