: GPIO_Write ( GPIO_TypeDef* GPIOx, uint16_t PortVal -- )

  \ /* Check the parameters */
  swap
  assert_param(IS_GPIO_ALL_PERIPH(GPIOx));
  \   GPIOx->ODR = PortVal;
  GPIOx->ODR w!
;

\s
void GPIO_Write(GPIO_TypeDef* GPIOx, uint16_t PortVal)
{
  /* Check the parameters */
  assert_param(IS_GPIO_ALL_PERIPH(GPIOx));

  GPIOx->ODR = PortVal;
}