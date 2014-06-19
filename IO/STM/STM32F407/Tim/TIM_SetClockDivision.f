void TIM_SetClockDivision(TIM_TypeDef* TIMx, uint16_t TIM_CKD)
{
  /* Check the parameters */
  assert_param(IS_TIM_LIST1_PERIPH(TIMx));
  assert_param(IS_TIM_CKD_DIV(TIM_CKD));

  /* Reset the CKD Bits */
  TIMx->CR1 &= (uint16_t)(~TIM_CR1_CKD);

  /* Set the CKD value */
  TIMx->CR1 |= TIM_CKD;
}