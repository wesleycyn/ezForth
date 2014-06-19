\ Forthuino Board II
\ ISP, IAP

defer ComInit
defer ComKey
defer ComEmit

fload WINSER.f  \ 根據 COM 指向 ,範例為 com3

' Com3Init is ComInit
' Com3Key  is ComKey
' Com3Emit is ComEmit



create ISP_Receive_Buffer 257 allot
create ISP_Send_Buffer    257 allot
variable ISP_Address





: STM_Link
  cr s" STM Link Start." type
  0x7f ComEmit
  ;


: ACK/NACK?
  Comkey 0x79 =
  ;

: begin_STM_Link
  ComInit
  cr ." STM Link begin."  type
  STM_Link
  ACK/NACK?
  if
    cr ." STM Link OK!!!" type
  then
  ;



: Receive_Data_Lenth ( -- len )
  Comkey
  dup ISP_Receive_Buffer c!
  ;

: Receive_Data ( count -- )
   Comkey 
   swap ISP_Receive_Buffer 1 + + c!
  ;

: Send_Address_with_checksum
  ISP_Address c@ dup ComEmit
  ISP_Address 1 + c@ dup ComEmit
  ISP_Address 2 + c@ dup ComEmit
  ISP_Address 3 + c@ dup ComEmit
  xor xor xor ComEmit
  ;

: Send_Read_Bytes_with_checksum
   ISP_Receive_Buffer c@ 
    dup 
   ComEmit
   0xFF xor ComEmit
  \  0xFF   ComEmit
  \  0x00  ComEmit
  ;

: Send_Write_Byte&Data_with_checksum
  ISP_Send_Buffer c@  dup dup ComEmit
  0 do
    ISP_Send_Buffer c@  dup ComEmit xor
  loop
  ComEmit
  ;
  
fload Get_command.f
fload Get_ID_Command.f

fload Readout_UnProtect_command.f
fload Read_Memory_command.f
fload   Get_Version&Read_Protection_Status_command.f
ComInit
STM_Link

ACK/NACK? drop

\ Get_command

\ Get_ID_Command


0x08000000 ISP_Address !
0xff ISP_Receive_Buffer c!

\ Readout_UnProtect_command

 \ Read_Memory_command

\ Get_Version&Read_Protection_Status_command

z" COM2" ComClose
