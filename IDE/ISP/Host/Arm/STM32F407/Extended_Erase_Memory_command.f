\ Forthuino Board II 
\ ISP, IAP
\ Extended Erase Memory command: host side
 
  
: Start_Extended_Erase_Memory_command
  s" Erase_Extended_Memory_command is Satrt!"
  0x44 ComEmit
  0xBB ComEmit 
  ;

: End_Erase_Extended_Memory_commandd ( -- )
  Hex
  DECIMAL 
 ;

: Erase_Extended_Memory_command
  Start_Erase_Extended_Memory_command 
  ACK/NACK?
   if
    Send_Read_Bytes_with_checksum
    ACK/NACK?
    if
      s" Erase_Extended_Memory_command is Over !"
    then
   then
  End_Erase_Extended_Memory_command   
  ; 
  
\s  
  
: Erase_Special_command
  Start_Erase_Extended_Memory_command 
  ACK/NACK?
   if
    0xFF ComEmit
    0x00 ComEmit    
    ACK/NACK?
    if
      s" Erase_Extended_Memory_command is Over !"
    then
   then
  End_Erase_Extended_Memory_command   
  ;  