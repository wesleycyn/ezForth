void TIM_OC2Init(TIM_TypeDef* TIMx, TIM_OCInitTypeDef* TIM_OCInitStruct)
{
  uint16_t tmpccmrx = 0, tmpccer = 0, tmpcr2 = 0;
   
  /* Check the parameters */
  assert_param(IS_TIM_LIST2_PERIPH(TIMx)); 
  assert_param(IS_TIM_OC_MODE(TIM_OCInitStruct->TIM_OCMode));
  assert_param(IS_TIM_OUTPUT_STATE(TIM_OCInitStruct->TIM_OutputState));
  assert_param(IS_TIM_OC_POLARITY(TIM_OCInitStruct->TIM_OCPolarity));   

  /* Disable the Channel 2: Reset the CC2E Bit */
  TIMx->CCER &= (uint16_t)~TIM_CCER_CC2E;
  
  /* Get the TIMx CCER register value */  
  tmpccer = TIMx->CCER;
  /* Get the TIMx CR2 register value */
  tmpcr2 =  TIMx->CR2;
  
  /* Get the TIMx CCMR1 register value */
  tmpccmrx = TIMx->CCMR1;
    
  /* Reset the Output Compare mode and Capture/Compare selection Bits */
  tmpccmrx &= (uint16_t)~TIM_CCMR1_OC2M;
  tmpccmrx &= (uint16_t)~TIM_CCMR1_CC2S;
  
  /* Select the Output Compare Mode */
  tmpccmrx |= (uint16_t)(TIM_OCInitStruct->TIM_OCMode << 8);
  
  /* Reset the Output Polarity level */
  tmpccer &= (uint16_t)~TIM_CCER_CC2P;
  /* Set the Output Compare Polarity */
  tmpccer |= (uint16_t)(TIM_OCInitStruct->TIM_OCPolarity << 4);
  
  /* Set the Output State */
  tmpccer |= (uint16_t)(TIM_OCInitStruct->TIM_OutputState << 4);
    
  if((TIMx == TIM1) || (TIMx == TIM8))
  {
    assert_param(IS_TIM_OUTPUTN_STATE(TIM_OCInitStruct->TIM_OutputNState));
    assert_param(IS_TIM_OCN_POLARITY(TIM_OCInitStruct->TIM_OCNPolarity));
    assert_param(IS_TIM_OCNIDLE_STATE(TIM_OCInitStruct->TIM_OCNIdleState));
    assert_param(IS_TIM_OCIDLE_STATE(TIM_OCInitStruct->TIM_OCIdleState));
    
    /* Reset the Output N Polarity level */
    tmpccer &= (uint16_t)~TIM_CCER_CC2NP;
    /* Set the Output N Polarity */
    tmpccer |= (uint16_t)(TIM_OCInitStruct->TIM_OCNPolarity << 4);
    /* Reset the Output N State */
    tmpccer &= (uint16_t)~TIM_CCER_CC2NE;
    
    /* Set the Output N State */
    tmpccer |= (uint16_t)(TIM_OCInitStruct->TIM_OutputNState << 4);
    /* Reset the Output Compare and Output Compare N IDLE State */
    tmpcr2 &= (uint16_t)~TIM_CR2_OIS2;
    tmpcr2 &= (uint16_t)~TIM_CR2_OIS2N;
    /* Set the Output Idle state */
    tmpcr2 |= (uint16_t)(TIM_OCInitStruct->TIM_OCIdleState << 2);
    /* Set the Output N Idle state */
    tmpcr2 |= (uint16_t)(TIM_OCInitStruct->TIM_OCNIdleState << 2);
  }
  /* Write to TIMx CR2 */
  TIMx->CR2 = tmpcr2;
  
  /* Write to TIMx CCMR1 */
  TIMx->CCMR1 = tmpccmrx;
  
  /* Set the Capture Compare Register value */
  TIMx->CCR2 = TIM_OCInitStruct->TIM_Pulse;
  
  /* Write to TIMx CCER */
  TIMx->CCER = tmpccer;
}