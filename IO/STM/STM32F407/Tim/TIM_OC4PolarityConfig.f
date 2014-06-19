void TIM_OC4PolarityConfig(TIM_TypeDef* TIMx, uint16_t TIM_OCPolarity)
{
  uint16_t tmpccer = 0;

  /* Check the parameters */
  assert_param(IS_TIM_LIST3_PERIPH(TIMx));
  assert_param(IS_TIM_OC_POLARITY(TIM_OCPolarity));

  tmpccer = TIMx->CCER;

  /* Set or Reset the CC4P Bit */
  tmpccer &= (uint16_t)~TIM_CCER_CC4P;
  tmpccer |= (uint16_t)(TIM_OCPolarity << 12);

  /* Write to TIMx CCER register */
  TIMx->CCER = tmpccer;
}