void TIM_ClearOC4Ref(TIM_TypeDef* TIMx, uint16_t TIM_OCClear)
{
  uint16_t tmpccmr2 = 0;

  /* Check the parameters */
  assert_param(IS_TIM_LIST3_PERIPH(TIMx));
  assert_param(IS_TIM_OCCLEAR_STATE(TIM_OCClear));

  tmpccmr2 = TIMx->CCMR2;

  /* Reset the OC4CE Bit */
  tmpccmr2 &= (uint16_t)~TIM_CCMR2_OC4CE;

  /* Enable or Disable the Output Compare Clear Bit */
  tmpccmr2 |= (uint16_t)(TIM_OCClear << 8);

  /* Write to TIMx CCMR2 register */
  TIMx->CCMR2 = tmpccmr2;
}