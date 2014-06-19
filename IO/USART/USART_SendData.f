: USART_SendData ( USART_TypeDef* USARTx, uint16_t Data )
  \ /* Check the parameters */
  
  assert_param(IS_USART_DATA(Data));
  swap  
  assert_param(IS_USART_ALL_PERIPH(USARTx));
  USARTx->DR >r
    
  \ /* Transmit Data */
  \ USARTx->DR = (Data & (uint16_t)0x01FF);
  0x1ff and r@ w!
;


\s
void USART_SendData(USART_TypeDef* USARTx, uint16_t Data)
{
  /* Check the parameters */
  assert_param(IS_USART_ALL_PERIPH(USARTx));
  assert_param(IS_USART_DATA(Data)); 
    
  /* Transmit Data */
  USARTx->DR = (Data & (uint16_t)0x01FF);
}