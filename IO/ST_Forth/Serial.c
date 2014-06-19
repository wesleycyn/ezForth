/*
  File: Serial.c
  
  To provide UART interrupt callback and char I/O functions.
  
*/

#include "serial.h"

static unsigned char rxbuff[RXBUFF_SIZE];   // Receive buffer
static unsigned char txbuff[TXBUFF_SIZE];   // Transmit buffer
static volatile unsigned int rxbuff_i = 0, rxbuff_j = 0;  // Receive buffer indices
static volatile unsigned int txbuff_i = 0, txbuff_j = 0;  // Transmit buffer indices

int putchar (int c)
{
  unsigned int i = (txbuff_i + 1) % TXBUFF_SIZE;
  
  /* If buffer is not full yet, place the char in buffer for transmit */
  if(i != txbuff_j)
  {
    txbuff_i = i;
    txbuff[txbuff_i] = c;
    txBufEmpty();
  }
  return c;
}

int getchar(void)
{
  /* if buffer is not empty, get a char from the buffer */
  while(rxbuff_i == rxbuff_j);
  rxbuff_j = (rxbuff_j + 1) % RXBUFF_SIZE;
  return rxbuff[rxbuff_j];
}

// UART receive interrupt callback
void byteReceived(unsigned char c)
{
  unsigned int i = (rxbuff_i + 1) % RXBUFF_SIZE;
  
  /* if buffer is not full yet, save it into the buffer */
  if(i != rxbuff_j)
  {
    rxbuff_i = i;
    rxbuff[rxbuff_i] = c;
    putchar(c);
  }
  /*  otherwise, incoming char is losed */
}

// UART transmit interrupt callback
void txBufEmpty(void)
{
  /* if buffer is not empty, transmit a char out from the buffer */
  if(txbuff_i != txbuff_j)
  {
    txbuff_j = (txbuff_j + 1) % TXBUFF_SIZE;
    LPC2294UART0TxByte(txbuff[txbuff_j]);
  }
}

// Import a line of characters from the uart
void scanline(char * line)
{
  char c = getchar();
  int i = 0;
  
  while((c != '\r') && (c != '\n'))
  {
    line[i++] = c;
    c = getchar();
  }
  line[i] = 0;
}
