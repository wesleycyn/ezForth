void TIM_ClearOC1Ref(TIM_TypeDef* TIMx, uint16_t TIM_OCClear)
{
  uint16_t tmpccmr1 = 0;

  /* Check the parameters */
  assert_param(IS_TIM_LIST1_PERIPH(TIMx));
  assert_param(IS_TIM_OCCLEAR_STATE(TIM_OCClear));

  tmpccmr1 = TIMx->CCMR1;

  /* Reset the OC1CE Bit */
  tmpccmr1 &= (uint16_t)~TIM_CCMR1_OC1CE;

  /* Enable or Disable the Output Compare Clear Bit */
  tmpccmr1 |= TIM_OCClear;

  /* Write to TIMx CCMR1 register */
  TIMx->CCMR1 = tmpccmr1;
}