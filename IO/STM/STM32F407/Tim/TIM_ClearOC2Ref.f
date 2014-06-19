void TIM_ClearOC2Ref(TIM_TypeDef* TIMx, uint16_t TIM_OCClear)
{
  uint16_t tmpccmr1 = 0;

  /* Check the parameters */
  assert_param(IS_TIM_LIST2_PERIPH(TIMx));
  assert_param(IS_TIM_OCCLEAR_STATE(TIM_OCClear));

  tmpccmr1 = TIMx->CCMR1;

  /* Reset the OC2CE Bit */
  tmpccmr1 &= (uint16_t)~TIM_CCMR1_OC2CE;

  /* Enable or Disable the Output Compare Clear Bit */
  tmpccmr1 |= (uint16_t)(TIM_OCClear << 8);

  /* Write to TIMx CCMR1 register */
  TIMx->CCMR1 = tmpccmr1;
}
