: USART_OneBitMethodCmd ( USART_TypeDef* USARTx, FunctionalState NewState -- )

  \ /* Check the parameters */
  
  swap 
  assert_param(IS_USART_ALL_PERIPH(USARTx));
  USARTx->CR3 >R
    
  assert_param(IS_FUNCTIONAL_STATE(NewState)); 

  \  (NewState != DISABLE)
  
  DISABLE <>
  if 
    \ /* Enable the one bit method by setting the ONEBITE bit in the CR3 register */
    \ USARTx->CR3 |= USART_CR3_ONEBIT;
    r@ w@ USART_CR3_ONEBIT or r@ w!
  else
    \ /* Disable the one bit method by clearing the ONEBITE bit in the CR3 register */
    \ USARTx->CR3 &= (uint16_t)~((uint16_t)USART_CR3_ONEBIT);
    r@ w@ USART_CR3_ONEBIT and r@ w!    
  then
;

\s

void USART_OneBitMethodCmd(USART_TypeDef* USARTx, FunctionalState NewState)
{
  /* Check the parameters */
  assert_param(IS_USART_ALL_PERIPH(USARTx));
  assert_param(IS_FUNCTIONAL_STATE(NewState));
  
  if (NewState != DISABLE)
  {
    /* Enable the one bit method by setting the ONEBITE bit in the CR3 register */
    USARTx->CR3 |= USART_CR3_ONEBIT;
  }
  else
  {
    /* Disable the one bit method by clearing the ONEBITE bit in the CR3 register */
    USARTx->CR3 &= (uint16_t)~((uint16_t)USART_CR3_ONEBIT);
  }
}