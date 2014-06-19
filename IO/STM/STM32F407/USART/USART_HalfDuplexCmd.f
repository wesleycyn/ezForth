
: USART_HalfDuplexCmd ( USART_TypeDef* USARTx, FunctionalState NewState -- )
{
  \ /* Check the parameters */
  swap  
  assert_param(IS_USART_ALL_PERIPH(USARTx));
  USARTx->CR3 >r
  assert_param(IS_FUNCTIONAL_STATE(NewState));
  
  \ (NewState != DISABLE)
  DISABLE <>
  if
    \ /* Enable the Half-Duplex mode by setting the HDSEL bit in the CR3 register */
    \ USARTx->CR3 |= USART_CR3_HDSEL;
    r@ w@ USART_CR3_HDSEL or r@ w!
  else
    \ /* Disable the Half-Duplex mode by clearing the HDSEL bit in the CR3 register */
    \ USARTx->CR3 &= (uint16_t)~((uint16_t)USART_CR3_HDSEL);
    r@ w@ USART_CR3_HDSEL and r@ w!    
  then
;


\s
void USART_HalfDuplexCmd(USART_TypeDef* USARTx, FunctionalState NewState)
{
  /* Check the parameters */
  assert_param(IS_USART_ALL_PERIPH(USARTx));
  assert_param(IS_FUNCTIONAL_STATE(NewState));
  
  if (NewState != DISABLE)
  {
    /* Enable the Half-Duplex mode by setting the HDSEL bit in the CR3 register */
    USARTx->CR3 |= USART_CR3_HDSEL;
  }
  else
  {
    /* Disable the Half-Duplex mode by clearing the HDSEL bit in the CR3 register */
    USARTx->CR3 &= (uint16_t)~((uint16_t)USART_CR3_HDSEL);
  }
}