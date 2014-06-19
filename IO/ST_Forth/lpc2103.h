// LPC2103 has 14.745600MHz crystal


#define XTALFREQ 14745600         //XTAL frequency in Hz
#define PCLKFREQ (XTALFREQ/4)     //pclk must always be XTALFREQ/4 when PLL off
#define CCLKFREQ (XTALFREQ*5)/4
