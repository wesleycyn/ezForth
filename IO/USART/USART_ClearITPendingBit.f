: USART_ClearITPendingBit ( USART_TypeDef* USARTx, uint16_t USART_IT -- )
  USART_IT USART_IT_CTS =
  if
     \  assert_param(IS_USART_1236_PERIPH(USARTx));
  then
  USART_IT  0x08  >>   bitpos !
  0x01 bitpos w@  Lshift
  itmask w@ not USARTx->SR w!
  ; 


\s
void USART_ClearITPendingBit(USART_TypeDef* USARTx, uint16_t USART_IT)
{
  uint16_t bitpos = 0x00, itmask = 0x00;
  /* Check the parameters */
  assert_param(IS_USART_ALL_PERIPH(USARTx));
  assert_param(IS_USART_CLEAR_IT(USART_IT)); 

  /* The CTS interrupt is not available for UART4 and UART5 */
  if (USART_IT == USART_IT_CTS)
  {
    assert_param(IS_USART_1236_PERIPH(USARTx));
  } 
    
  bitpos = USART_IT >> 0x08;
  itmask = ((uint16_t)0x01 << (uint16_t)bitpos);
  USARTx->SR = (uint16_t)~itmask;
}