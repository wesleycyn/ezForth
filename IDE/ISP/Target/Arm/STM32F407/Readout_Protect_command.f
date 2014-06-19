\ Forthuino Board II 
\ ISP, IAP
\ Readout Protect command: host side
: Readout_Protect_command
  Start_Readout_Protect_command
  Send_0x82+0x7D
  Wait_for_ACK_or_NACK?\
  if
    Wait_for_ACK_or_NACK
  then
  End_Readout_Protect_command
  ;