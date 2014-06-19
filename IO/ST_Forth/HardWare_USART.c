#include "stm32f10x_lib.h"


//#define RxBufferSize 32
//#define TxBufferSize 32
//u8 TxBuffer[] = "USART Example 1: USART - Hyperterminal communication using hardware flow control";
//u8 RxBuffer[RxBufferSize];
//u8 NbrOfDataToTransfer = TxBufferSize;
//u8 NbrOfDataToRead = RxBufferSize;
//u8 TxCounter = 0;
//u8 RxCounter = 0;  
extern ErrorStatus HSEStartUpStatus;

extern unsigned char gUartRecTmp;


extern void UART1receive(void);


int Host_SendNext(unsigned char *value,int n);
void Test_USART2(void);
void USART2_ISR(void);



int Host_SendNext(unsigned char* TxBuffer,int n)
{
  int i;
   for(i=0;i<n;i++)
   {
      USART_SendData(USART2, TxBuffer[i]);
      while(USART_GetFlagStatus(USART2, USART_FLAG_TXE) == RESET); 
   }
  return(1);
}


void USART2_ISR(void)
{
  if(USART_GetITStatus(USART2, USART_IT_RXNE) != RESET)
  {   
    // Read one byte from the receive data register 
    
      gUartRecTmp=USART_ReceiveData(USART2);    
           

      UART1receive();
          // Clear the USART1 Receive interrupt 
            USART_ClearITPendingBit(USART2, USART_IT_RXNE);
      // receive is end, Disable the USART1 Transmit interrupt       
  }

  if(USART_GetITStatus(USART2, USART_IT_TXE) != RESET)
  {   
    // Write one byte to the transmit data register 
                   
    // Clear the USART1 transmit interrupt 
      USART_ClearITPendingBit(USART2, USART_IT_TXE); 
    // transmit is end ,Disable the USART1 Transmit interrupt     
  }  
}