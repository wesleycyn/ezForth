: TIM_DeInit ( TIMx -- )
   case
    TIM1 of
        RCC_APB2Periph_TIM1 ENABLE   RCC_APB2PeriphResetCmd 
        RCC_APB2Periph_TIM1 DISABLE  RCC_APB2PeriphResetCmd
      endof

    TIM8 of
        RCC_APB2Periph_TIM8 ENABLE   RCC_APB2PeriphResetCmd 
        RCC_APB2Periph_TIM8 DISABLE  RCC_APB2PeriphResetCmd
      endof

    TIM9 of
        RCC_APB2Periph_TIM9 ENABLE   RCC_APB2PeriphResetCmd 
        RCC_APB2Periph_TIM9 DISABLE  RCC_APB2PeriphResetCmd
      endof
      
    TIM10 of
        RCC_APB2Periph_TIM10 ENABLE   RCC_APB2PeriphResetCmd 
        RCC_APB2Periph_TIM10 DISABLE  RCC_APB2PeriphResetCmd
      endof
      
    TIM11 of
        RCC_APB2Periph_TIM11 ENABLE   RCC_APB2PeriphResetCmd 
        RCC_APB2Periph_TIM11 DISABLE  RCC_APB2PeriphResetCmd
      endof   
      
    TIM2 of
        RCC_APB1Periph_TIM2 ENABLE   RCC_APB1PeriphResetCmd 
        RCC_APB1Periph_TIM2 DISABLE  RCC_APB1PeriphResetCmd
      endof 
  
    TIM2 of
        RCC_APB1Periph_TIM2 ENABLE   RCC_APB1PeriphResetCmd 
        RCC_APB1Periph_TIM2 DISABLE  RCC_APB1PeriphResetCmd
      endof   
  
    TIM2 of
        RCC_APB1Periph_TIM2 ENABLE   RCC_APB1PeriphResetCmd 
        RCC_APB1Periph_TIM2 DISABLE  RCC_APB1PeriphResetCmd
      endof  
  
    TIM3 of
        RCC_APB1Periph_TIM3 ENABLE   RCC_APB1PeriphResetCmd 
        RCC_APB1Periph_TIM3 DISABLE  RCC_APB1PeriphResetCmd
      endof
  
    TIM4 of
        RCC_APB1Periph_TIM4 ENABLE   RCC_APB1PeriphResetCmd 
        RCC_APB1Periph_TIM4 DISABLE  RCC_APB1PeriphResetCmd
      endof
  
    TIM5 of
        RCC_APB1Periph_TIM5 ENABLE   RCC_APB1PeriphResetCmd 
        RCC_APB1Periph_TIM5 DISABLE  RCC_APB1PeriphResetCmd
      endof
  
    TIM6 of
        RCC_APB1Periph_TIM6 ENABLE   RCC_APB1PeriphResetCmd 
        RCC_APB1Periph_TIM6 DISABLE  RCC_APB1PeriphResetCmd
      endof
  
    TIM7 of
        RCC_APB1Periph_TIM7 ENABLE   RCC_APB1PeriphResetCmd 
        RCC_APB1Periph_TIM7 DISABLE  RCC_APB1PeriphResetCmd
      endof
  
    TIM12 of
        RCC_APB1Periph_TIM12 ENABLE   RCC_APB1PeriphResetCmd 
        RCC_APB1Periph_TIM12 DISABLE  RCC_APB1PeriphResetCmd
      endof
  
    TIM13 of
        RCC_APB1Periph_TIM13 ENABLE   RCC_APB1PeriphResetCmd 
        RCC_APB1Periph_TIM13 DISABLE  RCC_APB1PeriphResetCmd
      endof
  
    TIM14 of
        RCC_APB1Periph_TIM14 ENABLE   RCC_APB1PeriphResetCmd 
        RCC_APB1Periph_TIM14 DISABLE  RCC_APB1PeriphResetCmd
      endof            
                                    
   endcase
  ;                                
      
