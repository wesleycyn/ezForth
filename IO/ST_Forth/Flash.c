	#include "typedef.h"
#include <intrinsics.h>
#include "LPC22xx.h"
extern unsigned char RevBuff[];
extern unsigned char  UnZipBuf[];
#define FP  0x10000
#define ROM  0x80000000
#define ROM1  0x80010000
#define base_adr  0x80010000

extern unsigned char TestMode;
extern unsigned char FlashMark[10];

union fsreg {                  // Flash Status Register
  struct b  {
    unsigned int q0:1;
    unsigned int q1:1;
    unsigned int q2:1;
    unsigned int q3:1;
    unsigned int q4:1;
    unsigned int q5:1;
    unsigned int q6:1;
    unsigned int q7:1;
  } b;
  unsigned int v;
} fsr;

 int EraseSector(u32 SA)@"FastProcRAM" ;
 int Polling (u32 adr)@"FastProcRAM" ;
 int ProgramPage (u32 adr, u32 sz, u16* buf) @"FastProcRAM";

void UG(void) @"FastProcRAM"
{
    u32 i;      

        
  if (TestMode==1)
  {  
  	
	EraseSector(0x10000);
	ProgramPage(0x10000,65536,(u16*)UnZipBuf);      

  }	
  else
  {
    EraseSector(0x10000);
    
	EraseSector(0x00000);
	ProgramPage(0x00000,65536,(u16*)UnZipBuf);  

  }
    
 	M16(0x80000000) = 0xF0; 
	for(i=0x81008000;i<0x8107ffff;i++)
        {
          M8( i ) =0;
        }		
    asm(" movs r0,#0x80 \n" /* r2 = address of UG */
        " movs r1,r0,lsl #24 \n" /* jump over constant */       
        " bx r1"); /* flag = r0 */	  
      
}

/*
 * Check if Program/Erase completed
 *    Parameter:      adr:  Block Start Address
 *    Return Value:   0 - OK,  1 - Failed
 */

int Polling (u32 adr)  @"FastProcRAM"
{
  unsigned int q6;
  fsr.v = M16(adr);

  q6 = fsr.b.q6;
  do {
    fsr.v = M16(adr);
    if (fsr.b.q6 == q6) return (0);  // Done
    q6 = fsr.b.q6;
  } while (fsr.b.q5 == 0);           // Check for Timeout

  fsr.v = M16(adr);
  q6 = fsr.b.q6;
  fsr.v = M16(adr);

  if (fsr.b.q6 == q6) return (0);    // Done
  M16(adr) = 0xF0;                   // Reset Device
  return (1);                        // Failed
}
/*
 *  Program Page in Flash Memory
 *    Parameter:      adr:  Page Start Address
 *                    sz:   Page Size
 *                    buf:  Page Data
 *    Return Value:   0 - OK,  1 - Failed
 */
int ProgramPage (u32 adr, u32 sz, u16* buf)  @"FastProcRAM"
{
   u32 i;
  for (i = 0; i < sz; i=i+2)  {
    M16(ROM +adr+ 0xAAA) = 0xAA;
    M16(ROM +adr+ 0x555) = 0x55;
    M16(ROM +adr+ 0xAAA) = 0xA0;
    M16(ROM +adr+ i) = *((u16 *) buf);
    if (Polling(ROM+adr+i) != 0) return (1);
    buf += 1;
  }
  return (0);
}



int EraseSector(u32 SA) @"FastProcRAM"
{
  // Start Erase Sector Command
  M16(ROM+SA+0xAAA) = 0xAA;
  M16(ROM+SA+0x555) = 0x55;
  M16(ROM+SA+0xAAA) = 0x80;
  M16(ROM+SA+0xAAA) = 0xAA;
  M16(ROM+SA+0x555) = 0x55;
  M16(ROM+SA) = 0x30;
  do {
    fsr.v = M16(ROM+SA);
  } while (fsr.b.q3 == 0);     // Wait for Sector Erase Timeout
  return (Polling(ROM+SA));       // Wait until Erase completed
}




void FlashMemRead(unsigned char *Dest,unsigned char *Source,unsigned long Length)
{
  unsigned long i;
  for(i=0;i<Length;i++)
    Dest[i]=Source[i] ;
}


unsigned char Flash_Erase(unsigned char Sector){

  //unsigned char Pass;
  
  /*Dest_Adr = ((char*)0x80000+Sector*0x10000) ;
  
  Dest_char = 0x00 ; // byte write for clear
  disable_interrupt();
  //Flash_Wr() ;
  asm("jsr.a 06000H");
  enable_interrupt();
  
  Dest_char = Sector ; 
  
  //Flash_Sec_Erase();
  asm("jsr.a 06100H");
  
  dly_ms(5) ;
  
  // check the erase data is OK or not 
  if( *Dest_Adr != 0xFF ){ 
    Pass = 0 ;
    FlashWriFlg=100; //Try Only By Lee    
  }else
    Pass = 1 ;*/	
  return(1);

}/*END Flash_Erase function*/