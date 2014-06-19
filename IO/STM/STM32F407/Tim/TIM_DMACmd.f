void TIM_DMACmd(TIM_TypeDef* TIMx, uint16_t TIM_DMASource, FunctionalState NewState)
{ 
  /* Check the parameters */
  assert_param(IS_TIM_LIST5_PERIPH(TIMx)); 
  assert_param(IS_TIM_DMA_SOURCE(TIM_DMASource));
  assert_param(IS_FUNCTIONAL_STATE(NewState));
  
  if (NewState != DISABLE)
  {
    /* Enable the DMA sources */
    TIMx->DIER |= TIM_DMASource; 
  }
  else
  {
    /* Disable the DMA sources */
    TIMx->DIER &= (uint16_t)~TIM_DMASource;
  }
}