\ Forthuino Board II 
\ ISP, IAP
\ Get Version & Read Protection Status command: host side

: Get_Version&Read_Protection_Status_command
  Start_Get_Version&Read_Protection_Status
  Send_0x01+0xFE
  Wait_for_ACK_or_NACK?
  if
    Receive_the_bootloader_version
    Receive_the_number_of_times_the_read_protection_was_disabled
    Receive_the_number_of_times_the_read_protection_was_enabled
    Wait_for_ACK_or_NACK
  then
    End_Get_Version&Read_Protection_Status
  ;