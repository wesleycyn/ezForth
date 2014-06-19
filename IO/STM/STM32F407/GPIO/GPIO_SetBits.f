: GPIO_SetBits ( GPIO_TypeDef* GPIOx, uint16_t GPIO_Pin -- )
  \ /* Check the parameters */
  assert_param(IS_GPIO_PIN(GPIO_Pin));
  swap
  assert_param(IS_GPIO_ALL_PERIPH(GPIOx));
  \ GPIOx->BSRRL = GPIO_Pin;
  GPIOx->BSRRL w!
;

\s
void GPIO_SetBits(GPIO_TypeDef* GPIOx, uint16_t GPIO_Pin)
{
  /* Check the parameters */
  assert_param(IS_GPIO_ALL_PERIPH(GPIOx));
  assert_param(IS_GPIO_PIN(GPIO_Pin));

  GPIOx->BSRRL = GPIO_Pin;
}