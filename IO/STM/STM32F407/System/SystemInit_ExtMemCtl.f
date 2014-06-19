/**
  * @brief  Setup the external memory controller.
  *         Called in startup_stm32f4xx.s before jump to main.
  *         This function configures the external SRAM mounted on STM324xG_EVAL/STM324x7I_EVAL board
  *         This SRAM will be used as program data memory (including heap and stack).
  * @param  None
  * @retval None
  */

: SystemInit_ExtMemCtl ( -- )
\ /*-- GPIOs Configuration -----------------------------------------------------*/
\ /*
\ +-------------------+--------------------+------------------+------------------+
\ +                       SRAM pins assignment                                   +
\ +-------------------+--------------------+------------------+------------------+
\ | PD0  <-> FSMC_D2  | PE0  <-> FSMC_NBL0 | PF0 <-> FSMC_A0  | PG0 <-> FSMC_A10 |
\ | PD1  <-> FSMC_D3  | PE1  <-> FSMC_NBL1 | PF1 <-> FSMC_A1  | PG1 <-> FSMC_A11 |
\ | PD4  <-> FSMC_NOE | PE2  <-> FSMC_A23  | PF2 <-> FSMC_A2  | PG2 <-> FSMC_A12 |
\ | PD5  <-> FSMC_NWE | PE3  <-> FSMC_A19  | PF3 <-> FSMC_A3  | PG3 <-> FSMC_A13 |
\ | PD8  <-> FSMC_D13 | PE4  <-> FSMC_A20  | PF4 <-> FSMC_A4  | PG4 <-> FSMC_A14 |
\ | PD9  <-> FSMC_D14 | PE5  <-> FSMC_A21  | PF5 <-> FSMC_A5  | PG5 <-> FSMC_A15 |
\ | PD10 <-> FSMC_D15 | PE6  <-> FSMC_A22  | PF12 <-> FSMC_A6 | PG9 <-> FSMC_NE2 |
\ | PD11 <-> FSMC_A16 | PE7  <-> FSMC_D4   | PF13 <-> FSMC_A7 |------------------+
\ | PD12 <-> FSMC_A17 | PE8  <-> FSMC_D5   | PF14 <-> FSMC_A8 |
\ | PD13 <-> FSMC_A18 | PE9  <-> FSMC_D6   | PF15 <-> FSMC_A9 |
\ | PD14 <-> FSMC_D0  | PE10 <-> FSMC_D7   |------------------+
\ | PD15 <-> FSMC_D1  | PE11 <-> FSMC_D8   |
\ +-------------------| PE12 <-> FSMC_D9   |
\                     | PE13 <-> FSMC_D10  |
\                     | PE14 <-> FSMC_D11  |
\                     | PE15 <-> FSMC_D12  |
\                     +--------------------+
\ 
   /* Enable GPIOD, GPIOE, GPIOF and GPIOG interface clock */
  RCC->AHB1ENR   |= 0x00000078;
  
  /* Connect PDx pins to FSMC Alternate function */
  GPIOD->AFR[0]  = 0x00cc00cc;
  GPIOD->AFR[1]  = 0xcccccccc;
  /* Configure PDx pins in Alternate function mode */  
  GPIOD->MODER   = 0xaaaa0a0a;
  /* Configure PDx pins speed to 100 MHz */  
  GPIOD->OSPEEDR = 0xffff0f0f;
  /* Configure PDx pins Output type to push-pull */  
  GPIOD->OTYPER  = 0x00000000;
  /* No pull-up, pull-down for PDx pins */ 
  GPIOD->PUPDR   = 0x00000000;

  /* Connect PEx pins to FSMC Alternate function */
  GPIOE->AFR[0]  = 0xcccccccc;
  GPIOE->AFR[1]  = 0xcccccccc;
  /* Configure PEx pins in Alternate function mode */ 
  GPIOE->MODER   = 0xaaaaaaaa;
  /* Configure PEx pins speed to 100 MHz */ 
  GPIOE->OSPEEDR = 0xffffffff;
  /* Configure PEx pins Output type to push-pull */  
  GPIOE->OTYPER  = 0x00000000;
  /* No pull-up, pull-down for PEx pins */ 
  GPIOE->PUPDR   = 0x00000000;

  /* Connect PFx pins to FSMC Alternate function */
  GPIOF->AFR[0]  = 0x00cccccc;
  GPIOF->AFR[1]  = 0xcccc0000;
  /* Configure PFx pins in Alternate function mode */   
  GPIOF->MODER   = 0xaa000aaa;
  /* Configure PFx pins speed to 100 MHz */ 
  GPIOF->OSPEEDR = 0xff000fff;
  /* Configure PFx pins Output type to push-pull */  
  GPIOF->OTYPER  = 0x00000000;
  /* No pull-up, pull-down for PFx pins */ 
  GPIOF->PUPDR   = 0x00000000;

  /* Connect PGx pins to FSMC Alternate function */
  GPIOG->AFR[0]  = 0x00cccccc;
  GPIOG->AFR[1]  = 0x000000c0;
  /* Configure PGx pins in Alternate function mode */ 
  GPIOG->MODER   = 0x00080aaa;
  /* Configure PGx pins speed to 100 MHz */ 
  GPIOG->OSPEEDR = 0x000c0fff;
  /* Configure PGx pins Output type to push-pull */  
  GPIOG->OTYPER  = 0x00000000;
  /* No pull-up, pull-down for PGx pins */ 
  GPIOG->PUPDR   = 0x00000000;
  
