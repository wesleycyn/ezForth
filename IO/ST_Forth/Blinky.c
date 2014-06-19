/*
  File: Blinky.c

  To blink the onboard LED (D3) of the Phytec PCM-023 board
  for every 65ms.

*/

#include <intrinsics.h>
#include "timer.h"
#include "lpc2294.h"

int main (void)
{
  // System initialization, this will map the exception vectors.
  LPC2294SystemInit();

  // Set up peripheral registers.
  LPC2294InitPIO();

  // First disable interrupts.
  __disable_interrupt();

  // Setup interrupt controller.
  LPC2294InitVIC();
  LPC2294InitTimerInterrupt(TimerBeat);

  // Periodic timer initialization.
  LPC2294InitTimer();

  // Enable interrupts.
  __enable_interrupt();

  // Start periodic timer.
  LPC2294StartTimer();

  // Loop forever.
  for (;;)
  {
    LPC2294LedSet();
    Sleep(200);      // Display for 65 ms.
    LPC2294LedClear();
    Sleep(200);      // Display for 65 ms.
  }
}
