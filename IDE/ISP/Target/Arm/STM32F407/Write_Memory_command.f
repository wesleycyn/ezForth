\ Forthuino Board II 
\ ISP, IAP
\ Write Memory command: host side
: Write_Memory_command
  Start_Write_Memory_command
  Send_0x31+0xCE
  Wait_for_ACK_or_NACK?
  if
    Send_the_start_address_(4bytes)&checksum
    Wait_for_ACK_or_NACK?
    if
      Send_the_number_of_bytes_to_be_written(1byte),the_data_(N+1_by_tes)(2)_and_checksum
      Wait_for_ACK_or_NACK
    then
  then
  End_Write_Memory_command
  ;