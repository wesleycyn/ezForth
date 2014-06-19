static void TI1_Config(TIM_TypeDef* TIMx, uint16_t TIM_ICPolarity, uint16_t TIM_ICSelection,
                       uint16_t TIM_ICFilter)
{
  uint16_t tmpccmr1 = 0, tmpccer = 0;

  /* Disable the Channel 1: Reset the CC1E Bit */
  TIMx->CCER &= (uint16_t)~TIM_CCER_CC1E;
  tmpccmr1 = TIMx->CCMR1;
  tmpccer = TIMx->CCER;

  /* Select the Input and set the filter */
  tmpccmr1 &= ((uint16_t)~TIM_CCMR1_CC1S) & ((uint16_t)~TIM_CCMR1_IC1F);
  tmpccmr1 |= (uint16_t)(TIM_ICSelection | (uint16_t)(TIM_ICFilter << (uint16_t)4));

  /* Select the Polarity and set the CC1E Bit */
  tmpccer &= (uint16_t)~(TIM_CCER_CC1P | TIM_CCER_CC1NP);
  tmpccer |= (uint16_t)(TIM_ICPolarity | (uint16_t)TIM_CCER_CC1E);

  /* Write to TIMx CCMR1 and CCER registers */
  TIMx->CCMR1 = tmpccmr1;
  TIMx->CCER = tmpccer;
}