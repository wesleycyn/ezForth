       
int hSon_ETH



int hSon_ETH.MACCR     
int hSon_ETH.MACFFR     
int hSon_ETH.MACHTHR    
int hSon_ETH.MACHTLR    
int hSon_ETH.MACMIIAR   
int hSon_ETH.MACMIIDR   
int hSon_ETH.MACFCR     
  	 
int hSon_ETH.MACVLANTR   
int hSon_ETH.MACRWUFFR   

int hSon_ETH.MACPMTCSR   
int hSon_ETH.MACDBGR     
int hSon_ETH.MACSR       


int hSon_ETH.MACIMR   
int hSon_ETH.MACA0HR     
int hSon_ETH.MACA0LR       
int hSon_ETH.MACA1HR   
int hSon_ETH.MACA1LR     
int hSon_ETH.MACA2HR       
int hSon_ETH.MACA2LR   
int hSon_ETH.MACA3HR     
int hSon_ETH.MACA3LR       
int hSon_ETH.MMCCR   
int hSon_ETH.MMCRIR     
int hSon_ETH.MMCTIR       
int hSon_ETH.MMCRIMR   
int hSon_ETH.MMCTIMR     
int hSon_ETH.MMCTGFSCCR      
int hSon_ETH.MMCTGFMSCCR        

int hSon_ETH.MMCTGFCR   
int hSon_ETH.MMCRFCECR     
int hSon_ETH.MMCRFAECR      
int hSon_ETH.MMCRGUFCR   
int hSon_ETH.PTPTSCR     
int hSon_ETH.PTPSSIR       
int hSon_ETH.PTPTSHR   
int hSon_ETH.PTPTSLR     
int hSon_ETH.PTPTSHUR       
int hSon_ETH.PTPTSLUR   
int hSon_ETH.PTPTSAR     
int hSon_ETH.PTPTTHR       
int hSon_ETH.PTPTTLR   
int hSon_ETH.PTPTSSR     
int hSon_ETH.DMABMR       
int hSon_ETH.DMATPDR       
int hSon_ETH.DMARPDR   
int hSon_ETH.DMARDLAR     
int hSon_ETH.DMATDLAR       
int hSon_ETH.DMASR       

int hSon_ETH.DMAOMR   
int hSon_ETH.DMAIER     
int hSon_ETH.DMAMFBOCR       
int hSon_ETH.DMARSWTR       
int hSon_ETH.DMACHTDR   
int hSon_ETH.DMACHRDR     
int hSon_ETH.DMACHTBAR       
int hSon_ETH.DMACHRBAR       



