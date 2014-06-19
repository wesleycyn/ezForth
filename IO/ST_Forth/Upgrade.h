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
extern unsigned char udf[LED_byte_Length];
extern unsigned char udfG[LED_byte_Length];
extern unsigned char UartPreFrmTbl[255];
extern unsigned char CommandMode;
extern struct {
    unsigned char Start;
    unsigned char End;
}UARTFRM,Reserve;
extern unsigned char UartDispMode,UartLang ;//Lang=0  =>Normal ; Lang=1  =>Russian
extern unsigned char UartID,UartDelFlg;
extern unsigned char UpdateFlg ;


extern unsigned char UpgradeMode;
extern unsigned long TxtChkSum;
extern unsigned short UartChkSum;
extern unsigned long RevBuffIndex;
extern unsigned char RevCommand,RevFlag;
extern unsigned long Cmd1Length,Cmd3Length;
extern unsigned long LastCmd3Len;
extern unsigned long Times;
extern unsigned char Htag,UartHtag;
extern unsigned char Dtag,TestMode;
//******************************************************************

////const unsigned char *POINT;
extern unsigned char LNG,R_MCNT;
extern unsigned int Rec_Timer_cnt,SYS_sec;
extern unsigned int gWRecLen;
extern unsigned char gUartRecTmp,gWRecBuff[MAXLEN_2K5];
extern unsigned int gWTxLen, gWTxCnt;
extern unsigned char gWTxBuff[MAXLEN_1K] ;
extern unsigned int RecLen, RecIndex;

extern unsigned char MUS_flg,LED_ON_flag,MUS_timeout,flg_ESC,RTS_flg,RTS_flg1;


extern volatile unsigned char LED_change;
extern unsigned char LED_Com_count ; // it will indicate the Com scan number , when you want to initial it , u can set = 0
extern unsigned char LED_display_mode ; // 0 is ASCII code buffer tranfer to 7x9 font put in LED_display RAM
                       // 1 is bit map LED_buffer transfer to LED_display RAM

extern unsigned char LED_ASCii_buffer[LED_byte_Length+1] ; // transfer 80 ASCII code to ( 7x9 ) LED display


#ifdef _HardWare
          struct LED{
             unsigned char COM[16][LED_byte_Length];
          }; 

  extern struct LED LED_display; 
  extern struct LED LED_displayG; 
  extern struct LED LED_buffer; 
  extern struct LED LED_bufferG; 
  extern struct LED Backup; 
  extern struct LED BackupG; 

#else //BC 
          extern struct LED{
             unsigned char COM[16][LED_byte_Length];
          } LED_display,LED_displayG,LED_buffer,LED_bufferG,Backup,BackupG; 
#endif           
            


extern unsigned int lenword ;

extern unsigned char *Dest_Adr,*Sour_Adr;
extern unsigned int Data_Len,Dest_data;

extern unsigned char Dest_char,Disp_status,FlashWriFlg;

extern volatile unsigned char RecProcessing;
//#pragma memory=default
//#pragma memory=far
//SRAM 40 K


extern unsigned char SRAM_Program1[256] ; // reserve momory for Flash program !
extern unsigned char SRAM_Program2[256] ;

//unsigned char RevTmpBuff[2500] ;

//#pragma memory=default

//#pragma memory=huge

//unsigned char RevBuff[186000] ; // use only 40 characters for LED display
extern unsigned char RevBuff[65000] ; // use only 40 characters for LED display#pragma memory=default

//#pragma memory=dataseg(FLASHCS0):huge

extern unsigned char FlashMark[10];
extern unsigned char DispMode; //0:Normal 1:Page Text   
extern struct {
    unsigned char Start;
    unsigned char End;
}LEDFRM;
extern unsigned char PreFrameTable[255];
extern unsigned char TxtMode; //100:new mode others:old mode
extern unsigned char BinMix; // 0 = Binary , 1 = Mix
//unsigned char FlhTxtBuf[3][2500];
//unsigned long FlhChkSum[3];
//unsigned char FlhLng;
extern unsigned long BinChkSum[255];

extern struct {
  short          Str_Width;          //每一幕的pixels總數
  unsigned char  CharWidth[80];      //每一個字的pixels寬度
  unsigned char  buf[16][LED_byte_Length];//每一幕的Red pixels Image
  unsigned char  bufG[16][LED_byte_Length];//每一幕的Green pixels Image  
  unsigned char  mode;               //前功能選項
  unsigned char  outmode;            //後功能選項
  short          delay;
}LEDPage[255];

extern struct {
  short          Str_Width;          //每一幕的pixels總數
  unsigned char  CharWidth[80];      //每一個字的pixels寬度
  unsigned char  buf[16][LED_byte_Length];//每一幕的pixels Image
  unsigned char  data[2001];
  unsigned char  mode;                //前功能選項
  unsigned char  outmode;             //後功能選項
  short          delay;
}LEDPage1[5];

extern unsigned char LastTxtBuff[2000];

