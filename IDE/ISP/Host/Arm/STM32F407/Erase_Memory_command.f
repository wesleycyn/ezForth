\ Forthuino Board II 
\ ISP, IAP
\ Erase Memory command: host side
 
: Start_Erase_Memory_command
  s" Erase_Memory_command is Satrt!"
  0x43 ComEmit
  0xBC ComEmit 
  ;

: End_Erase_Memory_commandd ( -- )
  Hex
  DECIMAL 
 ;

: Erase_Memory_command
  Start_Erase_Memory_command 
  ACK/NACK?
   if
    Send_Read_Bytes_with_checksum
    ACK/NACK?
    if
      s" Erase_Memory_command is Over !"
    then
   then
  End_Erase_Memory_command   
  ; 
  
: Erase_Global_command
  Start_Erase_Memory_command 
  ACK/NACK?
   if
    0xFF ComEmit
    0x00 ComEmit    
    ACK/NACK?
    if
      s" Erase_Memory_command is Over !"
    then
   then
  End_Erase_Memory_command   
  ;  