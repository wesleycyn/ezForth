\ Forthuino Board II 
\ ISP, IAP
\ Extended Erase Memory command: host side
: Extended_Erase_Memory_command
  Start_Extended_Erase_Memory_command
  Send_0x44+0xBB
  Wait_for_ACK_or_NACK?
  if
    Special_Erase?
    if
      Send Special Erase cmd:
      0xFFFF=Mass_erase
      0xFFFE=Bank1_erase
      0xFFFD=Bank2_erase
      0xFFF0_to_0xFFFC_are_reserved
      Send_the_checksum_of_the_two_bytes
     else
        Send_the_number_of pages_to_be_erased_N_(on_two_bytes)_MSB_first
        Send_the_page_numbers(each_on_two_bytes,MSB_first)
        Send_byte_checksum_of_all_sent_bytes_(N(2 bytes),2x(N+1)bytes)
     then
        Wait_for_ACK_or_NACK
   then
   End_Extended_Erase_Memory_command
  ;