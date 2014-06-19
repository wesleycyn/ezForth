uint32_t TIM_GetCapture3(TIM_TypeDef* TIMx)
{
  /* Check the parameters */
  assert_param(IS_TIM_LIST3_PERIPH(TIMx)); 

  /* Get the Capture 3 Register value */
  return TIMx->CCR3;
}