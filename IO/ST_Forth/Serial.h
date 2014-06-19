/*
  File: Serial.h
*/

#ifndef __SERIAL_H__
#define __SERIAL_H__

#define RXBUFF_SIZE 20    /* Size of receive buffer */
#define TXBUFF_SIZE 20    /* Size of transmit buffer */

#include "lpc2294.h"
#include <stdio.h>

void byteReceived(unsigned char);
void txBufEmpty(void);
void scanline(char *);

#endif  /* __SERIAL_H__ */
