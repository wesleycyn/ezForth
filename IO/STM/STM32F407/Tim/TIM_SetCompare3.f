void TIM_SetCompare3(TIM_TypeDef* TIMx, uint32_t Compare3)
{
  /* Check the parameters */
  assert_param(IS_TIM_LIST3_PERIPH(TIMx));

  /* Set the Capture Compare3 Register value */
  TIMx->CCR3 = Compare3;
}
