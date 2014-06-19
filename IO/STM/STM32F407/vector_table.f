\ STM32F407 vector_table

\ __vector_table
sfe(CSTACK)                    0 vector_table!  \
Reset_Handler                  1 vector_table!  \; Reset Handler

NMI_Handler                    2 vector_table!  \; NMI Handler
HardFault_Handler              3 vector_table!  \; Hard Fault Handler
MemManage_Handler              4 vector_table!  \; MPU Fault Handler
BusFault_Handler               5 vector_table!  \; Bus Fault Handler
UsageFault_Handler             6 vector_table!  \; Usage Fault Handler
0                              7 vector_table!  \; Reserved
0                              8 vector_table!  \; Reserved
0                              9 vector_table!  \; Reserved
0                             10 vector_table!  \; Reserved
vPortSVCHandler               11 vector_table!  \; FreeRTOS SVC handler
DebugMon_Handler              12 vector_table!  \; Debug Monitor Handler
0                             13 vector_table!  \; Reserved
xPortPendSVHandler            14 vector_table!  \; PendSV  Handler
SysTick_Handler               15 vector_table!  \; SysTick Handler

\ ; External Interrupts
WWDG_IRQHandler               16 vector_table!  \        ; Window WatchDog                                        
PVD_IRQHandler                17 vector_table!  \        ; PVD through EXTI Line detection                        
TAMP_STAMP_IRQHandler         18 vector_table!  \        ; Tamper and TimeStamps through the EXTI line            
RTC_WKUP_IRQHandler           19 vector_table!  \        ; RTC Wakeup through the EXTI line                       
FLASH_IRQHandler              20 vector_table!  \        ; FLASH                                           
RCC_IRQHandler                21 vector_table!  \        ; RCC                                             
EXTI0_IRQHandler              22 vector_table!  \        ; EXTI Line0                                             
EXTI1_IRQHandler              23 vector_table!  \        ; EXTI Line1                                             
EXTI2_IRQHandler              24 vector_table!  \        ; EXTI Line2                                             
EXTI3_IRQHandler              25 vector_table!  \        ; EXTI Line3                                             
EXTI4_IRQHandler              26 vector_table!  \        ; EXTI Line4                                             
DMA1_Stream0_IRQHandler       27 vector_table!  \        ; DMA1 Stream 0                                   
DMA1_Stream1_IRQHandler       28 vector_table!  \        ; DMA1 Stream 1                                   
DMA1_Stream2_IRQHandler       29 vector_table!  \        ; DMA1 Stream 2                                   
DMA1_Stream3_IRQHandler       30 vector_table!  \        ; DMA1 Stream 3                                   
DMA1_Stream4_IRQHandler       31 vector_table!  \        ; DMA1 Stream 4                                   
DMA1_Stream5_IRQHandler       32 vector_table!  \        ; DMA1 Stream 5                                   
DMA1_Stream6_IRQHandler       33 vector_table!  \        ; DMA1 Stream 6                                   
ADC_IRQHandler                34 vector_table!  \        ; ADC1, ADC2 and ADC3s                            
CAN1_TX_IRQHandler            35 vector_table!  \        ; CAN1 TX                                                
CAN1_RX0_IRQHandler           36 vector_table!  \        ; CAN1 RX0                                               
CAN1_RX1_IRQHandler           37 vector_table!  \        ; CAN1 RX1                                               
CAN1_SCE_IRQHandler           38 vector_table!  \        ; CAN1 SCE                                               
EXTI9_5_IRQHandler            39 vector_table!  \        ; External Line[9:5]s                                    
TIM1_BRK_TIM9_IRQHandler      40 vector_table!  \        ; TIM1 Break and TIM9                   
TIM1_UP_TIM10_IRQHandler      41 vector_table!  \        ; TIM1 Update and TIM10                 
TIM1_TRG_COM_TIM11_IRQHandler 42 vector_table!  \    ; TIM1 Trigger and Commutation and TIM11
TIM1_CC_IRQHandler            43 vector_table!  \        ; TIM1 Capture Compare                                   
TIM2_IRQHandler               44 vector_table!  \       ; TIM2                                            
TIM3_IRQHandler               45 vector_table!  \        ; TIM3                                            
TIM4_IRQHandler               46 vector_table!  \        ; TIM4                                            
I2C1_EV_IRQHandler            47 vector_table!  \        ; I2C1 Event                                             
I2C1_ER_IRQHandler            48 vector_table!  \        ; I2C1 Error                                             
I2C2_EV_IRQHandler            49 vector_table!  \        ; I2C2 Event                                             
I2C2_ER_IRQHandler            50 vector_table!  \        ; I2C2 Error                                               
SPI1_IRQHandler               51 vector_table!  \        ; SPI1                                            
SPI2_IRQHandler               52 vector_table!  \        ; SPI2                                            
USART1_IRQHandler             53 vector_table!  \        ; USART1                                          
USART2_IRQHandler             54 vector_table!  \        ; USART2                                          
USART3_IRQHandler             55 vector_table!  \        ; USART3                                          
EXTI15_10_IRQHandler          56 vector_table!  \        ; External Line[15:10]s                                  
RTC_Alarm_IRQHandler          57 vector_table!  \        ; RTC Alarm (A and B) through EXTI Line                  
OTG_FS_WKUP_IRQHandler        58 vector_table!  \        ; USB OTG FS Wakeup through EXTI line                        
TIM8_BRK_TIM12_IRQHandler     59 vector_table!  \       ; TIM8 Break and TIM12                  
TIM8_UP_TIM13_IRQHandler      60 vector_table!  \        ; TIM8 Update and TIM13                 
TIM8_TRG_COM_TIM14_IRQHandler 61 vector_table!  \    ; TIM8 Trigger and Commutation and TIM14
TIM8_CC_IRQHandler            62 vector_table!  \    ; TIM8 Capture Compare                                   
DMA1_Stream7_IRQHandler       63 vector_table!  \    ; DMA1 Stream7                                           
FSMC_IRQHandler               64 vector_table!  \    ; FSMC                                            
SDIO_IRQHandler               65 vector_table!  \    ; SDIO                                            
TIM5_IRQHandler               66 vector_table!  \    ; TIM5                                            
SPI3_IRQHandler               67 vector_table!  \    ; SPI3                                            
UART4_IRQHandler              68 vector_table!  \    ; UART4                                           
UART5_IRQHandler              69 vector_table!  \    ; UART5                                           
TIM6_DAC_IRQHandler           70 vector_table!  \    ; TIM6 and DAC1&2 underrun errors                   
TIM7_IRQHandler               71 vector_table!  \    ; TIM7                   
DMA2_Stream0_IRQHandler       72 vector_table!  \    ; DMA2 Stream 0                                   
DMA2_Stream1_IRQHandler       73 vector_table!  \    ; DMA2 Stream 1                                   
DMA2_Stream2_IRQHandler       74 vector_table!  \    ; DMA2 Stream 2                                   
DMA2_Stream3_IRQHandler       75 vector_table!  \    ; DMA2 Stream 3                                   
DMA2_Stream4_IRQHandler       76 vector_table!  \    ; DMA2 Stream 4                                   
ETH_IRQHandler                77 vector_table!  \    ; Ethernet                                        
ETH_WKUP_IRQHandler           78 vector_table!  \    ; Ethernet Wakeup through EXTI line                      
CAN2_TX_IRQHandler            79 vector_table!  \    ; CAN2 TX                                                
CAN2_RX0_IRQHandler           80 vector_table!  \    ; CAN2 RX0                                               
CAN2_RX1_IRQHandler           81 vector_table!  \    ; CAN2 RX1                                               
CAN2_SCE_IRQHandler           82 vector_table!  \    ; CAN2 SCE                                               
OTG_FS_IRQHandler             83 vector_table!  \    ; USB OTG FS                                      
DMA2_Stream5_IRQHandler       84 vector_table!  \   ; DMA2 Stream 5                                   
DMA2_Stream6_IRQHandler       85 vector_table!  \    ; DMA2 Stream 6                                   
DMA2_Stream7_IRQHandler       86 vector_table!  \    ; DMA2 Stream 7                                   
USART6_IRQHandler             87 vector_table!  \    ; USART6                                           
I2C3_EV_IRQHandler            88 vector_table!  \    ; I2C3 event                                             
I2C3_ER_IRQHandler            89 vector_table!  \    ; I2C3 error                                             
OTG_HS_EP1_OUT_IRQHandler     90 vector_table!  \    ; USB OTG HS End Point 1 Out                      
OTG_HS_EP1_IN_IRQHandler      91 vector_table!  \    ; USB OTG HS End Point 1 In                       
OTG_HS_WKUP_IRQHandler        92 vector_table!  \    ; USB OTG HS Wakeup through EXTI                         
OTG_HS_IRQHandler             93 vector_table!  \    ; USB OTG HS                                      
DCMI_IRQHandler               94 vector_table!  \    ; DCMI                                            
CRYP_IRQHandler               95 vector_table!  \    ; CRYP crypto                                     
HASH_RNG_IRQHandler           96 vector_table!  \    ; Hash and Rng
FPU_IRQHandler                97 vector_table!  \    ; FPU