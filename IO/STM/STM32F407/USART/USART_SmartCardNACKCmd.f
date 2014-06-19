: USART_SmartCardNACKCmd ( USART_TypeDef* USARTx, FunctionalState NewState -- )
\  /* Check the parameters */
  assert_param(IS_FUNCTIONAL_STATE(NewState));
  swap
  assert_param(IS_USART_1236_PERIPH(USARTx)); 
  USARTx->CR3 >r

  DISABLE <>
  if       
\    /* Enable the NACK transmission by setting the NACK bit in the CR3 register */
\    USARTx->CR3 |= USART_CR3_NACK;
   r@ w@ USART_CR3_NACK or r@ w!
  else
\    /* Disable the NACK transmission by clearing the NACK bit in the CR3 register */
\    USARTx->CR3 &= (uint16_t)~((uint16_t)USART_CR3_NACK);  
   USART_CR3_NACK not r@ w@ and r> w! 
  then 
 ;



\s
void USART_SmartCardNACKCmd(USART_TypeDef* USARTx, FunctionalState NewState)
{
  /* Check the parameters */
  assert_param(IS_USART_1236_PERIPH(USARTx)); 
  assert_param(IS_FUNCTIONAL_STATE(NewState));
  if (NewState != DISABLE)
  {
    /* Enable the NACK transmission by setting the NACK bit in the CR3 register */
    USARTx->CR3 |= USART_CR3_NACK;
  }
  else
  {
    /* Disable the NACK transmission by clearing the NACK bit in the CR3 register */
    USARTx->CR3 &= (uint16_t)~((uint16_t)USART_CR3_NACK);
  }
}