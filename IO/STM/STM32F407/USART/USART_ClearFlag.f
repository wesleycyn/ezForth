: USART_ClearFlag ( USART_TypeDef* USARTx, uint16_t USART_FLAG -- )
  USART_FLAG USART_FLAG_CTS and
  USART_FLAG_CTS
  USART_FLAG not USARTx->SR w!
  ;
  


\s
void USART_ClearFlag(USART_TypeDef* USARTx, uint16_t USART_FLAG)
{
  /* Check the parameters */
  assert_param(IS_USART_ALL_PERIPH(USARTx));
  assert_param(IS_USART_CLEAR_FLAG(USART_FLAG));

  /* The CTS flag is not available for UART4 and UART5 */
  if ((USART_FLAG & USART_FLAG_CTS) == USART_FLAG_CTS)
  {
    assert_param(IS_USART_1236_PERIPH(USARTx));
  } 
       
  USARTx->SR = (uint16_t)~USART_FLAG;
}