extern int TopIndex;
extern int LastIndex;
extern int CurIndex;
extern int LedDly;
extern unsigned int SramChkLen;
extern unsigned char RevTxtBuff[2000];
//unsigned char ShowBuff[2500];
extern unsigned char RevTxtColor[2000];
extern unsigned char TmpTxtBuff[2000];
extern int yy_offset;
extern unsigned short RevTxtLen;
extern char DftMsg[51];
extern unsigned char dtm_flag; //Show Time On/Off => 0 = Off ; 1 = On
extern unsigned char tmd_flag; //display mode => 1 = after each msg ; 2 = after all msg
extern unsigned int  tdy_flag; //time delay 以second為單位
extern unsigned char lng_flag; //ENG = english(0) ; FRE = french(1)
extern unsigned char tfm_flag; //Time Formate; 1 ~ 9
extern unsigned char ddt_flag; //Date display ON/OFF
extern unsigned char mgc_flag; //01=only one msg ; 24= 24 msg ; 25 = AU => 24 memory don't care capcodes,FIFO 
extern unsigned char mau_flag; //mgc_flag = AU counter
extern unsigned char dbz_flag; //0 = buzzer OFF ; 1 = buzzer ON
extern unsigned int  ztm_flag; //Buzzer On Time ; 001 ~ 999 seconds
extern unsigned char zty_flag; //Buzzer Music Type 0 - 9
extern unsigned int  act_flag; //Auto clear time 001 ~ 999 ; 000=>disable
extern unsigned int  acc_flag; //Auto clear count times 001 ~ 999 ; 000=>disable
extern unsigned char tsm_flag; //time stamp=> 0=Off,1=head of msg,2=end of msg ,format=HH:MM
extern unsigned char crc_flag; //ON(1) = if msg header or trailer with "reset" ,the same msg will be del
extern unsigned int  nst_flag; //Non Scroll Hold time ; 001 ~ 999 seconds
extern unsigned int  timer_counter; // 1 second one time
extern unsigned char RTC_flag; //0 = No RTC  1 = RTC Work
extern unsigned char (*Flash_Write_fun)(unsigned char *Addr,unsigned char Data);
extern unsigned char dft_tm;   //Default message is time or not
extern unsigned char seq_flag;
extern unsigned char last_str_width; 
//---------------------------------------------------------------------------------------------------------
extern struct {
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
extern unsigned char last_time;
extern unsigned char last_M1;
extern unsigned char last_M2;
extern unsigned char last_MM;
extern unsigned char last_d1;
extern unsigned char last_d2;
extern unsigned char last_h1;
extern unsigned char last_h2;
extern unsigned char last_m1;
extern unsigned char last_m2;
extern unsigned char type_flag;
extern unsigned char amm_flag;
extern unsigned char dmm_flag;
extern char tm_hr;
extern unsigned char tm_mm;
extern unsigned char tm_dd;
extern unsigned char tm_hh;
extern unsigned char tm_hr_pos;
extern unsigned char tm_spc_pos;
extern int Line2_Dly;
extern unsigned char chg_flag;
extern unsigned char mgn_flag;//ON(1) = msg add msg number
extern unsigned char ani_flag;
extern unsigned char te_flag;//ON(1) = test mode
extern unsigned char LED2_char_Length;
extern unsigned char tm_strt;
extern unsigned char pri_flag;
extern unsigned char primsg_flag;
extern unsigned char rlytm_flag;
extern unsigned char rly_counter;
extern unsigned long pri_bits;//MSB = Capcode1 Function A
extern unsigned long mail_bits;//MSB = Capcode1 Function A
extern unsigned char mdf_flag; //ON(1) = Mail Drop Time Out Off ; Off(0) = Mail Drop Time Out is same as normal message
extern unsigned char priclr_flag;
extern unsigned char autoct_flag;
extern unsigned char pact_flag;
extern unsigned int  nml_timer; // normal message timer ;1 second one time
extern int PTopIndex;
extern int PLastIndex;
extern unsigned char pricnt_flag;//priority counter
extern unsigned char pgc_flag;//priority auto increse 1
extern unsigned char  TmpBuf[16][3*LED_byte_Length];//保留每三幕的pixels Image
extern unsigned char  TmpBufG[16][3*LED_byte_Length];//保留每三幕的pixels Image

//**************************** BCB 增加的變數 ****************************************
extern char Cmd_Str[20];
extern unsigned char ask_flag;
extern unsigned char ask_value;
extern unsigned char ask_buf[30];
extern unsigned char LRCM_flag;
extern unsigned char LRCM_value;
extern unsigned char tmhr_flag;
extern unsigned char dot_flag;
          //增加Show Year
extern unsigned char last_y1;
extern unsigned char last_y2;
extern unsigned char tm_yy;
extern unsigned char tm_hr_pos1;
extern unsigned char msgno[34];
extern unsigned char pmau_flag; 
extern unsigned char msgc_flag;
extern unsigned char pmsgc_flag;
extern unsigned char color_flag;
extern unsigned char pcolor_flag;
extern unsigned char capcl_flag[24];
extern unsigned char msgcl_flag;
extern unsigned char autocl[24];
//************************************************************************************
//---------------------------------------------------------------------------------------------------------
extern unsigned char SpdTm[5];
extern unsigned char SpdCn[5];
extern unsigned char MonthStr[12];
extern void Shift_Line1_left(void); 
extern void Shift_Line1_leftX(void); 
extern void Shift_Line2_left(void); 
extern void Shift_Line2_leftX(void); 
//---------------------------------------------------------------------------------------------------------
extern unsigned char last_str_width; 
//************************************** 修改函數宣告 ****************************************************
int LED_ascii2buffer1(unsigned char *ASC_Buf,int n);
int LED_ascii2bufx(unsigned char *ASC_Buf,int n,int page,int *over);//page=0 -> line 1 ; page=1 -> line2,over=0 -> 未結束  over=1 -> 結束
void mdy_bits(unsigned char *buf,int addr,int bits,int TotalBits,unsigned int value);
int Space_Pos(unsigned char *ptr,int maxc,char dli,int *over);
void scroll_line_left(int line); //小字第一列向左移入
void scroll_line_leftX(int len,int line); //向左移入1
void LED_ascii2Line(int point,unsigned char *ASC_Buf,unsigned char Des_Buf[16][LED_byte_Length], int n,int line);
void LED_ascii2Line1(int point,unsigned char *ASC_Buf,unsigned char Des_Buf[16][3*LED_byte_Length], int n,int line);
void mdy_bits(unsigned char *buf,int addr,int bits,int TotalBits,unsigned int value);
void show_line_time(int line);
void put_img(int point,unsigned char ASC,unsigned char Des_Buf[16][LED_byte_Length],int line );
int txt2img(unsigned char *BufPT);//BCB Modify
int txt2img1(unsigned char *BufPT);//BCB Modify
void show_init_time(int line);
int last_space(unsigned char *buf);
void show_2line(void);
void show_1line(void);
void show_msg_time(int line);   
void show_msg_effect(void);
int txt2lineimg(int line,int *lastlen);
void show_line_dft(int line);
void show_msg_dft(int line);
void twoline_in(void);
void twoline_out(void);
unsigned char trans(unsigned data);
void add_msgno(void);
int msgcount(void);
void test_mode(void);
void oneline_in(void);
void add_timestamp(int ID);
void timer_entry(void);
void timer_int(void);
int get_bit(unsigned long value,int id);//capcode 1 function A = id0 ==> MSB
void insert_node(int *Top , int *Last , int node, int x);//insert node before x,TopIndex與LastIndex確定不可能為-1
int get_next_id(int cnt);
void del_node1(int *Top , int *Last , unsigned char ID);//delete node
void delete_node1(int *Top , int *Last , unsigned char ID);//delete node
void add_node(int *Top , int *Last , unsigned char ID);
void next_node1(int *Top);
int get_next_priid(int cnt);
int maildrop_count(unsigned long value);
int get_msg_count(unsigned char value);
//************************************ TMain.c **********************************************************************
void String_disp(char *DispStr);
extern const char VerStr[];
void Status_disp(unsigned char Sdata);
void init_show(void);
void LED_ascii2buffer(unsigned char *ASC_Buf,int n);
unsigned char Flash_Write(unsigned char *Addr,unsigned char Data);
void FlashMemWrite(unsigned char *Dest,unsigned char *Source,unsigned long Length);
void test_mode(void);
void show_ask_msg(void);
void reset_value(void);
void LRCM_mode(void);
void show_date_tw(void);
void add_indexno(int index,int maxmsg);
void add_pindexno(int index);
int pmsgcount(void);
void add_prinode(int *Top , int *Last , unsigned char ID);
void Chk_Color(unsigned char *ASC_Buf,unsigned char *tr_Buf,unsigned char *Color_Buf);
void LED_ascii2bufferC(unsigned char *ASC_Buf,unsigned char *Color_Buf,int n);  
void LED_ascii2LineC(int point,unsigned char *ASC_Buf,unsigned char *Color_Buf,unsigned char Des_Buf[16][LED_byte_Length],unsigned char DesG_Buf[16][LED_byte_Length],int n,int line);
void LED_ascii2Line1C(int point,unsigned char *ASC_Buf,unsigned char *Color_Buf,unsigned char Des_Buf[16][3*LED_byte_Length],unsigned char DesG_Buf[16][3*LED_byte_Length], int n,int line);
//******************************************IAR Waring***************************************************************************************
unsigned long  Decompression(unsigned char *Source,unsigned char *Dest,unsigned long SourceSize);
unsigned long  DecprLen(unsigned char *Source,unsigned long SourceSize);
void FlashMemRead(unsigned char *Dest,unsigned char *Source,unsigned long Length);
unsigned char Flash_Erase(unsigned char Sector);
void init_sram(void);
void show_datetime(void);
int RAM_test(void);
void dly_ms(unsigned long dly);
void ask_mode(void);
unsigned long get_idsec(int id);
void addtm_stamp(int CurIndex);
unsigned char RTC_Initial(void);
void beep_vibrate( unsigned char beep_type );
void String_disp(char *DispStr);
int Host_SendNext(unsigned char *value,int n);
unsigned char RTC_write1(unsigned char Addr,unsigned char Data);