: GPIO_ToggleBits ( GPIO_TypeDef* GPIOx, uint16_t GPIO_Pin -- )
  \ /* Check the parameters */
  swap
  assert_param(IS_GPIO_ALL_PERIPH(GPIOx));
  >r
  \ GPIOx->ODR ^= GPIO_Pin;
  r@ w@ xor r> w! 
;  

\s
void GPIO_ToggleBits(GPIO_TypeDef* GPIOx, uint16_t GPIO_Pin)
{
  /* Check the parameters */
  assert_param(IS_GPIO_ALL_PERIPH(GPIOx));

  GPIOx->ODR ^= GPIO_Pin;
}