

\ Get command: host side of ISP of Forthuino Board II

: Start_Get_command
   0x00 ComEmit
   0xFF ComEmit
   ;

: End_of_Get_Command ( -- )
  Hex
  cr s"                                       number :" type ISP_Receive_Buffer      c@ u.
  cr s"                           Bootloader version :" type ISP_Receive_Buffer  1 + c@ u.
  cr s"                             Get command Code :" type ISP_Receive_Buffer  2 + c@ u.
  cr s"       Get Version and Read Protection Status :" type ISP_Receive_Buffer  3 + c@ u.  
  cr s"                          Get ID command Code :" type ISP_Receive_Buffer  4 + c@ u.
  cr s"                     Read Memory command Code :" type ISP_Receive_Buffer  5 + c@ u.
  cr s"                              Go command Code :" type ISP_Receive_Buffer  6 + c@ u.
  cr s"                    Write Memory command Code :" type ISP_Receive_Buffer  7 + c@ u.
  cr s" Erase command or Extended Erase command Code :" type ISP_Receive_Buffer  8 + c@ u.
  cr s"                   Write Protect command Code :" type ISP_Receive_Buffer  9 + c@ u.
  cr s"                 Write Unprotect command Code :" type ISP_Receive_Buffer 10 + c@ u.
  cr s"                 Readout Protect command Code :" type ISP_Receive_Buffer 11 + c@ u.
  cr s"               Readout Unprotect command Code :" type ISP_Receive_Buffer 12 + c@ u.

    
  DECIMAL
 ;

: Get_command
  Start_Get_command
  ACK/NACK?
  if
    
    \ ACK/NACK? drop
    \ 13
    Receive_Data_Lenth  1 +
    0 do
     i Receive_Data
    loop
    ACK/NACK?
    if

      cr s" Get__command is Over !" type
    else
                    cr s" it is FAIL !"  type        
    then
    else
                    cr s" it is FAIL !"  type     
  then
  End_of_Get_Command
 ;

: test1
   14 0 do              
        Com3key  Hex u. DECIMAL
  loop  
  ;
  