\s
void TIM_DeInit(TIM_TypeDef* TIMx)
{
  /* Check the parameters */
  assert_param(IS_TIM_ALL_PERIPH(TIMx)); 
 
  if (TIMx == TIM1)
  {
    RCC_APB2PeriphResetCmd(RCC_APB2Periph_TIM1, ENABLE);
    RCC_APB2PeriphResetCmd(RCC_APB2Periph_TIM1, DISABLE);  
  } 
  else if (TIMx == TIM2) 
  {     
    RCC_APB1PeriphResetCmd(RCC_APB1Periph_TIM2, ENABLE);
    RCC_APB1PeriphResetCmd(RCC_APB1Periph_TIM2, DISABLE);
  }  
  else if (TIMx == TIM3)
  { 
    RCC_APB1PeriphResetCmd(RCC_APB1Periph_TIM3, ENABLE);
    RCC_APB1PeriphResetCmd(RCC_APB1Periph_TIM3, DISABLE);
  }  
  else if (TIMx == TIM4)
  { 
    RCC_APB1PeriphResetCmd(RCC_APB1Periph_TIM4, ENABLE);
    RCC_APB1PeriphResetCmd(RCC_APB1Periph_TIM4, DISABLE);
  }  
  else if (TIMx == TIM5)
  {      
    RCC_APB1PeriphResetCmd(RCC_APB1Periph_TIM5, ENABLE);
    RCC_APB1PeriphResetCmd(RCC_APB1Periph_TIM5, DISABLE);
  }  
  else if (TIMx == TIM6)  
  {    
    RCC_APB1PeriphResetCmd(RCC_APB1Periph_TIM6, ENABLE);
    RCC_APB1PeriphResetCmd(RCC_APB1Periph_TIM6, DISABLE);
  }  
  else if (TIMx == TIM7)
  {      
    RCC_APB1PeriphResetCmd(RCC_APB1Periph_TIM7, ENABLE);
    RCC_APB1PeriphResetCmd(RCC_APB1Periph_TIM7, DISABLE);
  }  
  else if (TIMx == TIM8)
  {      
    RCC_APB2PeriphResetCmd(RCC_APB2Periph_TIM8, ENABLE);
    RCC_APB2PeriphResetCmd(RCC_APB2Periph_TIM8, DISABLE);  
  }  
  else if (TIMx == TIM9)
  {      
    RCC_APB2PeriphResetCmd(RCC_APB2Periph_TIM9, ENABLE);
    RCC_APB2PeriphResetCmd(RCC_APB2Periph_TIM9, DISABLE);  
   }  
  else if (TIMx == TIM10)
  {      
    RCC_APB2PeriphResetCmd(RCC_APB2Periph_TIM10, ENABLE);
    RCC_APB2PeriphResetCmd(RCC_APB2Periph_TIM10, DISABLE);  
  }  
  else if (TIMx == TIM11) 
  {     
    RCC_APB2PeriphResetCmd(RCC_APB2Periph_TIM11, ENABLE);
    RCC_APB2PeriphResetCmd(RCC_APB2Periph_TIM11, DISABLE);  
  }  
  else if (TIMx == TIM12)
  {      
    RCC_APB1PeriphResetCmd(RCC_APB1Periph_TIM12, ENABLE);
    RCC_APB1PeriphResetCmd(RCC_APB1Periph_TIM12, DISABLE);  
  }  
  else if (TIMx == TIM13) 
  {       
    RCC_APB1PeriphResetCmd(RCC_APB1Periph_TIM13, ENABLE);
    RCC_APB1PeriphResetCmd(RCC_APB1Periph_TIM13, DISABLE);  
  }  
  else
  { 
    if (TIMx == TIM14) 
    {     
      RCC_APB1PeriphResetCmd(RCC_APB1Periph_TIM14, ENABLE);
      RCC_APB1PeriphResetCmd(RCC_APB1Periph_TIM14, DISABLE); 
    }   
  }
}