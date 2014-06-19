: USART_LINCmd ( USART_TypeDef* USARTx, FunctionalState NewState -- )

  /* Check the parameters */
  assert_param(IS_FUNCTIONAL_STATE(NewState));
  swap  
  assert_param(IS_USART_ALL_PERIPH(USARTx));
  USARTx->CR2 >r
  \ (NewState != DISABLE)
  DISABLE <>
  if (NewState != DISABLE)
    \ /* Enable the LIN mode by setting the LINEN bit in the CR2 register */
    \ USARTx->CR2 |= USART_CR2_LINEN;
    r@ w@ USART_CR2_LINEN or r> w!
  else
    \ /* Disable the LIN mode by clearing the LINEN bit in the CR2 register */
    \ USARTx->CR2 &= (uint16_t)~((uint16_t)USART_CR2_LINEN);
        r@ w@ USART_CR2_LINEN and r> w!
  then
;

\s
void USART_LINCmd(USART_TypeDef* USARTx, FunctionalState NewState)
{
  /* Check the parameters */
  assert_param(IS_USART_ALL_PERIPH(USARTx));
  assert_param(IS_FUNCTIONAL_STATE(NewState));
  
  if (NewState != DISABLE)
  {
    /* Enable the LIN mode by setting the LINEN bit in the CR2 register */
    USARTx->CR2 |= USART_CR2_LINEN;
  }
  else
  {
    /* Disable the LIN mode by clearing the LINEN bit in the CR2 register */
    USARTx->CR2 &= (uint16_t)~((uint16_t)USART_CR2_LINEN);
  }
}