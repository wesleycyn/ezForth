void TIM_ETRClockMode2Config(TIM_TypeDef* TIMx, uint16_t TIM_ExtTRGPrescaler, 
                             uint16_t TIM_ExtTRGPolarity, uint16_t ExtTRGFilter)
{
  /* Check the parameters */
  assert_param(IS_TIM_LIST3_PERIPH(TIMx));
  assert_param(IS_TIM_EXT_PRESCALER(TIM_ExtTRGPrescaler));
  assert_param(IS_TIM_EXT_POLARITY(TIM_ExtTRGPolarity));
  assert_param(IS_TIM_EXT_FILTER(ExtTRGFilter));

  /* Configure the ETR Clock source */
  TIM_ETRConfig(TIMx, TIM_ExtTRGPrescaler, TIM_ExtTRGPolarity, ExtTRGFilter);

  /* Enable the External clock mode2 */
  TIMx->SMCR |= TIM_SMCR_ECE;
}