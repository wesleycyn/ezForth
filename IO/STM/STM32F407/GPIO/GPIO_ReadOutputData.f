\ uint16_t GPIO_ReadOutputData(GPIO_TypeDef* GPIOx)
: GPIO_ReadOutputData ( GPIO_TypeDef* GPIOx -- uint16_t )
 \  /* Check the parameters */
  assert_param(IS_GPIO_ALL_PERIPH(GPIOx));
 \ return ((uint16_t)GPIOx->ODR);
 GPIOx->ODR w@
;

\s
uint16_t GPIO_ReadOutputData(GPIO_TypeDef* GPIOx)
{
  /* Check the parameters */
  assert_param(IS_GPIO_ALL_PERIPH(GPIOx));

  return ((uint16_t)GPIOx->ODR);
}