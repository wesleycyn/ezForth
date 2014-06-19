/******************** (C) COPYRIGHT 2008 STMicroelectronics ********************
* File Name          : main.c
* Author             : MCD Application Team
* Version            : V2.0.3
* Date               : 09/22/2008
* Description        : Main program body.
********************************************************************************
* THE PRESENT FIRMWARE WHICH IS FOR GUIDANCE ONLY AIMS AT PROVIDING CUSTOMERS
* WITH CODING INFORMATION REGARDING THEIR PRODUCTS IN ORDER FOR THEM TO SAVE TIME.
* AS A RESULT, STMICROELECTRONICS SHALL NOT BE HELD LIABLE FOR ANY DIRECT,
* INDIRECT OR CONSEQUENTIAL DAMAGES WITH RESPECT TO ANY CLAIMS ARISING FROM THE
* CONTENT OF SUCH FIRMWARE AND/OR THE USE MADE BY CUSTOMERS OF THE CODING
* INFORMATION CONTAINED HEREIN IN CONNECTION WITH THEIR PRODUCTS.
*******************************************************************************/

/* Includes ------------------------------------------------------------------*/
#include "stm32f10x.h"
#include "platform_config.h"
#include "fsmc_nor.h"


/* Private typedef -----------------------------------------------------------*/
/* Private define ------------------------------------------------------------*/
#define BUFFER_SIZE        0x400
#define WRITE_READ_ADDR    0x8000
/* Private macro -------------------------------------------------------------*/
/* Private variables ---------------------------------------------------------*/
vu32 TabAddr, MSPValue = 0;
ErrorStatus HSEStartUpStatus;
u16 TxBuffer[BUFFER_SIZE];
NOR_IDTypeDef NOR_ID;

extern int clRed ;
extern int clBlack;

/* Private function prototypes -----------------------------------------------*/
extern void RCC_Configuration(void);
extern void NVIC_Configuration(void);
extern void GPIO_Configuration(void);
extern void DMA_Configuration(void);
extern void SPI_Configuration(void);
extern void RTC_Configuration(void);
extern void  USART_Configuration(void);
extern void Tim2_Configuration(void);
extern void Tim3_Configuration(void);
extern void Tim4_Configuration(void);
extern void Tim5_Configuration(void);
extern void RTC_Configuration(void);
/* Private functions ---------------------------------------------------------*/
void HardWare_Init(void);
void LEDsSet (unsigned int State);

void Fill_Buffer(u16 *pBuffer, u16 BufferLenght, u32 Offset);


/*******************************************************************************
* Function Name  : main
* Description    : Main program.
* Input          : None
* Output         : None
* Return         : None
*******************************************************************************/
void HardWare_Init(void)
{

#ifdef DEBUG
  debug();
#endif
  /* Get main stack pointer value */
  MSPValue = __MRS_MSP(); /* should be 0x2000xxxx */
    
  /* System Clocks Configuration */
  RCC_Configuration();   
  
  
  
  
  GPIO_Configuration();  
 
  /* Write/read to/from FSMC SRAM memory  *************************************/
  /* Enable the FSMC Clock */
  RCC_AHBPeriphClockCmd(RCC_AHBPeriph_FSMC, ENABLE);

  /* Configure FSMC Bank1 NOR/SRAM2 */
//  FSMC_NOR_Init();  
  
//  FSMC_NOR_ReadID(&NOR_ID);
  
  /* Read NOR memory ID */
//  FSMC_NOR_ReadID(&NOR_ID);

//  FSMC_NOR_ReturnToReadMode();

  /* Erase the NOR memory block to write on */
//  FSMC_NOR_EraseBlock(WRITE_READ_ADDR);

  /* Write data to FSMC NOR memory */
  /* Fill the buffer to send */
//  Fill_Buffer(TxBuffer, BUFFER_SIZE, 0x3210);
//  FSMC_NOR_WriteBuffer(TxBuffer, WRITE_READ_ADDR, BUFFER_SIZE);
    
    
  
  /* Turn on Leds connected to GPIO_LED Pin 6 and Pin 8 */
  GPIO_Write(GPIO_LED, GPIO_Pin_6 | GPIO_Pin_8);
  
    GPIO_SetBits(GPIOF,GPIO_Pin_7); // LED_Run On
    GPIO_ResetBits(GPIOF,GPIO_Pin_6); // LED_Busy Off
   clRed=1;
   clBlack=0;  
    
    
  SPI_Configuration(); 
  DMA_Configuration();  
    /* SysTick end of count event each 1ms with input clock equal to 9MHz (HCLK/8, default) */
 // SysTick_SetReload(9000);
 SysTick_SetReload(10500); //AMIC 02/24
// SysTick_SetReload(10125); //
 //SysTick_SetReload(10312); //  
 // SysTick_SetReload(10406); // 
 //SysTick_SetReload(10453); // 
// SysTick_SetReload(10476); // 
// SysTick_SetReload(10488); // 
// SysTick_SetReload(10494); //  
// SysTick_SetReload(10497); //  
// SysTick_SetReload(10498); //  
// SysTick_SetReload(11500); //°{
  /* Enable SysTick interrupt */
  SysTick_ITConfig(ENABLE);
  SysTick_CounterCmd(SysTick_Counter_Enable);  
  
  
  Tim2_Configuration();
  Tim3_Configuration();  
  Tim4_Configuration();  
  Tim5_Configuration();    
  USART_Configuration(); 
  RTC_Configuration();
  
  
    if (BKP_ReadBackupRegister(BKP_DR1) != 0xA5A5)
  {
    /* Backup data register value is not correct or not yet programmed (when
       the first time the program is executed) */
    /* RTC Configuration */
    RTC_Configuration();
    /* Adjust time by values entred by the user on the hyperterminal */
    //Time_Adjust();
    BKP_WriteBackupRegister(BKP_DR1, 0xA5A5);
  }
  else
  {
    /* Check if the Power On Reset flag is set */
    if (RCC_GetFlagStatus(RCC_FLAG_PORRST) != RESET)
    {
    }
    /* Check if the Pin Reset flag is set */
    else if (RCC_GetFlagStatus(RCC_FLAG_PINRST) != RESET)
    {
    }

    /* Wait for RTC registers synchronization */
    RTC_WaitForSynchro();

    /* Enable the RTC Second */
    RTC_ITConfig(RTC_IT_SEC, ENABLE);
    /* Wait until last write operation on RTC registers has finished */
    RTC_WaitForLastTask();
  }
  
  /* Clear reset flags */
  RCC_ClearFlag();
  
  /* NVIC configuration */
  NVIC_Configuration();

  
}







