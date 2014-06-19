void TIM_SetCounter(TIM_TypeDef* TIMx, uint32_t Counter)
{
  /* Check the parameters */
   assert_param(IS_TIM_ALL_PERIPH(TIMx));

  /* Set the Counter Register value */
  TIMx->CNT = Counter;
}