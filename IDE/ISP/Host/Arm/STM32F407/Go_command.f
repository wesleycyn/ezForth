\ Forthuino Board II 
\ ISP, IAP
\ Go command: host side

: Go_command
  Start_Go_command
  Send_0x21+0xDE
  Wait_for_ACK_or_NACK?
  if
    Send_the_Start_Address_(4bytes)&checksum
    Wait_for_ACK_or_NACK?
    if
      Wait_for_ACK_or_NACK
    then
  then
  End_Start_Go_command
  ;