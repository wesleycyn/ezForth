\ 1 CONSTANT USART1
\ 2 CONSTANT USART2
\ 3 CONSTANT USART3
\ 4 CONSTANT USART4
\ 5 CONSTANT USART5
\ 6 CONSTANT USART6
\ 7 CONSTANT USART7

create USART1 1 ,


: USART_DeInit ( USARTx -- ) 
   dup
   IS_USART_ALL_PERIPH   
   case
    USART1 of
        RCC_APB2Periph_USART1 ENABLE   RCC_APB2PeriphResetCmd 
        RCC_APB2Periph_USART1 DISABLE  RCC_APB2PeriphResetCmd
      endof

    USART6 of
        RCC_APB2Periph_USART6 ENABLE   RCC_APB2PeriphResetCmd 
        RCC_APB2Periph_USART6 DISABLE  RCC_APB2PeriphResetCmd
      endof
      
    USART2 of
        RCC_APB1Periph_USART7 ENABLE   RCC_APB1PeriphResetCmd 
        RCC_APB1Periph_USART7 DISABLE  RCC_APB1PeriphResetCmd
      endof

    USART3 of
        RCC_APB1Periph_USART7 ENABLE   RCC_APB1PeriphResetCmd 
        RCC_APB1Periph_USART7 DISABLE  RCC_APB1PeriphResetCmd
      endof
      
    USART4 of
        RCC_APB1Periph_USART7 ENABLE   RCC_APB1PeriphResetCmd 
        RCC_APB1Periph_USART7 DISABLE  RCC_APB1PeriphResetCmd
      endof
      
    USART5 of
        RCC_APB1Periph_USART7 ENABLE   RCC_APB1PeriphResetCmd 
        RCC_APB1Periph_USART7 DISABLE  RCC_APB1PeriphResetCmd
      endof
            
    USART7 of
        RCC_APB1Periph_USART7 ENABLE   RCC_APB1PeriphResetCmd 
        RCC_APB1Periph_USART7 DISABLE  RCC_APB1PeriphResetCmd
      endof                                 
   endcase
  ;

\s
void USART_DeInit(USART_TypeDef* USARTx)
{
  /* Check the parameters */
  assert_param(IS_USART_ALL_PERIPH(USARTx));

  if (USARTx == USART1)
  {
    RCC_APB2PeriphResetCmd(RCC_APB2Periph_USART1, ENABLE);
    RCC_APB2PeriphResetCmd(RCC_APB2Periph_USART1, DISABLE);
  }
  else if (USARTx == USART2)
  {
    RCC_APB1PeriphResetCmd(RCC_APB1Periph_USART2, ENABLE);
    RCC_APB1PeriphResetCmd(RCC_APB1Periph_USART2, DISABLE);
  }
  else if (USARTx == USART3)
  {
    RCC_APB1PeriphResetCmd(RCC_APB1Periph_USART3, ENABLE);
    RCC_APB1PeriphResetCmd(RCC_APB1Periph_USART3, DISABLE);
  }    
  else if (USARTx == UART4)
  {
    RCC_APB1PeriphResetCmd(RCC_APB1Periph_UART4, ENABLE);
    RCC_APB1PeriphResetCmd(RCC_APB1Periph_UART4, DISABLE);
  }
  else if (USARTx == UART5)
  {
    RCC_APB1PeriphResetCmd(RCC_APB1Periph_UART5, ENABLE);
    RCC_APB1PeriphResetCmd(RCC_APB1Periph_UART5, DISABLE);
  }  
  else if (USARTx == USART6)
  {
    RCC_APB2PeriphResetCmd(RCC_APB2Periph_USART6, ENABLE);
    RCC_APB2PeriphResetCmd(RCC_APB2Periph_USART6, DISABLE);
  }
  else if (USARTx == UART7)
  {
    RCC_APB1PeriphResetCmd(RCC_APB1Periph_UART7, ENABLE);
    RCC_APB1PeriphResetCmd(RCC_APB1Periph_UART7, DISABLE);
  }     
  else
  {
    if (USARTx == UART8)
    { 
      RCC_APB1PeriphResetCmd(RCC_APB1Periph_UART8, ENABLE);
      RCC_APB1PeriphResetCmd(RCC_APB1Periph_UART8, DISABLE);
    }
  }
}