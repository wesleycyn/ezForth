\ Forthuino Board II 
\ ISP, IAP
\ Readout Protect command: host side
: Readout_UnProtect_command
  Start_Readout_UnProtect_command
  Send_0x92+0x6D
  Wait_for_ACK_or_NACK?\
  if
    Wait_for_ACK_or_NACK
  then
  End_Readout_UnProtect_command
  ;