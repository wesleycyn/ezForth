: USART_IrDAConfig ( USART_TypeDef* USARTx, uint16_t USART_IrDAMode -- )
  \ /* Check the parameters */
  swap
  assert_param(IS_USART_ALL_PERIPH(USARTx));
  USARTx->CR3 >r
  assert_param(IS_USART_IRDA_MODE(USART_IrDAMode));
     
  \ USARTx->CR3 &= (uint16_t)~((uint16_t)USART_CR3_IRLP);
  r@ w@ USART_CR3_IRLP and r@ w!

  \ USARTx->CR3 |= USART_IrDAMode;
  r@ w@ USART_CR3_IRLP or r@ w!
;

\s

void USART_IrDAConfig(USART_TypeDef* USARTx, uint16_t USART_IrDAMode)
{
  /* Check the parameters */
  assert_param(IS_USART_ALL_PERIPH(USARTx));
  assert_param(IS_USART_IRDA_MODE(USART_IrDAMode));
    
  USARTx->CR3 &= (uint16_t)~((uint16_t)USART_CR3_IRLP);
  USARTx->CR3 |= USART_IrDAMode;
}