\ Forthuino Board II 
\ ISP, IAP
\ Read Memory command: host side
: Read_Memory_command
  Start_Read_Memory_command
  Send_0x11+0xEE
  Wait_for_ACK_or_NACK?
  if
    Send_the_start_address_(4bytes)_withchecksum
    Wait_for_ACK_or_NACK?
    if
      Send_the_number_of_bytes_to_be_read_(1byte)_and_a_checksum_(1byte)
      Wait_for_ACK_or_NACK?
      if
        Receive_data_from_the_BL
      then
    then
  then
  End_Read_Memory_command
  ;