fload FileIO.f


variable LL
variable AAAA
variable TT
variable cc
variable extAdr
variable EIP
variable CODE_SIZE

0 value File_ID1
create buf1 1024 200 *  allot

create buffer   4096 allot

create data_buf 1024  allot



: EOF?
   drop 0 <> 
  ;

  s" STM324xG_EVA.hex" r/w 秨侣郎 to File_ID1
 
  





: ASCII>Num  ( -- )

  dup
  0x39 > if
   0x37 -
  else
   0x30 -
  then 
 ;

: Get_Data
   0 data_buf c! 
   LL @ dup data_buf c!
   0 do
   \ i . cr 
    buffer 9  +  I 2 * +  c@ ASCII>Num 4 lshift 
    buffer 10 +  I 2 * +  c@ ASCII>Num +
    dup 
    data_buf 1 + i +  c!  
     AAAA @   extAdr @ 0x0800 - 0x10000 * +  i +  
     
     dup 
     CODE_SIZE ! 
     buf1 + c! 
      
  loop
  ;



: Get_extAdr
  buffer 9 + c@ ASCII>Num    4 lshift
  buffer 10 + c@ ASCII>Num +  4 lshift
  buffer 11 + c@ ASCII>Num +  4 lshift 
  buffer 12 + c@ ASCII>Num +  
  extAdr ! 
  ;
  
: Get_EIP
  ;  




: HEX_display
  hex
  cr
  cr ." EIP:" EIP @ .  
  cr ." LL:" LL @ . 
  cr ." Adr:" extAdr @ . ." :" AAAA @ .
  cr ." TT:" TT @ .
  \ data
  cr ." data:"  data_buf count dump cr
  
  buf1 AAAA @ + 16 dump cr
  DECIMAL
  ;


: HEX_TT?
  TT @ 
  case
   0 of  Get_Data  endof 
   1 of endof
   2 of endof
   3 of endof   
   4 of Get_extAdr endof
   5 of    endof   
  endcase
  ;



: hex_s  ( len -- )
  >R 
  \ :
  
  \ ll
  buffer 1 + c@ ASCII>Num 4 lshift
  buffer 2 + c@ ASCII>Num + LL !
  
  \ aaaa 
  buffer 3 + c@ ASCII>Num    4 lshift
  buffer 4 + c@ ASCII>Num +  4 lshift
  buffer 5 + c@ ASCII>Num +  4 lshift 
  buffer 6 + c@ ASCII>Num +  
  AAAA !     
  
  \ TT
  buffer 7 + c@ ASCII>Num 4 lshift
  buffer 8 + c@ ASCII>Num + TT !  
  HEX_TT?
  \ CC

   buffer r@ + 2 - c@ ASCII>Num  4 lshift
   buffer r@ + 1 - c@ ASCII>Num  + CC !
   R> drop  
  \ data

  
  \ 耞戈タ絋?
  
 \  HEX_display


  ;




: RHF
 buffer 1024 File_ID1  read-line drop drop
\  dup 
\  buffer swap dump cr
  hex_s
 ;
 
 
: read-hex-file
  begin
   buffer 256 File_ID1  read-line 
  EOF?
  while
   ( buffer swap dump cr  )
     hex_s
  repeat
  File_ID1 闽郎
; 

\ RHF
\ read-hex-file

: 计陪ボ
 hex
 . cr
  DECIMAL 
;

