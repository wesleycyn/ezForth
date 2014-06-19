void TIM_ForcedOC2Config(TIM_TypeDef* TIMx, uint16_t TIM_ForcedAction)
{
  uint16_t tmpccmr1 = 0;

  /* Check the parameters */
  assert_param(IS_TIM_LIST2_PERIPH(TIMx));
  assert_param(IS_TIM_FORCED_ACTION(TIM_ForcedAction));
  tmpccmr1 = TIMx->CCMR1;

  /* Reset the OC2M Bits */
  tmpccmr1 &= (uint16_t)~TIM_CCMR1_OC2M;

  /* Configure The Forced output Mode */
  tmpccmr1 |= (uint16_t)(TIM_ForcedAction << 8);

  /* Write to TIMx CCMR1 register */
  TIMx->CCMR1 = tmpccmr1;
}