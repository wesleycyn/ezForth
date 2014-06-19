void TIM_SetCompare1(TIM_TypeDef* TIMx, uint32_t Compare1)
{
  /* Check the parameters */
  assert_param(IS_TIM_LIST1_PERIPH(TIMx));

  /* Set the Capture Compare1 Register value */
  TIMx->CCR1 = Compare1;
}