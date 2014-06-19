        #include <stdio.h>
        #include <string.h>
        #include "typedef.h"
        #include "LPC22xx.h"

// ¸ê®Æ«Å§i
	extern	unsigned char LED79PAT[];


// Display
unsigned char *S0msg; // pointer to SPI data buffer
unsigned short S0count ;
unsigned char *S1msg; // pointer to SPI data buffer
unsigned short S1count; // nr of bytes send/received
unsigned char temp;
	unsigned long Ti=0;

// UART
unsigned char txptr=0;
unsigned char typtr=0;
u32 ZipLenght;
u32 UnZipLenght;

u8 UnZipBuf[65536];
u8 ZipBuf[65536];
char Alpha[256];
	u8 AlphaLen;
extern	u8	gUartRecTmp;
extern	u8	flg_ESC;
extern	u8	RevFlag;
extern	u16	UartChkSum ;
	u8 Upgrade_flag=0;
        u8      Apha_flag=0;
        
        
// Music
	u8 BUZPIN;

// Flash ROM
unsigned char* ROM     =(unsigned char*)		0x80000000;
unsigned short* wROM     =(unsigned short*)		0x80000000;


