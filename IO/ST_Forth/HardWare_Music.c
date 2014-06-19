#include "stm32f10x.h"
//#include <Table_Music.h>

extern long SYS_sec;


extern TIM_TimeBaseInitTypeDef  TIM_TimeBaseStructure;
extern TIM_TimeBaseInitTypeDef  TIM2_TimeBaseStructure;
extern TIM_TimeBaseInitTypeDef  TIM3_TimeBaseStructure;
extern TIM_TimeBaseInitTypeDef  TIM4_TimeBaseStructure;
extern TIM_TimeBaseInitTypeDef  TIM5_TimeBaseStructure;

extern TIM_OCInitTypeDef  TIM_OCInitStructure;
extern TIM_OCInitTypeDef  TIM2_OCInitStructure;
extern TIM_OCInitTypeDef  TIM3_OCInitStructure;
extern TIM_OCInitTypeDef  TIM4_OCInitStructure;
extern TIM_OCInitTypeDef  TIM5_OCInitStructure;

extern u16 capture;
extern vu16 Tim3_CCR1_Val;
extern vu16 Tim4_CCR1_Val;
extern vu16 Tim5_CCR1_Val;


u32  Music_PTR @"FastDataRAM";
unsigned char *POINT @"FastDataRAM";

void Set_Tone(vu16 Tone_Tim5_CCR1_Val);
void Set_Beat(vu16 Beat_Tim4_CCR1_Val);

void TIM4_ISR(void);
void TIM5_ISR(void);

void beep_vibrate_stop(void);
void beep_vibrate( unsigned char beep_type );
void beep_1(void);
void Play_Music(const unsigned char *Music_tbl);

// [Description ]
// This is PC simulate Beep sound and vibrate stop function
// Return value : no return variable
// [LIB include]
// music.h
// [Variable]
// [example]
// beep_vibrate_stop() ;
// this example will stop beep or vibrate
void beep_vibrate_stop(void)
{    
    	Set_Tone(0);		// STOP PWM
}


void Play_Music(const unsigned char *Music_tbl)
{
  POINT=(unsigned char *)Music_tbl;  
  Set_Beat(POINT[1] *10);
  Set_Tone(POINT[0]);		// Duty = Ontime / time     
  Music_PTR=2;
}

void TIM3_ISR(void);

/*******************************************************************************
* Function Name  : TIM3_IRQHandler
* Description    : This function handles TIM3 global interrupt request.
* Input          : None
* Output         : None
* Return         : None
*******************************************************************************/
void TIM3_ISR(void)
{
  if (TIM_GetITStatus(TIM3, TIM_IT_CC1) != RESET)
  {
    TIM_ClearITPendingBit(TIM3, TIM_IT_CC1);   
    if ( SYS_sec > 0 )
     SYS_sec-=1 ;    
    /* Pin PC.06 toggling with frequency = 73.24 Hz */
//    GPIO_WriteBit(GPIOC, GPIO_Pin_6, (BitAction)(1 - GPIO_ReadOutputDataBit(GPIOC, GPIO_Pin_6)));
    capture = TIM_GetCapture1(TIM3);
    TIM_SetCompare1(TIM3, capture + Tim3_CCR1_Val);
  }
}
/*******************************************************************************
* Function Name  : TIM4_IRQHandler
* Description    : This function handles TIM4 global interrupt request.
* Input          : None
* Output         : None
* Return         : None
*******************************************************************************/
void TIM4_ISR(void)
{

  if (TIM_GetITStatus(TIM4, TIM_IT_CC1) != RESET)
  {
    TIM_ClearITPendingBit(TIM4, TIM_IT_CC1);
//    GPIO_WriteBit(GPIOC, GPIO_Pin_6, (BitAction)(1 - GPIO_ReadOutputDataBit(GPIOC, GPIO_Pin_6)));
    capture = TIM_GetCapture1(TIM4);
    TIM_SetCompare1(TIM4, capture + Tim4_CCR1_Val);   
//    SYS_sec=1;
   if (SYS_sec > 0 )
   {
	  if	((POINT[Music_PTR+1]==0 )&&(POINT[Music_PTR]==0 ) )
	  {
		Music_PTR = 0;
	  }
	  Set_Beat(POINT[Music_PTR+1]*10);
	  Set_Tone(POINT[Music_PTR]);		// Duty = Ontime / time 
	  Music_PTR=(Music_PTR+2);
   }
   else
   {
    		Set_Tone(0);		// STOP PWM
   }  
  
  }
}


/*******************************************************************************
* Function Name  : TIM5_IRQHandler
* Description    : This function handles TIM5 global interrupt request.
* Input          : None
* Output         : None
* Return         : None
*******************************************************************************/
void TIM5_ISR(void)
{
  if (TIM_GetITStatus(TIM5, TIM_IT_CC1) != RESET)
  {
    TIM_ClearITPendingBit(TIM5, TIM_IT_CC1);

    /* Pin PC.06 toggling with frequency = 73.24 Hz */
//    GPIO_WriteBit(GPIOC, GPIO_Pin_6, (BitAction)(1 - GPIO_ReadOutputDataBit(GPIOC, GPIO_Pin_6)));
    GPIO_WriteBit(GPIOF, GPIO_Pin_10, (BitAction)(1 - GPIO_ReadOutputDataBit(GPIOF, GPIO_Pin_10)));    
    capture = TIM_GetCapture1(TIM5);
    TIM_SetCompare1(TIM5, capture + Tim5_CCR1_Val);
  }

}

