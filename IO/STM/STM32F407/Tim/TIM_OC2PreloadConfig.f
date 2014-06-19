void TIM_OC2PreloadConfig(TIM_TypeDef* TIMx, uint16_t TIM_OCPreload)
{
  uint16_t tmpccmr1 = 0;

  /* Check the parameters */
  assert_param(IS_TIM_LIST2_PERIPH(TIMx));
  assert_param(IS_TIM_OCPRELOAD_STATE(TIM_OCPreload));

  tmpccmr1 = TIMx->CCMR1;

  /* Reset the OC2PE Bit */
  tmpccmr1 &= (uint16_t)(~TIM_CCMR1_OC2PE);

  /* Enable or Disable the Output Compare Preload feature */
  tmpccmr1 |= (uint16_t)(TIM_OCPreload << 8);

  /* Write to TIMx CCMR1 register */
  TIMx->CCMR1 = tmpccmr1;
}