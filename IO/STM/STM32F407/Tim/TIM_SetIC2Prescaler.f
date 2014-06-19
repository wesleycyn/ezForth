void TIM_SetIC2Prescaler(TIM_TypeDef* TIMx, uint16_t TIM_ICPSC)
{
  /* Check the parameters */
  assert_param(IS_TIM_LIST2_PERIPH(TIMx));
  assert_param(IS_TIM_IC_PRESCALER(TIM_ICPSC));

  /* Reset the IC2PSC Bits */
  TIMx->CCMR1 &= (uint16_t)~TIM_CCMR1_IC2PSC;

  /* Set the IC2PSC value */
  TIMx->CCMR1 |= (uint16_t)(TIM_ICPSC << 8);
}