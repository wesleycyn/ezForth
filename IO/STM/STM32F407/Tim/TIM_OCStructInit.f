void TIM_OCStructInit(TIM_OCInitTypeDef* TIM_OCInitStruct)
{
  /* Set the default configuration */
  TIM_OCInitStruct->TIM_OCMode = TIM_OCMode_Timing;
  TIM_OCInitStruct->TIM_OutputState = TIM_OutputState_Disable;
  TIM_OCInitStruct->TIM_OutputNState = TIM_OutputNState_Disable;
  TIM_OCInitStruct->TIM_Pulse = 0x00000000;
  TIM_OCInitStruct->TIM_OCPolarity = TIM_OCPolarity_High;
  TIM_OCInitStruct->TIM_OCNPolarity = TIM_OCPolarity_High;
  TIM_OCInitStruct->TIM_OCIdleState = TIM_OCIdleState_Reset;
  TIM_OCInitStruct->TIM_OCNIdleState = TIM_OCNIdleState_Reset;
}