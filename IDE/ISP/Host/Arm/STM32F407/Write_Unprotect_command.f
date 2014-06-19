\ Forthuino Board II 
\ ISP, IAP
\ Write Unprotect command: host side
: Write_Unprotect_command
  Start_Write_Unprotect_command
  Send_0x73+0x8C
  Wait_for_ACK_or_NACK?
  if
    Wait_for_ACK_or_NACK
  then
    End_Write_Unprotect_command
  ;
  
: Start_Write_UnProtect_command
  s" Write_UnProtect_command!"
  0x73 ComEmit
  0x8C ComEmit 
  ;

: End_Write_UnProtect_command ( -- )
  Hex 
  DECIMAL 
 ;

: Get_Write_UnProtect_command
  Start_Write_UnProtect_command
  ACK/NACK?
  if
    ACK/NACK?
    if
      s" Write_UnProtect_command is Over !"
    then
  then
  End_Write_UnProtect_command   
  ;    