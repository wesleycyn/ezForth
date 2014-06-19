\ /**
\  * @brief  Configures the System clock source, PLL Multiplier and Divider factors, 
\  *         AHB/APBx prescalers and Flash settings
\  * @Note   This function should be called only once the RCC clock configuration  
\  *         is reset to the default reset state (done in SystemInit() function).   
\  * @param  None
\  * @retval None
\  */

: SetSysClock ( -- )
\ /******************************************************************************/
\ /*            PLL (clocked by HSE) used as System clock source                */
\ /******************************************************************************/
\  __IO uint32_t StartUpCounter = 0, HSEStatus = 0;
  
 \ /* Enable HSE */
 \ RCC->CR |= ((uint32_t)RCC_CR_HSEON);
   RCC->CR @ RCC_CR_HSEON or RCC->CR ! 
 
 \ /* Wait till HSE is ready and if Time out is reached exit */ 
 \ do
 \ {
 \   HSEStatus = RCC->CR & RCC_CR_HSERDY;
 \   StartUpCounter++;
 \ } while((HSEStatus == 0) && (StartUpCounter != HSE_STARTUP_TIMEOUT));
  begin
   RCC->CR @ RCC_CR_HSERDY and 0 =
   StartUpCounter @ 1 + dup StartUpCounter !
   HSE_STARTUP_TIMEOUT <>
   and
  until

\  if ((RCC->CR & RCC_CR_HSERDY) != RESET)
\  {
\    HSEStatus = (uint32_t)0x01;
\  }
\  else
\  {
\    HSEStatus = (uint32_t)0x00;
\  }

   RCC->CR @ RCC_CR_HSERDY and RESET <>
   if
      0x01
   else
      0
   then   


  \ if (HSEStatus == (uint32_t)0x01)
  if
    /* Select regulator voltage output Scale 1 mode, System frequency up to 168 MHz */
    RCC->APB1ENR |= RCC_APB1ENR_PWREN;
    PWR->CR |= PWR_CR_VOS;

    /* HCLK = SYSCLK / 1*/
    RCC->CFGR |= RCC_CFGR_HPRE_DIV1;
      
    /* PCLK2 = HCLK / 2*/
    RCC->CFGR |= RCC_CFGR_PPRE2_DIV2;
    
    /* PCLK1 = HCLK / 4*/
    RCC->CFGR |= RCC_CFGR_PPRE1_DIV4;

    /* Configure the main PLL */
    RCC->PLLCFGR = PLL_M | (PLL_N << 6) | (((PLL_P >> 1) -1) << 16) |
                   (RCC_PLLCFGR_PLLSRC_HSE) | (PLL_Q << 24);

    /* Enable the main PLL */
    RCC->CR |= RCC_CR_PLLON;

    \ /* Wait till the main PLL is ready */
    \ while((RCC->CR & RCC_CR_PLLRDY) == 0){}
    begin
     RCC->CR @ RCC_CR_PLLRDY and 0 =
    until
       
   
    \ /* Configure Flash prefetch, Instruction cache, Data cache and wait state */
    \ FLASH->ACR = FLASH_ACR_PRFTEN |FLASH_ACR_ICEN |FLASH_ACR_DCEN |FLASH_ACR_LATENCY_5WS;
    FLASH_ACR_PRFTEN FLASH_ACR_ICEN or FLASH_ACR_DCEN or FLASH_ACR_LATENCY_5WS or FLASH->ACR !
    
    \ /* Select the main PLL as system clock source */
    \ RCC->CFGR &= (uint32_t)((uint32_t)~(RCC_CFGR_SW));
    RCC_CFGR_SW INVERT RCC->CFGR @ and RCC->CFGR !  
     
    \ RCC->CFGR |= RCC_CFGR_SW_PLL;
    RCC->CFGR @ RCC_CFGR_SW_PLL or RCC->CFGR ! 


    \ /* Wait till the main PLL is used as system clock source */
    \ while ((RCC->CFGR & (uint32_t)RCC_CFGR_SWS ) != RCC_CFGR_SWS_PLL); {}
    begin
     RCC->CFG @ RCC_CFGR_SWS and RCC_CFGR_SWS_PLL <>
    until
    
  else
  \ /* If HSE fails to start-up, the application will have wrong clock configuration. User can add here some code to deal with this error */
  then
;

\s 
/**
  * @brief  Configures the System clock source, PLL Multiplier and Divider factors, 
  *         AHB/APBx prescalers and Flash settings
  * @Note   This function should be called only once the RCC clock configuration  
  *         is reset to the default reset state (done in SystemInit() function).   
  * @param  None
  * @retval None
  */
static void SetSysClock(void)
{
/******************************************************************************/
/*            PLL (clocked by HSE) used as System clock source                */
/******************************************************************************/
  __IO uint32_t StartUpCounter = 0, HSEStatus = 0;
  
  /* Enable HSE */
  RCC->CR |= ((uint32_t)RCC_CR_HSEON);
 
  /* Wait till HSE is ready and if Time out is reached exit */
  do
  {
    HSEStatus = RCC->CR & RCC_CR_HSERDY;
    StartUpCounter++;
  } while((HSEStatus == 0) && (StartUpCounter != HSE_STARTUP_TIMEOUT));

  if ((RCC->CR & RCC_CR_HSERDY) != RESET)
  {
    HSEStatus = (uint32_t)0x01;
  }
  else
  {
    HSEStatus = (uint32_t)0x00;
  }

  if (HSEStatus == (uint32_t)0x01)
  {
    /* Select regulator voltage output Scale 1 mode, System frequency up to 168 MHz */
    RCC->APB1ENR |= RCC_APB1ENR_PWREN;
    PWR->CR |= PWR_CR_VOS;

    /* HCLK = SYSCLK / 1*/
    RCC->CFGR |= RCC_CFGR_HPRE_DIV1;
      
    /* PCLK2 = HCLK / 2*/
    RCC->CFGR |= RCC_CFGR_PPRE2_DIV2;
    
    /* PCLK1 = HCLK / 4*/
    RCC->CFGR |= RCC_CFGR_PPRE1_DIV4;

    /* Configure the main PLL */
    RCC->PLLCFGR = PLL_M | (PLL_N << 6) | (((PLL_P >> 1) -1) << 16) |
                   (RCC_PLLCFGR_PLLSRC_HSE) | (PLL_Q << 24);

    /* Enable the main PLL */
    RCC->CR |= RCC_CR_PLLON;

    /* Wait till the main PLL is ready */
    while((RCC->CR & RCC_CR_PLLRDY) == 0)
    {
    }
   
    /* Configure Flash prefetch, Instruction cache, Data cache and wait state */
    FLASH->ACR = FLASH_ACR_PRFTEN |FLASH_ACR_ICEN |FLASH_ACR_DCEN |FLASH_ACR_LATENCY_5WS;

    /* Select the main PLL as system clock source */
    RCC->CFGR &= (uint32_t)((uint32_t)~(RCC_CFGR_SW));
    RCC->CFGR |= RCC_CFGR_SW_PLL;

    /* Wait till the main PLL is used as system clock source */
    while ((RCC->CFGR & (uint32_t)RCC_CFGR_SWS ) != RCC_CFGR_SWS_PLL);
    {
    }
  }
  else
  { /* If HSE fails to start-up, the application will have wrong clock
         configuration. User can add here some code to deal with this error */
  }

}