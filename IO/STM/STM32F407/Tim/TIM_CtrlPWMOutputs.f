void TIM_CtrlPWMOutputs(TIM_TypeDef* TIMx, FunctionalState NewState)
{
  /* Check the parameters */
  assert_param(IS_TIM_LIST4_PERIPH(TIMx));
  assert_param(IS_FUNCTIONAL_STATE(NewState));

  if (NewState != DISABLE)
  {
    /* Enable the TIM Main Output */
    TIMx->BDTR |= TIM_BDTR_MOE;
  }
  else
  {
    /* Disable the TIM Main Output */
    TIMx->BDTR &= (uint16_t)~TIM_BDTR_MOE;
  }  
}