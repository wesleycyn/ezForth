\ Forthuino Board II 
\ ISP, IAP
\ Get ID command: host side

: Get_ID_command
  Start_Get_ID_command
  Send_0x02+0xFD
  Wait_for_ACK_or_NACK?
  if
    Receive_N=number_of_bytes ¡V 1
    Receive_PID
    Wait_for_ACK_or_NACK
  then
  End_Get_ID_command
  ;