uint32_t TIM_GetCapture2(TIM_TypeDef* TIMx)
{
  /* Check the parameters */
  assert_param(IS_TIM_LIST2_PERIPH(TIMx));

  /* Get the Capture 2 Register value */
  return TIMx->CCR2;
}