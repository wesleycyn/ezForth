: SystemInit ( -- )
\  /* FPU settings ------------------------------------------------------------*/
\  #if (__FPU_PRESENT == 1) && (__FPU_USED == 1)
\    SCB->CPACR |= ((3UL << 10*2)|(3UL << 11*2));  /* set CP10 and CP11 Full Access */
\  #endif

\  /* Reset the RCC clock configuration to the default reset state ------------*/
\  /* Set HSION bit */
\  RCC->CR |= (uint32_t)0x00000001;
   RCC->CR @ 0x00000001 or RCC->CR ! 

\  /* Reset CFGR register */
\  RCC->CFGR = 0x00000000;
   0x00000000 RCC->CFGR !

\  /* Reset HSEON, CSSON and PLLON bits */
\  RCC->CR &= (uint32_t)0xFEF6FFFF;
   RCC->CR @ 0xFEF6FFFF and RCC->CR ! 


\  /* Reset PLLCFGR register */
\  RCC->PLLCFGR = 0x24003010;
   0x24003010  RCC->PLLCFGR !

\  /* Reset HSEBYP bit */
\  RCC->CR &= (uint32_t)0xFFFBFFFF;
   RCC->CR @ 0xFFFBFFFF and RCC->CR !

\  /* Disable all interrupts */
\  RCC->CIR = 0x00000000;
   0x00000000 RCC->CIR !

\ #ifdef DATA_IN_ExtSRAM
\  SystemInit_ExtMemCtl(); 
\ #endif /* DATA_IN_ExtSRAM */
  SystemInit_ExtMemCtl

\  /* Configure the System clock source, PLL Multiplier and Divider factors, AHB/APBx prescalers and Flash settings ----------------------------------*/
\  SetSysClock();
   SetSysClock

\   /* Configure the Vector Table location add offset address ------------------*/
\ #ifdef VECT_TAB_SRAM
\  SCB->VTOR = SRAM_BASE | VECT_TAB_OFFSET; /* Vector Table Relocation in Internal SRAM */
\ #else
\  SCB->VTOR = FLASH_BASE | VECT_TAB_OFFSET; /* Vector Table Relocation in Internal FLASH */
\ #endif

;


\s


/**
  * @brief  Setup the microcontroller system
  *         Initialize the Embedded Flash Interface, the PLL and update the 
  *         SystemFrequency variable.
  * @param  None
  * @retval None
  */
void SystemInit(void)
{
  /* FPU settings ------------------------------------------------------------*/
  #if (__FPU_PRESENT == 1) && (__FPU_USED == 1)
    SCB->CPACR |= ((3UL << 10*2)|(3UL << 11*2));  /* set CP10 and CP11 Full Access */
  #endif
  /* Reset the RCC clock configuration to the default reset state ------------*/
  /* Set HSION bit */
  RCC->CR |= (uint32_t)0x00000001;

  /* Reset CFGR register */
  RCC->CFGR = 0x00000000;

  /* Reset HSEON, CSSON and PLLON bits */
  RCC->CR &= (uint32_t)0xFEF6FFFF;

  /* Reset PLLCFGR register */
  RCC->PLLCFGR = 0x24003010;

  /* Reset HSEBYP bit */
  RCC->CR &= (uint32_t)0xFFFBFFFF;

  /* Disable all interrupts */
  RCC->CIR = 0x00000000;

#ifdef DATA_IN_ExtSRAM
  SystemInit_ExtMemCtl(); 
#endif /* DATA_IN_ExtSRAM */
         
  /* Configure the System clock source, PLL Multiplier and Divider factors, 
     AHB/APBx prescalers and Flash settings ----------------------------------*/
  SetSysClock();

  /* Configure the Vector Table location add offset address ------------------*/
#ifdef VECT_TAB_SRAM
  SCB->VTOR = SRAM_BASE | VECT_TAB_OFFSET; /* Vector Table Relocation in Internal SRAM */
#else
  SCB->VTOR = FLASH_BASE | VECT_TAB_OFFSET; /* Vector Table Relocation in Internal FLASH */
#endif
}