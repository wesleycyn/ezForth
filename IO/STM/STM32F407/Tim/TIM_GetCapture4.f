uint32_t TIM_GetCapture4(TIM_TypeDef* TIMx)
{
  /* Check the parameters */
  assert_param(IS_TIM_LIST3_PERIPH(TIMx));

  /* Get the Capture 4 Register value */
  return TIMx->CCR4;
}