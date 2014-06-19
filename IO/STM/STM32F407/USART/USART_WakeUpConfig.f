: USART_WakeUpConfig ( USART_TypeDef* USARTx -<uint16_t USART_WakeUp>- )
\  /* Check the parameters */

   assert_param(IS_USART_WAKEUP(USART_WakeUp));
   swap 
   assert_param(IS_USART_ALL_PERIPH(USARTx));

   USARTx->CR1 >R  
\  
\  USARTx->CR1 &= (uint16_t)~((uint16_t)USART_CR1_WAKE);      
  USART_CR1_WAKE@ not r@ w@ and  r@ w!
\  USARTx->CR1 |= USART_WakeUp;
   r@ w@ or r> w!
  ;

\s
void USART_WakeUpConfig(USART_TypeDef* USARTx, uint16_t USART_WakeUp)
{
  /* Check the parameters */
  assert_param(IS_USART_ALL_PERIPH(USARTx));
  assert_param(IS_USART_WAKEUP(USART_WakeUp));
  
  USARTx->CR1 &= (uint16_t)~((uint16_t)USART_CR1_WAKE);
  USARTx->CR1 |= USART_WakeUp;
}