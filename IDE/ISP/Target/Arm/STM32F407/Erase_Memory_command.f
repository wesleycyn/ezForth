\ Forthuino Board II 
\ ISP, IAP
\ Erase Memory command: host side
: Erase_Memory_command
  Start_Erase_Memory_command
  Send_0x43+0xBC
  Wait_for_ACK_or_NACK?
  if
    Globa_Erase?
    if
      Send_0xFF
      Send_0x00
    else
      Send_the_number_of_pages_to_be_erased_(1_byte)
      Send_the_page_numbers
      Send_checksum
    then
      Wait_for_ACK_or_NACK
   then
   End_Erase_Memory_command
 ;