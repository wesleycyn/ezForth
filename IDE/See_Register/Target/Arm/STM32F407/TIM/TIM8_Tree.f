int hSon_TIM8

int hSon_TIM8.CR1 
int hSon_TIM8.CR2
int hSon_TIM8.SMCR
int hSon_TIM8.DIER
int hSon_TIM8.SR 
int hSon_TIM8.EGR 
int hSon_TIM8.CCMR1 
int hSon_TIM8.CCMR2 
int hSon_TIM8.CCER
int hSon_TIM8.CNT
int hSon_TIM8.PSC 
int hSon_TIM8.ARR 
int hSon_TIM8.RCR 
int hSon_TIM8.CCR1 
int hSon_TIM8.CCR2 
int hSon_TIM8.CCR3 
int hSon_TIM8.CCR4 
int hSon_TIM8.DBTR 
int hSon_TIM8.DCR 
int hSon_TIM8.DMAR 

  



: Tree_TIM8 
  z" TIM8"        hPrev     hSon_TIM     1  AddItem     hPrev to hSon_TIM8
  hex  temp$ 256 ERASE s" CR1:" temp$ place TIM8.CR1 @ 0 <# # # # # # # # # #> temp$ +place   temp$ count drop  DECIMAL   hPrev     hSon_TIM8     1  AddItem      hPrev to hSon_TIM8.CR1  
      16 0 do
       temp$ 256 ERASE s" Bit" temp$ place i 0 <# # # #> temp$ +place   temp$ count drop  hPrev     
       hSon_TIM8.CR1      0  AddItem       
      loop   

  hex  temp$ 256 ERASE s" CR2:" temp$ place TIM8.CR2 @ 0 <# # # # # # # # # #> temp$ +place   temp$ count drop  DECIMAL   hPrev     hSon_TIM8     1  AddItem      hPrev to hSon_TIM8.CR2  
      16 0 do
       temp$ 256 ERASE s" Bit" temp$ place i 0 <# # # #> temp$ +place   temp$ count drop  hPrev     
       hSon_TIM8.CR2      0  AddItem       
      loop   
                      
  hex  temp$ 256 ERASE s" SMCR:" temp$ place TIM8.SMCR @ 0 <# # # # # # # # # #> temp$ +place   temp$ count drop  DECIMAL   hPrev     hSon_TIM8     1  AddItem      hPrev to hSon_TIM8.SMCR  
      16 0 do
       temp$ 256 ERASE s" Bit" temp$ place i 0 <# # # #> temp$ +place   temp$ count drop  hPrev     
       hSon_TIM8.SMCR      0  AddItem       
      loop   
      
  hex  temp$ 256 ERASE s" DIER:" temp$ place TIM8.DIER @ 0 <# # # # # # # # # #> temp$ +place   temp$ count drop  DECIMAL   hPrev     hSon_TIM8     1  AddItem      hPrev to hSon_TIM8.DIER  
      16 0 do
       temp$ 256 ERASE s" Bit" temp$ place i 0 <# # # #> temp$ +place   temp$ count drop  hPrev     
       hSon_TIM8.DIER      0  AddItem       
      loop      
      
  hex  temp$ 256 ERASE s" SR:" temp$ place TIM8.SR @ 0 <# # # # # # # # # #> temp$ +place   temp$ count drop  DECIMAL   hPrev     hSon_TIM8     1  AddItem      hPrev to hSon_TIM8.SR  
      16 0 do
       temp$ 256 ERASE s" Bit" temp$ place i 0 <# # # #> temp$ +place   temp$ count drop  hPrev     
       hSon_TIM8.DIER      0  AddItem       
      loop       


  hex  temp$ 256 ERASE s" EGR:" temp$ place TIM8.EGR @ 0 <# # # # # # # # # #> temp$ +place   temp$ count drop  DECIMAL   hPrev     hSon_TIM8     1  AddItem      hPrev to hSon_TIM8.EGR  
      16 0 do
       temp$ 256 ERASE s" Bit" temp$ place i 0 <# # # #> temp$ +place   temp$ count drop  hPrev     
       hSon_TIM8.EGR      0  AddItem       
      loop       

  hex  temp$ 256 ERASE s" CCMR1:" temp$ place TIM8.CCMR1 @ 0 <# # # # # # # # # #> temp$ +place   temp$ count drop  DECIMAL   hPrev     hSon_TIM8     1  AddItem      hPrev to hSon_TIM8.CCMR1
      16 0 do
       temp$ 256 ERASE s" Bit" temp$ place i 0 <# # # #> temp$ +place   temp$ count drop  hPrev     
       hSon_TIM8.CCMR1      0  AddItem       
      loop       
      

  hex  temp$ 256 ERASE s" CCMR2:" temp$ place TIM8.CCMR2 @ 0 <# # # # # # # # # #> temp$ +place   temp$ count drop  DECIMAL   hPrev     hSon_TIM8     1  AddItem      hPrev to hSon_TIM8.CCMR2
      16 0 do
       temp$ 256 ERASE s" Bit" temp$ place i 0 <# # # #> temp$ +place   temp$ count drop  hPrev     
       hSon_TIM8.CCMR2      0  AddItem       
      loop 

  hex  temp$ 256 ERASE s" CCER:" temp$ place TIM8.CCER @ 0 <# # # # # # # # # #> temp$ +place   temp$ count drop  DECIMAL   hPrev     hSon_TIM8     1  AddItem      hPrev to hSon_TIM8.CCER
      16 0 do
       temp$ 256 ERASE s" Bit" temp$ place i 0 <# # # #> temp$ +place   temp$ count drop  hPrev     
       hSon_TIM8.CCER      0  AddItem       
      loop 
      
  hex  temp$ 256 ERASE s" CNT:" temp$ place TIM8.CNT @ 0 <# # # # # # # # # #> temp$ +place   temp$ count drop  DECIMAL   hPrev     hSon_TIM8     1  AddItem      hPrev to hSon_TIM8.CNT
      16 0 do
       temp$ 256 ERASE s" Bit" temp$ place i 0 <# # # #> temp$ +place   temp$ count drop  hPrev     
       hSon_TIM8.CNT      0  AddItem       
      loop      
      
  hex  temp$ 256 ERASE s" PSC:" temp$ place TIM8.PSC @ 0 <# # # # # # # # # #> temp$ +place   temp$ count drop  DECIMAL   hPrev     hSon_TIM8     1  AddItem      hPrev to hSon_TIM8.PSC
      16 0 do
       temp$ 256 ERASE s" Bit" temp$ place i 0 <# # # #> temp$ +place   temp$ count drop  hPrev     
       hSon_TIM8.PSC      0  AddItem       
      loop      
      
  hex  temp$ 256 ERASE s" ARR:" temp$ place TIM8.ARR @ 0 <# # # # # # # # # #> temp$ +place   temp$ count drop  DECIMAL   hPrev     hSon_TIM8     1  AddItem      hPrev to hSon_TIM8.ARR
      16 0 do
       temp$ 256 ERASE s" Bit" temp$ place i 0 <# # # #> temp$ +place   temp$ count drop  hPrev     
       hSon_TIM8.ARR      0  AddItem       
      loop 
      
  hex  temp$ 256 ERASE s" RCR:" temp$ place TIM8.RCR @ 0 <# # # # # # # # # #> temp$ +place   temp$ count drop  DECIMAL   hPrev     hSon_TIM8     1  AddItem      hPrev to hSon_TIM8.RCR
      16 0 do
       temp$ 256 ERASE s" Bit" temp$ place i 0 <# # # #> temp$ +place   temp$ count drop  hPrev     
       hSon_TIM8.RCR      0  AddItem       
      loop       
      
  hex  temp$ 256 ERASE s" CCR1:" temp$ place TIM8.CCR1 @ 0 <# # # # # # # # # #> temp$ +place   temp$ count drop  DECIMAL   hPrev     hSon_TIM8     1  AddItem      hPrev to hSon_TIM8.CCR1
      16 0 do
       temp$ 256 ERASE s" Bit" temp$ place i 0 <# # # #> temp$ +place   temp$ count drop  hPrev     
       hSon_TIM8.CCR1      0  AddItem       
      loop        
      
  hex  temp$ 256 ERASE s" CCR2:" temp$ place TIM8.CCR2 @ 0 <# # # # # # # # # #> temp$ +place   temp$ count drop  DECIMAL   hPrev     hSon_TIM8     1  AddItem      hPrev to hSon_TIM8.CCR2
      16 0 do
       temp$ 256 ERASE s" Bit" temp$ place i 0 <# # # #> temp$ +place   temp$ count drop  hPrev     
       hSon_TIM8.CCR2      0  AddItem       
      loop
      
  hex  temp$ 256 ERASE s" CCR3:" temp$ place TIM8.CCR3 @ 0 <# # # # # # # # # #> temp$ +place   temp$ count drop  DECIMAL   hPrev     hSon_TIM8     1  AddItem      hPrev to hSon_TIM8.CCR3
      16 0 do
       temp$ 256 ERASE s" Bit" temp$ place i 0 <# # # #> temp$ +place   temp$ count drop  hPrev     
       hSon_TIM8.CCR3      0  AddItem       
      loop
      
  hex  temp$ 256 ERASE s" CCR4:" temp$ place TIM8.CCR4 @ 0 <# # # # # # # # # #> temp$ +place   temp$ count drop  DECIMAL   hPrev     hSon_TIM8     1  AddItem      hPrev to hSon_TIM8.CCR4
      16 0 do
       temp$ 256 ERASE s" Bit" temp$ place i 0 <# # # #> temp$ +place   temp$ count drop  hPrev     
       hSon_TIM8.CCR4      0  AddItem       
      loop                              
      
           
  hex  temp$ 256 ERASE s" DBTR:" temp$ place TIM8.DBTR @ 0 <# # # # # # # # # #> temp$ +place   temp$ count drop  DECIMAL   hPrev     hSon_TIM8     1  AddItem      hPrev to hSon_TIM8.DBTR
      16 0 do
       temp$ 256 ERASE s" Bit" temp$ place i 0 <# # # #> temp$ +place   temp$ count drop  hPrev     
       hSon_TIM8.DBTR      0  AddItem       
      loop                              

  hex  temp$ 256 ERASE s" DCR:" temp$ place TIM8.DCR @ 0 <# # # # # # # # # #> temp$ +place   temp$ count drop  DECIMAL   hPrev     hSon_TIM8     1  AddItem      hPrev to hSon_TIM8.DCR
      16 0 do
       temp$ 256 ERASE s" Bit" temp$ place i 0 <# # # #> temp$ +place   temp$ count drop  hPrev     
       hSon_TIM8.DCR      0  AddItem       
      loop                              


  hex  temp$ 256 ERASE s" DMAR:" temp$ place TIM8.DMAR @ 0 <# # # # # # # # # #> temp$ +place   temp$ count drop  DECIMAL   hPrev     hSon_TIM8     1  AddItem      hPrev to hSon_TIM8.DMAR
      16 0 do
       temp$ 256 ERASE s" Bit" temp$ place i 0 <# # # #> temp$ +place   temp$ count drop  hPrev     
       hSon_TIM8.DMAR      0  AddItem       
      loop                              
      ;             


