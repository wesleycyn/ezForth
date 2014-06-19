: USART_SetPrescaler ( USART_TypeDef* USARTx, uint8_t USART_Prescaler -- )
 
  \ /* Check the parameters */
  swap
  assert_param(IS_USART_ALL_PERIPH(USARTx));
  USARTx->GTPR >r
  \ /* Clear the USART prescaler */
  \ USARTx->GTPR &= USART_GTPR_GT;  
  r@ w@ USART_GTPR_GT and r@ w!
  \ /* Set the USART prescaler */
  \ USARTx->GTPR |= USART_Prescaler;
  r@ w@ or r> w!
;

\s
void USART_SetPrescaler(USART_TypeDef* USARTx, uint8_t USART_Prescaler)
{ 
  /* Check the parameters */
  assert_param(IS_USART_ALL_PERIPH(USARTx));
  
  /* Clear the USART prescaler */
  USARTx->GTPR &= USART_GTPR_GT;
  /* Set the USART prescaler */
  USARTx->GTPR |= USART_Prescaler;
}