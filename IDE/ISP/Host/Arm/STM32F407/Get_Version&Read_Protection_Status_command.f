\ Version&Read_Protection_Status_command: host side of ISP of Forthuino Board II

: Start_Get_Version&Read_Protection_Status_command
  s" Get ID command is Satrt!" type
  0x01 ComEmit
  0xFE ComEmit
  ;

: End_Get_Version&Read_Protection_Status_command ( -- )
  Hex
  cr s"                               bootloader version :" type ISP_Receive_Buffer  1 + c@ u.
  cr s" number of times the read protection was disabled :" type ISP_Receive_Buffer  2 + c@ u.
  cr s"  number of times the read protection was enabled :" type ISP_Receive_Buffer  3 + c@ u.
  DECIMAL
 ;

: Get_Version&Read_Protection_Status_command
  Start_Get_Version&Read_Protection_Status_command
  ACK/NACK?
  if
    \ ACK/NACK?  drop
     0 Receive_Data
     1 Receive_Data
     2 Receive_Data
    ACK/NACK?
    if
      s" Get ID Dommand is Over !" type
    then
  then
  End_Get_Version&Read_Protection_Status_command
  ;
