\ Forthuino Board II 
\ ISP, IAP
\ Readout Protect command: host side
  
: Start_Readout_UnProtect_command
  cr s" Get Readout_UnProtect_command!" type
  0x92 ComEmit
  0x6D ComEmit 
  ;

: End_Readout_UnProtect_command ( -- )
  Hex 
  DECIMAL 
 ;
: wait_time
  5535 0 do
   65535 0 do
   loop
  loop
  ; 


: Readout_UnProtect_command
  Start_Readout_UnProtect_command
   ACK/NACK?
   if
     wait_time  
    ACK/NACK?
    if
      cr s" Readout_UnProtect_command is Over !" type
    else
                    cr s" it is FAIL !"  type      
    then
     else
                    cr s" it is FAIL !"  type      
   then
  End_Readout_UnProtect_command   
  ;  