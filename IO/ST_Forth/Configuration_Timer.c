#include "stm32f10x_lib.h"

#include "stm32f10x.h"
#include "platform_config.h"
TIM_TimeBaseInitTypeDef  TIM_TimeBaseStructure;
TIM_TimeBaseInitTypeDef  TIM2_TimeBaseStructure;
TIM_TimeBaseInitTypeDef  TIM3_TimeBaseStructure;
TIM_TimeBaseInitTypeDef  TIM4_TimeBaseStructure;
TIM_TimeBaseInitTypeDef  TIM5_TimeBaseStructure;

TIM_OCInitTypeDef  TIM_OCInitStructure;
TIM_OCInitTypeDef  TIM2_OCInitStructure;
TIM_OCInitTypeDef  TIM3_OCInitStructure;
TIM_OCInitTypeDef  TIM4_OCInitStructure;
TIM_OCInitTypeDef  TIM5_OCInitStructure;


u16 capture = 0;

vu16 Tim2_CCR1_Val = 10000; //49152;
vu16 Tim3_CCR1_Val = 10000; //49152;
vu16 Tim4_CCR1_Val = 200; //49152;
vu16 Tim5_CCR1_Val = 182; //49152;


void Tim2_Configuration(void);
void Tim3_Configuration(void);
void Tim4_Configuration(void);
void Tim5_Configuration(void);


void Tim2_Configuration(void)
{
  /* ---------------------------------------------------------------
    TIM2 Configuration: Output Compare Timing Mode:
    TIM2CLK = 36 MHz, Prescaler = 4, TIM2 counter clock = 7.2 MHz
    CC1 update rate = TIM2 counter clock / CCR1_Val = 146.48 Hz
    CC2 update rate = TIM2 counter clock / CCR2_Val = 219.7 Hz
    CC3 update rate = TIM2 counter clock / CCR3_Val = 439.4 Hz
    CC4 update rate = TIM2 counter clock / CCR4_Val =  878.9 Hz
  --------------------------------------------------------------- */

  /* Time base configuration */
  TIM_TimeBaseStructure.TIM_Period = 65535;
  TIM_TimeBaseStructure.TIM_Prescaler = 0;
  TIM_TimeBaseStructure.TIM_ClockDivision = 0;
  TIM_TimeBaseStructure.TIM_CounterMode = TIM_CounterMode_Up;

  TIM_TimeBaseInit(TIM2, &TIM_TimeBaseStructure);

  /* Prescaler configuration */
  TIM_PrescalerConfig(TIM2, 7200, TIM_PSCReloadMode_Immediate);

  /* Output Compare Timing Mode configuration: Channel1 */
  TIM_OCInitStructure.TIM_OCMode = TIM_OCMode_Timing;
  TIM_OCInitStructure.TIM_OutputState = TIM_OutputState_Enable;
  TIM_OCInitStructure.TIM_Pulse = Tim2_CCR1_Val;
  TIM_OCInitStructure.TIM_OCPolarity = TIM_OCPolarity_High;

  TIM_OC1Init(TIM2, &TIM_OCInitStructure);

  TIM_OC1PreloadConfig(TIM2, TIM_OCPreload_Disable);

  /* TIM IT enable */
  TIM_ITConfig(TIM2, TIM_IT_CC1 , ENABLE);

  /* TIM2 enable counter */
  TIM_Cmd(TIM2, ENABLE);
} 

void Tim3_Configuration(void)
{
  /* ---------------------------------------------------------------
    TIM2 Configuration: Output Compare Timing Mode:
    TIM2CLK = 36 MHz, Prescaler = 4, TIM2 counter clock = 7.2 MHz
    CC1 update rate = TIM2 counter clock / CCR1_Val = 146.48 Hz
    CC2 update rate = TIM2 counter clock / CCR2_Val = 219.7 Hz
    CC3 update rate = TIM2 counter clock / CCR3_Val = 439.4 Hz
    CC4 update rate = TIM2 counter clock / CCR4_Val =  878.9 Hz
  --------------------------------------------------------------- */

  /* Time base configuration */
  TIM_TimeBaseStructure.TIM_Period = 65535;
  TIM_TimeBaseStructure.TIM_Prescaler = 0;
  TIM_TimeBaseStructure.TIM_ClockDivision = 0;
  TIM_TimeBaseStructure.TIM_CounterMode = TIM_CounterMode_Up;

  TIM_TimeBaseInit(TIM3, &TIM_TimeBaseStructure);

  /* Prescaler configuration */
  TIM_PrescalerConfig(TIM3, 720, TIM_PSCReloadMode_Immediate);

  /* Output Compare Timing Mode configuration: Channel1 */
  TIM_OCInitStructure.TIM_OCMode = TIM_OCMode_Timing;
  TIM_OCInitStructure.TIM_OutputState = TIM_OutputState_Enable;
  TIM_OCInitStructure.TIM_Pulse = Tim3_CCR1_Val;
  TIM_OCInitStructure.TIM_OCPolarity = TIM_OCPolarity_High;

  TIM_OC1Init(TIM3, &TIM_OCInitStructure);

  TIM_OC1PreloadConfig(TIM3, TIM_OCPreload_Disable);

  /* TIM IT enable */
  TIM_ITConfig(TIM3, TIM_IT_CC1 , ENABLE);

  /* TIM2 enable counter */
  TIM_Cmd(TIM3, ENABLE);
}



void Tim4_Configuration(void)
{
  /* ---------------------------------------------------------------
    TIM2 Configuration: Output Compare Timing Mode:
    TIM2CLK = 36 MHz, Prescaler = 4, TIM2 counter clock = 7.2 MHz
    CC1 update rate = TIM2 counter clock / CCR1_Val = 146.48 Hz
    CC2 update rate = TIM2 counter clock / CCR2_Val = 219.7 Hz
    CC3 update rate = TIM2 counter clock / CCR3_Val = 439.4 Hz
    CC4 update rate = TIM2 counter clock / CCR4_Val =  878.9 Hz
  --------------------------------------------------------------- */

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


void Tim5_Configuration(void)
{
  /* ---------------------------------------------------------------
    TIM2 Configuration: Output Compare Timing Mode:
    TIM2CLK = 36 MHz, Prescaler = 4, TIM2 counter clock = 7.2 MHz
    CC1 update rate = TIM2 counter clock / CCR1_Val = 146.48 Hz
    CC2 update rate = TIM2 counter clock / CCR2_Val = 219.7 Hz
    CC3 update rate = TIM2 counter clock / CCR3_Val = 439.4 Hz
    CC4 update rate = TIM2 counter clock / CCR4_Val =  878.9 Hz
  --------------------------------------------------------------- */

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
  TIM_OCInitStructure.TIM_Pulse = Tim5_CCR1_Val;
  TIM_OCInitStructure.TIM_OCPolarity = TIM_OCPolarity_High;

  TIM_OC1Init(TIM5, &TIM_OCInitStructure);

  TIM_OC1PreloadConfig(TIM5, TIM_OCPreload_Disable);

  /* TIM IT enable */
  TIM_ITConfig(TIM5, TIM_IT_CC1 , ENABLE);

  /* TIM2 enable counter */
  TIM_Cmd(TIM5, ENABLE);
} 


