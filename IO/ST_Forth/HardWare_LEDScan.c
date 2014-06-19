#include "stm32f10x.h"
#define SPI1_DR_Address    0x4001300C
#define SPI2_DR_Address    0x4000380C

extern DMA_InitTypeDef DMA_InitStructure;
#define LED_byte_Length 10
extern struct LED{
             unsigned char COM[16][LED_byte_Length];
          }LED_display,LED_displayG,LED_buffer,LED_bufferG,Backup,BackupG;

extern unsigned char LED_change;
extern volatile unsigned long msTi ;
unsigned int LedState @"FastDataRAM";
extern unsigned char LED_ON_flag;

extern void LEDsSet (unsigned int State);
extern void DMA_SPI(unsigned int Ti);
extern void mCopy(u8* sBuf,u8* dBuf,u32 Legth);


void  LED_OFF(void);
void TimingDelay_Decrement(void);
void SPI01(unsigned char * add0,unsigned char * add1, unsigned short count);
void  LED_OFF(void)
{
 //  	IO2SET = 0x00800000; // Enable=Hi   
}


/*******************************************************************************
* Function Name  : TimingDelay_Decrement
* Description    : Decrements the TimingDelay variable.
* Input          : None
* Output         : TimingDelay
* Return         : None
*******************************************************************************/
void TimingDelay_Decrement(void)
{
//  if (TimingDelay != 0x00)
//  { 
//    TimingDelay--;
//  }
 
if(  LED_ON_flag != 0) 
{  
    if (LedState==16)
    { 
        LEDsSet(~(0x1));// Enable=Hi  
	SPI01(LED_display.COM[0],LED_displayG.COM[0],LED_byte_Length); // read temperature	
    }
    else
    {
         LEDsSet(~((LedState<<6)|0x1));// Enable=Hi
         LEDsSet(~((LedState<<6)|0x0401));// LE&Enable=Hi        
         LEDsSet(~((LedState<<6)|0x1));// LE=Lo 
         LEDsSet(~((LedState<<6)|0x1));// LE=Lo 
         LEDsSet(~(LedState<<6));          
	if (LedState==15)  
	{
	    if(LED_change==1)
	    {
               mCopy((unsigned char*)LED_buffer.COM[0],(unsigned char*)LED_display.COM[0],LED_byte_Length*16);
               mCopy((unsigned char*)LED_bufferG.COM[0],(unsigned char*)LED_displayG.COM[0],LED_byte_Length*16);                                        
	       LED_change=0;
            }
          
	}	
	else
	{
          SPI01(LED_display.COM[(LedState+1)&0xf],LED_displayG.COM[(LedState+1)&0xf],LED_byte_Length); // read temperature          
        }
     }	
}
else
{
        LEDsSet(~(0x1));// Enable=Hi   
}

  LedState=(LedState+1);
  if (LedState==17)
  {
	LedState=0;
  }  


  
msTi=msTi+1;  
  
    /* Disable SysTick Counter */
  SysTick_CounterCmd(SysTick_Counter_Disable);
  /* Clear SysTick Counter */
  SysTick_CounterCmd(SysTick_Counter_Clear);
 
  /* Enable the SysTick Counter */
  SysTick_CounterCmd(SysTick_Counter_Enable);  
  
}

void SPI01(unsigned char * add0,unsigned char * add1, unsigned short count)@"FastProcRAM"
{

  DMA_InitStructure.DMA_BufferSize = count;//BufferSize;  
  
  
  DMA_DeInit(DMA1_Channel3);
  DMA_InitStructure.DMA_PeripheralBaseAddr = (u32)SPI1_DR_Address;
  DMA_InitStructure.DMA_MemoryBaseAddr = (u32)add0;
  DMA_Init(DMA1_Channel3, &DMA_InitStructure);          

  /* Transfer complete */   
  DMA_DeInit(DMA1_Channel5);
  DMA_InitStructure.DMA_PeripheralBaseAddr = (u32)SPI2_DR_Address;
  DMA_InitStructure.DMA_MemoryBaseAddr = (u32)add1;
  DMA_Init(DMA1_Channel5, &DMA_InitStructure);   
  
  /* Enable SPI DMA Tx request */
    SPI_I2S_DMACmd(SPI2, SPI_I2S_DMAReq_Tx, ENABLE);
  SPI_I2S_DMACmd(SPI1, SPI_I2S_DMAReq_Tx, ENABLE);

  /* Enable SPI&DMA */  
  SPI_Cmd(SPI2, ENABLE);  
    SPI_Cmd(SPI1, ENABLE);
    
  DMA_Cmd(DMA1_Channel5, ENABLE); 
    DMA_Cmd(DMA1_Channel3, ENABLE); 
      
  /* Transfer complete */      
}