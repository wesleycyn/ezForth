
  fload meta/Initialize.f
  fload meta/Memory_Map.f
  fload meta/Header/ELF.f
  fload meta/Table/ASCII_PATTERN_TABLE.f

  fload meta/Output/Output.f

( Including Assembler )
  chdir asm   fload main_asm.f
  chdir ..
  fload meta/Including_Assembler.f

\ Target
  fload meta\Target\Target.f

\ Forth system
( Include  eforth  )

fload kernel/eForth/code/code_main.f

\ fload IO/io.f
  CODE ?RX
     $NEXT
   END-CODE

 CODE TX!
  $NEXT
  END-CODE
  
fload   kernel/eForth/colon/system.f
 \ fload kernel/eForth/colon/extension.f
 \ FLOAD IO/debug.F           

\ BIOS 
  \ fload BIOS/IAP/IAP.f 

\ IO device VM
  \ fload Device/LCD
  \ fload Device/KeyBoard
  fload IO/KeyBoard/KeyBoard.f

\ HardWare IO
\ fload IO/io.f
  fload IO/STM/STM32F407/RCC/RCC.f
  fload IO/STM/STM32F407/GPIO/GPIO.f
  fload IO/STM/STM32F407/USART/USART.f
  \ fload IO/STM/STM32F407/Tim/Tim.f
  \ fload IO/STM/STM32F407/System/System.f

code asura 
 0x5555AAAA ,
  MOV  IP,LP  
  MOV  R3,R1
  MOV  R1,R3
  LDR PC,[IP],#4  
  $NEXT
END-CODE

fload meta/Initialize_User_Variables.f
fload meta/Boot.f
\ fload FileSystem/paths.f
META

CR .( Unresolved references: ) CR   .UNRESOLVED
5 pause-seconds


WRITE_BIN_FILE
\s
WRITE_AXF_FILE
