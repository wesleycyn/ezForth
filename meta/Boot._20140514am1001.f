MEM_BASE ORG
ASSEMBLER

\ $20000000 CONSTANT Internal_SRAM
\ $08000000 CONSTANT CODE_ROM
\ $00002000 CONSTANT SYSTEM_SIZE
( arm mode )

 MOV SP,#$CODE_ROM   ,     \ SP :=80000000
 MOV RP,#$Internal_SRAM ,  \ RP :=$20000000

LABEL: SYSTEM_MOVE         \ 狡籹ず场 SRAM
 LDR WP,[SP],#$4     w,    \ WP := [SP], SP:=SP+4
 STR WP,[RP],#$4     w,    \ [RP] := WP, RP:=RP+4
\ CMP SP,SYSTEM_SIZE  w,    \ Finish?
\ BNE SYSTEM_MOVE     ,     \ do again

 LDR SP,[PC+4]      w,     \ SP := [PC] :=SPP
 LDR RP,[PC+4]      w,     \ RP := [PC] :=RPP
 LDR PC,[PC+4]      w,     \ Jump to COLD of thubm2 mode

=SPP ( Internal_SRAM + ) ,
=RPP ( Internal_SRAM + ) ,

' COLD t, \ t, 1 + ,




\s
MEM_BASE ORG
ASSEMBLER
0xAA5555AA , 0xFFFFFFFF ,

\ \ __vector_table
=SPP , \ sfe(CSTACK)                    0 vector_table!  \
' COLD t,
\ Reset_Handler                  1 vector_table!  \; Reset Handler
\
0 , \ NMI_Handler                    2 vector_table!  \; NMI Handler
0 , \ HardFault_Handler              3 vector_table!  \; Hard Fault Handler
0 , \ MemManage_Handler              4 vector_table!  \; MPU Fault Handler
0 , \ BusFault_Handler               5 vector_table!  \; Bus Fault Handler
0 , \ UsageFault_Handler             6 vector_table!  \; Usage Fault Handler
0 , \ 0                              7 vector_table!  \; Reserved
0 , \ 0                              8 vector_table!  \; Reserved
0 , \ 0                              9 vector_table!  \; Reserved
0 , \ 0                             10 vector_table!  \; Reserved
0 , \ vPortSVCHandler               11 vector_table!  \; FreeRTOS SVC handler
0 , \ DebugMon_Handler              12 vector_table!  \; Debug Monitor Handler
0 , \ 0                             13 vector_table!  \; Reserved
0 , \ xPortPendSVHandler            14 vector_table!  \; PendSV  Handler
0 , \ SysTick_Handler               15 vector_table!  \; SysTick Handler

