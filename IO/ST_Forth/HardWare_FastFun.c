#include "typedef.h"

extern unsigned char *Dest_Adr,*Sour_Adr;
extern unsigned int Data_Len; 


void mCopy(u8* sBuf,u8* dBuf,u32 Legth); //wesley
void data_copyF(void);
int RAM_test(void) @"FastProcRAM";



void mCopy(u8* sBuf,u8* dBuf,u32 Legth) @"FastProcRAM"
{
	u32 i;
	for	(i=0;i<Legth;i++)
	{		
		dBuf[i]=sBuf[i];
	}
}


void data_copyF(void)
{
   mCopy(Sour_Adr,Dest_Adr,Data_Len);
}




int RAM_test(void) @"FastProcRAM"
{
    #define tRAM  0x68000000
    #define iRAM  0x2000FFFC  
  
  u32 i,TestData;


  for (i=0;i<0x80000;i=i+4)
  {  
      M32(iRAM ) =   M32(tRAM + i );      
      M32(tRAM + i )=TestData;      
      if ( M32(tRAM + i ) != TestData ) {return -1;}     
      M32(tRAM + i )=M32(iRAM ) ;
      TestData=TestData+1;
  } 

  return 0;
}


