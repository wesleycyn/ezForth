#include <intrinsics.h>
#include "stm32f10x_lib.h"

void  USART_Configuration(void);
void  USART_Configuration(void)
{
  USART_InitTypeDef USART_InitStructure;  
  
/* USART2 configuration ------------------------------------------------------*/
  /* USART2 configured as follow:
        - BaudRate = 115200 baud  
        - Word Length = 8 Bits
        - One Stop Bit
        - No parity
        - Hardware flow control enabled (RTS and CTS signals)
        - Receive and transmit enabled
        - USART Clock disabled
        - USART CPOL: Clock is active low
        - USART CPHA: Data is captured on the second edge 
        - USART LastBit: The clock pulse of the last data bit is not output to 
                         the SCLK pin
  */
  USART_InitStructure.USART_BaudRate = 19200;
  USART_InitStructure.USART_WordLength = USART_WordLength_8b;
  USART_InitStructure.USART_StopBits = USART_StopBits_1;
  USART_InitStructure.USART_Parity = USART_Parity_No ;
  USART_InitStructure.USART_HardwareFlowControl = USART_HardwareFlowControl_RTS_CTS;
  
//   USART_InitStructure.USART_HardwareFlowControl = USART_HardwareFlowControl_None; 
  USART_InitStructure.USART_Mode = USART_Mode_Rx | USART_Mode_Tx;
//  USART_InitStructure.USART_Clock = USART_Clock_Disable;
//  USART_InitStructure.USART_CPOL = USART_CPOL_Low;
//  USART_InitStructure.USART_CPHA = USART_CPHA_2Edge;
//  USART_InitStructure.USART_LastBit = USART_LastBit_Disable;
  


  /* Configure the USART1 */
  USART_Init(USART2, &USART_InitStructure);

/* Enable the USART Transmoit interrupt: this interrupt is generated when the 
   USART1 transmit data register is empty */  
//  USART_ITConfig(USART2, USART_IT_TXE, ENABLE);

/* Enable the USART Receive interrupt: this interrupt is generated when the 
   USART1 receive data register is not empty */
  USART_ITConfig(USART2, USART_IT_RXNE, ENABLE);
 

  USART_Init(USART2, &USART_InitStructure);
  /* Enable the USART2 */
  
    /* Enable the USART2 */
  USART_Cmd(USART2, ENABLE);
}