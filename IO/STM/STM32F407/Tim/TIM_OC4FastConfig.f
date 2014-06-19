void TIM_OC4FastConfig(TIM_TypeDef* TIMx, uint16_t TIM_OCFast)
{
  uint16_t tmpccmr2 = 0;

  /* Check the parameters */
  assert_param(IS_TIM_LIST3_PERIPH(TIMx));
  assert_param(IS_TIM_OCFAST_STATE(TIM_OCFast));

  /* Get the TIMx CCMR2 register value */
  tmpccmr2 = TIMx->CCMR2;

  /* Reset the OC4FE Bit */
  tmpccmr2 &= (uint16_t)(~TIM_CCMR2_OC4FE);

  /* Enable or Disable the Output Compare Fast Bit */
  tmpccmr2 |= (uint16_t)(TIM_OCFast << 8);

  /* Write to TIMx CCMR2 */
  TIMx->CCMR2 = tmpccmr2;
}