fload Target/Target_Tree.f






: FillTreeView  ( -- )  \ Application depended

\ Host   
  z" Host"         TVI_FIRST  TVI_ROOT  1  AddItem   hPrev to hRoot  
   z" DataStack"        hPrev     hRoot     1  AddItem     hPrev to hSon
    z" StackData0:1111"   hPrev     hSon      0  AddItem
    z" StackData1:2222"  hPrev     hSon      0  AddItem 
    z" StackData2:1111"   hPrev     hSon      0  AddItem
    z" StackData3:2222"  hPrev     hSon      0  AddItem     
    z" StackData4:1111"   hPrev     hSon      0  AddItem
    z" StackData5:2222"  hPrev     hSon      0  AddItem     
    
   z" ProcStack"        hPrev     hRoot     1  AddItem     hPrev to hSon
    z" StackData0:1111"   hPrev     hSon      0  AddItem
    z" StackData1:2222"  hPrev     hSon      0  AddItem 
    z" StackData2:1111"   hPrev     hSon      0  AddItem
    z" StackData3:2222"  hPrev     hSon      0  AddItem     
    z" StackData4:1111"   hPrev     hSon      0  AddItem
    z" StackData5:2222"  hPrev     hSon      0  AddItem 



\ Traget   
  z" Traget"        TVI_SORT  TVI_ROOT  1  AddItem   hPrev to hRoot 
   z" DataStack"        hPrev     hRoot     1  AddItem     hPrev to hSon
    z" StackData0:1111"   hPrev     hSon      0  AddItem
    z" StackData1:2222"  hPrev     hSon      0  AddItem 
   z" ProcStack"        hPrev     hRoot     1  AddItem     hPrev to hSon
    z" StackData0:1111"   hPrev     hSon      0  AddItem
    z" StackData1:2222"  hPrev     hSon      0  AddItem   

\ CPU
   z" CPU"        hPrev     hRoot     1  AddItem     hPrev to hSon
    z" R0"   hPrev     hSon      0  AddItem
    z" R1"  hPrev     hSon      0  AddItem 
    z" R2"   hPrev     hSon      0  AddItem
    z" R3"  hPrev     hSon      0  AddItem 
    z" R4"   hPrev     hSon      0  AddItem
    z" R5"  hPrev     hSon      0  AddItem 
   z" PWR"        hPrev     hRoot     1  AddItem     hPrev to hSon
   RCC
   GPIO
   z" SYSCFG"     hPrev     hRoot     1  AddItem     hPrev to hSon
   z" DMA"        hPrev     hRoot     1  AddItem     hPrev to hSon
   z" ADC"        hPrev     hRoot     1  AddItem     hPrev to hSon
   z" DAC"        hPrev     hRoot     1  AddItem     hPrev to hSon
   z" DCMI"        hPrev     hRoot     1  AddItem     hPrev to hSon
  TIM   
   z" IWDG"        hPrev     hRoot     1  AddItem     hPrev to hSon  
   z" WWDG"        hPrev     hRoot     1  AddItem     hPrev to hSon
   z" CRYP"        hPrev     hRoot     1  AddItem     hPrev to hSon   
   z" RNG"        hPrev     hRoot     1  AddItem     hPrev to hSon
   
   z" HASH"        hPrev     hRoot     1  AddItem     hPrev to hSon  
   z" RTC"        hPrev     hRoot     1  AddItem     hPrev to hSon
   z" CAN"        hPrev     hRoot     1  AddItem     hPrev to hSon   
   z" I2C"        hPrev     hRoot     1  AddItem     hPrev to hSon   
   
  USART 
   z" SPI"        hPrev     hRoot     1  AddItem     hPrev to hSon
   z" SDIO"        hPrev     hRoot     1  AddItem     hPrev to hSon   
  ETH
   z" OTG_FS"        hPrev     hRoot     1  AddItem     hPrev to hSon  
   z" OTG_HS"        hPrev     hRoot     1  AddItem     hPrev to hSon
   z" FSMC"        hPrev     hRoot     1  AddItem     hPrev to hSon   
   z" DBG"        hPrev     hRoot     1  AddItem     hPrev to hSon   
            
  ;