void TIM_OC3FastConfig(TIM_TypeDef* TIMx, uint16_t TIM_OCFast)
{
  uint16_t tmpccmr2 = 0;
  
  /* Check the parameters */
  assert_param(IS_TIM_LIST3_PERIPH(TIMx));
  assert_param(IS_TIM_OCFAST_STATE(TIM_OCFast));

  /* Get the TIMx CCMR2 register value */
  tmpccmr2 = TIMx->CCMR2;

  /* Reset the OC3FE Bit */
  tmpccmr2 &= (uint16_t)~TIM_CCMR2_OC3FE;

  /* Enable or Disable the Output Compare Fast Bit */
  tmpccmr2 |= TIM_OCFast;

  /* Write to TIMx CCMR2 */
  TIMx->CCMR2 = tmpccmr2;
}