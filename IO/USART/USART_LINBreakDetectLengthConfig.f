
: USART_LINBreakDetectLengthConfig( USART_TypeDef* USARTx, uint16_t USART_LINBreakDetectLength -- )
  \ /* Check the parameters */
  swap
  assert_param(IS_USART_ALL_PERIPH(USARTx));
  USARTx->CR2 >r
  assert_param(IS_USART_LIN_BREAK_DETECT_LENGTH(USART_LINBreakDetectLength));
  
  \ USARTx->CR2 &= (uint16_t)~((uint16_t)USART_CR2_LBDL);
  r@ w@ USART_CR2_LBDL and r@ w!
  \ USARTx->CR2 |= USART_LINBreakDetectLength;
  r@ w@ USART_CR2_LBDL or r@ w!    
;



\s
void USART_LINBreakDetectLengthConfig(USART_TypeDef* USARTx, uint16_t USART_LINBreakDetectLength)
{
  /* Check the parameters */
  assert_param(IS_USART_ALL_PERIPH(USARTx));
  assert_param(IS_USART_LIN_BREAK_DETECT_LENGTH(USART_LINBreakDetectLength));
  
  USARTx->CR2 &= (uint16_t)~((uint16_t)USART_CR2_LBDL);
  USARTx->CR2 |= USART_LINBreakDetectLength;  
}