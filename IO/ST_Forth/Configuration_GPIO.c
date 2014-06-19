#include "platform_config.h"
                                                                                                                                          
#include "stm32f10x_lib.h"

GPIO_InitTypeDef GPIO_InitStructure @"FastDataRAM";
void GPIO_Configuration(void);
void GPIO_Configuration(void)
{





  
//Output Mode  
  /* Configure GPIO_LED Pin 6, Pin 7, Pin 8 and Pin 9 as Output push-pull ----*/
  GPIO_InitStructure.GPIO_Pin = GPIO_Pin_6 | GPIO_Pin_7 | GPIO_Pin_8 | GPIO_Pin_9;
  GPIO_InitStructure.GPIO_Speed = GPIO_Speed_50MHz;
  GPIO_InitStructure.GPIO_Mode = GPIO_Mode_Out_PP;
  GPIO_Init(GPIO_LED, &GPIO_InitStructure);

  RCC_APB2PeriphClockCmd(RCC_APB2Periph_GPIOA |
                         RCC_APB2Periph_GPIOB |
                         RCC_APB2Periph_GPIOC,
                         ENABLE);
  RCC_APB2PeriphResetCmd(RCC_APB2Periph_GPIOA |
                         RCC_APB2Periph_GPIOB |
                         RCC_APB2Periph_GPIOC,
                         DISABLE);

  // Assign PA4, PA5, PA6, PA7, PA9, PA10, PB6, PB7, PB10, PB11, PB12, PB13,
  // PB14, PB15, PC6, PC7 to LEDs
  GPIO_InitStructure.GPIO_Speed = GPIO_Speed_50MHz;
  GPIO_InitStructure.GPIO_Mode = GPIO_Mode_Out_PP;
//
  GPIO_InitStructure.GPIO_Pin = GPIO_Pin_4 | GPIO_Pin_5 | GPIO_Pin_6 |GPIO_Pin_7 ;
  GPIO_Init(GPIOA, &GPIO_InitStructure);
//
  GPIO_InitStructure.GPIO_Pin = GPIO_Pin_6 | GPIO_Pin_7 | GPIO_Pin_12|
                                GPIO_Pin_10| GPIO_Pin_11| GPIO_Pin_13|
                                GPIO_Pin_14| GPIO_Pin_15;
  GPIO_Init(GPIOB, &GPIO_InitStructure);
//
  GPIO_InitStructure.GPIO_Pin = GPIO_Pin_6 | GPIO_Pin_7;
  GPIO_Init(GPIOC, &GPIO_InitStructure);  

//
  GPIO_InitStructure.GPIO_Pin = GPIO_Pin_6 | GPIO_Pin_7 | GPIO_Pin_8| GPIO_Pin_9 | GPIO_Pin_10;
  GPIO_Init(GPIOF, &GPIO_InitStructure);  
  
  
  
  
  // PA4  LED_Enable
  // PB12 LED_Latch 
  
  /* Configure SPI1 pins: NSS, SCK, MISO and MOSI ----------------------------*/
  GPIO_InitStructure.GPIO_Pin =  GPIO_Pin_5 | GPIO_Pin_6 | GPIO_Pin_7;
  GPIO_InitStructure.GPIO_Speed =GPIO_Speed_10MHz;// GPIO_Speed_50MHz;
  GPIO_InitStructure.GPIO_Mode = GPIO_Mode_AF_PP;
  GPIO_Init(GPIOA, &GPIO_InitStructure);

  /* Configure SPI2 pins: NSS, SCK, MISO and MOSI ----------------------------*/
  GPIO_InitStructure.GPIO_Pin =  GPIO_Pin_13 | GPIO_Pin_14 | GPIO_Pin_15;
  GPIO_Init(GPIOB, &GPIO_InitStructure);   
  
  
  /* GPIOC Configuration:Pin6, 7, 8 and 9 as alternate function push-pull */
  GPIO_InitStructure.GPIO_Pin = GPIO_Pin_6 | GPIO_Pin_7 | GPIO_Pin_8 | GPIO_Pin_9;
  GPIO_InitStructure.GPIO_Mode = GPIO_Mode_Out_PP;
  GPIO_InitStructure.GPIO_Speed = GPIO_Speed_50MHz;
  GPIO_Init(GPIOC, &GPIO_InitStructure);  
  
  /* Configure USART2 pins:*/  
  //Alternate functions USART2_REMAP = 0 USART2_REMAP = 1
  //  USART2_CTS        PA0             PD3
  //  USART2_RTS        PA1             PD4
  //  USART2_TX         PA2             PD5
  //  USART2_RX         PA3             PD6
  //  USART2_CK         PA4             PD7    

// Remap available only for 100-pin and 144-pin packages.
  /* Enable the USART2 Pins Software Remapping */  
 // GPIO_PinRemapConfig(GPIO_Remap_USART2, ENABLE);

  /* Configure USART2 RTS (PD4) and USART2 Tx (PD5) as alternate function push-pull */
  GPIO_InitStructure.GPIO_Pin = GPIO_Pin_1 | GPIO_Pin_2;
  GPIO_InitStructure.GPIO_Speed = GPIO_Speed_50MHz;
  GPIO_InitStructure.GPIO_Mode = GPIO_Mode_AF_PP;
  GPIO_Init(GPIOA, &GPIO_InitStructure);

  
  
  
  
  /* Configure USART2 CTS (PD3) and USART2 Rx (PD6) as input floating */
  GPIO_InitStructure.GPIO_Pin = GPIO_Pin_3 | GPIO_Pin_0;
  GPIO_InitStructure.GPIO_Mode = GPIO_Mode_IN_FLOATING;
  GPIO_Init(GPIOA, &GPIO_InitStructure);   



// Input Mode
  GPIO_InitStructure.GPIO_Speed = GPIO_Speed_50MHz;
  GPIO_InitStructure.GPIO_Mode = GPIO_Mode_IN_FLOATING;
//
  GPIO_InitStructure.GPIO_Pin = GPIO_Pin_9 | GPIO_Pin_10 | GPIO_Pin_11 |GPIO_Pin_12 ;
  GPIO_Init(GPIOA, &GPIO_InitStructure);
  
  
}