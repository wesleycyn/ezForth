       
int hSon_RCC

int hSon_RCC.CR      
int hSon_RCC.PLLCFGR 
int hSon_RCC.CFGR    
int hSon_RCC.CIR     
int hSon_RCC.AHB1RSTR
int hSon_RCC.AHB2RSTR
int hSon_RCC.AHB3RSTR 
int hSon_RCC.APB1RSTR
int hSon_RCC.APB2RSTR
int hSon_RCC.AHB1ENR 
int hSon_RCC.AHB2ENR 
int hSon_RCC.AHB3ENR 


: RCC
\ RCC 
   z" RCC"        hPrev     hRoot     1  AddItem     hPrev to hSon_RCC

  hex  temp$ 256 ERASE s" CR:" temp$ place RCC.CR @ 0 <# # # # # # # # # #> temp$ +place   temp$ count drop  DECIMAL   hPrev     hSon_RCC     1  AddItem      hPrev to hSon_RCC.CR  
      16 0 do
       temp$ 256 ERASE s" Bit" temp$ place i 0 <# # # #> temp$ +place   temp$ count drop  hPrev     
       hSon_RCC.CR      0  AddItem       
      loop   

  hex  temp$ 256 ERASE s" PLLCFGR:" temp$ place RCC.PLLCFGR @ 0 <# # # # # # # # # #> temp$ +place   temp$ count drop  DECIMAL   hPrev     hSon_RCC     1  AddItem      hPrev to hSon_RCC.PLLCFGR  
      16 0 do
       temp$ 256 ERASE s" Bit" temp$ place i 0 <# # # #> temp$ +place   temp$ count drop  hPrev     
       hSon_RCC.PLLCFGR      0  AddItem       
      loop   
                      
  hex  temp$ 256 ERASE s" CFGR:" temp$ place RCC.CFGR @ 0 <# # # # # # # # # #> temp$ +place   temp$ count drop  DECIMAL   hPrev     hSon_RCC     1  AddItem      hPrev to hSon_RCC.CFGR  
      16 0 do
       temp$ 256 ERASE s" Bit" temp$ place i 0 <# # # #> temp$ +place   temp$ count drop  hPrev     
       hSon_RCC.CFGR      0  AddItem       
      loop   
      
  hex  temp$ 256 ERASE s" CIR:" temp$ place RCC.CIR @ 0 <# # # # # # # # # #> temp$ +place   temp$ count drop  DECIMAL   hPrev     hSon_RCC     1  AddItem      hPrev to hSon_RCC.CIR  
      16 0 do
       temp$ 256 ERASE s" Bit" temp$ place i 0 <# # # #> temp$ +place   temp$ count drop  hPrev     
       hSon_RCC.CIR     0  AddItem       
      loop      
      
  hex  temp$ 256 ERASE s" AHB1RSTR:" temp$ place RCC.AHB1RSTR @ 0 <# # # # # # # # # #> temp$ +place   temp$ count drop  DECIMAL   hPrev     hSon_RCC     1  AddItem      hPrev to hSon_RCC.AHB1RSTR  
      16 0 do
       temp$ 256 ERASE s" Bit" temp$ place i 0 <# # # #> temp$ +place   temp$ count drop  hPrev     
       hSon_RCC.AHB1RSTR      0  AddItem       
      loop       


  hex  temp$ 256 ERASE s" AHB2RSTR:" temp$ place RCC.AHB2RSTR @ 0 <# # # # # # # # # #> temp$ +place   temp$ count drop  DECIMAL   hPrev     hSon_RCC     1  AddItem      hPrev to hSon_RCC.AHB2RSTR  
      16 0 do
       temp$ 256 ERASE s" Bit" temp$ place i 0 <# # # #> temp$ +place   temp$ count drop  hPrev     
       hSon_RCC.AHB2RSTR      0  AddItem       
      loop       

  hex  temp$ 256 ERASE s" AHB3RSTR:" temp$ place RCC.AHB3RSTR @ 0 <# # # # # # # # # #> temp$ +place   temp$ count drop  DECIMAL   hPrev     hSon_RCC     1  AddItem      hPrev to hSon_RCC.AHB3RSTR
      16 0 do
       temp$ 256 ERASE s" Bit" temp$ place i 0 <# # # #> temp$ +place   temp$ count drop  hPrev     
       hSon_RCC.AHB3RSTR      0  AddItem       
      loop       
      
  hex  temp$ 256 ERASE s" APB1RSTR:" temp$ place RCC.APB1RSTR @ 0 <# # # # # # # # # #> temp$ +place   temp$ count drop  DECIMAL   hPrev     hSon_RCC     1  AddItem      hPrev to hSon_RCC.APB1RSTR  
      16 0 do
       temp$ 256 ERASE s" Bit" temp$ place i 0 <# # # #> temp$ +place   temp$ count drop  hPrev     
       hSon_RCC.APB1RSTR      0  AddItem       
      loop   
      
  hex  temp$ 256 ERASE s" APB2RSTR:" temp$ place RCC.APB2RSTR @ 0 <# # # # # # # # # #> temp$ +place   temp$ count drop  DECIMAL   hPrev     hSon_RCC     1  AddItem      hPrev to hSon_RCC.APB2RSTR  
      16 0 do
       temp$ 256 ERASE s" Bit" temp$ place i 0 <# # # #> temp$ +place   temp$ count drop  hPrev     
       hSon_RCC.APB2RSTR     0  AddItem       
      loop      
      
  hex  temp$ 256 ERASE s" AHB1ENR:" temp$ place RCC.AHB1ENR @ 0 <# # # # # # # # # #> temp$ +place   temp$ count drop  DECIMAL   hPrev     hSon_RCC     1  AddItem      hPrev to hSon_RCC.AHB1ENR  
      16 0 do
       temp$ 256 ERASE s" Bit" temp$ place i 0 <# # # #> temp$ +place   temp$ count drop  hPrev     
       hSon_RCC.AHB1ENR      0  AddItem       
      loop       


  hex  temp$ 256 ERASE s" AHB2ENR:" temp$ place RCC.AHB2ENR @ 0 <# # # # # # # # # #> temp$ +place   temp$ count drop  DECIMAL   hPrev     hSon_RCC     1  AddItem      hPrev to hSon_RCC.AHB2ENR  
      16 0 do
       temp$ 256 ERASE s" Bit" temp$ place i 0 <# # # #> temp$ +place   temp$ count drop  hPrev     
       hSon_RCC.AHB2ENR      0  AddItem       
      loop       

  hex  temp$ 256 ERASE s" AHB3ENR:" temp$ place RCC.AHB3ENR @ 0 <# # # # # # # # # #> temp$ +place   temp$ count drop  DECIMAL   hPrev     hSon_RCC     1  AddItem      hPrev to hSon_RCC.AHB3ENR
      16 0 do
       temp$ 256 ERASE s" Bit" temp$ place i 0 <# # # #> temp$ +place   temp$ count drop  hPrev     
       hSon_RCC.AHB3ENR      0  AddItem       
      loop
                   
      ;
        