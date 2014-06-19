void TIM_ARRPreloadConfig(TIM_TypeDef* TIMx, FunctionalState NewState)
{
  /* Check the parameters */
  assert_param(IS_TIM_ALL_PERIPH(TIMx));
  assert_param(IS_FUNCTIONAL_STATE(NewState));

  if (NewState != DISABLE)
  {
    /* Set the ARR Preload Bit */
    TIMx->CR1 |= TIM_CR1_ARPE;
  }
  else
  {
    /* Reset the ARR Preload Bit */
    TIMx->CR1 &= (uint16_t)~TIM_CR1_ARPE;
  }
}