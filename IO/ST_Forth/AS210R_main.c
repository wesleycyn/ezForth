



#include <intrinsics.h>
#include "stm32f10x_lib.h"




#include <string.h>

#include <stdio.h>

#include "typedef.h"
#include "ioReFlex.h"
#include "Upgrade.h"
#include "LED_Effect.h"










extern void SelfTest(void);
extern void self_test_entry(void); 
extern void HardWare_Init(void);
extern unsigned long  Decompression(unsigned char *Source,unsigned char *Dest,unsigned long SourceSize);
extern void HardWare_Init(void);
extern void self_test_2(void);
extern  void UG(void) ;
extern void  LED_OFF(void);

unsigned char* UpgradeROM     =(unsigned char*)		0x08010000;
u8 UnZipBuf[65536*2];
extern const char ID_Str[];







int chk_update(void);
void main_Func (void);

extern void Test_USART2(void);


//
#define ITM_Port8(n)    (*((volatile unsigned char *)(0xE0000000+4*n)))
#define ITM_Port16(n)   (*((volatile unsigned short*)(0xE0000000+4*n)))
#define ITM_Port32(n)   (*((volatile unsigned long *)(0xE0000000+4*n)))

#define DEMCR           (*((volatile unsigned long *)(0xE000EDFC)))
#define TRCENA          0x01000000

struct __FILE { int handle; /* Add whatever you need here */ };
FILE __stdout;
FILE __stdin;

int fputc(int ch, FILE *f) {
  if (DEMCR & TRCENA) {
    while (ITM_Port32(1) == 0);
    ITM_Port8(1) = ch;
  }
  return(ch);
}
// ITM End


int main (void){
  
  
printf("ITM Output Debug Trace message%d\n",101);  
  
 // HardWare_Init();
 main_Func();
 
 
 
}


#pragma optimize=none
int chk_update(void) 
{

  unsigned char *addr;
  unsigned short chksum,versum;
  unsigned long i;
  int flag;
 
  SYS_sec = 0;
  
  if ( memcmp(ID_Str,"GApollo LED Sign",16) != 0 )
    return ( 0 );
  addr = (unsigned char *)0x08010000;
  for( chksum = 0 , flag = 0 , i = 0 ; i < 0xFFFEL ; i++ ){
    if ( addr[i] != 0 ) flag = 1; 
    chksum = chksum + ( addr[i] & 0xFFFFL );
  } 
  versum = addr[0xFFFEL];
  versum = ( versum << 8 ) + addr[0xFFFFL];
  if ( ( chksum == versum ) && ( flag == 1) )
    return ( 1 );
  else  
   
  return ( 0 );
}

void main_Func (void)
{        
    
//UG1();
//   init_UART() ;
LED_change=0;
  flg_ESC = 0 ;
   RTS_flg = 0 ;
   
//   P0 = 0x01 ;
//  Flash_Sub_2_RAM() ;
//   enable_interrupt();          // enable all maskable interrupts.   
   //LED_ON_flag = 1;   
     __enable_interrupt();  
     
   
   HardWare_Init(); 
//   printf("ITM Output Debug Trace message : HardWare_Init");
 //   for(;;){
 //  Test_USART2();
 //   }
   
//     __enable_interrupt();       
   
   for(;;){
 //    RTC_Initial();        
     LED_ON_flag = 1; 
//     SYS_sec = 500 ;  // ms
     MUS_timeout = 1 ;
//     beep_vibrate( 4 ) ;
     RTC_flag = 1; //RTC_Initial();     

     if ( chk_update() == 1 )
      
       {
//       String_disp("E-Block : ");   
        UpdateFlg=1;
            // self_test_2();
        self_test_entry();//new version
     }
     else
     {
 //     String_disp("Bt-Block : ");     
       UpdateFlg=0;
       SelfTest();  // old version 
     }
      
      Decompression(RevBuff,UnZipBuf,Cmd3Length);         
  __disable_interrupt();           

//        LED_OFF();
        
    UG();               // ROM更新後熱開機
   }
} 

// USART  
#define TxBufferSize   (countof(TxBuffer) - 1)
#define RxBufferSize   0xFF

/* Private macro -------------------------------------------------------------*/
#define countof(a)   (sizeof(a) / sizeof(*(a)))

/* Private variables ---------------------------------------------------------*/

