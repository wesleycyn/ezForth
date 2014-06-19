/*************************************************************************
*       IAR V.2.31 Program
*       GOLD APOLLO CO., LTD.
*       LED Display V 1.0 2003.6.16
*       File Name : global_main.h
**************************************************************************/

// global_main.h this is variable 

#include "ioReFlex.h"

//#pragma warnings=off
//extern const char far mon_day[];
//extern const char far mon_day1[];
//#pragma warnings=default

//#pragma memory=near
//**********************Use By LED_Effect.c************************

const unsigned char MarkStrBoot[] 	="\1\1\2\3\4\5\6\7\x8\x9";
#ifndef _HardWare
  #define __no_init  
#endif


__no_init unsigned char udf[LED_byte_Length];
__no_init unsigned char udfG[LED_byte_Length];
__no_init unsigned char UartPreFrmTbl[255];
__no_init unsigned char CommandMode;
__no_init struct {
    unsigned char Start;
    unsigned char End;
}UARTFRM,Reserve;
__no_init unsigned char UartDispMode,UartLang ;//Lang=0  =>Normal ; Lang=1  =>Russian
__no_init unsigned char UartID,UartDelFlg;
__no_init unsigned char UpdateFlg ;


__no_init unsigned char UpgradeMode;
__no_init unsigned long TxtChkSum;
unsigned short UartChkSum=0;
unsigned long RevBuffIndex=0;
unsigned char RevCommand=0,RevFlag=0;
__no_init unsigned long Cmd1Length,Cmd3Length;
__no_init unsigned long LastCmd3Len;
unsigned long Times=0;
unsigned char Htag=0x20,UartHtag;
unsigned char Dtag,TestMode=0;
//******************************************************************

////const unsigned char *POINT;
__no_init unsigned char LNG,R_MCNT;
unsigned int Rec_Timer_cnt=0;
//long SYS_sec=0 ;
long SYS_sec @"FastDataRAM";

unsigned int gWRecLen=0 ;
__no_init unsigned char gUartRecTmp,gWRecBuff[MAXLEN_2K5];
 unsigned int gWTxLen=0, gWTxCnt=0;
__no_init unsigned char gWTxBuff[MAXLEN_1K] ;
unsigned int RecLen=0, RecIndex=0;

__no_init unsigned char MUS_flg,LED_ON_flag,MUS_timeout,flg_ESC,RTS_flg,RTS_flg1;


volatile  unsigned char LED_change @"FastDataRAM";
__no_init unsigned char LED_Com_count ; // it will indicate the Com scan number , when you want to initial it , u can set = 0
__no_init unsigned char LED_display_mode ; // 0 is ASCII code buffer tranfer to 7x9 font put in LED_display RAM
                       // 1 is bit map LED_buffer transfer to LED_display RAM

__no_init unsigned char LED_ASCii_buffer[LED_byte_Length+1] ; // transfer 80 ASCII code to ( 7x9 ) LED display


#ifdef _HardWare
          struct LED{
             unsigned char COM[16][LED_byte_Length];
          }; 

   struct LED LED_display @"FastDataRAM"; 
   struct LED LED_displayG @"FastDataRAM"; 
  struct LED LED_buffer @"FastDataRAM"; 
  struct LED LED_bufferG @"FastDataRAM"; 
  struct LED Backup @"FastDataRAM"; 
  struct LED BackupG @"FastDataRAM"; 

#else //BC 
          struct LED{
             unsigned char COM[16][LED_byte_Length];
          } LED_display,LED_displayG,LED_buffer,LED_bufferG,Backup,BackupG; 
#endif           
            


__no_init unsigned int lenword ;

__no_init unsigned char *Dest_Adr,*Sour_Adr;
__no_init unsigned int Data_Len,Dest_data;

__no_init unsigned char Dest_char,Disp_status,FlashWriFlg;


volatile unsigned char RecProcessing ;
//#pragma memory=default
//#pragma memory=far
//SRAM 40 K


__no_init unsigned char SRAM_Program1[256] ; // reserve momory for Flash program !
__no_init unsigned char SRAM_Program2[256] ;

