void TIM_InternalClockConfig(TIM_TypeDef* TIMx)
{
  /* Check the parameters */
  assert_param(IS_TIM_LIST2_PERIPH(TIMx));

  /* Disable slave mode to clock the prescaler directly with the internal clock */
  TIMx->SMCR &=  (uint16_t)~TIM_SMCR_SMS;
}