: USART_SmartCardCmd ( USART_TypeDef* USARTx, FunctionalState NewState -- )

  \ /* Check the parameters */
  assert_param(IS_FUNCTIONAL_STATE(NewState));
  swap
  assert_param(IS_USART_1236_PERIPH(USARTx));
  USARTx->CR3 >r

  DISABLE <>
  if
   \ /* Enable the SC mode by setting the SCEN bit in the CR3 register */
   \ USARTx->CR3 |= USART_CR3_SCEN;
   r@ w@  USART_CR3_SCEN or r@ w!
  else
   \ /* Disable the SC mode by clearing the SCEN bit in the CR3 register */
   \ USARTx->CR3 &= (uint16_t)~((uint16_t)USART_CR3_SCEN);
   r@ w@ USART_CR3_SCEN not and r> w!
;





\s
void USART_SmartCardCmd(USART_TypeDef* USARTx, FunctionalState NewState)
{
  /* Check the parameters */
  assert_param(IS_USART_1236_PERIPH(USARTx));
  assert_param(IS_FUNCTIONAL_STATE(NewState));
  if (NewState != DISABLE)
  {
    /* Enable the SC mode by setting the SCEN bit in the CR3 register */
    USARTx->CR3 |= USART_CR3_SCEN;
  }
  else
  {
    /* Disable the SC mode by clearing the SCEN bit in the CR3 register */
    USARTx->CR3 &= (uint16_t)~((uint16_t)USART_CR3_SCEN);
  }
}