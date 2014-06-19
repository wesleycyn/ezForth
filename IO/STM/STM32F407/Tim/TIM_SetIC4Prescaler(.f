void TIM_SetIC4Prescaler(TIM_TypeDef* TIMx, uint16_t TIM_ICPSC)
{  
  /* Check the parameters */
  assert_param(IS_TIM_LIST3_PERIPH(TIMx));
  assert_param(IS_TIM_IC_PRESCALER(TIM_ICPSC));

  /* Reset the IC4PSC Bits */
  TIMx->CCMR2 &= (uint16_t)~TIM_CCMR2_IC4PSC;

  /* Set the IC4PSC value */
  TIMx->CCMR2 |= (uint16_t)(TIM_ICPSC << 8);
}