: GPIO_ResetBits ( GPIO_TypeDef* GPIOx, uint16_t GPIO_Pin -- )
  \ /* Check the parameters */
  assert_param(IS_GPIO_PIN(GPIO_Pin));
  swap  
  assert_param(IS_GPIO_ALL_PERIPH(GPIOx));
  \ GPIOx->BSRRH = GPIO_Pin;
  GPIOx->BSRRH w!  
;

\s
void GPIO_ResetBits(GPIO_TypeDef* GPIOx, uint16_t GPIO_Pin)
{
  /* Check the parameters */
  assert_param(IS_GPIO_ALL_PERIPH(GPIOx));
  assert_param(IS_GPIO_PIN(GPIO_Pin));

  GPIOx->BSRRH = GPIO_Pin;
}