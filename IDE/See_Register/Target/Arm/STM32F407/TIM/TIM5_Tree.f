int hSon_TIM5

int hSon_TIM5.CR1 
int hSon_TIM5.CR2
int hSon_TIM5.SMCR
int hSon_TIM5.DIER
int hSon_TIM5.SR 
int hSon_TIM5.EGR 
int hSon_TIM5.CCMR1 
int hSon_TIM5.CCMR2 
int hSon_TIM5.CCER
int hSon_TIM5.CNT
int hSon_TIM5.PSC 
int hSon_TIM5.ARR 
int hSon_TIM5.RCR 
int hSon_TIM5.CCR1 
int hSon_TIM5.CCR2 
int hSon_TIM5.CCR3 
int hSon_TIM5.CCR4 
int hSon_TIM5.DBTR 
int hSon_TIM5.DCR 
int hSon_TIM5.DMAR 

  



: Tree_TIM5 
  z" TIM5"        hPrev     hSon_TIM     1  AddItem     hPrev to hSon_TIM5
  hex  temp$ 256 ERASE s" CR1:" temp$ place TIM5.CR1 @ 0 <# # # # # # # # # #> temp$ +place   temp$ count drop  DECIMAL   hPrev     hSon_TIM5     1  AddItem      hPrev to hSon_TIM5.CR1  
      16 0 do
       temp$ 256 ERASE s" Bit" temp$ place i 0 <# # # #> temp$ +place   temp$ count drop  hPrev     
       hSon_TIM5.CR1      0  AddItem       
      loop   

  hex  temp$ 256 ERASE s" CR2:" temp$ place TIM5.CR2 @ 0 <# # # # # # # # # #> temp$ +place   temp$ count drop  DECIMAL   hPrev     hSon_TIM5     1  AddItem      hPrev to hSon_TIM5.CR2  
      16 0 do
       temp$ 256 ERASE s" Bit" temp$ place i 0 <# # # #> temp$ +place   temp$ count drop  hPrev     
       hSon_TIM5.CR2      0  AddItem       
      loop   
                      
  hex  temp$ 256 ERASE s" SMCR:" temp$ place TIM5.SMCR @ 0 <# # # # # # # # # #> temp$ +place   temp$ count drop  DECIMAL   hPrev     hSon_TIM5     1  AddItem      hPrev to hSon_TIM5.SMCR  
      16 0 do
       temp$ 256 ERASE s" Bit" temp$ place i 0 <# # # #> temp$ +place   temp$ count drop  hPrev     
       hSon_TIM5.SMCR      0  AddItem       
      loop   
      
  hex  temp$ 256 ERASE s" DIER:" temp$ place TIM5.DIER @ 0 <# # # # # # # # # #> temp$ +place   temp$ count drop  DECIMAL   hPrev     hSon_TIM5     1  AddItem      hPrev to hSon_TIM5.DIER  
      16 0 do
       temp$ 256 ERASE s" Bit" temp$ place i 0 <# # # #> temp$ +place   temp$ count drop  hPrev     
       hSon_TIM5.DIER      0  AddItem       
      loop      
      
  hex  temp$ 256 ERASE s" SR:" temp$ place TIM5.SR @ 0 <# # # # # # # # # #> temp$ +place   temp$ count drop  DECIMAL   hPrev     hSon_TIM5     1  AddItem      hPrev to hSon_TIM5.SR  
      16 0 do
       temp$ 256 ERASE s" Bit" temp$ place i 0 <# # # #> temp$ +place   temp$ count drop  hPrev     
       hSon_TIM5.DIER      0  AddItem       
      loop       


  hex  temp$ 256 ERASE s" EGR:" temp$ place TIM5.EGR @ 0 <# # # # # # # # # #> temp$ +place   temp$ count drop  DECIMAL   hPrev     hSon_TIM5     1  AddItem      hPrev to hSon_TIM5.EGR  
      16 0 do
       temp$ 256 ERASE s" Bit" temp$ place i 0 <# # # #> temp$ +place   temp$ count drop  hPrev     
       hSon_TIM5.EGR      0  AddItem       
      loop       

  hex  temp$ 256 ERASE s" CCMR1:" temp$ place TIM5.CCMR1 @ 0 <# # # # # # # # # #> temp$ +place   temp$ count drop  DECIMAL   hPrev     hSon_TIM5     1  AddItem      hPrev to hSon_TIM5.CCMR1
      16 0 do
       temp$ 256 ERASE s" Bit" temp$ place i 0 <# # # #> temp$ +place   temp$ count drop  hPrev     
       hSon_TIM5.CCMR1      0  AddItem       
      loop       
      

  hex  temp$ 256 ERASE s" CCMR2:" temp$ place TIM5.CCMR2 @ 0 <# # # # # # # # # #> temp$ +place   temp$ count drop  DECIMAL   hPrev     hSon_TIM5     1  AddItem      hPrev to hSon_TIM5.CCMR2
      16 0 do
       temp$ 256 ERASE s" Bit" temp$ place i 0 <# # # #> temp$ +place   temp$ count drop  hPrev     
       hSon_TIM5.CCMR2      0  AddItem       
      loop 

  hex  temp$ 256 ERASE s" CCER:" temp$ place TIM5.CCER @ 0 <# # # # # # # # # #> temp$ +place   temp$ count drop  DECIMAL   hPrev     hSon_TIM5     1  AddItem      hPrev to hSon_TIM5.CCER
      16 0 do
       temp$ 256 ERASE s" Bit" temp$ place i 0 <# # # #> temp$ +place   temp$ count drop  hPrev     
       hSon_TIM5.CCER      0  AddItem       
      loop 
      
  hex  temp$ 256 ERASE s" CNT:" temp$ place TIM5.CNT @ 0 <# # # # # # # # # #> temp$ +place   temp$ count drop  DECIMAL   hPrev     hSon_TIM5     1  AddItem      hPrev to hSon_TIM5.CNT
      16 0 do
       temp$ 256 ERASE s" Bit" temp$ place i 0 <# # # #> temp$ +place   temp$ count drop  hPrev     
       hSon_TIM5.CNT      0  AddItem       
      loop      
      
  hex  temp$ 256 ERASE s" PSC:" temp$ place TIM5.PSC @ 0 <# # # # # # # # # #> temp$ +place   temp$ count drop  DECIMAL   hPrev     hSon_TIM5     1  AddItem      hPrev to hSon_TIM5.PSC
      16 0 do
       temp$ 256 ERASE s" Bit" temp$ place i 0 <# # # #> temp$ +place   temp$ count drop  hPrev     
       hSon_TIM5.PSC      0  AddItem       
      loop      
      
  hex  temp$ 256 ERASE s" ARR:" temp$ place TIM5.ARR @ 0 <# # # # # # # # # #> temp$ +place   temp$ count drop  DECIMAL   hPrev     hSon_TIM5     1  AddItem      hPrev to hSon_TIM5.ARR
      16 0 do
       temp$ 256 ERASE s" Bit" temp$ place i 0 <# # # #> temp$ +place   temp$ count drop  hPrev     
       hSon_TIM5.ARR      0  AddItem       
      loop 
      
  hex  temp$ 256 ERASE s" RCR:" temp$ place TIM5.RCR @ 0 <# # # # # # # # # #> temp$ +place   temp$ count drop  DECIMAL   hPrev     hSon_TIM5     1  AddItem      hPrev to hSon_TIM5.RCR
      16 0 do
       temp$ 256 ERASE s" Bit" temp$ place i 0 <# # # #> temp$ +place   temp$ count drop  hPrev     
       hSon_TIM5.RCR      0  AddItem       
      loop       
      
  hex  temp$ 256 ERASE s" CCR1:" temp$ place TIM5.CCR1 @ 0 <# # # # # # # # # #> temp$ +place   temp$ count drop  DECIMAL   hPrev     hSon_TIM5     1  AddItem      hPrev to hSon_TIM5.CCR1
      16 0 do
       temp$ 256 ERASE s" Bit" temp$ place i 0 <# # # #> temp$ +place   temp$ count drop  hPrev     
       hSon_TIM5.CCR1      0  AddItem       
      loop        
      
  hex  temp$ 256 ERASE s" CCR2:" temp$ place TIM5.CCR2 @ 0 <# # # # # # # # # #> temp$ +place   temp$ count drop  DECIMAL   hPrev     hSon_TIM5     1  AddItem      hPrev to hSon_TIM5.CCR2
      16 0 do
       temp$ 256 ERASE s" Bit" temp$ place i 0 <# # # #> temp$ +place   temp$ count drop  hPrev     
       hSon_TIM5.CCR2      0  AddItem       
      loop
      
  hex  temp$ 256 ERASE s" CCR3:" temp$ place TIM5.CCR3 @ 0 <# # # # # # # # # #> temp$ +place   temp$ count drop  DECIMAL   hPrev     hSon_TIM5     1  AddItem      hPrev to hSon_TIM5.CCR3
      16 0 do
       temp$ 256 ERASE s" Bit" temp$ place i 0 <# # # #> temp$ +place   temp$ count drop  hPrev     
       hSon_TIM5.CCR3      0  AddItem       
      loop
      
  hex  temp$ 256 ERASE s" CCR4:" temp$ place TIM5.CCR4 @ 0 <# # # # # # # # # #> temp$ +place   temp$ count drop  DECIMAL   hPrev     hSon_TIM5     1  AddItem      hPrev to hSon_TIM5.CCR4
      16 0 do
       temp$ 256 ERASE s" Bit" temp$ place i 0 <# # # #> temp$ +place   temp$ count drop  hPrev     
       hSon_TIM5.CCR4      0  AddItem       
      loop                              
      
           
  hex  temp$ 256 ERASE s" DBTR:" temp$ place TIM5.DBTR @ 0 <# # # # # # # # # #> temp$ +place   temp$ count drop  DECIMAL   hPrev     hSon_TIM5     1  AddItem      hPrev to hSon_TIM5.DBTR
      16 0 do
       temp$ 256 ERASE s" Bit" temp$ place i 0 <# # # #> temp$ +place   temp$ count drop  hPrev     
       hSon_TIM5.DBTR      0  AddItem       
      loop                              

  hex  temp$ 256 ERASE s" DCR:" temp$ place TIM5.DCR @ 0 <# # # # # # # # # #> temp$ +place   temp$ count drop  DECIMAL   hPrev     hSon_TIM5     1  AddItem      hPrev to hSon_TIM5.DCR
      16 0 do
       temp$ 256 ERASE s" Bit" temp$ place i 0 <# # # #> temp$ +place   temp$ count drop  hPrev     
       hSon_TIM5.DCR      0  AddItem       
      loop                              


  hex  temp$ 256 ERASE s" DMAR:" temp$ place TIM5.DMAR @ 0 <# # # # # # # # # #> temp$ +place   temp$ count drop  DECIMAL   hPrev     hSon_TIM5     1  AddItem      hPrev to hSon_TIM5.DMAR
      16 0 do
       temp$ 256 ERASE s" Bit" temp$ place i 0 <# # # #> temp$ +place   temp$ count drop  hPrev     
       hSon_TIM5.DMAR      0  AddItem       
      loop                              
      ;             


