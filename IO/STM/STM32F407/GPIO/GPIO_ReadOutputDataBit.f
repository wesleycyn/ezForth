\ uint8_t GPIO_ReadOutputDataBit(GPIO_TypeDef* GPIOx, uint16_t GPIO_Pin)

:  GPIO_ReadOutputDataBit( GPIO_TypeDef* GPIOx, uint16_t GPIO_Pin -- uint8_t bitstatus )

  \ ? uint8_t bitstatus = 0x00;

  \ /* Check the parameters */
  
  assert_param(IS_GET_GPIO_PIN(GPIO_Pin));
  swap  
  assert_param(IS_GPIO_ALL_PERIPH(GPIOx));

  \ (((GPIOx->ODR) & GPIO_Pin) != (uint32_t)Bit_RESET)
  GPIOx->OD w@ and
  
  Bit_RESET <>
  
  if
    \ bitstatus = (uint8_t)Bit_SET;
    Bit_SET
  else
    \ bitstatus = (uint8_t)Bit_RESET;
    Bit_RESET    
  then
  \ return bitstatus;
;





\s
uint8_t GPIO_ReadOutputDataBit(GPIO_TypeDef* GPIOx, uint16_t GPIO_Pin)
{
  uint8_t bitstatus = 0x00;

  /* Check the parameters */
  assert_param(IS_GPIO_ALL_PERIPH(GPIOx));
  assert_param(IS_GET_GPIO_PIN(GPIO_Pin));

  if (((GPIOx->ODR) & GPIO_Pin) != (uint32_t)Bit_RESET)
  {
    bitstatus = (uint8_t)Bit_SET;
  }
  else
  {
    bitstatus = (uint8_t)Bit_RESET;
  }
  return bitstatus;
}