: GPIO_WriteBit ( GPIO_TypeDef* GPIOx, uint16_t GPIO_Pin, BitAction BitVal -- )

  \ /* Check the parameters */  
  assert_param(IS_GPIO_BIT_ACTION(BitVal));   
  >r 
  assert_param(IS_GET_GPIO_PIN(GPIO_Pin));
  >r 
  assert_param(IS_GPIO_ALL_PERIPH(GPIOx));
  r>
  r>   
  \ (BitVal != Bit_RESET)
  Bit_RESET <>
  if
    \ GPIOx->BSRRL = GPIO_Pin;
    swap
    GPIOx->BSRRL w!
  else
    \ GPIOx->BSRRH = GPIO_Pin ;
    swap
    GPIOx->BSRRH w!
;



\s
void GPIO_WriteBit(GPIO_TypeDef* GPIOx, uint16_t GPIO_Pin, BitAction BitVal)
{
  /* Check the parameters */
  assert_param(IS_GPIO_ALL_PERIPH(GPIOx));
  assert_param(IS_GET_GPIO_PIN(GPIO_Pin));
  assert_param(IS_GPIO_BIT_ACTION(BitVal));

  if (BitVal != Bit_RESET)
  {
    GPIOx->BSRRL = GPIO_Pin;
  }
  else
  {
    GPIOx->BSRRH = GPIO_Pin ;
  }
}