/*-- FSMC Configuration ------------------------------------------------------*/
  /* Enable the FSMC interface clock */
  RCC->AHB3ENR         |= 0x00000001;

  /* Configure and enable Bank1_SRAM2 */
  FSMC_Bank1->BTCR[2]  = 0x00001011;
  FSMC_Bank1->BTCR[3]  = 0x00000201;
  FSMC_Bank1E->BWTR[2] = 0x0fffffff;
/*
  Bank1_SRAM2 is configured as follow:

  p.FSMC_AddressSetupTime = 1;
  p.FSMC_AddressHoldTime = 0;
  p.FSMC_DataSetupTime = 2;
  p.FSMC_BusTurnAroundDuration = 0;
  p.FSMC_CLKDivision = 0;
  p.FSMC_DataLatency = 0;
  p.FSMC_AccessMode = FSMC_AccessMode_A;

  FSMC_NORSRAMInitStructure.FSMC_Bank = FSMC_Bank1_NORSRAM2;
  FSMC_NORSRAMInitStructure.FSMC_DataAddressMux = FSMC_DataAddressMux_Disable;
  FSMC_NORSRAMInitStructure.FSMC_MemoryType = FSMC_MemoryType_SRAM;
  FSMC_NORSRAMInitStructure.FSMC_MemoryDataWidth = FSMC_MemoryDataWidth_16b;
  FSMC_NORSRAMInitStructure.FSMC_BurstAccessMode = FSMC_BurstAccessMode_Disable;
  FSMC_NORSRAMInitStructure.FSMC_AsynchronousWait = FSMC_AsynchronousWait_Disable;  
  FSMC_NORSRAMInitStructure.FSMC_WaitSignalPolarity = FSMC_WaitSignalPolarity_Low;
  FSMC_NORSRAMInitStructure.FSMC_WrapMode = FSMC_WrapMode_Disable;
  FSMC_NORSRAMInitStructure.FSMC_WaitSignalActive = FSMC_WaitSignalActive_BeforeWaitState;
  FSMC_NORSRAMInitStructure.FSMC_WriteOperation = FSMC_WriteOperation_Enable;
  FSMC_NORSRAMInitStructure.FSMC_WaitSignal = FSMC_WaitSignal_Disable;
  FSMC_NORSRAMInitStructure.FSMC_ExtendedMode = FSMC_ExtendedMode_Disable;
  FSMC_NORSRAMInitStructure.FSMC_WriteBurst = FSMC_WriteBurst_Disable;
  FSMC_NORSRAMInitStructure.FSMC_ReadWriteTimingStruct = &p;
  FSMC_NORSRAMInitStructure.FSMC_WriteTimingStruct = &p;
*/
}
#endif /* DATA_IN_ExtSRAM */