#ifdef  DEBUG
/*******************************************************************************
* Function Name  : assert_failed
* Description    : Reports the name of the source file and the source line number
*                  where the assert_param error has occurred.
* Input          : - file: pointer to the source file name
*                  - line: assert_param error line source number
* Output         : None
* Return         : None
*******************************************************************************/
void assert_failed(u8* file, u32 line)
{ 
  /* User can add his own implementation to report the file name and line number,
     ex: printf("Wrong parameters value: file %s on line %d\r\n", file, line) */

  /* Infinite loop */
  while (1)
  {
  }
}
#endif

/******************* (C) COPYRIGHT 2008 STMicroelectronics *****END OF FILE****/

/*************************************************************************
 * Function Name: LEDsSet
 * Parameters: unsigned int State
 *
 * Return: none
 *
 * Description: Set LEDS State
 *
 *************************************************************************/
void LEDsSet (unsigned int State)
{
  GPIO_WriteBit(GPIOA,GPIO_Pin_4 ,(State & (1<<0 ))?Bit_RESET:Bit_SET);
//  GPIO_WriteBit(GPIOA,GPIO_Pin_5 ,(State & (1<<1 ))?Bit_RESET:Bit_SET);
//  GPIO_WriteBit(GPIOA,GPIO_Pin_6 ,(State & (1<<2 ))?Bit_RESET:Bit_SET);
//  GPIO_WriteBit(GPIOA,GPIO_Pin_7 ,(State & (1<<3 ))?Bit_RESET:Bit_SET);
//  GPIO_WriteBit(GPIOA,GPIO_Pin_9 ,(State & (1<<4 ))?Bit_RESET:Bit_SET);
//  GPIO_WriteBit(GPIOA,GPIO_Pin_10,(State & (1<<5 ))?Bit_RESET:Bit_SET);
  GPIO_WriteBit(GPIOB,GPIO_Pin_6 ,(State & (1<<6 ))?Bit_RESET:Bit_SET);
  GPIO_WriteBit(GPIOB,GPIO_Pin_7 ,(State & (1<<7 ))?Bit_RESET:Bit_SET);
  GPIO_WriteBit(GPIOB,GPIO_Pin_10,(State & (1<<8 ))?Bit_RESET:Bit_SET);
  GPIO_WriteBit(GPIOB,GPIO_Pin_11,(State & (1<<9 ))?Bit_RESET:Bit_SET);
  GPIO_WriteBit(GPIOB,GPIO_Pin_12,(State & (1<<10))?Bit_RESET:Bit_SET);
//  GPIO_WriteBit(GPIOB,GPIO_Pin_13,(State & (1<<11))?Bit_RESET:Bit_SET);
//  GPIO_WriteBit(GPIOB,GPIO_Pin_14,(State & (1<<12))?Bit_RESET:Bit_SET);
//  GPIO_WriteBit(GPIOB,GPIO_Pin_15,(State & (1<<13))?Bit_RESET:Bit_SET);
//  GPIO_WriteBit(GPIOC,GPIO_Pin_6 ,(State & (1<<14))?Bit_RESET:Bit_SET);
//  GPIO_WriteBit(GPIOC,GPIO_Pin_7 ,(State & (1<<15))?Bit_RESET:Bit_SET);
}





/*******************************************************************************
* Function name : Fill_Buffer
* Description   : Fill the global buffer
* Input         : - pBuffer: pointer on the Buffer to fill
*                 - BufferSize: size of the buffer to fill
*                 - Offset: first value to fill on the Buffer
* Output param  : None
*******************************************************************************/
void Fill_Buffer(u16 *pBuffer, u16 BufferLenght, u32 Offset)
{
  u16 IndexTmp = 0;

  /* Put in global buffer same values */
  for (IndexTmp = 0; IndexTmp < BufferLenght; IndexTmp++ )
  {
    pBuffer[IndexTmp] = IndexTmp + Offset;
  }
}

