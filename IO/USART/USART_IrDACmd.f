: USART_IrDACmd ( USART_TypeDef* USARTx, FunctionalState NewState -- )

  \ /* Check the parameters */
  swap
  assert_param(IS_USART_ALL_PERIPH(USARTx));
  USARTx->CR3 >R
  
  assert_param(IS_FUNCTIONAL_STATE(NewState));
  
  \ (NewState != DISABLE)
  DISABLE <>  
  if
    \ /* Enable the IrDA mode by setting the IREN bit in the CR3 register */
    \ USARTx->CR3 |= USART_CR3_IREN;
    r@ w@ USART_CR3_IREN or r> w!
  else
    \ /* Disable the IrDA mode by clearing the IREN bit in the CR3 register */
    \ USARTx->CR3 &= (uint16_t)~((uint16_t)USART_CR3_IREN);
    r@ w@ USART_CR3_IREN and r> w!    
  then
;


\s

void USART_IrDACmd(USART_TypeDef* USARTx, FunctionalState NewState)
{
  /* Check the parameters */
  assert_param(IS_USART_ALL_PERIPH(USARTx));
  assert_param(IS_FUNCTIONAL_STATE(NewState));
    
  if (NewState != DISABLE)
  {
    /* Enable the IrDA mode by setting the IREN bit in the CR3 register */
    USARTx->CR3 |= USART_CR3_IREN;
  }
  else
  {
    /* Disable the IrDA mode by clearing the IREN bit in the CR3 register */
    USARTx->CR3 &= (uint16_t)~((uint16_t)USART_CR3_IREN);
  }
}