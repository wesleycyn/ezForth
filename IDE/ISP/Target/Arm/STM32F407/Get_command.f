\ Forthuino Board II 
\ ISP, IAP
\ Get command: host side 

: Get_command
  Start Get 
  0x00 send
  0xff send
  wait_ACK/NACK
  if
    Receive_the_number_of_bytes(version+commands)
    Receive_the_bootloader_version \ ISP or IAP version
    Receive_the_supported_commands 
    wait_ACK/NACK
  then
  End_of_Get 
  ;