//unsigned char RevTmpBuff[2500] ;

//#pragma memory=default

//#pragma memory=huge

//unsigned char RevBuff[186000] ; // use only 40 characters for LED display
__no_init unsigned char RevBuff[60000*2] ; // use only 40 characters for LED display#pragma memory=default

//#pragma memory=dataseg(FLASHCS0):huge

__no_init unsigned char FlashMark[10];
//__no_init unsigned char DispMode; //0:Normal 1:Page Text 
__no_init unsigned char DispMode @"FastDataRAM"; //0:Normal 1:Page Text
__no_init struct {
    unsigned char Start;
    unsigned char End;
}LEDFRM;
__no_init unsigned char PreFrameTable[255];
//__no_init unsigned char TxtMode; //100:new mode others:old mode
__no_init unsigned char TxtMode  @"FastDataRAM"; //100:new mode others:old mode
__no_init unsigned char BinMix  @"FastDataRAM"; // 0 = Binary , 1 = Mix
//unsigned char FlhTxtBuf[3][2500];
//unsigned long FlhChkSum[3];
//unsigned char FlhLng;
__no_init unsigned long BinChkSum[255];

__no_init struct {
  short          Str_Width;          //每一幕的pixels總數
  unsigned char  CharWidth[80];      //每一個字的pixels寬度
  unsigned char  buf[16][LED_byte_Length];//每一幕的Red pixels Image
  unsigned char  bufG[16][LED_byte_Length];//每一幕的Green pixels Image  
  unsigned char  mode;               //前功能選項
  unsigned char  outmode;            //後功能選項
  short          delay;
}LEDPage[255];

__no_init struct {
  short          Str_Width;          //每一幕的pixels總數
  unsigned char  CharWidth[80];      //每一個字的pixels寬度
  unsigned char  buf[16][LED_byte_Length];//每一幕的pixels Image
  unsigned char  data[2001];
  unsigned char  mode;                //前功能選項
  unsigned char  outmode;             //後功能選項
  short          delay;
}LEDPage1[5];

__no_init unsigned char LastTxtBuff[2000];

__no_init int TopIndex;
__no_init int LastIndex;
__no_init int CurIndex;
__no_init int LedDly;
__no_init unsigned int SramChkLen;
__no_init unsigned char RevTxtBuff[2000];
//unsigned char ShowBuff[2500];
__no_init unsigned char RevTxtColor[2000];
__no_init unsigned char TmpTxtBuff[2000];
__no_init int yy_offset;
__no_init unsigned short RevTxtLen;
__no_init char DftMsg[51];
__no_init unsigned char dtm_flag; //Show Time On/Off => 0 = Off ; 1 = On
__no_init unsigned char tmd_flag; //display mode => 1 = after each msg ; 2 = after all msg
__no_init unsigned int  tdy_flag; //time delay 以second為單位
__no_init unsigned char lng_flag; //ENG = english(0) ; FRE = french(1)
__no_init unsigned char tfm_flag; //Time Formate; 1 ~ 9
__no_init unsigned char ddt_flag; //Date display ON/OFF
__no_init unsigned char mgc_flag; //01=only one msg ; 24= 24 msg ; 25 = AU => 24 memory don't care capcodes,FIFO 
__no_init unsigned char mau_flag; //mgc_flag = AU counter
__no_init unsigned char dbz_flag; //0 = buzzer OFF ; 1 = buzzer ON
__no_init unsigned int  ztm_flag; //Buzzer On Time ; 001 ~ 999 seconds
__no_init unsigned char zty_flag; //Buzzer Music Type 0 - 9
__no_init unsigned int  act_flag; //Auto clear time 001 ~ 999 ; 000=>disable
__no_init unsigned int  acc_flag; //Auto clear count times 001 ~ 999 ; 000=>disable
__no_init unsigned char tsm_flag; //time stamp=> 0=Off,1=head of msg,2=end of msg ,format=HH:MM
__no_init unsigned char crc_flag; //ON(1) = if msg header or trailer with "reset" ,the same msg will be del
__no_init unsigned int  nst_flag; //Non Scroll Hold time ; 001 ~ 999 seconds
__no_init unsigned int  timer_counter; // 1 second one time
__no_init unsigned char RTC_flag; //0 = No RTC  1 = RTC Work
__no_init unsigned char (*Flash_Write_fun)(unsigned char *Addr,unsigned char Data);
__no_init unsigned char dft_tm;   //Default message is time or not
__no_init unsigned char seq_flag;
__no_init unsigned char last_str_width; 
//---------------------------------------------------------------------------------------------------------