: vector_table_display
cr
." sfe(CSTACK)                  "  0 4 * buf1 + @ 计陪ボ
." Reset_Handler                "  1 4 * buf1 + @ 计陪ボ                                              
." NMI_Handler                  "  2 4 * buf1 + @ 计陪ボ
." HardFault_Handler            "  3 4 * buf1 + @ 计陪ボ
." MemManage_Handler            "  4 4 * buf1 + @ 计陪ボ
." BusFault_Handler             "  5 4 * buf1 + @ 计陪ボ
." UsageFault_Handler           "   6 4 * buf1 + @ 计陪ボ
." \ 0                          "     7 4 * buf1 + @ 计陪ボ
." \ 0                          "     8 4 * buf1 + @ 计陪ボ
." \ 0                          "     9 4 * buf1 + @ 计陪ボ
." \ 0                          "    10 4 * buf1 + @ 计陪ボ
." vPortSVCHandler              "  11 4 * buf1 + @ 计陪ボ
." DebugMon_Handler             "  12 4 * buf1 + @ 计陪ボ
." \ 0                          "    13 4 * buf1 + @ 计陪ボ
." xPortPendSVHandler           "  14 4 * buf1 + @ 计陪ボ
." SysTick_Handler              "  15 4 * buf1 + @ 计陪ボ                                            
." \ ; External Interrupts      "  cr                
." WWDG_IRQHandler              "  16 4 * buf1 + @ 计陪ボ
." PVD_IRQHandler               "  17 4 * buf1 + @ 计陪ボ
." TAMP_STAMP_IRQHandler        "  18 4 * buf1 + @ 计陪ボ
." RTC_WKUP_IRQHandler          "  19 4 * buf1 + @ 计陪ボ
." FLASH_IRQHandler             "  20 4 * buf1 + @ 计陪ボ
." RCC_IRQHandler               "  21 4 * buf1 + @ 计陪ボ 
." EXTI0_IRQHandler             "  22 4 * buf1 + @ 计陪ボ
." EXTI1_IRQHandler             "  23 4 * buf1 + @ 计陪ボ
." EXTI2_IRQHandler             "  24 4 * buf1 + @ 计陪ボ
." EXTI3_IRQHandler             "  25 4 * buf1 + @ 计陪ボ
." EXTI4_IRQHandler             "  26 4 * buf1 + @ 计陪ボ
." DMA1_Stream0_IRQHandler      "  27 4 * buf1 + @ 计陪ボ
." DMA1_Stream1_IRQHandler      "  28 4 * buf1 + @ 计陪ボ
." DMA1_Stream2_IRQHandler      "  29 4 * buf1 + @ 计陪ボ
." DMA1_Stream3_IRQHandler      "  30 4 * buf1 + @ 计陪ボ
." DMA1_Stream4_IRQHandler      "  31 4 * buf1 + @ 计陪ボ
." DMA1_Stream5_IRQHandler      "  32 4 * buf1 + @ 计陪ボ
." DMA1_Stream6_IRQHandler      "  33 4 * buf1 + @ 计陪ボ
." ADC_IRQHandler               "  34 4 * buf1 + @ 计陪ボ
." CAN1_TX_IRQHandler           "  35 4 * buf1 + @ 计陪ボ
." CAN1_RX0_IRQHandler          "  36 4 * buf1 + @ 计陪ボ
." CAN1_RX1_IRQHandler          "  37 4 * buf1 + @ 计陪ボ
." CAN1_SCE_IRQHandler          "  38 4 * buf1 + @ 计陪ボ
." EXTI9_5_IRQHandler           "  39 4 * buf1 + @ 计陪ボ
." TIM1_BRK_TIM9_IRQHandler     "  40 4 * buf1 + @ 计陪ボ
." TIM1_UP_TIM10_IRQHandler     "  41 4 * buf1 + @ 计陪ボ
." TIM1_TRG_COM_TIM11_IRQHandler"  42 4 * buf1 + @ 计陪ボ
." TIM1_CC_IRQHandler           "  43 4 * buf1 + @ 计陪ボ
." TIM2_IRQHandler              "  44 4 * buf1 + @ 计陪ボ
." TIM3_IRQHandler              "  45 4 * buf1 + @ 计陪ボ
." TIM4_IRQHandler              "  46 4 * buf1 + @ 计陪ボ
." I2C1_EV_IRQHandler           "  47 4 * buf1 + @ 计陪ボ
." I2C1_ER_IRQHandler           "  48 4 * buf1 + @ 计陪ボ
." I2C2_EV_IRQHandler           "  49 4 * buf1 + @ 计陪ボ
." I2C2_ER_IRQHandler           "  50 4 * buf1 + @ 计陪ボ
." SPI1_IRQHandler              "  51 4 * buf1 + @ 计陪ボ
." SPI2_IRQHandler              "  52 4 * buf1 + @ 计陪ボ
." USART1_IRQHandler            "  53 4 * buf1 + @ 计陪ボ
." USART2_IRQHandler            "  54 4 * buf1 + @ 计陪ボ
." USART3_IRQHandler            "  55 4 * buf1 + @ 计陪ボ
." EXTI15_10_IRQHandler         "  56 4 * buf1 + @ 计陪ボ
." RTC_Alarm_IRQHandler         "  57 4 * buf1 + @ 计陪ボ
." OTG_FS_WKUP_IRQHandler       "  58 4 * buf1 + @ 计陪ボ
." TIM8_BRK_TIM12_IRQHandler    "  59 4 * buf1 + @ 计陪ボ
." TIM8_UP_TIM13_IRQHandler     "  60 4 * buf1 + @ 计陪ボ
." TIM8_TRG_COM_TIM14_IRQHandler"  61 4 * buf1 + @ 计陪ボ
." TIM8_CC_IRQHandler           "  62 4 * buf1 + @ 计陪ボ
." DMA1_Stream7_IRQHandler      "  63 4 * buf1 + @ 计陪ボ
." FSMC_IRQHandler              "  64 4 * buf1 + @ 计陪ボ
." SDIO_IRQHandler              "  65 4 * buf1 + @ 计陪ボ
." TIM5_IRQHandler              "  66 4 * buf1 + @ 计陪ボ
." SPI3_IRQHandler              "  67 4 * buf1 + @ 计陪ボ
." UART4_IRQHandler             "  68 4 * buf1 + @ 计陪ボ
." UART5_IRQHandler             "  69 4 * buf1 + @ 计陪ボ
." TIM6_DAC_IRQHandler          "  70 4 * buf1 + @ 计陪ボ
." TIM7_IRQHandler              "  71 4 * buf1 + @ 计陪ボ
." DMA2_Stream0_IRQHandler      "  72 4 * buf1 + @ 计陪ボ
." DMA2_Stream1_IRQHandler      "  73 4 * buf1 + @ 计陪ボ
." DMA2_Stream2_IRQHandler      "  74 4 * buf1 + @ 计陪ボ
." DMA2_Stream3_IRQHandler      "  75 4 * buf1 + @ 计陪ボ
." DMA2_Stream4_IRQHandler      "  76 4 * buf1 + @ 计陪ボ
." ETH_IRQHandler               "  77 4 * buf1 + @ 计陪ボ
." ETH_WKUP_IRQHandler          "  78 4 * buf1 + @ 计陪ボ
." CAN2_TX_IRQHandler           "  79 4 * buf1 + @ 计陪ボ
." CAN2_RX0_IRQHandler          "  80 4 * buf1 + @ 计陪ボ
." CAN2_RX1_IRQHandler          "  81 4 * buf1 + @ 计陪ボ
." CAN2_SCE_IRQHandler          "  82 4 * buf1 + @ 计陪ボ
." OTG_FS_IRQHandler            "  83 4 * buf1 + @ 计陪ボ
." DMA2_Stream5_IRQHandler      "  84 4 * buf1 + @ 计陪ボ
." DMA2_Stream6_IRQHandler      "  85 4 * buf1 + @ 计陪ボ
." DMA2_Stream7_IRQHandler      "  86 4 * buf1 + @ 计陪ボ
." USART6_IRQHandler            "  87 4 * buf1 + @ 计陪ボ
." I2C3_EV_IRQHandler           "  88 4 * buf1 + @ 计陪ボ
." I2C3_ER_IRQHandler           "  89 4 * buf1 + @ 计陪ボ
." OTG_HS_EP1_OUT_IRQHandler    "  90 4 * buf1 + @ 计陪ボ
." OTG_HS_EP1_IN_IRQHandler     "  91 4 * buf1 + @ 计陪ボ
." OTG_HS_WKUP_IRQHandler       "  92 4 * buf1 + @ 计陪ボ
." OTG_HS_IRQHandler            "  93 4 * buf1 + @ 计陪ボ
." DCMI_IRQHandler              "  94 4 * buf1 + @ 计陪ボ
." CRYP_IRQHandler              "  95 4 * buf1 + @ 计陪ボ
." HASH_RNG_IRQHandler          "  96 4 * buf1 + @ 计陪ボ
." FPU_IRQHandler               "  97 4 * buf1 + @ 计陪ボ
;


cls
\ RHF
read-hex-file

vector_table_display

chdir ../../DISASM/ARM/Thumb2
fload DisASM.f
fload Thumb2.f

variable 祘璸计

1 4 * buf1 + @  祘璸计 !
0 _Code !

: inst
  cr
  ." PC:=" 祘璸计 @ .  
  buf1 祘璸计 @ + 1 - 0x08000000 - w@ _Code @ 16 lshift + _Code !
  DisASM 
  祘璸计 @ 2 + 祘璸计 ! 
  _flag @
  0 = if   
   0 _Code !
  then
;

inst