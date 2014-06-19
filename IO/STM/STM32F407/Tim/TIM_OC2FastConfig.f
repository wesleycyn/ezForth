void TIM_OC2FastConfig(TIM_TypeDef* TIMx, uint16_t TIM_OCFast)
{
  uint16_t tmpccmr1 = 0;

  /* Check the parameters */
  assert_param(IS_TIM_LIST2_PERIPH(TIMx));
  assert_param(IS_TIM_OCFAST_STATE(TIM_OCFast));

  /* Get the TIMx CCMR1 register value */
  tmpccmr1 = TIMx->CCMR1;

  /* Reset the OC2FE Bit */
  tmpccmr1 &= (uint16_t)(~TIM_CCMR1_OC2FE);

  /* Enable or Disable the Output Compare Fast Bit */
  tmpccmr1 |= (uint16_t)(TIM_OCFast << 8);

  /* Write to TIMx CCMR1 */
  TIMx->CCMR1 = tmpccmr1;
}