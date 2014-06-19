: USART_StructInit( -<USART_InitTypeDef* USART_InitStruct>- )
  /* USART_InitStruct members default value */
  9600                           USART_InitStruct->USART_BaudRate!  
  USART_WordLength_8b            USART_InitStruct->USART_WordLength!
  USART_StopBits_1               USART_InitStruct->USART_StopBits!
  USART_Parity_No                USART_InitStruct->USART_Parity!
  USART_Mode_Rx USART_Mode_Tx or USART_InitStruct->USART_Mode!
  USART_HardwareFlowControl_None USART_InitStruct->USART_HardwareFlowControl!
;

\s
void USART_StructInit(USART_InitTypeDef* USART_InitStruct)
{
  /* USART_InitStruct members default value */
  USART_InitStruct->USART_BaudRate = 9600;
  USART_InitStruct->USART_WordLength = USART_WordLength_8b;
  USART_InitStruct->USART_StopBits = USART_StopBits_1;
  USART_InitStruct->USART_Parity = USART_Parity_No ;
  USART_InitStruct->USART_Mode = USART_Mode_Rx | USART_Mode_Tx;
  USART_InitStruct->USART_HardwareFlowControl = USART_HardwareFlowControl_None;  
}