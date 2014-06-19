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