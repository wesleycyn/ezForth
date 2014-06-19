\ 0x4002 3800 - 0x4002 3BFF

 
 0 4 * 40023800 + CONSTANT RCC->CR        
 1 4 * 40023800 + CONSTANT RCC->PLLCFGR   
 2 4 * 40023800 + CONSTANT RCC->CFGR      
 3 4 * 40023800 + CONSTANT RCC->CIR       
 4 4 * 40023800 + CONSTANT RCC->AHB1RSTR  
 5 4 * 40023800 + CONSTANT RCC->AHB2RSTR  
 6 4 * 40023800 + CONSTANT RCC->AHB3RSTR  
        	 
 8 4 * 40023800 + CONSTANT RCC->APB1RSTR  
 9 4 * 40023800 + CONSTANT RCC->APB2RSTR  
      
12 4 * 40023800 + CONSTANT RCC->AHB1ENR    
13 4 * 40023800 + CONSTANT RCC->AHB2ENR    
14 4 * 40023800 + CONSTANT RCC->AHB3ENR    


0x00000001 CONSTANT  RCC_CR_HSION    \ /* Internal High Speed clock enable */
0x00000002 CONSTANT  RCC_CR_HSIRDY   \ /* Internal High Speed clock ready flag */
0x000000F8 CONSTANT  RCC_CR_HSITRIM  \ /* Internal High Speed clock trimming */
0x0000FF00 CONSTANT  RCC_CR_HSICAL   \ /* Internal High Speed clock Calibration */
0x00010000 CONSTANT  RCC_CR_HSEON    \ /* External High Speed clock enable */
0x00020000 CONSTANT  RCC_CR_HSERDY   \ /* External High Speed clock ready flag */
0x00040000 CONSTANT  RCC_CR_HSEBYP   \ /* External High Speed clock Bypass */
0x00080000 CONSTANT  RCC_CR_CSSON    \ /* Clock Security System enable */
0x01000000 CONSTANT  RCC_CR_PLLON    \ /* PLL enable */
0x02000000 CONSTANT  RCC_CR_PLLRDY   \ /* PLL clock ready flag */