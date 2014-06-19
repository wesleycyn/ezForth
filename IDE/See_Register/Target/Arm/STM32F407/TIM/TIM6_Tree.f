int hSon_TIM6

int hSon_TIM6.CR1 
int hSon_TIM6.CR2
int hSon_TIM6.SMCR
int hSon_TIM6.DIER
int hSon_TIM6.SR 
int hSon_TIM6.EGR 
int hSon_TIM6.CCMR1 
int hSon_TIM6.CCMR2 
int hSon_TIM6.CCER
int hSon_TIM6.CNT
int hSon_TIM6.PSC 
int hSon_TIM6.ARR 
int hSon_TIM6.RCR 
int hSon_TIM6.CCR1 
int hSon_TIM6.CCR2 
int hSon_TIM6.CCR3 
int hSon_TIM6.CCR4 
int hSon_TIM6.DBTR 
int hSon_TIM6.DCR 
int hSon_TIM6.DMAR 

  



: Tree_TIM6 
  z" TIM6"        hPrev     hSon_TIM     1  AddItem     hPrev to hSon_TIM6
  hex  temp$ 256 ERASE s" CR1:" temp$ place TIM6.CR1 @ 0 <# # # # # # # # # #> temp$ +place   temp$ count drop  DECIMAL   hPrev     hSon_TIM6     1  AddItem      hPrev to hSon_TIM6.CR1  
      16 0 do
       temp$ 256 ERASE s" Bit" temp$ place i 0 <# # # #> temp$ +place   temp$ count drop  hPrev     
       hSon_TIM6.CR1      0  AddItem       
      loop   

  hex  temp$ 256 ERASE s" CR2:" temp$ place TIM6.CR2 @ 0 <# # # # # # # # # #> temp$ +place   temp$ count drop  DECIMAL   hPrev     hSon_TIM6     1  AddItem      hPrev to hSon_TIM6.CR2  
      16 0 do
       temp$ 256 ERASE s" Bit" temp$ place i 0 <# # # #> temp$ +place   temp$ count drop  hPrev     
       hSon_TIM6.CR2      0  AddItem       
      loop   
                      
  hex  temp$ 256 ERASE s" SMCR:" temp$ place TIM6.SMCR @ 0 <# # # # # # # # # #> temp$ +place   temp$ count drop  DECIMAL   hPrev     hSon_TIM6     1  AddItem      hPrev to hSon_TIM6.SMCR  
      16 0 do
       temp$ 256 ERASE s" Bit" temp$ place i 0 <# # # #> temp$ +place   temp$ count drop  hPrev     
       hSon_TIM6.SMCR      0  AddItem       
      loop   
      
  hex  temp$ 256 ERASE s" DIER:" temp$ place TIM6.DIER @ 0 <# # # # # # # # # #> temp$ +place   temp$ count drop  DECIMAL   hPrev     hSon_TIM6     1  AddItem      hPrev to hSon_TIM6.DIER  
      16 0 do
       temp$ 256 ERASE s" Bit" temp$ place i 0 <# # # #> temp$ +place   temp$ count drop  hPrev     
       hSon_TIM6.DIER      0  AddItem       
      loop      
      
  hex  temp$ 256 ERASE s" SR:" temp$ place TIM6.SR @ 0 <# # # # # # # # # #> temp$ +place   temp$ count drop  DECIMAL   hPrev     hSon_TIM6     1  AddItem      hPrev to hSon_TIM6.SR  
      16 0 do
       temp$ 256 ERASE s" Bit" temp$ place i 0 <# # # #> temp$ +place   temp$ count drop  hPrev     
       hSon_TIM6.DIER      0  AddItem       
      loop       


  hex  temp$ 256 ERASE s" EGR:" temp$ place TIM6.EGR @ 0 <# # # # # # # # # #> temp$ +place   temp$ count drop  DECIMAL   hPrev     hSon_TIM6     1  AddItem      hPrev to hSon_TIM6.EGR  
      16 0 do
       temp$ 256 ERASE s" Bit" temp$ place i 0 <# # # #> temp$ +place   temp$ count drop  hPrev     
       hSon_TIM6.EGR      0  AddItem       
      loop       

  hex  temp$ 256 ERASE s" CCMR1:" temp$ place TIM6.CCMR1 @ 0 <# # # # # # # # # #> temp$ +place   temp$ count drop  DECIMAL   hPrev     hSon_TIM6     1  AddItem      hPrev to hSon_TIM6.CCMR1
      16 0 do
       temp$ 256 ERASE s" Bit" temp$ place i 0 <# # # #> temp$ +place   temp$ count drop  hPrev     
       hSon_TIM6.CCMR1      0  AddItem       
      loop       
      

  hex  temp$ 256 ERASE s" CCMR2:" temp$ place TIM6.CCMR2 @ 0 <# # # # # # # # # #> temp$ +place   temp$ count drop  DECIMAL   hPrev     hSon_TIM6     1  AddItem      hPrev to hSon_TIM6.CCMR2
      16 0 do
       temp$ 256 ERASE s" Bit" temp$ place i 0 <# # # #> temp$ +place   temp$ count drop  hPrev     
       hSon_TIM6.CCMR2      0  AddItem       
      loop 

  hex  temp$ 256 ERASE s" CCER:" temp$ place TIM6.CCER @ 0 <# # # # # # # # # #> temp$ +place   temp$ count drop  DECIMAL   hPrev     hSon_TIM6     1  AddItem      hPrev to hSon_TIM6.CCER
      16 0 do
       temp$ 256 ERASE s" Bit" temp$ place i 0 <# # # #> temp$ +place   temp$ count drop  hPrev     
       hSon_TIM6.CCER      0  AddItem       
      loop 
      
  hex  temp$ 256 ERASE s" CNT:" temp$ place TIM6.CNT @ 0 <# # # # # # # # # #> temp$ +place   temp$ count drop  DECIMAL   hPrev     hSon_TIM6     1  AddItem      hPrev to hSon_TIM6.CNT
      16 0 do
       temp$ 256 ERASE s" Bit" temp$ place i 0 <# # # #> temp$ +place   temp$ count drop  hPrev     
       hSon_TIM6.CNT      0  AddItem       
      loop      
      
  hex  temp$ 256 ERASE s" PSC:" temp$ place TIM6.PSC @ 0 <# # # # # # # # # #> temp$ +place   temp$ count drop  DECIMAL   hPrev     hSon_TIM6     1  AddItem      hPrev to hSon_TIM6.PSC
      16 0 do
       temp$ 256 ERASE s" Bit" temp$ place i 0 <# # # #> temp$ +place   temp$ count drop  hPrev     
       hSon_TIM6.PSC      0  AddItem       
      loop      
      
  hex  temp$ 256 ERASE s" ARR:" temp$ place TIM6.ARR @ 0 <# # # # # # # # # #> temp$ +place   temp$ count drop  DECIMAL   hPrev     hSon_TIM6     1  AddItem      hPrev to hSon_TIM6.ARR
      16 0 do
       temp$ 256 ERASE s" Bit" temp$ place i 0 <# # # #> temp$ +place   temp$ count drop  hPrev     
       hSon_TIM6.ARR      0  AddItem       
      loop 
      
  hex  temp$ 256 ERASE s" RCR:" temp$ place TIM6.RCR @ 0 <# # # # # # # # # #> temp$ +place   temp$ count drop  DECIMAL   hPrev     hSon_TIM6     1  AddItem      hPrev to hSon_TIM6.RCR
      16 0 do
       temp$ 256 ERASE s" Bit" temp$ place i 0 <# # # #> temp$ +place   temp$ count drop  hPrev     
       hSon_TIM6.RCR      0  AddItem       
      loop       
      
  hex  temp$ 256 ERASE s" CCR1:" temp$ place TIM6.CCR1 @ 0 <# # # # # # # # # #> temp$ +place   temp$ count drop  DECIMAL   hPrev     hSon_TIM6     1  AddItem      hPrev to hSon_TIM6.CCR1
      16 0 do
       temp$ 256 ERASE s" Bit" temp$ place i 0 <# # # #> temp$ +place   temp$ count drop  hPrev     
       hSon_TIM6.CCR1      0  AddItem       
      loop        
      
  hex  temp$ 256 ERASE s" CCR2:" temp$ place TIM6.CCR2 @ 0 <# # # # # # # # # #> temp$ +place   temp$ count drop  DECIMAL   hPrev     hSon_TIM6     1  AddItem      hPrev to hSon_TIM6.CCR2
      16 0 do
       temp$ 256 ERASE s" Bit" temp$ place i 0 <# # # #> temp$ +place   temp$ count drop  hPrev     
       hSon_TIM6.CCR2      0  AddItem       
      loop
      
  hex  temp$ 256 ERASE s" CCR3:" temp$ place TIM6.CCR3 @ 0 <# # # # # # # # # #> temp$ +place   temp$ count drop  DECIMAL   hPrev     hSon_TIM6     1  AddItem      hPrev to hSon_TIM6.CCR3
      16 0 do
       temp$ 256 ERASE s" Bit" temp$ place i 0 <# # # #> temp$ +place   temp$ count drop  hPrev     
       hSon_TIM6.CCR3      0  AddItem       
      loop
      
  hex  temp$ 256 ERASE s" CCR4:" temp$ place TIM6.CCR4 @ 0 <# # # # # # # # # #> temp$ +place   temp$ count drop  DECIMAL   hPrev     hSon_TIM6     1  AddItem      hPrev to hSon_TIM6.CCR4
      16 0 do
       temp$ 256 ERASE s" Bit" temp$ place i 0 <# # # #> temp$ +place   temp$ count drop  hPrev     
       hSon_TIM6.CCR4      0  AddItem       
      loop                              
      
           
  hex  temp$ 256 ERASE s" DBTR:" temp$ place TIM6.DBTR @ 0 <# # # # # # # # # #> temp$ +place   temp$ count drop  DECIMAL   hPrev     hSon_TIM6     1  AddItem      hPrev to hSon_TIM6.DBTR
      16 0 do
       temp$ 256 ERASE s" Bit" temp$ place i 0 <# # # #> temp$ +place   temp$ count drop  hPrev     
       hSon_TIM6.DBTR      0  AddItem       
      loop                              

  hex  temp$ 256 ERASE s" DCR:" temp$ place TIM6.DCR @ 0 <# # # # # # # # # #> temp$ +place   temp$ count drop  DECIMAL   hPrev     hSon_TIM6     1  AddItem      hPrev to hSon_TIM6.DCR
      16 0 do
       temp$ 256 ERASE s" Bit" temp$ place i 0 <# # # #> temp$ +place   temp$ count drop  hPrev     
       hSon_TIM6.DCR      0  AddItem       
      loop                              


  hex  temp$ 256 ERASE s" DMAR:" temp$ place TIM6.DMAR @ 0 <# # # # # # # # # #> temp$ +place   temp$ count drop  DECIMAL   hPrev     hSon_TIM6     1  AddItem      hPrev to hSon_TIM6.DMAR
      16 0 do
       temp$ 256 ERASE s" Bit" temp$ place i 0 <# # # #> temp$ +place   temp$ count drop  hPrev     
       hSon_TIM6.DMAR      0  AddItem       
      loop                              
      ;             


