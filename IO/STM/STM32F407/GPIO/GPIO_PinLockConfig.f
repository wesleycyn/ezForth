: GPIO_PinLockConfig ( GPIO_TypeDef* GPIOx, uint16_t GPIO_Pin -- )

  \ __IO uint32_t tmp = 0x00010000;
  \ /* Check the parameters */
  assert_param(IS_GPIO_PIN(GPIO_Pin));
  swap  
  assert_param(IS_GPIO_ALL_PERIPH(GPIOx));
  >r
  dup
  tmp |= GPIO_Pin;
  
  0x00010000 or dup
  \ /* Set LCKK bit */
  \ GPIOx->LCKR = tmp;  
  r@ w!  
  \ /* Reset LCKK bit */
  \ GPIOx->LCKR =  GPIO_Pin;
  swap
  r@ w!
  \ /* Set LCKK bit */
  \ GPIOx->LCKR = tmp;
  r@ w!
  \ /* Read LCKK bit*/
  \ tmp = GPIOx->LCKR;
  r@ w@  
  \ /* Read LCKK bit*/
  \ tmp = GPIOx->LCKR;
  r> w@
;

\s
void GPIO_PinLockConfig(GPIO_TypeDef* GPIOx, uint16_t GPIO_Pin)
{
  __IO uint32_t tmp = 0x00010000;

  /* Check the parameters */
  assert_param(IS_GPIO_ALL_PERIPH(GPIOx));
  assert_param(IS_GPIO_PIN(GPIO_Pin));

  tmp |= GPIO_Pin;
  /* Set LCKK bit */
  GPIOx->LCKR = tmp;
  /* Reset LCKK bit */
  GPIOx->LCKR =  GPIO_Pin;
  /* Set LCKK bit */
  GPIOx->LCKR = tmp;
  /* Read LCKK bit*/
  tmp = GPIOx->LCKR;
  /* Read LCKK bit*/
  tmp = GPIOx->LCKR;
}