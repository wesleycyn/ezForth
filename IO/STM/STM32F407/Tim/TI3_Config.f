static void TI3_Config(TIM_TypeDef* TIMx, uint16_t TIM_ICPolarity, uint16_t TIM_ICSelection,
                       uint16_t TIM_ICFilter)
{
  uint16_t tmpccmr2 = 0, tmpccer = 0, tmp = 0;

  /* Disable the Channel 3: Reset the CC3E Bit */
  TIMx->CCER &= (uint16_t)~TIM_CCER_CC3E;
  tmpccmr2 = TIMx->CCMR2;
  tmpccer = TIMx->CCER;
  tmp = (uint16_t)(TIM_ICPolarity << 8);

  /* Select the Input and set the filter */
  tmpccmr2 &= ((uint16_t)~TIM_CCMR1_CC1S) & ((uint16_t)~TIM_CCMR2_IC3F);
  tmpccmr2 |= (uint16_t)(TIM_ICSelection | (uint16_t)(TIM_ICFilter << (uint16_t)4));

  /* Select the Polarity and set the CC3E Bit */
  tmpccer &= (uint16_t)~(TIM_CCER_CC3P | TIM_CCER_CC3NP);
  tmpccer |= (uint16_t)(tmp | (uint16_t)TIM_CCER_CC3E);

  /* Write to TIMx CCMR2 and CCER registers */
  TIMx->CCMR2 = tmpccmr2;
  TIMx->CCER = tmpccer;
}