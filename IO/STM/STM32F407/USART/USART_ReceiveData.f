: USART_ReceiveData( USART_TypeDef* USARTx -- )
  \ /* Check the parameters */
  assert_param(IS_USART_ALL_PERIPH(USARTx));
  USARTx->DR >r
  \ /* Receive Data */
  \ return (uint16_t)(USARTx->DR & (uint16_t)0x01FF);
  r> w@ 0x01FF and
;

\s
uint16_t USART_ReceiveData(USART_TypeDef* USARTx)
{
  /* Check the parameters */
  assert_param(IS_USART_ALL_PERIPH(USARTx));
  
  /* Receive Data */
  return (uint16_t)(USARTx->DR & (uint16_t)0x01FF);
}