: ETH
\ ETH 
   z" ETH"        hPrev     hRoot     1  AddItem     hPrev to hSon_ETH

  hex  temp$ 256 ERASE s" MACCR:" temp$ place ETH.MACCR @ 0 <# # # # # # # # # #> temp$ +place   temp$ count drop  DECIMAL   hPrev     hSon_ETH     1  AddItem      hPrev to hSon_ETH.MACCR  
      16 0 do
       temp$ 256 ERASE s" Bit" temp$ place i 0 <# # # #> temp$ +place   temp$ count drop  hPrev     
       hSon_ETH.MACCR      0  AddItem       
      loop   

  hex  temp$ 256 ERASE s" MACFFR:" temp$ place ETH.MACFFR @ 0 <# # # # # # # # # #> temp$ +place   temp$ count drop  DECIMAL   hPrev     hSon_ETH     1  AddItem      hPrev to hSon_ETH.MACFFR  
      16 0 do
       temp$ 256 ERASE s" Bit" temp$ place i 0 <# # # #> temp$ +place   temp$ count drop  hPrev     
       hSon_ETH.MACFFR      0  AddItem       
      loop 

  hex  temp$ 256 ERASE s" MACHTHR:" temp$ place ETH.MACHTHR @ 0 <# # # # # # # # # #> temp$ +place   temp$ count drop  DECIMAL   hPrev     hSon_ETH     1  AddItem      hPrev to hSon_ETH.MACHTHR  
      16 0 do
       temp$ 256 ERASE s" Bit" temp$ place i 0 <# # # #> temp$ +place   temp$ count drop  hPrev     
       hSon_ETH.MACHTHR      0  AddItem       
      loop

  hex  temp$ 256 ERASE s" MACHTLR:" temp$ place ETH.MACHTLR @ 0 <# # # # # # # # # #> temp$ +place   temp$ count drop  DECIMAL   hPrev     hSon_ETH     1  AddItem      hPrev to hSon_ETH.MACHTLR  
      16 0 do
       temp$ 256 ERASE s" Bit" temp$ place i 0 <# # # #> temp$ +place   temp$ count drop  hPrev     
       hSon_ETH.MACHTLR      0  AddItem       
      loop

  hex  temp$ 256 ERASE s" MACMIIAR:" temp$ place ETH.MACMIIAR @ 0 <# # # # # # # # # #> temp$ +place   temp$ count drop  DECIMAL   hPrev     hSon_ETH     1  AddItem      hPrev to hSon_ETH.MACMIIAR  
      16 0 do
       temp$ 256 ERASE s" Bit" temp$ place i 0 <# # # #> temp$ +place   temp$ count drop  hPrev     
       hSon_ETH.MACMIIAR      0  AddItem       
      loop

  hex  temp$ 256 ERASE s" MACMIIDR:" temp$ place ETH.MACMIIDR @ 0 <# # # # # # # # # #> temp$ +place   temp$ count drop  DECIMAL   hPrev     hSon_ETH     1  AddItem      hPrev to hSon_ETH.MACMIIDR  
      16 0 do
       temp$ 256 ERASE s" Bit" temp$ place i 0 <# # # #> temp$ +place   temp$ count drop  hPrev     
       hSon_ETH.MACMIIDR      0  AddItem       
      loop

  hex  temp$ 256 ERASE s" MACFCR:" temp$ place ETH.MACFCR @ 0 <# # # # # # # # # #> temp$ +place   temp$ count drop  DECIMAL   hPrev     hSon_ETH     1  AddItem      hPrev to hSon_ETH.MACFCR  
      16 0 do
       temp$ 256 ERASE s" Bit" temp$ place i 0 <# # # #> temp$ +place   temp$ count drop  hPrev     
       hSon_ETH.MACFCR      0  AddItem       
      loop

  hex  temp$ 256 ERASE s" MACVLANTR:" temp$ place ETH.MACVLANTR @ 0 <# # # # # # # # # #> temp$ +place   temp$ count drop  DECIMAL   hPrev     hSon_ETH     1  AddItem      hPrev to hSon_ETH.MACVLANTR  
      16 0 do
       temp$ 256 ERASE s" Bit" temp$ place i 0 <# # # #> temp$ +place   temp$ count drop  hPrev     
       hSon_ETH.MACVLANTR      0  AddItem       
      loop

  hex  temp$ 256 ERASE s" MACRWUFFR:" temp$ place ETH.MACRWUFFR @ 0 <# # # # # # # # # #> temp$ +place   temp$ count drop  DECIMAL   hPrev     hSon_ETH     1  AddItem      hPrev to hSon_ETH.MACRWUFFR  
      16 0 do
       temp$ 256 ERASE s" Bit" temp$ place i 0 <# # # #> temp$ +place   temp$ count drop  hPrev     
       hSon_ETH.MACRWUFFR      0  AddItem       
      loop

  hex  temp$ 256 ERASE s" MACPMTCSR:" temp$ place ETH.MACPMTCSR @ 0 <# # # # # # # # # #> temp$ +place   temp$ count drop  DECIMAL   hPrev     hSon_ETH     1  AddItem      hPrev to hSon_ETH.MACPMTCSR  
      16 0 do
       temp$ 256 ERASE s" Bit" temp$ place i 0 <# # # #> temp$ +place   temp$ count drop  hPrev     
       hSon_ETH.MACPMTCSR      0  AddItem       
      loop

  hex  temp$ 256 ERASE s" MACDBGR:" temp$ place ETH.MACDBGR @ 0 <# # # # # # # # # #> temp$ +place   temp$ count drop  DECIMAL   hPrev     hSon_ETH     1  AddItem      hPrev to hSon_ETH.MACDBGR  
      16 0 do
       temp$ 256 ERASE s" Bit" temp$ place i 0 <# # # #> temp$ +place   temp$ count drop  hPrev     
       hSon_ETH.MACDBGR      0  AddItem       
      loop

  hex  temp$ 256 ERASE s" MACSR:" temp$ place ETH.MACSR @ 0 <# # # # # # # # # #> temp$ +place   temp$ count drop  DECIMAL   hPrev     hSon_ETH     1  AddItem      hPrev to hSon_ETH.MACSR  
      16 0 do
       temp$ 256 ERASE s" Bit" temp$ place i 0 <# # # #> temp$ +place   temp$ count drop  hPrev     
       hSon_ETH.MACSR      0  AddItem       
      loop

  hex  temp$ 256 ERASE s" MACIMR:" temp$ place ETH.MACIMR @ 0 <# # # # # # # # # #> temp$ +place   temp$ count drop  DECIMAL   hPrev     hSon_ETH     1  AddItem      hPrev to hSon_ETH.MACIMR  
      16 0 do
       temp$ 256 ERASE s" Bit" temp$ place i 0 <# # # #> temp$ +place   temp$ count drop  hPrev     
       hSon_ETH.MACIMR      0  AddItem       
      loop

  hex  temp$ 256 ERASE s" MACA0HR:" temp$ place ETH.MACA0HR @ 0 <# # # # # # # # # #> temp$ +place   temp$ count drop  DECIMAL   hPrev     hSon_ETH     1  AddItem      hPrev to hSon_ETH.MACA0HR  
      16 0 do
       temp$ 256 ERASE s" Bit" temp$ place i 0 <# # # #> temp$ +place   temp$ count drop  hPrev     
       hSon_ETH.MACA0HR      0  AddItem       
      loop

  hex  temp$ 256 ERASE s" MACA0LR:" temp$ place ETH.MACA0LR @ 0 <# # # # # # # # # #> temp$ +place   temp$ count drop  DECIMAL   hPrev     hSon_ETH     1  AddItem      hPrev to hSon_ETH.MACA0LR  
      16 0 do
       temp$ 256 ERASE s" Bit" temp$ place i 0 <# # # #> temp$ +place   temp$ count drop  hPrev     
       hSon_ETH.MACA0LR      0  AddItem       
      loop

  hex  temp$ 256 ERASE s" MACA1HR:" temp$ place ETH.MACA1HR @ 0 <# # # # # # # # # #> temp$ +place   temp$ count drop  DECIMAL   hPrev     hSon_ETH     1  AddItem      hPrev to hSon_ETH.MACA1HR  
      16 0 do
       temp$ 256 ERASE s" Bit" temp$ place i 0 <# # # #> temp$ +place   temp$ count drop  hPrev     
       hSon_ETH.MACA1HR      0  AddItem       
      loop

  hex  temp$ 256 ERASE s" MACA1LR:" temp$ place ETH.MACA1LR @ 0 <# # # # # # # # # #> temp$ +place   temp$ count drop  DECIMAL   hPrev     hSon_ETH     1  AddItem      hPrev to hSon_ETH.MACA1LR  
      16 0 do
       temp$ 256 ERASE s" Bit" temp$ place i 0 <# # # #> temp$ +place   temp$ count drop  hPrev     
       hSon_ETH.MACA1LR      0  AddItem       
      loop

  hex  temp$ 256 ERASE s" MACA2HR:" temp$ place ETH.MACA2HR @ 0 <# # # # # # # # # #> temp$ +place   temp$ count drop  DECIMAL   hPrev     hSon_ETH     1  AddItem      hPrev to hSon_ETH.MACA2HR  
      16 0 do
       temp$ 256 ERASE s" Bit" temp$ place i 0 <# # # #> temp$ +place   temp$ count drop  hPrev     
       hSon_ETH.MACA2HR      0  AddItem       
      loop

  hex  temp$ 256 ERASE s" MACA2LR:" temp$ place ETH.MACA2LR @ 0 <# # # # # # # # # #> temp$ +place   temp$ count drop  DECIMAL   hPrev     hSon_ETH     1  AddItem      hPrev to hSon_ETH.MACA2LR  
      16 0 do
       temp$ 256 ERASE s" Bit" temp$ place i 0 <# # # #> temp$ +place   temp$ count drop  hPrev     
       hSon_ETH.MACA2LR      0  AddItem       
      loop

  hex  temp$ 256 ERASE s" MACA3HR:" temp$ place ETH.MACA3HR @ 0 <# # # # # # # # # #> temp$ +place   temp$ count drop  DECIMAL   hPrev     hSon_ETH     1  AddItem      hPrev to hSon_ETH.MACA3HR  
      16 0 do
       temp$ 256 ERASE s" Bit" temp$ place i 0 <# # # #> temp$ +place   temp$ count drop  hPrev     
       hSon_ETH.MACA3HR      0  AddItem       
      loop

  hex  temp$ 256 ERASE s" MACA3LR:" temp$ place ETH.MACA3LR @ 0 <# # # # # # # # # #> temp$ +place   temp$ count drop  DECIMAL   hPrev     hSon_ETH     1  AddItem      hPrev to hSon_ETH.MACA3LR  
      16 0 do
       temp$ 256 ERASE s" Bit" temp$ place i 0 <# # # #> temp$ +place   temp$ count drop  hPrev     
       hSon_ETH.MACA3LR      0  AddItem       
      loop

  hex  temp$ 256 ERASE s" MMCCR:" temp$ place ETH.MMCCR @ 0 <# # # # # # # # # #> temp$ +place   temp$ count drop  DECIMAL   hPrev     hSon_ETH     1  AddItem      hPrev to hSon_ETH.MMCCR  
      16 0 do
       temp$ 256 ERASE s" Bit" temp$ place i 0 <# # # #> temp$ +place   temp$ count drop  hPrev     
       hSon_ETH.MMCCR      0  AddItem       
      loop

  hex  temp$ 256 ERASE s" MMCRIR:" temp$ place ETH.MMCRIR @ 0 <# # # # # # # # # #> temp$ +place   temp$ count drop  DECIMAL   hPrev     hSon_ETH     1  AddItem      hPrev to hSon_ETH.MMCRIR  
      16 0 do
       temp$ 256 ERASE s" Bit" temp$ place i 0 <# # # #> temp$ +place   temp$ count drop  hPrev     
       hSon_ETH.MMCRIR      0  AddItem       
      loop

  hex  temp$ 256 ERASE s" MMCRIMR:" temp$ place ETH.MMCRIMR @ 0 <# # # # # # # # # #> temp$ +place   temp$ count drop  DECIMAL   hPrev     hSon_ETH     1  AddItem      hPrev to hSon_ETH.MMCRIMR  
      16 0 do
       temp$ 256 ERASE s" Bit" temp$ place i 0 <# # # #> temp$ +place   temp$ count drop  hPrev     
       hSon_ETH.MMCRIMR      0  AddItem       
      loop

  hex  temp$ 256 ERASE s" MMCTIMR:" temp$ place ETH.MMCTIMR @ 0 <# # # # # # # # # #> temp$ +place   temp$ count drop  DECIMAL   hPrev     hSon_ETH     1  AddItem      hPrev to hSon_ETH.MMCTIMR  
      16 0 do
       temp$ 256 ERASE s" Bit" temp$ place i 0 <# # # #> temp$ +place   temp$ count drop  hPrev     
       hSon_ETH.MMCTIMR      0  AddItem       
      loop

  hex  temp$ 256 ERASE s" MMCTGFSCCR:" temp$ place ETH.MMCTGFSCCR @ 0 <# # # # # # # # # #> temp$ +place   temp$ count drop  DECIMAL   hPrev     hSon_ETH     1  AddItem      hPrev to hSon_ETH.MMCTGFSCCR  
      16 0 do
       temp$ 256 ERASE s" Bit" temp$ place i 0 <# # # #> temp$ +place   temp$ count drop  hPrev     
       hSon_ETH.MMCTGFSCCR      0  AddItem       
      loop

  hex  temp$ 256 ERASE s" MMCTGFMSCCR:" temp$ place ETH.MMCTGFMSCCR @ 0 <# # # # # # # # # #> temp$ +place   temp$ count drop  DECIMAL   hPrev     hSon_ETH     1  AddItem      hPrev to hSon_ETH.MMCTGFMSCCR  
      16 0 do
       temp$ 256 ERASE s" Bit" temp$ place i 0 <# # # #> temp$ +place   temp$ count drop  hPrev     
       hSon_ETH.MMCTGFMSCCR      0  AddItem       
      loop

  hex  temp$ 256 ERASE s" MMCTGFCR:" temp$ place ETH.MMCTGFCR @ 0 <# # # # # # # # # #> temp$ +place   temp$ count drop  DECIMAL   hPrev     hSon_ETH     1  AddItem      hPrev to hSon_ETH.MMCTGFCR  
      16 0 do
       temp$ 256 ERASE s" Bit" temp$ place i 0 <# # # #> temp$ +place   temp$ count drop  hPrev     
       hSon_ETH.MMCTGFCR      0  AddItem       
      loop

  hex  temp$ 256 ERASE s" MMCRFCECR:" temp$ place ETH.MMCRFCECR @ 0 <# # # # # # # # # #> temp$ +place   temp$ count drop  DECIMAL   hPrev     hSon_ETH     1  AddItem      hPrev to hSon_ETH.MMCRFCECR  
      16 0 do
       temp$ 256 ERASE s" Bit" temp$ place i 0 <# # # #> temp$ +place   temp$ count drop  hPrev     
       hSon_ETH.MMCRFCECR      0  AddItem       
      loop

  hex  temp$ 256 ERASE s" MMCRFAECR:" temp$ place ETH.MMCRFAECR @ 0 <# # # # # # # # # #> temp$ +place   temp$ count drop  DECIMAL   hPrev     hSon_ETH     1  AddItem      hPrev to hSon_ETH.MMCRFAECR  
      16 0 do
       temp$ 256 ERASE s" Bit" temp$ place i 0 <# # # #> temp$ +place   temp$ count drop  hPrev     
       hSon_ETH.MMCRFAECR      0  AddItem       
      loop

  hex  temp$ 256 ERASE s" MMCRGUFCR:" temp$ place ETH.MMCRGUFCR @ 0 <# # # # # # # # # #> temp$ +place   temp$ count drop  DECIMAL   hPrev     hSon_ETH     1  AddItem      hPrev to hSon_ETH.MMCRGUFCR  
      16 0 do
       temp$ 256 ERASE s" Bit" temp$ place i 0 <# # # #> temp$ +place   temp$ count drop  hPrev     
       hSon_ETH.MMCRGUFCR      0  AddItem       
      loop

  hex  temp$ 256 ERASE s" PTPTSCR:" temp$ place ETH.PTPTSCR @ 0 <# # # # # # # # # #> temp$ +place   temp$ count drop  DECIMAL   hPrev     hSon_ETH     1  AddItem      hPrev to hSon_ETH.PTPTSCR  
      16 0 do
       temp$ 256 ERASE s" Bit" temp$ place i 0 <# # # #> temp$ +place   temp$ count drop  hPrev     
       hSon_ETH.PTPTSCR      0  AddItem       
      loop

  hex  temp$ 256 ERASE s" PTPSSIR:" temp$ place ETH.PTPSSIR @ 0 <# # # # # # # # # #> temp$ +place   temp$ count drop  DECIMAL   hPrev     hSon_ETH     1  AddItem      hPrev to hSon_ETH.PTPSSIR  
      16 0 do
       temp$ 256 ERASE s" Bit" temp$ place i 0 <# # # #> temp$ +place   temp$ count drop  hPrev     
       hSon_ETH.PTPSSIR      0  AddItem       
      loop

  hex  temp$ 256 ERASE s" PTPSSIR:" temp$ place ETH.PTPSSIR @ 0 <# # # # # # # # # #> temp$ +place   temp$ count drop  DECIMAL   hPrev     hSon_ETH     1  AddItem      hPrev to hSon_ETH.PTPSSIR  
      16 0 do
       temp$ 256 ERASE s" Bit" temp$ place i 0 <# # # #> temp$ +place   temp$ count drop  hPrev     
       hSon_ETH.PTPSSIR      0  AddItem       
      loop

  hex  temp$ 256 ERASE s" PTPTSHR:" temp$ place ETH.PTPTSHR @ 0 <# # # # # # # # # #> temp$ +place   temp$ count drop  DECIMAL   hPrev     hSon_ETH     1  AddItem      hPrev to hSon_ETH.PTPTSHR  
      16 0 do
       temp$ 256 ERASE s" Bit" temp$ place i 0 <# # # #> temp$ +place   temp$ count drop  hPrev     
       hSon_ETH.PTPTSHR      0  AddItem       
      loop

  hex  temp$ 256 ERASE s" PTPTSLR:" temp$ place ETH.PTPTSLR @ 0 <# # # # # # # # # #> temp$ +place   temp$ count drop  DECIMAL   hPrev     hSon_ETH     1  AddItem      hPrev to hSon_ETH.PTPTSLR  
      16 0 do
       temp$ 256 ERASE s" Bit" temp$ place i 0 <# # # #> temp$ +place   temp$ count drop  hPrev     
       hSon_ETH.PTPTSLR      0  AddItem       
      loop

  hex  temp$ 256 ERASE s" PTPTSHUR:" temp$ place ETH.PTPTSHUR @ 0 <# # # # # # # # # #> temp$ +place   temp$ count drop  DECIMAL   hPrev     hSon_ETH     1  AddItem      hPrev to hSon_ETH.PTPTSHUR  
      16 0 do
       temp$ 256 ERASE s" Bit" temp$ place i 0 <# # # #> temp$ +place   temp$ count drop  hPrev     
       hSon_ETH.PTPTSHUR      0  AddItem       
      loop

  hex  temp$ 256 ERASE s" PTPTSLUR:" temp$ place ETH.PTPTSLUR @ 0 <# # # # # # # # # #> temp$ +place   temp$ count drop  DECIMAL   hPrev     hSon_ETH     1  AddItem      hPrev to hSon_ETH.PTPTSLUR  
      16 0 do
       temp$ 256 ERASE s" Bit" temp$ place i 0 <# # # #> temp$ +place   temp$ count drop  hPrev     
       hSon_ETH.PTPTSLUR      0  AddItem       
      loop

  hex  temp$ 256 ERASE s" PTPTSAR:" temp$ place ETH.PTPTSAR @ 0 <# # # # # # # # # #> temp$ +place   temp$ count drop  DECIMAL   hPrev     hSon_ETH     1  AddItem      hPrev to hSon_ETH.PTPTSAR  
      16 0 do
       temp$ 256 ERASE s" Bit" temp$ place i 0 <# # # #> temp$ +place   temp$ count drop  hPrev     
       hSon_ETH.PTPTSAR      0  AddItem       
      loop

  hex  temp$ 256 ERASE s" PTPTTHR:" temp$ place ETH.PTPTTHR @ 0 <# # # # # # # # # #> temp$ +place   temp$ count drop  DECIMAL   hPrev     hSon_ETH     1  AddItem      hPrev to hSon_ETH.PTPTTHR  
      16 0 do
       temp$ 256 ERASE s" Bit" temp$ place i 0 <# # # #> temp$ +place   temp$ count drop  hPrev     
       hSon_ETH.PTPTTHR      0  AddItem       
      loop

  hex  temp$ 256 ERASE s" PTPTTLR:" temp$ place ETH.PTPTTLR @ 0 <# # # # # # # # # #> temp$ +place   temp$ count drop  DECIMAL   hPrev     hSon_ETH     1  AddItem      hPrev to hSon_ETH.PTPTTLR  
      16 0 do
       temp$ 256 ERASE s" Bit" temp$ place i 0 <# # # #> temp$ +place   temp$ count drop  hPrev     
       hSon_ETH.PTPTTLR      0  AddItem       
      loop

  hex  temp$ 256 ERASE s" PTPTSSR:" temp$ place ETH.PTPTSSR @ 0 <# # # # # # # # # #> temp$ +place   temp$ count drop  DECIMAL   hPrev     hSon_ETH     1  AddItem      hPrev to hSon_ETH.PTPTSSR  
      16 0 do
       temp$ 256 ERASE s" Bit" temp$ place i 0 <# # # #> temp$ +place   temp$ count drop  hPrev     
       hSon_ETH.PTPTSSR      0  AddItem       
      loop

  hex  temp$ 256 ERASE s" DMABMR:" temp$ place ETH.DMABMR @ 0 <# # # # # # # # # #> temp$ +place   temp$ count drop  DECIMAL   hPrev     hSon_ETH     1  AddItem      hPrev to hSon_ETH.DMABMR  
      16 0 do
       temp$ 256 ERASE s" Bit" temp$ place i 0 <# # # #> temp$ +place   temp$ count drop  hPrev     
       hSon_ETH.DMABMR      0  AddItem       
      loop

  hex  temp$ 256 ERASE s" DMATPDR:" temp$ place ETH.DMATPDR @ 0 <# # # # # # # # # #> temp$ +place   temp$ count drop  DECIMAL   hPrev     hSon_ETH     1  AddItem      hPrev to hSon_ETH.DMATPDR  
      16 0 do
       temp$ 256 ERASE s" Bit" temp$ place i 0 <# # # #> temp$ +place   temp$ count drop  hPrev     
       hSon_ETH.DMATPDR      0  AddItem       
      loop

  hex  temp$ 256 ERASE s" DMARPDR:" temp$ place ETH.DMARPDR @ 0 <# # # # # # # # # #> temp$ +place   temp$ count drop  DECIMAL   hPrev     hSon_ETH     1  AddItem      hPrev to hSon_ETH.DMARPDR  
      16 0 do
       temp$ 256 ERASE s" Bit" temp$ place i 0 <# # # #> temp$ +place   temp$ count drop  hPrev     
       hSon_ETH.DMARPDR      0  AddItem       
      loop

  hex  temp$ 256 ERASE s" DMARDLAR:" temp$ place ETH.DMARDLAR @ 0 <# # # # # # # # # #> temp$ +place   temp$ count drop  DECIMAL   hPrev     hSon_ETH     1  AddItem      hPrev to hSon_ETH.DMARDLAR  
      16 0 do
       temp$ 256 ERASE s" Bit" temp$ place i 0 <# # # #> temp$ +place   temp$ count drop  hPrev     
       hSon_ETH.DMARDLAR      0  AddItem       
      loop

  hex  temp$ 256 ERASE s" DMATDLAR:" temp$ place ETH.DMATDLAR @ 0 <# # # # # # # # # #> temp$ +place   temp$ count drop  DECIMAL   hPrev     hSon_ETH     1  AddItem      hPrev to hSon_ETH.DMATDLAR  
      16 0 do
       temp$ 256 ERASE s" Bit" temp$ place i 0 <# # # #> temp$ +place   temp$ count drop  hPrev     
       hSon_ETH.DMATDLAR      0  AddItem       
      loop

  hex  temp$ 256 ERASE s" DMASR:" temp$ place ETH.DMASR @ 0 <# # # # # # # # # #> temp$ +place   temp$ count drop  DECIMAL   hPrev     hSon_ETH     1  AddItem      hPrev to hSon_ETH.DMASR  
      16 0 do
       temp$ 256 ERASE s" Bit" temp$ place i 0 <# # # #> temp$ +place   temp$ count drop  hPrev     
       hSon_ETH.DMASR      0  AddItem       
      loop

  hex  temp$ 256 ERASE s" DMAOMR:" temp$ place ETH.DMAOMR @ 0 <# # # # # # # # # #> temp$ +place   temp$ count drop  DECIMAL   hPrev     hSon_ETH     1  AddItem      hPrev to hSon_ETH.DMAOMR  
      16 0 do
       temp$ 256 ERASE s" Bit" temp$ place i 0 <# # # #> temp$ +place   temp$ count drop  hPrev     
       hSon_ETH.DMAOMR      0  AddItem       
      loop

  hex  temp$ 256 ERASE s" DMAIER:" temp$ place ETH.DMAIER @ 0 <# # # # # # # # # #> temp$ +place   temp$ count drop  DECIMAL   hPrev     hSon_ETH     1  AddItem      hPrev to hSon_ETH.DMAIER  
      16 0 do
       temp$ 256 ERASE s" Bit" temp$ place i 0 <# # # #> temp$ +place   temp$ count drop  hPrev     
       hSon_ETH.DMAIER      0  AddItem       
      loop

  hex  temp$ 256 ERASE s" DMAMFBOCR:" temp$ place ETH.DMAMFBOCR @ 0 <# # # # # # # # # #> temp$ +place   temp$ count drop  DECIMAL   hPrev     hSon_ETH     1  AddItem      hPrev to hSon_ETH.DMAMFBOCR  
      16 0 do
       temp$ 256 ERASE s" Bit" temp$ place i 0 <# # # #> temp$ +place   temp$ count drop  hPrev     
       hSon_ETH.DMAMFBOCR      0  AddItem       
      loop

  hex  temp$ 256 ERASE s" DMARSWTR:" temp$ place ETH.DMARSWTR @ 0 <# # # # # # # # # #> temp$ +place   temp$ count drop  DECIMAL   hPrev     hSon_ETH     1  AddItem      hPrev to hSon_ETH.DMARSWTR  
      16 0 do
       temp$ 256 ERASE s" Bit" temp$ place i 0 <# # # #> temp$ +place   temp$ count drop  hPrev     
       hSon_ETH.DMARSWTR      0  AddItem       
      loop

  hex  temp$ 256 ERASE s" DMACHTDR:" temp$ place ETH.DMACHTDR @ 0 <# # # # # # # # # #> temp$ +place   temp$ count drop  DECIMAL   hPrev     hSon_ETH     1  AddItem      hPrev to hSon_ETH.DMACHTDR 
      16 0 do
       temp$ 256 ERASE s" Bit" temp$ place i 0 <# # # #> temp$ +place   temp$ count drop  hPrev     
       hSon_ETH.DMACHTDR      0  AddItem       
      loop

  hex  temp$ 256 ERASE s" DMACHRDR:" temp$ place ETH.DMACHRDR @ 0 <# # # # # # # # # #> temp$ +place   temp$ count drop  DECIMAL   hPrev     hSon_ETH     1  AddItem      hPrev to hSon_ETH.DMACHRDR  
      16 0 do
       temp$ 256 ERASE s" Bit" temp$ place i 0 <# # # #> temp$ +place   temp$ count drop  hPrev     
       hSon_ETH.DMACHRDR      0  AddItem       
      loop

  hex  temp$ 256 ERASE s" DMACHTBAR:" temp$ place ETH.DMACHTBAR @ 0 <# # # # # # # # # #> temp$ +place   temp$ count drop  DECIMAL   hPrev     hSon_ETH     1  AddItem      hPrev to hSon_ETH.DMACHTBAR  
      16 0 do
       temp$ 256 ERASE s" Bit" temp$ place i 0 <# # # #> temp$ +place   temp$ count drop  hPrev     
       hSon_ETH.DMACHTBAR      0  AddItem       
      loop

  hex  temp$ 256 ERASE s" DMACHRBAR:" temp$ place ETH.DMACHRBAR @ 0 <# # # # # # # # # #> temp$ +place   temp$ count drop  DECIMAL   hPrev     hSon_ETH     1  AddItem      hPrev to hSon_ETH.DMACHRBAR  
      16 0 do
       temp$ 256 ERASE s" Bit" temp$ place i 0 <# # # #> temp$ +place   temp$ count drop  hPrev     
       hSon_ETH.DMACHRBAR      0  AddItem       
      loop





                   
      ;
 