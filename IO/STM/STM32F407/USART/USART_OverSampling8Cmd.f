: USART_OverSampling8Cmd ( USART_TypeDef* USARTx, FunctionalState NewState -- )
  \ /* Check the parameters */
  swap
  assert_param(IS_USART_ALL_PERIPH(USARTx));
  USARTx->CR1 >r  
  
  assert_param(IS_FUNCTIONAL_STATE(NewState)); 
 

  \ (NewState != DISABLE)
  DISABLE <>
    \ /* Enable the 8x Oversampling mode by setting the OVER8 bit in the CR1 register */
    \ USARTx->CR1 |= USART_CR1_OVER8;
    r@ w@ USART_CR1_OVER8 or r@ w!
  else
    \ /* Disable the 8x Oversampling mode by clearing the OVER8 bit in the CR1 register */
    \ USARTx->CR1 &= (uint16_t)~((uint16_t)USART_CR1_OVER8);
    r@ w@ USART_CR1_OVER8 and r> w!
  then  
;

\s
void USART_OverSampling8Cmd(USART_TypeDef* USARTx, FunctionalState NewState)
{
  /* Check the parameters */
  assert_param(IS_USART_ALL_PERIPH(USARTx));
  assert_param(IS_FUNCTIONAL_STATE(NewState));
  
  if (NewState != DISABLE)
  {
    /* Enable the 8x Oversampling mode by setting the OVER8 bit in the CR1 register */
    USARTx->CR1 |= USART_CR1_OVER8;
  }
  else
  {
    /* Disable the 8x Oversampling mode by clearing the OVER8 bit in the CR1 register */
    USARTx->CR1 &= (uint16_t)~((uint16_t)USART_CR1_OVER8);
  }
} 