void Set_Tone(vu16 Tone_Tim5_CCR1_Val)
{
  /* ---------------------------------------------------------------
    TIM2 Configuration: Output Compare Timing Mode:
    TIM2CLK = 36 MHz, Prescaler = 4, TIM2 counter clock = 7.2 MHz
    CC1 update rate = TIM2 counter clock / CCR1_Val = 146.48 Hz
    CC2 update rate = TIM2 counter clock / CCR2_Val = 219.7 Hz
    CC3 update rate = TIM2 counter clock / CCR3_Val = 439.4 Hz
    CC4 update rate = TIM2 counter clock / CCR4_Val =  878.9 Hz
  --------------------------------------------------------------- */
Tim5_CCR1_Val=Tone_Tim5_CCR1_Val;
  /* Time base configuration */
  TIM_TimeBaseStructure.TIM_Period = 65535;
  TIM_TimeBaseStructure.TIM_Prescaler = 0;
  TIM_TimeBaseStructure.TIM_ClockDivision = 0;
  TIM_TimeBaseStructure.TIM_CounterMode = TIM_CounterMode_Up;

  TIM_TimeBaseInit(TIM5, &TIM_TimeBaseStructure);

  /* Prescaler configuration */
  TIM_PrescalerConfig(TIM5,72, TIM_PSCReloadMode_Immediate);

  /* Output Compare Timing Mode configuration: Channel1 */
  TIM_OCInitStructure.TIM_OCMode = TIM_OCMode_Timing;
  TIM_OCInitStructure.TIM_OutputState = TIM_OutputState_Enable;
  TIM_OCInitStructure.TIM_Pulse = Tone_Tim5_CCR1_Val;
  TIM_OCInitStructure.TIM_OCPolarity = TIM_OCPolarity_High;

  TIM_OC1Init(TIM5, &TIM_OCInitStructure);

  TIM_OC1PreloadConfig(TIM5, TIM_OCPreload_Disable);

  if (Tone_Tim5_CCR1_Val==0)
  {
      /* TIM IT enable */
  TIM_ITConfig(TIM5, TIM_IT_CC1 , DISABLE);

  /* TIM2 enable counter */
  TIM_Cmd(TIM5, DISABLE);
  }
  else
  {
  
  /* TIM IT enable */
  TIM_ITConfig(TIM5, TIM_IT_CC1 , ENABLE);

  /* TIM2 enable counter */
  TIM_Cmd(TIM5, ENABLE);
  }
} 

void Set_Beat(vu16 Beat_Tim4_CCR1_Val) 

{
  /* ---------------------------------------------------------------
    TIM2 Configuration: Output Compare Timing Mode:
    TIM2CLK = 36 MHz, Prescaler = 4, TIM2 counter clock = 7.2 MHz
    CC1 update rate = TIM2 counter clock / CCR1_Val = 146.48 Hz
    CC2 update rate = TIM2 counter clock / CCR2_Val = 219.7 Hz
    CC3 update rate = TIM2 counter clock / CCR3_Val = 439.4 Hz
    CC4 update rate = TIM2 counter clock / CCR4_Val =  878.9 Hz
  --------------------------------------------------------------- */
  Tim4_CCR1_Val=Beat_Tim4_CCR1_Val;
   
  /* Time base configuration */
  TIM_TimeBaseStructure.TIM_Period = 65535;
  TIM_TimeBaseStructure.TIM_Prescaler = 0;
  TIM_TimeBaseStructure.TIM_ClockDivision = 0;
  TIM_TimeBaseStructure.TIM_CounterMode = TIM_CounterMode_Up;

  TIM_TimeBaseInit(TIM4, &TIM_TimeBaseStructure);

  /* Prescaler configuration */
  TIM_PrescalerConfig(TIM4, 45000, TIM_PSCReloadMode_Immediate);

  /* Output Compare Timing Mode configuration: Channel1 */
  TIM_OCInitStructure.TIM_OCMode = TIM_OCMode_Timing;
  TIM_OCInitStructure.TIM_OutputState = TIM_OutputState_Enable;
  TIM_OCInitStructure.TIM_Pulse = Tim4_CCR1_Val;
  TIM_OCInitStructure.TIM_OCPolarity = TIM_OCPolarity_High;

  TIM_OC1Init(TIM4, &TIM_OCInitStructure);

  TIM_OC1PreloadConfig(TIM4, TIM_OCPreload_Disable);


  /* TIM IT enable */
  TIM_ITConfig(TIM4, TIM_IT_CC1 , ENABLE);

  /* TIM2 enable counter */
  TIM_Cmd(TIM4, ENABLE);
}
