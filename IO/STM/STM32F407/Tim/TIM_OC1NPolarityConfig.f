void TIM_OC1NPolarityConfig(TIM_TypeDef* TIMx, uint16_t TIM_OCNPolarity)
{
  uint16_t tmpccer = 0;
  /* Check the parameters */
  assert_param(IS_TIM_LIST4_PERIPH(TIMx));
  assert_param(IS_TIM_OCN_POLARITY(TIM_OCNPolarity));
   
  tmpccer = TIMx->CCER;

  /* Set or Reset the CC1NP Bit */
  tmpccer &= (uint16_t)~TIM_CCER_CC1NP;
  tmpccer |= TIM_OCNPolarity;

  /* Write to TIMx CCER register */
  TIMx->CCER = tmpccer;
}