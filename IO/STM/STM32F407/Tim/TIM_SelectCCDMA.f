void TIM_SelectCCDMA(TIM_TypeDef* TIMx, FunctionalState NewState)
{
  /* Check the parameters */
  assert_param(IS_TIM_LIST3_PERIPH(TIMx));
  assert_param(IS_FUNCTIONAL_STATE(NewState));

  if (NewState != DISABLE)
  {
    /* Set the CCDS Bit */
    TIMx->CR2 |= TIM_CR2_CCDS;
  }
  else
  {
    /* Reset the CCDS Bit */
    TIMx->CR2 &= (uint16_t)~TIM_CR2_CCDS;
  }
}