0 CONSTANT USART_SR
4 CONSTANT USART_DR

100 CONSTANT board_USART_base

1 CONSTANT Simulator
2 CONSTANT J-Link   
3 CONSTANT Com_Forth

variable debugger

: Simulator_w! ;
: J-Link_w!    ;
: Com_Forth_w! ;

: IOW!
  create
  does> 
   body> >name
   count 1 -
   temp$ place
   temp$ find
   if
    execute
\    board_USART_base +
    debugger @    
   case
     Simulator    of  Simulator_w!     endof
     J-Link       of  J-Link_w!        endof  
     Com_Forth    of  Com_Forth_w!     endof   
     http_forth   of  http_Forth_w!   endof
     usb_forth    of  usb_Forth_w!   endof                
   endcase
  else
\ 錯誤處理 
  then
  ;
  
: IOW@
  create
  does> 
   body> >name
   count 1 -
   temp$ place
   temp$ find
   if
    execute
    board_USART_base +
    debugger @    
   case
     Simulator    of  Simulator_w@    endof
     J-Link       of  J-Link_w@       endof  
     Com_Forth    of  Com_Forth_w@    endof
     http_forth   of  http_Forth_w@   endof
     usb_forth    of  usb_Forth_w@    endof             
   endcase
  else
\ 錯誤處理 
  then
  ;  