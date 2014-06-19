: TIM_TimeBaseInit ( TIM_TypeDef* TIMx, TIM_TimeBaseInitTypeDef* TIM_TimeBaseInitStruct -- )
  \ uint16_t tmpcr1 = 0;

  \ /* Check the parameters */
  \ assert_param(IS_TIM_ALL_PERIPH(TIMx)); 
  \ assert_param(IS_TIM_COUNTER_MODE(TIM_TimeBaseInitStruct->TIM_CounterMode));
  \ assert_param(IS_TIM_CKD_DIV(TIM_TimeBaseInitStruct->TIM_ClockDivision));

  tmpcr1 = TIMx->CR1;  

  \ if((TIMx == TIM1) || (TIMx == TIM8)||
  \   (TIMx == TIM2) || (TIMx == TIM3)||
  \   (TIMx == TIM4) || (TIMx == TIM5)) 
  \ {
  \   /* Select the Counter Mode */
  \   tmpcr1 &= (uint16_t)(~(TIM_CR1_DIR | TIM_CR1_CMS));
  \  tmpcr1 |= (uint32_t)TIM_TimeBaseInitStruct->TIM_CounterMode;
  \ }
  
  TIMx TIM1 or TIMx TIM8 or TIMx TIM2 or TIMx TIM3 or TIMx TIM4 or TIMx TIM5 or or
  if
  \   tmpcr1 &= (uint16_t)(~(TIM_CR1_DIR | TIM_CR1_CMS));
  \  tmpcr1 |= (uint32_t)TIM_TimeBaseInitStruct->TIM_CounterMode; 
  then
 
 
  \ if((TIMx != TIM6) && (TIMx != TIM7))
  \ {
  \  /* Set the clock division */
  \  tmpcr1 &=  (uint16_t)(~TIM_CR1_CKD);
  \  tmpcr1 |= (uint32_t)TIM_TimeBaseInitStruct->TIM_ClockDivision;
  \ }
  TIMx TIM6 <> TIMx  TIM7 <>  and 
  if
    tmpcr1  ~TIM_CR1_CKD and 
    TIM_TimeBaseInitStruct->TIM_ClockDivision or
    tmpcr1 !
  then
  \ TIMx->CR1 = tmpcr1;
  tmpcr1  TIMx->CR1!

  \ /* Set the Autoreload value */
  \ TIMx->ARR = TIM_TimeBaseInitStruct->TIM_Period ;
  TIM_TimeBaseInitStruct->TIM_Period TIMx->ARR!
 
  \ /* Set the Prescaler value */
  \ TIMx->PSC = TIM_TimeBaseInitStruct->TIM_Prescaler;
  
  TIM_TimeBaseInitStruct->TIM_Prescaler TIMx->PSC!  
    
    
  \ if ((TIMx == TIM1) || (TIMx == TIM8))  
  \ {
  \   /* Set the Repetition Counter value */
  \   TIMx->RCR = TIM_TimeBaseInitStruct->TIM_RepetitionCounter;
  \ }
  
  r> TIM1||TIM8 = 
  if
    TIM_TimeBaseInitStruct->TIM_RepetitionCounter TIMx->RCR!
  then

  \  /* Generate an update event to reload the Prescaler and the repetition counter(only for TIM1 and TIM8) value immediatly */
  TIM_PSCReloadMode_Immediate TIMx->EGR!    
  ;
  
\s
void TIM_TimeBaseInit(TIM_TypeDef* TIMx, TIM_TimeBaseInitTypeDef* TIM_TimeBaseInitStruct)
{
  uint16_t tmpcr1 = 0;

  /* Check the parameters */
  assert_param(IS_TIM_ALL_PERIPH(TIMx)); 
  assert_param(IS_TIM_COUNTER_MODE(TIM_TimeBaseInitStruct->TIM_CounterMode));
  assert_param(IS_TIM_CKD_DIV(TIM_TimeBaseInitStruct->TIM_ClockDivision));

  tmpcr1 = TIMx->CR1;  

  if((TIMx == TIM1) || (TIMx == TIM8)||
     (TIMx == TIM2) || (TIMx == TIM3)||
     (TIMx == TIM4) || (TIMx == TIM5)) 
  {
    /* Select the Counter Mode */
    tmpcr1 &= (uint16_t)(~(TIM_CR1_DIR | TIM_CR1_CMS));
    tmpcr1 |= (uint32_t)TIM_TimeBaseInitStruct->TIM_CounterMode;
  }
 
  if((TIMx != TIM6) && (TIMx != TIM7))
  {
    /* Set the clock division */
    tmpcr1 &=  (uint16_t)(~TIM_CR1_CKD);
    tmpcr1 |= (uint32_t)TIM_TimeBaseInitStruct->TIM_ClockDivision;
  }

  TIMx->CR1 = tmpcr1;

  /* Set the Autoreload value */
  TIMx->ARR = TIM_TimeBaseInitStruct->TIM_Period ;
 
  /* Set the Prescaler value */
  TIMx->PSC = TIM_TimeBaseInitStruct->TIM_Prescaler;
    
  if ((TIMx == TIM1) || (TIMx == TIM8))  
  {
    /* Set the Repetition Counter value */
    TIMx->RCR = TIM_TimeBaseInitStruct->TIM_RepetitionCounter;
  }

  /* Generate an update event to reload the Prescaler 
     and the repetition counter(only for TIM1 and TIM8) value immediatly */
  TIMx->EGR = TIM_PSCReloadMode_Immediate;          
}