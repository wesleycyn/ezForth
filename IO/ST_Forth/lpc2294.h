#ifndef __LPC2294_H__
#define __LPC2294_H__

//XTAL frequency in Hz
#define XTALFREQ 10000000

#define PCLKFREQ (XTALFREQ/4)

void LPC2294SystemInit(void);

void LPC2294InitVIC(void);
void LPC2294InitTimerInterrupt(void(*timer_func)(void));
void LPC2294InitUART0Interrupt(void(*uart0rx_func)(unsigned char),
                               void(*uart0tx_func)(void));
                               
void LPC2294InitTimer(void);
void LPC2294StartTimer(void);

void LPC2294InitPIO(void);
void LPC2294LedSet(void);
void LPC2294LedClear(void);

void LPC2294InitUART0(void);

void LPC2294UART0TxByte(unsigned char byte);

#endif  /* __LPC2294_H__ */
