\ uint16_t GPIO_ReadInputData(GPIO_TypeDef* GPIOx)

: GPIO_ReadInputData ( GPIO_TypeDef* GPIOx -- uint16_t )
  \ /* Check the parameters */
  assert_param(IS_GPIO_ALL_PERIPH(GPIOx));
  \ return ((uint16_t)GPIOx->IDR);
  GPIOx->IDR w@
;




\s
uint16_t GPIO_ReadInputData(GPIO_TypeDef* GPIOx)
{
  /* Check the parameters */
  assert_param(IS_GPIO_ALL_PERIPH(GPIOx));

  return ((uint16_t)GPIOx->IDR);
}