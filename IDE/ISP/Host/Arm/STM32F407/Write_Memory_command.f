\ Write Memory command: host side of ISP, IAP


  
: Start_Write_Memory_command
  s" Write_Memory_command is Satrt!"
  0x31 ComEmit
  0xCE ComEmit 
  ;

: End_Write_Memory_command ( -- )
  Hex
   CR ." ISP_Send_Buffer :"
   ISP_Send_Buffer count dump
  DECIMAL 
 ;

: Write_Memory_command
  Start_Write_Memory_command 
  ACK/NACK?
  if
   Send_Address_with_checksum
   ACK/NACK?
   if
    Send_Write_Byte&Data_with_checksum
    ACK/NACK?
    if
      s" Write_Memory_command is Over !"
    then
   then
  then
  End_Write_Memory_command   
  ;   