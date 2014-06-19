: GPIO_StructInit ( GPIO_InitTypeDef* GPIO_InitStruct -- )
  \ /* Reset GPIO init structure parameters values */
  >R
  \ GPIO_InitStruct->GPIO_Pin  = GPIO_Pin_All;
  GPIO_Pin_All r@  GPIO_InitStruct->GPIO_Pin w!
     
  \ GPIO_InitStruct->GPIO_Mode = GPIO_Mode_IN;
  GPIO_Mode_IN r@ GPIO_InitStruct->GPIO_Mode w!
  
  \ GPIO_InitStruct->GPIO_Speed = GPIO_Speed_2MHz;
  GPIO_Speed_2MHz r@ GPIO_InitStruct->GPIO_Speed w!
  
  \ GPIO_InitStruct->GPIO_OType = GPIO_OType_PP;
  GPIO_OType_PP r@ GPIO_InitStruct->GPIO_OType w!
  
  \ GPIO_InitStruct->GPIO_PuPd = GPIO_PuPd_NOPULL;
  GPIO_PuPd_NOPULL r> GPIO_InitStruct->GPIO_PuPd w!
;

\s
void GPIO_StructInit(GPIO_InitTypeDef* GPIO_InitStruct)
{
  /* Reset GPIO init structure parameters values */
  GPIO_InitStruct->GPIO_Pin  = GPIO_Pin_All;
  GPIO_InitStruct->GPIO_Mode = GPIO_Mode_IN;
  GPIO_InitStruct->GPIO_Speed = GPIO_Speed_2MHz;
  GPIO_InitStruct->GPIO_OType = GPIO_OType_PP;
  GPIO_InitStruct->GPIO_PuPd = GPIO_PuPd_NOPULL;
}