\ \ ; External Interrupts
0 , \ WWDG_IRQHandler               16 vector_table!  \        ; Window WatchDog
0 , \ PVD_IRQHandler                17 vector_table!  \        ; PVD through EXTI Line detection
0 , \ TAMP_STAMP_IRQHandler         18 vector_table!  \        ; Tamper and TimeStamps through the EXTI line
0 , \ RTC_WKUP_IRQHandler           19 vector_table!  \        ; RTC Wakeup through the EXTI line
0 , \ FLASH_IRQHandler              20 vector_table!  \        ; FLASH
0 , \ RCC_IRQHandler                21 vector_table!  \        ; RCC
0 , \ EXTI0_IRQHandler              22 vector_table!  \        ; EXTI Line0
0 , \ EXTI1_IRQHandler              23 vector_table!  \        ; EXTI Line1
0 , \ EXTI2_IRQHandler              24 vector_table!  \        ; EXTI Line2
0 , \ EXTI3_IRQHandler              25 vector_table!  \        ; EXTI Line3
0 , \ EXTI4_IRQHandler              26 vector_table!  \        ; EXTI Line4
0 , \ DMA1_Stream0_IRQHandler       27 vector_table!  \        ; DMA1 Stream 0
0 , \ DMA1_Stream1_IRQHandler       28 vector_table!  \        ; DMA1 Stream 1
0 , \ DMA1_Stream2_IRQHandler       29 vector_table!  \        ; DMA1 Stream 2
0 , \ DMA1_Stream3_IRQHandler       30 vector_table!  \        ; DMA1 Stream 3
0 , \ DMA1_Stream4_IRQHandler       31 vector_table!  \        ; DMA1 Stream 4
0 , \ DMA1_Stream5_IRQHandler       32 vector_table!  \        ; DMA1 Stream 5
0 , \ DMA1_Stream6_IRQHandler       33 vector_table!  \        ; DMA1 Stream 6
0 , \ ADC_IRQHandler                34 vector_table!  \        ; ADC1, ADC2 and ADC3s
0 , \ CAN1_TX_IRQHandler            35 vector_table!  \        ; CAN1 TX
0 , \ CAN1_RX0_IRQHandler           36 vector_table!  \        ; CAN1 RX0
0 , \ CAN1_RX1_IRQHandler           37 vector_table!  \        ; CAN1 RX1
0 , \ CAN1_SCE_IRQHandler           38 vector_table!  \        ; CAN1 SCE
0 , \ EXTI9_5_IRQHandler            39 vector_table!  \        ; External Line[9:5]s
0 , \ TIM1_BRK_TIM9_IRQHandler      40 vector_table!  \        ; TIM1 Break and TIM9
0 , \ TIM1_UP_TIM10_IRQHandler      41 vector_table!  \        ; TIM1 Update and TIM10
0 , \ TIM1_TRG_COM_TIM11_IRQHandler 42 vector_table!  \    ; TIM1 Trigger and Commutation and TIM11
0 , \ TIM1_CC_IRQHandler            43 vector_table!  \        ; TIM1 Capture Compare
0 , \ TIM2_IRQHandler               44 vector_table!  \       ; TIM2
0 , \ TIM3_IRQHandler               45 vector_table!  \        ; TIM3
0 , \ TIM4_IRQHandler               46 vector_table!  \        ; TIM4
0 , \ I2C1_EV_IRQHandler            47 vector_table!  \        ; I2C1 Event
0 , \ I2C1_ER_IRQHandler            48 vector_table!  \        ; I2C1 Error
0 , \ I2C2_EV_IRQHandler            49 vector_table!  \        ; I2C2 Event
0 , \ I2C2_ER_IRQHandler            50 vector_table!  \        ; I2C2 Error
0 , \ SPI1_IRQHandler               51 vector_table!  \        ; SPI1
0 , \ SPI2_IRQHandler               52 vector_table!  \        ; SPI2
0 , \ USART1_IRQHandler             53 vector_table!  \        ; USART1
0 , \ USART2_IRQHandler             54 vector_table!  \        ; USART2
0 , \ USART3_IRQHandler             55 vector_table!  \        ; USART3
0 , \ EXTI15_10_IRQHandler          56 vector_table!  \        ; External Line[15:10]s
0 , \ RTC_Alarm_IRQHandler          57 vector_table!  \        ; RTC Alarm (A and B) through EXTI Line
0 , \ OTG_FS_WKUP_IRQHandler        58 vector_table!  \        ; USB OTG FS Wakeup through EXTI line
0 , \ TIM8_BRK_TIM12_IRQHandler     59 vector_table!  \       ; TIM8 Break and TIM12
0 , \ TIM8_UP_TIM13_IRQHandler      60 vector_table!  \        ; TIM8 Update and TIM13
0 , \ TIM8_TRG_COM_TIM14_IRQHandler 61 vector_table!  \    ; TIM8 Trigger and Commutation and TIM14
0 , \ TIM8_CC_IRQHandler            62 vector_table!  \    ; TIM8 Capture Compare
0 , \ DMA1_Stream7_IRQHandler       63 vector_table!  \    ; DMA1 Stream7
0 , \ FSMC_IRQHandler               64 vector_table!  \    ; FSMC
0 , \ SDIO_IRQHandler               65 vector_table!  \    ; SDIO
0 , \ TIM5_IRQHandler               66 vector_table!  \    ; TIM5
0 , \ SPI3_IRQHandler               67 vector_table!  \    ; SPI3
0 , \ UART4_IRQHandler              68 vector_table!  \    ; UART4
0 , \ UART5_IRQHandler              69 vector_table!  \    ; UART5
0 , \ TIM6_DAC_IRQHandler           70 vector_table!  \    ; TIM6 and DAC1&2 underrun errors
0 , \ TIM7_IRQHandler               71 vector_table!  \    ; TIM7
0 , \ DMA2_Stream0_IRQHandler       72 vector_table!  \    ; DMA2 Stream 0
0 , \ DMA2_Stream1_IRQHandler       73 vector_table!  \    ; DMA2 Stream 1
0 , \ DMA2_Stream2_IRQHandler       74 vector_table!  \    ; DMA2 Stream 2
0 , \ DMA2_Stream3_IRQHandler       75 vector_table!  \    ; DMA2 Stream 3
0 , \ DMA2_Stream4_IRQHandler       76 vector_table!  \    ; DMA2 Stream 4
0 , \ ETH_IRQHandler                77 vector_table!  \    ; Ethernet
0 , \ ETH_WKUP_IRQHandler           78 vector_table!  \    ; Ethernet Wakeup through EXTI line
0 , \ CAN2_TX_IRQHandler            79 vector_table!  \    ; CAN2 TX
0 , \ CAN2_RX0_IRQHandler           80 vector_table!  \    ; CAN2 RX0
0 , \ CAN2_RX1_IRQHandler           81 vector_table!  \    ; CAN2 RX1
0 , \ CAN2_SCE_IRQHandler           82 vector_table!  \    ; CAN2 SCE
0 , \ OTG_FS_IRQHandler             83 vector_table!  \    ; USB OTG FS
0 , \ DMA2_Stream5_IRQHandler       84 vector_table!  \   ; DMA2 Stream 5
0 , \ DMA2_Stream6_IRQHandler       85 vector_table!  \    ; DMA2 Stream 6
0 , \ DMA2_Stream7_IRQHandler       86 vector_table!  \    ; DMA2 Stream 7
0 , \ USART6_IRQHandler             87 vector_table!  \    ; USART6
0 , \ I2C3_EV_IRQHandler            88 vector_table!  \    ; I2C3 event
0 , \ I2C3_ER_IRQHandler            89 vector_table!  \    ; I2C3 error
0 , \ OTG_HS_EP1_OUT_IRQHandler     90 vector_table!  \    ; USB OTG HS End Point 1 Out
0 , \ OTG_HS_EP1_IN_IRQHandler      91 vector_table!  \    ; USB OTG HS End Point 1 In
0 , \ OTG_HS_WKUP_IRQHandler        92 vector_table!  \    ; USB OTG HS Wakeup through EXTI
0 , \ OTG_HS_IRQHandler             93 vector_table!  \    ; USB OTG HS
0 , \ DCMI_IRQHandler               94 vector_table!  \    ; DCMI
0 , \ CRYP_IRQHandler               95 vector_table!  \    ; CRYP crypto
0 , \ HASH_RNG_IRQHandler           96 vector_table!  \    ; Hash and Rng
0 , \ FPU_IRQHandler                97 vector_table!  \    ; FPU

