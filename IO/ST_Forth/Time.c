/*
  File: Timer.h
  
  To provide timer interrupt callback and sleep functions.
  
*/
#include "timer.h"

static volatile int ms_ctr = 0;

// Timer interrupt callback
void TimerBeat(void)
{
  // Called at 1000 Hz rate.
  ms_ctr++; // Sleep counter.
}

void Sleep(int milliseconds)
{
  ms_ctr = 0;
  while (ms_ctr < milliseconds) ;
}