__no_init struct {
  int prev;
  int next;
  unsigned int  len;
  unsigned char data[2000];
  unsigned char color[2000];
  unsigned char year;
  unsigned char month;
  unsigned char day;
  unsigned char hour;
  unsigned char min;
  unsigned char sec;
  unsigned int  tm_cnt; //timer_counter
  unsigned int  count; //顯示次數
}TxtPage[34];

//************************ 只能此區域定義新的全域變數 ********************************
__no_init unsigned char last_time;
__no_init unsigned char last_M1;
__no_init unsigned char last_M2;
__no_init unsigned char last_MM;
__no_init unsigned char last_d1;
__no_init unsigned char last_d2;
__no_init unsigned char last_h1;
__no_init unsigned char last_h2;
__no_init unsigned char last_m1;
__no_init unsigned char last_m2;
__no_init unsigned char type_flag;
__no_init unsigned char amm_flag;
__no_init unsigned char dmm_flag;
__no_init char tm_hr;
__no_init unsigned char tm_mm;
__no_init unsigned char tm_dd;
__no_init unsigned char tm_hh;
__no_init unsigned char tm_hr_pos;
__no_init unsigned char tm_spc_pos;
__no_init int Line2_Dly;
__no_init unsigned char chg_flag;
__no_init unsigned char mgn_flag;//ON(1) = msg add msg number
__no_init unsigned char ani_flag;
__no_init unsigned char te_flag;//ON(1) = test mode
__no_init unsigned char LED2_char_Length;
__no_init unsigned char tm_strt;
__no_init unsigned char pri_flag;
__no_init unsigned char primsg_flag;
__no_init unsigned char rlytm_flag;
__no_init unsigned char rly_counter;
__no_init unsigned long pri_bits;//MSB = Capcode1 Function A
__no_init unsigned long mail_bits;//MSB = Capcode1 Function A
__no_init unsigned char mdf_flag; //ON(1) = Mail Drop Time Out Off ; Off(0) = Mail Drop Time Out is same as normal message
__no_init unsigned char priclr_flag;
__no_init unsigned char autoct_flag;
__no_init unsigned char pact_flag;
__no_init unsigned int  nml_timer; // normal message timer ;1 second one time
__no_init int PTopIndex;
__no_init int PLastIndex;
__no_init unsigned char pricnt_flag;//priority counter
__no_init unsigned char pgc_flag;//priority auto increse 1
__no_init unsigned char  TmpBuf[16][3*LED_byte_Length];//保留每三幕的pixels Image
__no_init unsigned char  TmpBufG[16][3*LED_byte_Length];//保留每三幕的pixels Image

//**************************** BCB 增加的變數 ****************************************
__no_init char Cmd_Str[20];
__no_init unsigned char ask_flag;
__no_init unsigned char ask_value;
__no_init unsigned char ask_buf[30];
__no_init unsigned char LRCM_flag;
__no_init unsigned char LRCM_value;
__no_init unsigned char tmhr_flag;
__no_init unsigned char dot_flag;
          //增加Show Year
__no_init unsigned char last_y1;
__no_init unsigned char last_y2;
__no_init unsigned char tm_yy;
__no_init unsigned char tm_hr_pos1;
__no_init unsigned char msgno[34];
__no_init unsigned char pmau_flag; 
__no_init unsigned char msgc_flag;
__no_init unsigned char pmsgc_flag;
__no_init unsigned char color_flag;
__no_init unsigned char pcolor_flag;
__no_init unsigned char capcl_flag[24];
__no_init unsigned char msgcl_flag;
__no_init unsigned char autocl[24];
//************************************************************************************
//#pragma memory=default