( arm mode )

 MOV SP,#$80000000   ,     \ SP :=80000000
 MOV RP,#$20000000   ,  \ RP :=$20000000

LABEL: SYSTEM_MOVE         \ 狡籹ず场 SRAM
 LDR WP,[SP],#$4     w,    \ WP := [SP], SP:=SP+4
 STR WP,[RP],#$4     w,    \ [RP] := WP, RP:=RP+4
\ CMP SP,SYSTEM_SIZE  w,    \ Finish?
\ BNE SYSTEM_MOVE     ,     \ do again

 LDR SP,[PC+4]      w,     \ SP := [PC] := SPP
 LDR RP,[PC+4]      w,     \ RP := [PC] := RPP
 LDR PC,[PC+4]      w,     \ Jump to COLD of thubm2 mode

=SPP 20000000 + ,
=RPP 20000000 + ,

' COLD , \ t, 1 + ,



\s
MEM_BASE ORG
ASSEMBLER

\ $20000000 CONSTANT Internal_SRAM
\ $08000000 CONSTANT CODE_ROM
\ $00002000 CONSTANT SYSTEM_SIZE
( arm mode )

 MOV SP,#$CODE_ROM   ,     \ SP :=80000000
 MOV RP,#$Internal_SRAM ,  \ RP :=$20000000

LABEL: SYSTEM_MOVE         \ 狡籹ず场 SRAM
 LDR WP,[SP],#$4     w,    \ WP := [SP], SP:=SP+4
 STR WP,[RP],#$4     w,    \ [RP] := WP, RP:=RP+4
 CMP SP,SYSTEM_SIZE  w,    \ Finish?
 BNE SYSTEM_MOVE     ,     \ do again

 LDR SP,[PC+4]      w,     \ SP := [PC] :=SPP
 LDR RP,[PC+4]      w,     \ RP := [PC] :=RPP
 LDR PC,[PC+4]      w,     \ Jump to COLD of thubm2 mode

=SPP Internal_SRAM + ,
=RPP Internal_SRAM + ,

' COLD t, \ t, 1 + ,

\s

MEM_BASE ORG
ASSEMBLER

( arm mode )
 CODE_ROM_Base      ->SP ,     \ SP :=CODE_ROM_Base
 Internal_SRAM_Base ->RP ,     \ RP :=Internal_SRAM_Base

LABEL: SYSTEM_MOVE             \ 狡籹ず场 SRAM
 [SP]->WP,SP+4->SP      w,     \ WP := [SP], SP:=RP+4
 WP->[RP],RP+4->RP      w,     \ [RP] := WP, RP:=RP+4
 SYSTEM_SIZE >SP        w,     \ Finish?
 BNE SYSTEM_MOVE         ,     \ do again

 [PC+4]->SP             w,     \ SP := [PC] :=SPP
 [PC+4]->RP             w,     \ RP := [PC] :=RPP
 [PC+4]->PC             w,     \ Jump to COLD of thubm2 mode
=SPP ( nternal_SRAM_Base +  ) ,
=RPP ( Internal_SRAM_Base + ) ,
' COLD t, \ : t, 1 + , ;
