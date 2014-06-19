//LPC2210 Clock
unsigned long Fosc=12000000;
unsigned long CCLK;
unsigned long PCLK;
unsigned long XCLK;

// usrt1 send
extern unsigned char txptr;
extern unsigned char typtr;

// usrt1 rev
/*
extern unsigned char gUartRecTmp,gWRecBuff[MAXLEN_2K5];
extern unsigned int gWRecLen;

extern u8	gUartRecTmp;
extern u8	flg_ESC;
extern u8	RevFlag;
extern u8	gWRecBuff[];
extern u16	UartChkSum ;
extern u32 MaxRevLen;

extern u8 UnZipBuf[];
extern u8 ZipBuf[];
extern char Alpha[];
extern	u8 AlphaLen;
extern u32 ZipLenght;
extern u8 Upgrade_flag;
extern u8 Apha_flag;
*/
// Timer0
extern unsigned char Ti;
extern unsigned long IoTi;

	extern unsigned long msTi;	
extern unsigned int  timer_counter; // 1 second one time
extern unsigned char primsg_flag;
extern unsigned int  nml_timer; // normal message timer ;1 second one time
extern long SYS_sec;
unsigned int ms_timer_counter;
extern unsigned char rly_counter;


extern struct LED{
             unsigned char COM[16][LED_byte_Length];
          }LED_display,LED_displayG,LED_buffer,LED_bufferG,Backup,BackupG;

extern unsigned char temp;  

extern unsigned char LED_change;

// SPI0
extern unsigned short S0count; // nr of bytes send/received 
extern unsigned char *S0msg; // pointer to SPI data buffer
// SPI1
extern unsigned short S1count; // nr of bytes send/received
extern unsigned char *S1msg; // pointer to SPI data buffer


//Timer1
	extern	u32* POINT;
	extern	u32 Music_PTR;
	extern	int Music_Busy;
