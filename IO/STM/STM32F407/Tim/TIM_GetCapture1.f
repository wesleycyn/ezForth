uint32_t TIM_GetCapture1(TIM_TypeDef* TIMx)
{
  /* Check the parameters */
  assert_param(IS_TIM_LIST1_PERIPH(TIMx));

  /* Get the Capture 1 Register value */
  return TIMx->CCR1;
}