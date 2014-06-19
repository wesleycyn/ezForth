void TIM_OC2PolarityConfig(TIM_TypeDef* TIMx, uint16_t TIM_OCPolarity)
{
  uint16_t tmpccer = 0;

  /* Check the parameters */
  assert_param(IS_TIM_LIST2_PERIPH(TIMx));
  assert_param(IS_TIM_OC_POLARITY(TIM_OCPolarity));

  tmpccer = TIMx->CCER;

  /* Set or Reset the CC2P Bit */
  tmpccer &= (uint16_t)(~TIM_CCER_CC2P);
  tmpccer |= (uint16_t)(TIM_OCPolarity << 4);

  /* Write to TIMx CCER register */
  TIMx->CCER = tmpccer;
}