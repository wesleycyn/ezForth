#include "stm32f10x_lib.h"
#include "platform_config.h"

#include "stm32f10x.h"



/* Private typedef -----------------------------------------------------------*/
typedef enum {FAILED = 0, PASSED = !FAILED} TestStatus;

/* Private define ------------------------------------------------------------*/
#define BootStartAddr     ((u32)0x08000000)
#define BootEndAddr       ((u32)0x08010000)
#define UpgradeStartAddr  ((u32)0x08010000)
#define UpgradeEndAddr    ((u32)0x08020000)



/* Private macro -------------------------------------------------------------*/
/* Private variables ---------------------------------------------------------*/  
u32 EraseCounter = 0x00, Address = 0x00;

vu32 NbrOfPage = 0x00;
volatile FLASH_Status FLASHStatus;
volatile TestStatus MemoryProgramStatus;
extern ErrorStatus HSEStartUpStatus;


extern unsigned char RevBuff[];
extern unsigned char  UnZipBuf[];
extern unsigned char TestMode;
extern unsigned char FlashMark[10];


extern void __iar_program_start( void );


void UG(void) @"FastProcRAM";
void FlashMemRead(unsigned char *Dest,unsigned char *Source,unsigned long Length);
unsigned char Flash_Erase(unsigned char Sector);

void UG1(void)  @"FastProcRAM" ;





void FlashMemRead(unsigned char *Dest,unsigned char *Source,unsigned long Length)
{
  unsigned long i;
  for(i=0;i<Length;i++)
    Dest[i]=Source[i] ;
}


unsigned char Flash_Erase(unsigned char Sector)
{

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

void UG(void) @"FastProcRAM"
{
  unsigned long i;
  FLASHStatus = FLASH_COMPLETE;
  MemoryProgramStatus = PASSED;
  
  if (TestMode==1)
  {  
  	
//	EraseSector(0x10000);
//	ProgramPage(0x10000,65536,(u16*)UnZipBuf);    
  /* Unlock the Flash Program Erase controller */
    FLASH_Unlock();
  /* Define the number of page to be erased */
    NbrOfPage = (UpgradeEndAddr - UpgradeStartAddr) / FLASH_PAGE_SIZE;
  /* Clear All pending flags */
    FLASH_ClearFlag(FLASH_FLAG_BSY | FLASH_FLAG_EOP | FLASH_FLAG_PGERR | FLASH_FLAG_WRPRTERR);	
  /* Erase the FLASH pages */
    for(EraseCounter = 0; (EraseCounter < NbrOfPage) && (FLASHStatus == FLASH_COMPLETE); EraseCounter++)
    {
      FLASHStatus = FLASH_ErasePage(UpgradeStartAddr + (FLASH_PAGE_SIZE * EraseCounter));    
      FLASH_ClearFlag(FLASH_FLAG_BSY | FLASH_FLAG_EOP | FLASH_FLAG_PGERR | FLASH_FLAG_WRPRTERR);	
    }    
// Program
    Address = UpgradeStartAddr;
    i=0;
    while((Address < UpgradeEndAddr) && (FLASHStatus == FLASH_COMPLETE))
    {
      FLASHStatus = FLASH_ProgramWord(Address,*((u32 *)(UnZipBuf+i)));
      Address = Address + 4;
      i=i+4;
    }      
  }	
  else
  {
//    EraseSector(0x10000);    
//	EraseSector(0x00000);
  /* Unlock the Flash Program Erase controller */
    FLASH_Unlock();
  /* Define the number of page to be erased */
    NbrOfPage = (UpgradeEndAddr - BootStartAddr) / FLASH_PAGE_SIZE;
  /* Clear All pending flags */
    FLASH_ClearFlag(FLASH_FLAG_BSY | FLASH_FLAG_EOP | FLASH_FLAG_PGERR | FLASH_FLAG_WRPRTERR);	
  /* Erase the FLASH pages */
    for(EraseCounter = 0; (EraseCounter < NbrOfPage) && (FLASHStatus == FLASH_COMPLETE); EraseCounter++)
    {
      FLASHStatus = FLASH_ErasePage(BootStartAddr + (FLASH_PAGE_SIZE * EraseCounter));    
      FLASH_ClearFlag(FLASH_FLAG_BSY | FLASH_FLAG_EOP | FLASH_FLAG_PGERR | FLASH_FLAG_WRPRTERR);	
    }    
 
//	ProgramPage(0x00000,65536,(u16*)UnZipBuf);    
// Program
    Address = BootStartAddr;
    i=0;
    while((Address < BootEndAddr) && (FLASHStatus == FLASH_COMPLETE))
    {
      FLASHStatus = FLASH_ProgramWord(Address,*((u32 *)(UnZipBuf+i)));
      Address = Address + 4;
      i=i+4;
    }      
  }
  
// Clear ExtSRAM  
//	for(i=0x81008000;i<0x8107ffff;i++)
//        {
//          M8( i ) =0;
//        }	
  
// Reset ST_ArmCore
    NVIC_GenerateCoreReset();  
      while(1);
}