\s
/**
  * @brief  Setup the external memory controller. Called in startup_stm32f4xx.s 
  *          before jump to __main
  * @param  None
  * @retval None
  */ 
#ifdef DATA_IN_ExtSRAM
/**
  * @brief  Setup the external memory controller.
  *         Called in startup_stm32f4xx.s before jump to main.
  *         This function configures the external SRAM mounted on STM324xG_EVAL/STM324x7I_EVAL board
  *         This SRAM will be used as program data memory (including heap and stack).
  * @param  None
  * @retval None
  */
void SystemInit_ExtMemCtl(void)
{
/*-- GPIOs Configuration -----------------------------------------------------*/
/*
 +-------------------+--------------------+------------------+------------------+
 +                       SRAM pins assignment                                   +
 +-------------------+--------------------+------------------+------------------+
 | PD0  <-> FSMC_D2  | PE0  <-> FSMC_NBL0 | PF0 <-> FSMC_A0  | PG0 <-> FSMC_A10 |
 | PD1  <-> FSMC_D3  | PE1  <-> FSMC_NBL1 | PF1 <-> FSMC_A1  | PG1 <-> FSMC_A11 |
 | PD4  <-> FSMC_NOE | PE2  <-> FSMC_A23  | PF2 <-> FSMC_A2  | PG2 <-> FSMC_A12 |
 | PD5  <-> FSMC_NWE | PE3  <-> FSMC_A19  | PF3 <-> FSMC_A3  | PG3 <-> FSMC_A13 |
 | PD8  <-> FSMC_D13 | PE4  <-> FSMC_A20  | PF4 <-> FSMC_A4  | PG4 <-> FSMC_A14 |
 | PD9  <-> FSMC_D14 | PE5  <-> FSMC_A21  | PF5 <-> FSMC_A5  | PG5 <-> FSMC_A15 |
 | PD10 <-> FSMC_D15 | PE6  <-> FSMC_A22  | PF12 <-> FSMC_A6 | PG9 <-> FSMC_NE2 |
 | PD11 <-> FSMC_A16 | PE7  <-> FSMC_D4   | PF13 <-> FSMC_A7 |------------------+
 | PD12 <-> FSMC_A17 | PE8  <-> FSMC_D5   | PF14 <-> FSMC_A8 |
 | PD13 <-> FSMC_A18 | PE9  <-> FSMC_D6   | PF15 <-> FSMC_A9 |
 | PD14 <-> FSMC_D0  | PE10 <-> FSMC_D7   |------------------+
 | PD15 <-> FSMC_D1  | PE11 <-> FSMC_D8   |
 +-------------------| PE12 <-> FSMC_D9   |
                     | PE13 <-> FSMC_D10  |
                     | PE14 <-> FSMC_D11  |
                     | PE15 <-> FSMC_D12  |
                     +--------------------+
*/
   /* Enable GPIOD, GPIOE, GPIOF and GPIOG interface clock */
  RCC->AHB1ENR   |= 0x00000078;
  
  /* Connect PDx pins to FSMC Alternate function */
  GPIOD->AFR[0]  = 0x00cc00cc;
  GPIOD->AFR[1]  = 0xcccccccc;
  /* Configure PDx pins in Alternate function mode */  
  GPIOD->MODER   = 0xaaaa0a0a;
  /* Configure PDx pins speed to 100 MHz */  
  GPIOD->OSPEEDR = 0xffff0f0f;
  /* Configure PDx pins Output type to push-pull */  
  GPIOD->OTYPER  = 0x00000000;
  /* No pull-up, pull-down for PDx pins */ 
  GPIOD->PUPDR   = 0x00000000;

  /* Connect PEx pins to FSMC Alternate function */
  GPIOE->AFR[0]  = 0xcccccccc;
  GPIOE->AFR[1]  = 0xcccccccc;
  /* Configure PEx pins in Alternate function mode */ 
  GPIOE->MODER   = 0xaaaaaaaa;
  /* Configure PEx pins speed to 100 MHz */ 
  GPIOE->OSPEEDR = 0xffffffff;
  /* Configure PEx pins Output type to push-pull */  
  GPIOE->OTYPER  = 0x00000000;
  /* No pull-up, pull-down for PEx pins */ 
  GPIOE->PUPDR   = 0x00000000;

  /* Connect PFx pins to FSMC Alternate function */
  GPIOF->AFR[0]  = 0x00cccccc;
  GPIOF->AFR[1]  = 0xcccc0000;
  /* Configure PFx pins in Alternate function mode */   
  GPIOF->MODER   = 0xaa000aaa;
  /* Configure PFx pins speed to 100 MHz */ 
  GPIOF->OSPEEDR = 0xff000fff;
  /* Configure PFx pins Output type to push-pull */  
  GPIOF->OTYPER  = 0x00000000;
  /* No pull-up, pull-down for PFx pins */ 
  GPIOF->PUPDR   = 0x00000000;

  /* Connect PGx pins to FSMC Alternate function */
  GPIOG->AFR[0]  = 0x00cccccc;
  GPIOG->AFR[1]  = 0x000000c0;
  /* Configure PGx pins in Alternate function mode */ 
  GPIOG->MODER   = 0x00080aaa;
  /* Configure PGx pins speed to 100 MHz */ 
  GPIOG->OSPEEDR = 0x000c0fff;
  /* Configure PGx pins Output type to push-pull */  
  GPIOG->OTYPER  = 0x00000000;
  /* No pull-up, pull-down for PGx pins */ 
  GPIOG->PUPDR   = 0x00000000;
  
/*-- FSMC Configuration ------------------------------------------------------*/
  /* Enable the FSMC interface clock */
  RCC->AHB3ENR         |= 0x00000001;

  /* Configure and enable Bank1_SRAM2 */
  FSMC_Bank1->BTCR[2]  = 0x00001011;
  FSMC_Bank1->BTCR[3]  = 0x00000201;
  FSMC_Bank1E->BWTR[2] = 0x0fffffff;
/*
  Bank1_SRAM2 is configured as follow:

  p.FSMC_AddressSetupTime = 1;
  p.FSMC_AddressHoldTime = 0;
  p.FSMC_DataSetupTime = 2;
  p.FSMC_BusTurnAroundDuration = 0;
  p.FSMC_CLKDivision = 0;
  p.FSMC_DataLatency = 0;
  p.FSMC_AccessMode = FSMC_AccessMode_A;

  FSMC_NORSRAMInitStructure.FSMC_Bank = FSMC_Bank1_NORSRAM2;
  FSMC_NORSRAMInitStructure.FSMC_DataAddressMux = FSMC_DataAddressMux_Disable;
  FSMC_NORSRAMInitStructure.FSMC_MemoryType = FSMC_MemoryType_SRAM;
  FSMC_NORSRAMInitStructure.FSMC_MemoryDataWidth = FSMC_MemoryDataWidth_16b;
  FSMC_NORSRAMInitStructure.FSMC_BurstAccessMode = FSMC_BurstAccessMode_Disable;
  FSMC_NORSRAMInitStructure.FSMC_AsynchronousWait = FSMC_AsynchronousWait_Disable;  
  FSMC_NORSRAMInitStructure.FSMC_WaitSignalPolarity = FSMC_WaitSignalPolarity_Low;
  FSMC_NORSRAMInitStructure.FSMC_WrapMode = FSMC_WrapMode_Disable;
  FSMC_NORSRAMInitStructure.FSMC_WaitSignalActive = FSMC_WaitSignalActive_BeforeWaitState;
  FSMC_NORSRAMInitStructure.FSMC_WriteOperation = FSMC_WriteOperation_Enable;
  FSMC_NORSRAMInitStructure.FSMC_WaitSignal = FSMC_WaitSignal_Disable;
  FSMC_NORSRAMInitStructure.FSMC_ExtendedMode = FSMC_ExtendedMode_Disable;
  FSMC_NORSRAMInitStructure.FSMC_WriteBurst = FSMC_WriteBurst_Disable;
  FSMC_NORSRAMInitStructure.FSMC_ReadWriteTimingStruct = &p;
  FSMC_NORSRAMInitStructure.FSMC_WriteTimingStruct = &p;
*/
}
#endif /* DATA_IN_ExtSRAM */