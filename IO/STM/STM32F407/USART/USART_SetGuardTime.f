: USART_SetGuardTime ( USART_TypeDef* USARTx, uint8_t USART_GuardTime -- )
    
  \ /* Check the parameters */
  swap
  assert_param(IS_USART_1236_PERIPH(USARTx));
  >R
  
  \ /* Clear the USART Guard time */
  \ USARTx->GTPR &= USART_GTPR_PSC;
  r@ w@  USART_GTPR_PSC and r@ w!
  
  \ /* Set the USART guard time */
  \ USARTx->GTPR |= (uint16_t)((uint16_t)USART_GuardTime << 0x08);
  r@ w@     USART_GuardTime 8 lshift or r@ w!  
  ;







\s
void USART_SetGuardTime(USART_TypeDef* USARTx, uint8_t USART_GuardTime)
{    
  /* Check the parameters */
  assert_param(IS_USART_1236_PERIPH(USARTx));
  
  /* Clear the USART Guard time */
  USARTx->GTPR &= USART_GTPR_PSC;
  /* Set the USART guard time */
  USARTx->GTPR |= (uint16_t)((uint16_t)USART_GuardTime << 0x08);
}