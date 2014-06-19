\ Forthuino Board II 
\ ISP, IAP
\ Read Memory command: host side of ISP, IAP


: Start_Read_Memory_command
  cr s" Read_Memory_command is Satrt!" type
  0x11 ComEmit
  0xEE ComEmit 
  ;

: End_Read_Memory_command ( -- )
  Hex
   CR s" Receive_Buffer :" type
   ISP_Receive_Buffer count dump
  DECIMAL 
 ;

: Read_Memory_command
  Start_Read_Memory_command 
  ACK/NACK?
  if
   Send_Address_with_checksum
   ACK/NACK?
   if
    \ Send_Read_Bytes_with_checksum
    0xFF   ComEmit
    0x00  ComEmit
    
    
    ACK/NACK?
    if
     ISP_Receive_Buffer c@ 1 +
     0 do 
      i Receive_Data     
     loop
     cr s" Read_Memory_command is Over !"  type
    else 
          cr s" Read_Memory_command read bytes is FAIL !"  type
                    cr s" it is FAIL !"  type           
    then
   else 
          cr s" Read_Memory_command Address is FAIL !"  type
                    cr s" it is FAIL !"  type     
   then
  then
  End_Read_Memory_command   
  ;   