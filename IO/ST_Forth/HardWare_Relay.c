#include "stm32f10x.h"

void Relay(int color);

void Relay(int color)
{
  if (color==1)
  {    
    GPIO_SetBits(GPIOF,GPIO_Pin_8);
  }
  else
  {
    GPIO_ResetBits(GPIOF,GPIO_Pin_8);    
    
  }
}