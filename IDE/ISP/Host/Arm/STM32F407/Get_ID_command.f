\ Get ID command: host side of ISP of Forthuino Board II 

: Start_Get_ID_command
  cr s" Get ID command is Satrt!" type
  0x02 ComEmit
  0xFD ComEmit 
  ;

: End_Get_ID_Command ( -- )
  Hex
  cr s" Number :" type ISP_Receive_Buffer    c@ u.
  cr s"   PID1 :" type ISP_Receive_Buffer  1 + c@ u. 
  cr s"   PID2 :" type ISP_Receive_Buffer  2 + c@ u.   
  DECIMAL 
 ;

: Get_ID_Command
  Start_Get_ID_Command 
  ACK/NACK?
  if
    Receive_Data_Lenth  1 +
    0 do
     i Receive_Data     
    loop
    ACK/NACK?
    if
      cr s" Get ID Dommand is Over !" type
    else
                    cr s" it is FAIL !"  type        
    then
    else
                    cr s" it is FAIL !"  type      
  then
  End_Get_ID_Command   
  ; 
  

  