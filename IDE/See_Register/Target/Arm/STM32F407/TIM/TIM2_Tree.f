int hSon_TIM2

int hSon_TIM2.CR1 
int hSon_TIM2.CR2
int hSon_TIM2.SMCR
int hSon_TIM2.DIER
int hSon_TIM2.SR 
int hSon_TIM2.EGR 
int hSon_TIM2.CCMR1 
int hSon_TIM2.CCMR2 
int hSon_TIM2.CCER
int hSon_TIM2.CNT
int hSon_TIM2.PSC 
int hSon_TIM2.ARR 
int hSon_TIM2.RCR 
int hSon_TIM2.CCR1 
int hSon_TIM2.CCR2 
int hSon_TIM2.CCR3 
int hSon_TIM2.CCR4 
int hSon_TIM2.DBTR 
int hSon_TIM2.DCR 
int hSon_TIM2.DMAR 

  



: Tree_TIM2 
  z" TIM2"        hPrev     hSon_TIM     1  AddItem     hPrev to hSon_TIM2
  hex  temp$ 256 ERASE s" CR1:" temp$ place TIM2.CR1 @ 0 <# # # # # # # # # #> temp$ +place   temp$ count drop  DECIMAL   hPrev     hSon_TIM2     1  AddItem      hPrev to hSon_TIM2.CR1  
      16 0 do
       temp$ 256 ERASE s" Bit" temp$ place i 0 <# # # #> temp$ +place   temp$ count drop  hPrev     
       hSon_TIM2.CR1      0  AddItem       
      loop   

  hex  temp$ 256 ERASE s" CR2:" temp$ place TIM2.CR2 @ 0 <# # # # # # # # # #> temp$ +place   temp$ count drop  DECIMAL   hPrev     hSon_TIM2     1  AddItem      hPrev to hSon_TIM2.CR2  
      16 0 do
       temp$ 256 ERASE s" Bit" temp$ place i 0 <# # # #> temp$ +place   temp$ count drop  hPrev     
       hSon_TIM2.CR2      0  AddItem       
      loop   
                      
  hex  temp$ 256 ERASE s" SMCR:" temp$ place TIM2.SMCR @ 0 <# # # # # # # # # #> temp$ +place   temp$ count drop  DECIMAL   hPrev     hSon_TIM2     1  AddItem      hPrev to hSon_TIM2.SMCR  
      16 0 do
       temp$ 256 ERASE s" Bit" temp$ place i 0 <# # # #> temp$ +place   temp$ count drop  hPrev     
       hSon_TIM2.SMCR      0  AddItem       
      loop   
      
  hex  temp$ 256 ERASE s" DIER:" temp$ place TIM2.DIER @ 0 <# # # # # # # # # #> temp$ +place   temp$ count drop  DECIMAL   hPrev     hSon_TIM2     1  AddItem      hPrev to hSon_TIM2.DIER  
      16 0 do
       temp$ 256 ERASE s" Bit" temp$ place i 0 <# # # #> temp$ +place   temp$ count drop  hPrev     
       hSon_TIM2.DIER      0  AddItem       
      loop      
      
  hex  temp$ 256 ERASE s" SR:" temp$ place TIM2.SR @ 0 <# # # # # # # # # #> temp$ +place   temp$ count drop  DECIMAL   hPrev     hSon_TIM2     1  AddItem      hPrev to hSon_TIM2.SR  
      16 0 do
       temp$ 256 ERASE s" Bit" temp$ place i 0 <# # # #> temp$ +place   temp$ count drop  hPrev     
       hSon_TIM2.DIER      0  AddItem       
      loop       


  hex  temp$ 256 ERASE s" EGR:" temp$ place TIM2.EGR @ 0 <# # # # # # # # # #> temp$ +place   temp$ count drop  DECIMAL   hPrev     hSon_TIM2     1  AddItem      hPrev to hSon_TIM2.EGR  
      16 0 do
       temp$ 256 ERASE s" Bit" temp$ place i 0 <# # # #> temp$ +place   temp$ count drop  hPrev     
       hSon_TIM2.EGR      0  AddItem       
      loop       

  hex  temp$ 256 ERASE s" CCMR1:" temp$ place TIM2.CCMR1 @ 0 <# # # # # # # # # #> temp$ +place   temp$ count drop  DECIMAL   hPrev     hSon_TIM2     1  AddItem      hPrev to hSon_TIM2.CCMR1
      16 0 do
       temp$ 256 ERASE s" Bit" temp$ place i 0 <# # # #> temp$ +place   temp$ count drop  hPrev     
       hSon_TIM2.CCMR1      0  AddItem       
      loop       
      

  hex  temp$ 256 ERASE s" CCMR2:" temp$ place TIM2.CCMR2 @ 0 <# # # # # # # # # #> temp$ +place   temp$ count drop  DECIMAL   hPrev     hSon_TIM2     1  AddItem      hPrev to hSon_TIM2.CCMR2
      16 0 do
       temp$ 256 ERASE s" Bit" temp$ place i 0 <# # # #> temp$ +place   temp$ count drop  hPrev     
       hSon_TIM2.CCMR2      0  AddItem       
      loop 

  hex  temp$ 256 ERASE s" CCER:" temp$ place TIM2.CCER @ 0 <# # # # # # # # # #> temp$ +place   temp$ count drop  DECIMAL   hPrev     hSon_TIM2     1  AddItem      hPrev to hSon_TIM2.CCER
      16 0 do
       temp$ 256 ERASE s" Bit" temp$ place i 0 <# # # #> temp$ +place   temp$ count drop  hPrev     
       hSon_TIM2.CCER      0  AddItem       
      loop 
      
  hex  temp$ 256 ERASE s" CNT:" temp$ place TIM2.CNT @ 0 <# # # # # # # # # #> temp$ +place   temp$ count drop  DECIMAL   hPrev     hSon_TIM2     1  AddItem      hPrev to hSon_TIM2.CNT
      16 0 do
       temp$ 256 ERASE s" Bit" temp$ place i 0 <# # # #> temp$ +place   temp$ count drop  hPrev     
       hSon_TIM2.CNT      0  AddItem       
      loop      
      
  hex  temp$ 256 ERASE s" PSC:" temp$ place TIM2.PSC @ 0 <# # # # # # # # # #> temp$ +place   temp$ count drop  DECIMAL   hPrev     hSon_TIM2     1  AddItem      hPrev to hSon_TIM2.PSC
      16 0 do
       temp$ 256 ERASE s" Bit" temp$ place i 0 <# # # #> temp$ +place   temp$ count drop  hPrev     
       hSon_TIM2.PSC      0  AddItem       
      loop      
      
  hex  temp$ 256 ERASE s" ARR:" temp$ place TIM2.ARR @ 0 <# # # # # # # # # #> temp$ +place   temp$ count drop  DECIMAL   hPrev     hSon_TIM2     1  AddItem      hPrev to hSon_TIM2.ARR
      16 0 do
       temp$ 256 ERASE s" Bit" temp$ place i 0 <# # # #> temp$ +place   temp$ count drop  hPrev     
       hSon_TIM2.ARR      0  AddItem       
      loop 
      
  hex  temp$ 256 ERASE s" RCR:" temp$ place TIM2.RCR @ 0 <# # # # # # # # # #> temp$ +place   temp$ count drop  DECIMAL   hPrev     hSon_TIM2     1  AddItem      hPrev to hSon_TIM2.RCR
      16 0 do
       temp$ 256 ERASE s" Bit" temp$ place i 0 <# # # #> temp$ +place   temp$ count drop  hPrev     
       hSon_TIM2.RCR      0  AddItem       
      loop       
      
  hex  temp$ 256 ERASE s" CCR1:" temp$ place TIM2.CCR1 @ 0 <# # # # # # # # # #> temp$ +place   temp$ count drop  DECIMAL   hPrev     hSon_TIM2     1  AddItem      hPrev to hSon_TIM2.CCR1
      16 0 do
       temp$ 256 ERASE s" Bit" temp$ place i 0 <# # # #> temp$ +place   temp$ count drop  hPrev     
       hSon_TIM2.CCR1      0  AddItem       
      loop        
      
  hex  temp$ 256 ERASE s" CCR2:" temp$ place TIM2.CCR2 @ 0 <# # # # # # # # # #> temp$ +place   temp$ count drop  DECIMAL   hPrev     hSon_TIM2     1  AddItem      hPrev to hSon_TIM2.CCR2
      16 0 do
       temp$ 256 ERASE s" Bit" temp$ place i 0 <# # # #> temp$ +place   temp$ count drop  hPrev     
       hSon_TIM2.CCR2      0  AddItem       
      loop
      
  hex  temp$ 256 ERASE s" CCR3:" temp$ place TIM2.CCR3 @ 0 <# # # # # # # # # #> temp$ +place   temp$ count drop  DECIMAL   hPrev     hSon_TIM2     1  AddItem      hPrev to hSon_TIM2.CCR3
      16 0 do
       temp$ 256 ERASE s" Bit" temp$ place i 0 <# # # #> temp$ +place   temp$ count drop  hPrev     
       hSon_TIM2.CCR3      0  AddItem       
      loop
      
  hex  temp$ 256 ERASE s" CCR4:" temp$ place TIM2.CCR4 @ 0 <# # # # # # # # # #> temp$ +place   temp$ count drop  DECIMAL   hPrev     hSon_TIM2     1  AddItem      hPrev to hSon_TIM2.CCR4
      16 0 do
       temp$ 256 ERASE s" Bit" temp$ place i 0 <# # # #> temp$ +place   temp$ count drop  hPrev     
       hSon_TIM2.CCR4      0  AddItem       
      loop                              
      
           
  hex  temp$ 256 ERASE s" DBTR:" temp$ place TIM2.DBTR @ 0 <# # # # # # # # # #> temp$ +place   temp$ count drop  DECIMAL   hPrev     hSon_TIM2     1  AddItem      hPrev to hSon_TIM2.DBTR
      16 0 do
       temp$ 256 ERASE s" Bit" temp$ place i 0 <# # # #> temp$ +place   temp$ count drop  hPrev     
       hSon_TIM2.DBTR      0  AddItem       
      loop                              

  hex  temp$ 256 ERASE s" DCR:" temp$ place TIM2.DCR @ 0 <# # # # # # # # # #> temp$ +place   temp$ count drop  DECIMAL   hPrev     hSon_TIM2     1  AddItem      hPrev to hSon_TIM2.DCR
      16 0 do
       temp$ 256 ERASE s" Bit" temp$ place i 0 <# # # #> temp$ +place   temp$ count drop  hPrev     
       hSon_TIM2.DCR      0  AddItem       
      loop                              


  hex  temp$ 256 ERASE s" DMAR:" temp$ place TIM2.DMAR @ 0 <# # # # # # # # # #> temp$ +place   temp$ count drop  DECIMAL   hPrev     hSon_TIM2     1  AddItem      hPrev to hSon_TIM2.DMAR
      16 0 do
       temp$ 256 ERASE s" Bit" temp$ place i 0 <# # # #> temp$ +place   temp$ count drop  hPrev     
       hSon_TIM2.DMAR      0  AddItem       
      loop                              
      ;             


