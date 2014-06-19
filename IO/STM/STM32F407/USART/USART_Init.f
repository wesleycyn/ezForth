\ void USART_Init(USART_TypeDef* USARTx, USART_InitTypeDef* USART_InitStruct)

: USART_Init ( USART_TypeDef* USARTx, USART_InitTypeDef* USART_InitStruct -- )
  \ uint32_t tmpreg = 0x00, apbclock = 0x00;
  \ uint32_t integerdivider = 0x00;
  \ uint32_t fractionaldivider = 0x00;
  \ RCC_ClocksTypeDef RCC_ClocksStatus;

  \ /* Check the parameters */
  assert_param(IS_USART_ALL_PERIPH(USARTx));
  assert_param(IS_USART_BAUDRATE(USART_InitStruct->USART_BaudRate));  
  assert_param(IS_USART_WORD_LENGTH(USART_InitStruct->USART_WordLength));
  assert_param(IS_USART_STOPBITS(USART_InitStruct->USART_StopBits));
  assert_param(IS_USART_PARITY(USART_InitStruct->USART_Parity));
  assert_param(IS_USART_MODE(USART_InitStruct->USART_Mode));
  assert_param(IS_USART_HARDWARE_FLOW_CONTROL(USART_InitStruct->USART_HardwareFlowControl));

  \ /* The hardware flow control is available only for USART1, USART2, USART3 and USART6 */
  \  if (USART_InitStruct->USART_HardwareFlowControl != USART_HardwareFlowControl_None)
  \ {
  \   assert_param(IS_USART_1236_PERIPH(USARTx));
  \ }

  USART_InitStruct->USART_HardwareFlowControl @ USART_HardwareFlowControl_None <>   
  if
    assert_param(IS_USART_1236_PERIPH(USARTx));
  then

\ /*---------------------------- USART CR2 Configuration -----------------------*/
  USARTx->CR2 @

  \ /* Clear STOP[13:12] bits */
  \ tmpreg &= (uint32_t)~((uint32_t)USART_CR2_STOP);
    tmpreg @ USART_CR2_STOP invert and tmpreg !


  \ /* Configure the USART Stop Bits, Clock, CPOL, CPHA and LastBit :
  \    Set STOP[13:12] bits according to USART_StopBits value */
  \ tmpreg |= (uint32_t)USART_InitStruct->USART_StopBits;
   tmpreg @ USART_InitStruct->USART_StopBits @ or tmpreg !
  
  
  \ /* Write to USART CR2 */
  \ USARTx->CR2 = (uint16_t)tmpreg;
  tmpreg @  USARTx->CR2 @ !


\ /*---------------------------- USART CR1 Configuration -----------------------*/
  \ tmpreg = USARTx->CR1;
  USARTx->CR1 @ tmpreg !
  
  
  \ /* Clear M, PCE, PS, TE and RE bits */
  \ tmpreg &= (uint32_t)~((uint32_t)CR1_CLEAR_MASK);
    tmpreg @  CR1_CLEAR_MASK invert tmpreg !

  \ /* Configure the USART Word Length, Parity and mode: 
  \   Set the M bits according to USART_WordLength value 
  \   Set PCE and PS bits according to USART_Parity value
  \   Set TE and RE bits according to USART_Mode value */
  \ tmpreg |= (uint32_t)USART_InitStruct->USART_WordLength | USART_InitStruct->USART_Parity |
  \          USART_InitStruct->USART_Mode;
  tmpreg @ 
  USART_InitStruct->USART_WordLength @ or 
  USART_InitStruct->USART_Parity @ or  
  USART_InitStruct->USART_Mode @ or
  tmpreg !


  \ /* Write to USART CR1 */
  \ USARTx->CR1 = (uint16_t)tmpreg;
  tmpreg w@  USARTx->CR1 w!

\ /*---------------------------- USART CR3 Configuration -----------------------*/  
  \ tmpreg = USARTx->CR3;
  USARTx->CR3  tmpreg !
  
  \ /* Clear CTSE and RTSE bits */
  tmpreg &= (uint32_t)~((uint32_t)CR3_CLEAR_MASK);

  \ /* Configure the USART HFC : 
  \    Set CTSE and RTSE bits according to USART_HardwareFlowControl value */

  tmpreg |= USART_InitStruct->USART_HardwareFlowControl;

  \ /* Write to USART CR3 */
  \ USARTx->CR3 = (uint16_t)tmpreg;
  tmpreg w@  USARTx->CR3 w!
  
\ /*---------------------------- USART BRR Configuration -----------------------*/
\  /* Configure the USART Baud Rate */
 
  \ RCC_GetClocksFreq(&RCC_ClocksStatus);
    RCC_ClocksStatus @ RCC_GetClocksFreq
    
  \ ((USARTx == USART1) || (USARTx == USART6))
   USARTx @ USART1 = USARTx @ USART6 = or
  if 
   \ apbclock = RCC_ClocksStatus.PCLK2_Frequency;
    RCC_ClocksStatus.PCLK2_Frequency apbclock !
  else
    \ apbclock = RCC_ClocksStatus.PCLK1_Frequency;
    RCC_ClocksStatus.PCLK1_Frequency apbclock !
  then
  
  \ /* Determine the integer part */
  \ ((USARTx->CR1 & USART_CR1_OVER8) != 0)
   USARTx->CR1 @  USART_CR1_OVER8 <>
  if 
    \ /* Integer part computing in case Oversampling mode is 8 Samples */
    \ integerdivider = ((25 * apbclock) / (2 * (USART_InitStruct->USART_BaudRate)));
    25 apbclock @ * 
    2 USART_InitStruct->USART_BaudRate @ *
    integerdivider !
    /        
  else \ /* if ((USARTx->CR1 & USART_CR1_OVER8) == 0) */
    \ /* Integer part computing in case Oversampling mode is 16 Samples */
    \ integerdivider = ((25 * apbclock) / (4 * (USART_InitStruct->USART_BaudRate))); 
    25 apbclock @ * 
    4 USART_InitStruct->USART_BaudRate @ *
   integerdivider !       
  then
  
  \ tmpreg = (integerdivider / 100) << 4;
  integerdivider @ 100 / 4 lshift tmpreg !
  
  \ /* Determine the fractional part */
  \ fractionaldivider = integerdivider - (100 * (tmpreg >> 4));
    integerdivider @    
    100 tmpreg 4 rshift *
    -
    fractionaldivider !
  \ /* Implement the fractional part in the register */
  \ ((USARTx->CR1 & USART_CR1_OVER8) != 0)
  
  if 
    \ tmpreg |= ((((fractionaldivider * 8) + 50) / 100)) & ((uint8_t)0x07);
    tmpreg @ 
    fractionaldivider @ 8 * 50 + 100  /
    0x07 and
    or
    tmpreg !
  else \ /* if ((USARTx->CR1 & USART_CR1_OVER8) == 0) */
   \ tmpreg |= ((((fractionaldivider * 16) + 50) / 100)) & ((uint8_t)0x0F);
    tmpreg @ 
    fractionaldivider @ 16 * 50 + 100  /
    0x07 and
    or
    tmpreg !    
  then
  
  \ /* Write to USART BRR register */
  \ USARTx->BRR = (uint16_t)tmpreg;  
  tmpreg w@  USARTx->BRR !
   ;



