int hSon_TIM11

int hSon_TIM11.CR1 
int hSon_TIM11.CR2
int hSon_TIM11.SMCR
int hSon_TIM11.DIER
int hSon_TIM11.SR 
int hSon_TIM11.EGR 
int hSon_TIM11.CCMR1 
int hSon_TIM11.CCMR2 
int hSon_TIM11.CCER
int hSon_TIM11.CNT
int hSon_TIM11.PSC 
int hSon_TIM11.ARR 
int hSon_TIM11.RCR 
int hSon_TIM11.CCR1 
int hSon_TIM11.CCR2 
int hSon_TIM11.CCR3 
int hSon_TIM11.CCR4 
int hSon_TIM11.DBTR 
int hSon_TIM11.DCR 
int hSon_TIM11.DMAR 

  



: Tree_TIM11 
  z" TIM11"        hPrev     hSon_TIM     1  AddItem     hPrev to hSon_TIM11
  hex  temp$ 256 ERASE s" CR1:" temp$ place TIM11.CR1 @ 0 <# # # # # # # # # #> temp$ +place   temp$ count drop  DECIMAL   hPrev     hSon_TIM11     1  AddItem      hPrev to hSon_TIM11.CR1  
      16 0 do
       temp$ 256 ERASE s" Bit" temp$ place i 0 <# # # #> temp$ +place   temp$ count drop  hPrev     
       hSon_TIM11.CR1      0  AddItem       
      loop   

  hex  temp$ 256 ERASE s" CR2:" temp$ place TIM11.CR2 @ 0 <# # # # # # # # # #> temp$ +place   temp$ count drop  DECIMAL   hPrev     hSon_TIM11     1  AddItem      hPrev to hSon_TIM11.CR2  
      16 0 do
       temp$ 256 ERASE s" Bit" temp$ place i 0 <# # # #> temp$ +place   temp$ count drop  hPrev     
       hSon_TIM11.CR2      0  AddItem       
      loop   
                      
  hex  temp$ 256 ERASE s" SMCR:" temp$ place TIM11.SMCR @ 0 <# # # # # # # # # #> temp$ +place   temp$ count drop  DECIMAL   hPrev     hSon_TIM11     1  AddItem      hPrev to hSon_TIM11.SMCR  
      16 0 do
       temp$ 256 ERASE s" Bit" temp$ place i 0 <# # # #> temp$ +place   temp$ count drop  hPrev     
       hSon_TIM11.SMCR      0  AddItem       
      loop   
      
  hex  temp$ 256 ERASE s" DIER:" temp$ place TIM11.DIER @ 0 <# # # # # # # # # #> temp$ +place   temp$ count drop  DECIMAL   hPrev     hSon_TIM11     1  AddItem      hPrev to hSon_TIM11.DIER  
      16 0 do
       temp$ 256 ERASE s" Bit" temp$ place i 0 <# # # #> temp$ +place   temp$ count drop  hPrev     
       hSon_TIM11.DIER      0  AddItem       
      loop      
      
  hex  temp$ 256 ERASE s" SR:" temp$ place TIM11.SR @ 0 <# # # # # # # # # #> temp$ +place   temp$ count drop  DECIMAL   hPrev     hSon_TIM11     1  AddItem      hPrev to hSon_TIM11.SR  
      16 0 do
       temp$ 256 ERASE s" Bit" temp$ place i 0 <# # # #> temp$ +place   temp$ count drop  hPrev     
       hSon_TIM11.DIER      0  AddItem       
      loop       


  hex  temp$ 256 ERASE s" EGR:" temp$ place TIM11.EGR @ 0 <# # # # # # # # # #> temp$ +place   temp$ count drop  DECIMAL   hPrev     hSon_TIM11     1  AddItem      hPrev to hSon_TIM11.EGR  
      16 0 do
       temp$ 256 ERASE s" Bit" temp$ place i 0 <# # # #> temp$ +place   temp$ count drop  hPrev     
       hSon_TIM11.EGR      0  AddItem       
      loop       

  hex  temp$ 256 ERASE s" CCMR1:" temp$ place TIM11.CCMR1 @ 0 <# # # # # # # # # #> temp$ +place   temp$ count drop  DECIMAL   hPrev     hSon_TIM11     1  AddItem      hPrev to hSon_TIM11.CCMR1
      16 0 do
       temp$ 256 ERASE s" Bit" temp$ place i 0 <# # # #> temp$ +place   temp$ count drop  hPrev     
       hSon_TIM11.CCMR1      0  AddItem       
      loop       
      

  hex  temp$ 256 ERASE s" CCMR2:" temp$ place TIM11.CCMR2 @ 0 <# # # # # # # # # #> temp$ +place   temp$ count drop  DECIMAL   hPrev     hSon_TIM11     1  AddItem      hPrev to hSon_TIM11.CCMR2
      16 0 do
       temp$ 256 ERASE s" Bit" temp$ place i 0 <# # # #> temp$ +place   temp$ count drop  hPrev     
       hSon_TIM11.CCMR2      0  AddItem       
      loop 

  hex  temp$ 256 ERASE s" CCER:" temp$ place TIM11.CCER @ 0 <# # # # # # # # # #> temp$ +place   temp$ count drop  DECIMAL   hPrev     hSon_TIM11     1  AddItem      hPrev to hSon_TIM11.CCER
      16 0 do
       temp$ 256 ERASE s" Bit" temp$ place i 0 <# # # #> temp$ +place   temp$ count drop  hPrev     
       hSon_TIM11.CCER      0  AddItem       
      loop 
      
  hex  temp$ 256 ERASE s" CNT:" temp$ place TIM11.CNT @ 0 <# # # # # # # # # #> temp$ +place   temp$ count drop  DECIMAL   hPrev     hSon_TIM11     1  AddItem      hPrev to hSon_TIM11.CNT
      16 0 do
       temp$ 256 ERASE s" Bit" temp$ place i 0 <# # # #> temp$ +place   temp$ count drop  hPrev     
       hSon_TIM11.CNT      0  AddItem       
      loop      
      
  hex  temp$ 256 ERASE s" PSC:" temp$ place TIM11.PSC @ 0 <# # # # # # # # # #> temp$ +place   temp$ count drop  DECIMAL   hPrev     hSon_TIM11     1  AddItem      hPrev to hSon_TIM11.PSC
      16 0 do
       temp$ 256 ERASE s" Bit" temp$ place i 0 <# # # #> temp$ +place   temp$ count drop  hPrev     
       hSon_TIM11.PSC      0  AddItem       
      loop      
      
  hex  temp$ 256 ERASE s" ARR:" temp$ place TIM11.ARR @ 0 <# # # # # # # # # #> temp$ +place   temp$ count drop  DECIMAL   hPrev     hSon_TIM11     1  AddItem      hPrev to hSon_TIM11.ARR
      16 0 do
       temp$ 256 ERASE s" Bit" temp$ place i 0 <# # # #> temp$ +place   temp$ count drop  hPrev     
       hSon_TIM11.ARR      0  AddItem       
      loop 
      
  hex  temp$ 256 ERASE s" RCR:" temp$ place TIM11.RCR @ 0 <# # # # # # # # # #> temp$ +place   temp$ count drop  DECIMAL   hPrev     hSon_TIM11     1  AddItem      hPrev to hSon_TIM11.RCR
      16 0 do
       temp$ 256 ERASE s" Bit" temp$ place i 0 <# # # #> temp$ +place   temp$ count drop  hPrev     
       hSon_TIM11.RCR      0  AddItem       
      loop       
      
  hex  temp$ 256 ERASE s" CCR1:" temp$ place TIM11.CCR1 @ 0 <# # # # # # # # # #> temp$ +place   temp$ count drop  DECIMAL   hPrev     hSon_TIM11     1  AddItem      hPrev to hSon_TIM11.CCR1
      16 0 do
       temp$ 256 ERASE s" Bit" temp$ place i 0 <# # # #> temp$ +place   temp$ count drop  hPrev     
       hSon_TIM11.CCR1      0  AddItem       
      loop        
      
  hex  temp$ 256 ERASE s" CCR2:" temp$ place TIM11.CCR2 @ 0 <# # # # # # # # # #> temp$ +place   temp$ count drop  DECIMAL   hPrev     hSon_TIM11     1  AddItem      hPrev to hSon_TIM11.CCR2
      16 0 do
       temp$ 256 ERASE s" Bit" temp$ place i 0 <# # # #> temp$ +place   temp$ count drop  hPrev     
       hSon_TIM11.CCR2      0  AddItem       
      loop
      
  hex  temp$ 256 ERASE s" CCR3:" temp$ place TIM11.CCR3 @ 0 <# # # # # # # # # #> temp$ +place   temp$ count drop  DECIMAL   hPrev     hSon_TIM11     1  AddItem      hPrev to hSon_TIM11.CCR3
      16 0 do
       temp$ 256 ERASE s" Bit" temp$ place i 0 <# # # #> temp$ +place   temp$ count drop  hPrev     
       hSon_TIM11.CCR3      0  AddItem       
      loop
      
  hex  temp$ 256 ERASE s" CCR4:" temp$ place TIM11.CCR4 @ 0 <# # # # # # # # # #> temp$ +place   temp$ count drop  DECIMAL   hPrev     hSon_TIM11     1  AddItem      hPrev to hSon_TIM11.CCR4
      16 0 do
       temp$ 256 ERASE s" Bit" temp$ place i 0 <# # # #> temp$ +place   temp$ count drop  hPrev     
       hSon_TIM11.CCR4      0  AddItem       
      loop                              
      
           
  hex  temp$ 256 ERASE s" DBTR:" temp$ place TIM11.DBTR @ 0 <# # # # # # # # # #> temp$ +place   temp$ count drop  DECIMAL   hPrev     hSon_TIM11     1  AddItem      hPrev to hSon_TIM11.DBTR
      16 0 do
       temp$ 256 ERASE s" Bit" temp$ place i 0 <# # # #> temp$ +place   temp$ count drop  hPrev     
       hSon_TIM11.DBTR      0  AddItem       
      loop                              

  hex  temp$ 256 ERASE s" DCR:" temp$ place TIM11.DCR @ 0 <# # # # # # # # # #> temp$ +place   temp$ count drop  DECIMAL   hPrev     hSon_TIM11     1  AddItem      hPrev to hSon_TIM11.DCR
      16 0 do
       temp$ 256 ERASE s" Bit" temp$ place i 0 <# # # #> temp$ +place   temp$ count drop  hPrev     
       hSon_TIM11.DCR      0  AddItem       
      loop                              


  hex  temp$ 256 ERASE s" DMAR:" temp$ place TIM11.DMAR @ 0 <# # # # # # # # # #> temp$ +place   temp$ count drop  DECIMAL   hPrev     hSon_TIM11     1  AddItem      hPrev to hSon_TIM11.DMAR
      16 0 do
       temp$ 256 ERASE s" Bit" temp$ place i 0 <# # # #> temp$ +place   temp$ count drop  hPrev     
       hSon_TIM11.DMAR      0  AddItem       
      loop                              
      ;             


