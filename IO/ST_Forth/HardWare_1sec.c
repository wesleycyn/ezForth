#include "stm32f10x_it.h"

extern void Relay(int color);


extern u16 capture;
extern vu16 Tim2_CCR1_Val;
extern unsigned char primsg_flag;

extern unsigned int  timer_counter; // 1 second one time
extern unsigned int  nml_timer;

extern u8 rly_counter;

extern unsigned char UpdateFlg ;
extern void time_entry(void) @"UpgradeROM";

void TIM2_ISR(void);

/*******************************************************************************
* Function Name  : TIM2_IRQHandler
* Description    : This function handles TIM2 global interrupt request.
* Input          : None
* Output         : None
* Return         : None
*******************************************************************************/
void TIM2_ISR(void)
{

  
  if (TIM_GetITStatus(TIM2, TIM_IT_CC1) != RESET)
  {
    TIM_ClearITPendingBit(TIM2, TIM_IT_CC1);

    
        timer_counter = ( timer_counter + 1 ) % 10000;    
        


             
	     if (rly_counter>0)
	     {
  	      rly_counter--;
    		}
    		else
    		{
   				Relay(0);   
    		}         
           if ( primsg_flag == 0 ) 
     nml_timer = ( nml_timer + 1 ) % 10000;
        
   if ( UpdateFlg == 1 )  
     time_entry(); 
     
    /* Pin PC.06 toggling with frequency = 73.24 Hz */
//    GPIO_WriteBit(GPIOC, GPIO_Pin_6, (BitAction)(1 - GPIO_ReadOutputDataBit(GPIOC, GPIO_Pin_6)));
    capture = TIM_GetCapture1(TIM2);
    TIM_SetCompare1(TIM2, capture + Tim2_CCR1_Val);


  }
  

  
}