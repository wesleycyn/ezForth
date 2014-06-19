\ Forthuino Board II 
\ ISP, IAP
\ Write Protect command: host side
: Write_Protect_command
  Start_Write_Protect_command
  Send_0x63+0x9C
  Wait_for_ACK_or_NACK?
  if
    Send_the_number_of_sectors_to_be_protected_(1_byte)
    Send_the_sector_codes
    Send_checksum
    Wait_for_ACK_or_NACK
  then
  End_Write_Protect_command
  ;