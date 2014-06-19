/*************************************************************************
*       IAR V.2.31 Program
*       GOLD APOLLO CO., LTD.
*       LED Display V 1.0 2003.6.16
*       File Name : ioReFlex.h
*       Writed by : Tommy Chang 
**************************************************************************/

#define MAXLEN_2K5          2500       // UART input data length.
#define MAXLEN_1K           1000       // UART output data length.
#define MAXUART 300
#define XTAL 8064000         // set MCU use crystal frequence.
//#define XTAL 14318000         // set MCU use crystal frequence.
#define UART_19200 XTAL/(16*19200)-1 // Transfer speed 19200. use f1.
#define UART_9600  XTAL/(16*9600)-1  // Transfer speed 9600. use f1.
#define UART_4800  XTAL/(16*4800)-1  // Transfer speed 9600. use f1.
#define Timer_850  XTAL/(8*900)-1    // timer speed 850Hz. use f1.this is LED display move speed !

//#define LRCMPowerDisable   P7.6
//#define BUZPIN    P8.0
//#define MOTOR     P9.2
//#define FLASH_STATIC	P9.3
//#define FLASH_ON_SYM	P8.0

//#define SCLPIN  	P7.5
//#define SDAPIN  	P7.7
//#define D_SDA		P7D.7
//#define D_SCL		P7D.5
//#define SCLPIN      P7.5
//#define SDAPIN      P7.7
//#define SDADIR      P7D.7
//#define SCLDIR      P7D.5

#define STX 0x02
#define ETX 0x03
#define EOT 0x04
#define ACK 0x06
#define BEL 0x07
#define VT  0x0B
#define SO  0x0E
#define SI  0x0F
#define NAK 0x15
#define SYN 0x16
#define SUB 0x1A
#define ESC 0x1B
#define GS  0x1D
#define RS  0x1E
#define passive 0
#define active1 1
#define active2 2
#define active3 3

#define NewMode 0x5A
#define OldMode 0xA5

//#define RTS_output      P6.0
//#define CTS_input       P6.4

//¬O§_­nMix Mode
//#define Mix
#define LEDType 71  //V5.x = 50   V5.xR=51   V7.x=70   V7.xR=71
//different length chang here
#define QueryVer       50  //PC Query LED Sign Length
#define PriID          24

#define LEDVersion     "Soft V1.0R"
#define LEDLength      "LED  LH=10"
#define LED_byte_Length 10
//----------------------------------------

//#define LEDVersion     "Software Version_5.0"
//#define LEDLength      "  LED Length = 20"
//#define LED_byte_Length 20

//different length chang here

#define LED_buf_len_byte	LED_byte_Length*16
#define LED_buf_len_word	LED_byte_Length*8
#define LED_bit_Length          LED_byte_Length*8
#define RndRange                LED_byte_Length*8*16
#define Mark                    "\1\1\2\3\4\5\6\7\x8\x9"
#define LED_Com_disable  P9.1
#define LED_shift_Latch  P9.0

#define LVL2Cmd1 0x02
#define LVL2Cmd2 0x05
#define LVL2Cmd3 0x06

#define NotLVL2Cmd1 0xFD
#define NotLVL2Cmd2 0xFA
#define NotLVL2Cmd3 0xF9

#define   FLAG_Copied         0x80
#define   FLAG_Compress       0x40

#define   TRUE                1
#define   FALSE               0

#define RTCSecond 0x00
#define RTCMinute 0x01
#define RTCHour 0x02
#define RTCDay 0x04
#define RTCMonth 0x05
#define RTCYear 0x06