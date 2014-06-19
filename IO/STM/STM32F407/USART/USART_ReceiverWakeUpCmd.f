: USART_ReceiverWakeUpCmd ( USART_TypeDef* USARTx, FunctionalState NewState -- )

  \ /* Check the parameters */
  assert_param(IS_FUNCTIONAL_STATE(NewState)); 
  swap 
  assert_param(IS_USART_ALL_PERIPH(USARTx));
  USARTx->CR >r
  \ (NewState != DISABLE)
  DISABLE
  if 
    \ /* Enable the USART mute mode  by setting the RWU bit in the CR1 register */
    \ USARTx->CR1 |= USART_CR1_RWU;
     r@ w@ USART_CR1_RWU or r> w!
  else
    \ /* Disable the USART mute mode by clearing the RWU bit in the CR1 register */
    \ USARTx->CR1 &= (uint16_t)~((uint16_t)USART_CR1_RWU);
    r@ w@ USART_CR1_RWU and r> w!
  then
;

\s 
void USART_ReceiverWakeUpCmd(USART_TypeDef* USARTx, FunctionalState NewState)
{
  /* Check the parameters */
  assert_param(IS_USART_ALL_PERIPH(USARTx));
  assert_param(IS_FUNCTIONAL_STATE(NewState)); 
  
  if (NewState != DISABLE)
  {
    /* Enable the USART mute mode  by setting the RWU bit in the CR1 register */
    USARTx->CR1 |= USART_CR1_RWU;
  }
  else
  {
    /* Disable the USART mute mode by clearing the RWU bit in the CR1 register */
    USARTx->CR1 &= (uint16_t)~((uint16_t)USART_CR1_RWU);
  }
}