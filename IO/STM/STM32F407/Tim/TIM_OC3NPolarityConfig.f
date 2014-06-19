void TIM_OC3NPolarityConfig(TIM_TypeDef* TIMx, uint16_t TIM_OCNPolarity)
{
  uint16_t tmpccer = 0;
 
  /* Check the parameters */
  assert_param(IS_TIM_LIST4_PERIPH(TIMx));
  assert_param(IS_TIM_OCN_POLARITY(TIM_OCNPolarity));
    
  tmpccer = TIMx->CCER;

  /* Set or Reset the CC3NP Bit */
  tmpccer &= (uint16_t)~TIM_CCER_CC3NP;
  tmpccer |= (uint16_t)(TIM_OCNPolarity << 8);

  /* Write to TIMx CCER register */
  TIMx->CCER = tmpccer;
}