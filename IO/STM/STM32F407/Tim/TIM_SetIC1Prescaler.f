void TIM_SetIC1Prescaler(TIM_TypeDef* TIMx, uint16_t TIM_ICPSC)
{
  /* Check the parameters */
  assert_param(IS_TIM_LIST1_PERIPH(TIMx));
  assert_param(IS_TIM_IC_PRESCALER(TIM_ICPSC));

  /* Reset the IC1PSC Bits */
  TIMx->CCMR1 &= (uint16_t)~TIM_CCMR1_IC1PSC;

  /* Set the IC1PSC value */
  TIMx->CCMR1 |= TIM_ICPSC;
}