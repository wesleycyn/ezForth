void TIM_SelectOutputTrigger(TIM_TypeDef* TIMx, uint16_t TIM_TRGOSource)
{
  /* Check the parameters */
  assert_param(IS_TIM_LIST5_PERIPH(TIMx));
  assert_param(IS_TIM_TRGO_SOURCE(TIM_TRGOSource));

  /* Reset the MMS Bits */
  TIMx->CR2 &= (uint16_t)~TIM_CR2_MMS;
  /* Select the TRGO source */
  TIMx->CR2 |=  TIM_TRGOSource;
}