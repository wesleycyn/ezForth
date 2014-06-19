: USART_SendBreak ( USART_TypeDef* USARTx )
  \ /* Check the parameters */
  assert_param(IS_USART_ALL_PERIPH(USARTx));
  USARTx->CR1 >r
  \ /* Send break characters */
  \ USARTx->CR1 |= USART_CR1_SBK;
  r@ w@ USART_CR1_SBK or r@ w!
;

\s
void USART_SendBreak(USART_TypeDef* USARTx)
{
  /* Check the parameters */
  assert_param(IS_USART_ALL_PERIPH(USARTx));
  
  /* Send break characters */
  USARTx->CR1 |= USART_CR1_SBK;
}