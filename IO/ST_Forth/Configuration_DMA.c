#include <intrinsics.h>
#include "stm32f10x_lib.h"

DMA_InitTypeDef DMA_InitStructure @"FastDataRAM";

void DMA_Configuration(void);

void DMA_Configuration(void)
{
  /* DMA Channel3 configuration ----------------------------------------------*/
  DMA_InitStructure.DMA_PeripheralInc = DMA_PeripheralInc_Disable;
  DMA_InitStructure.DMA_MemoryInc = DMA_MemoryInc_Enable;
  DMA_InitStructure.DMA_PeripheralDataSize = DMA_PeripheralDataSize_Byte;
  DMA_InitStructure.DMA_MemoryDataSize = DMA_MemoryDataSize_Byte;
  DMA_InitStructure.DMA_Mode = DMA_Mode_Normal;
  DMA_InitStructure.DMA_M2M = DMA_M2M_Disable;
  DMA_InitStructure.DMA_DIR = DMA_DIR_PeripheralDST;
  DMA_InitStructure.DMA_Priority = DMA_Priority_Low;  
}