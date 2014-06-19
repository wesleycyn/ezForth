void TIM_SelectCOM(TIM_TypeDef* TIMx, FunctionalState NewState)
{
  /* Check the parameters */
  assert_param(IS_TIM_LIST4_PERIPH(TIMx));
  assert_param(IS_FUNCTIONAL_STATE(NewState));

  if (NewState != DISABLE)
  {
    /* Set the COM Bit */
    TIMx->CR2 |= TIM_CR2_CCUS;
  }
  else
  {
    /* Reset the COM Bit */
    TIMx->CR2 &= (uint16_t)~TIM_CR2_CCUS;
  }
}