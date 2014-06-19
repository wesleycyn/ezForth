\ Forthuino Board II 
\ ISP, IAP
\ Readout Protect command: host side

: Start_Readout_Protect_command
  s" Get Readout_Protect_command!"
  0x82 ComEmit
  0x7D ComEmit 
  ;

: End_Readout_Protect_command ( -- )
  Hex 
  DECIMAL 
 ;

: Get_Readout_Protect_command
  Start_Readout_Protect_command
  ACK/NACK?
  if
    ACK/NACK?
    if
      s" Readout_Protect_command is Over !"
    then
  then
  End_Readout_Protect_command   
  ; 