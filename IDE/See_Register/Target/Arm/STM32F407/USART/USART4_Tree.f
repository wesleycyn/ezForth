int hSon_USART4

int hSon_USART4.SR  
int hSon_USART4.DR  
int hSon_USART4.BRR 
int hSon_USART4.CR1 
int hSon_USART4.CR2 
int hSon_USART4.CR3 
int hSon_USART4.GTPR 


  



: Tree_USART4 
  z" USART4"        hPrev     hSon_USART     1  AddItem     hPrev to hSon_USART4
  hex  temp$ 256 ERASE s" SR:" temp$ place USART4.SR @ 0 <# # # # # # # # # #> temp$ +place   temp$ count drop  DECIMAL   hPrev     hSon_USART4     1  AddItem      hPrev to hSon_USART4.SR  
      16 0 do
       temp$ 256 ERASE s" Bit" temp$ place i 0 <# # # #> temp$ +place   temp$ count drop  hPrev     
       hSon_USART4.SR      0  AddItem       
      loop   

  hex  temp$ 256 ERASE s" DR:" temp$ place USART4.DR @ 0 <# # # # # # # # # #> temp$ +place   temp$ count drop  DECIMAL   hPrev     hSon_USART4     1  AddItem      hPrev to hSon_USART4.DR  
      16 0 do
       temp$ 256 ERASE s" Bit" temp$ place i 0 <# # # #> temp$ +place   temp$ count drop  hPrev     
       hSon_USART4.DR      0  AddItem       
      loop   
                      
  hex  temp$ 256 ERASE s" BRR:" temp$ place USART4.BRR @ 0 <# # # # # # # # # #> temp$ +place   temp$ count drop  DECIMAL   hPrev     hSon_USART4     1  AddItem      hPrev to hSon_USART4.BRR  
      16 0 do
       temp$ 256 ERASE s" Bit" temp$ place i 0 <# # # #> temp$ +place   temp$ count drop  hPrev     
       hSon_USART4.BRR      0  AddItem       
      loop   
      
  hex  temp$ 256 ERASE s" CR1:" temp$ place USART4.CR1 @ 0 <# # # # # # # # # #> temp$ +place   temp$ count drop  DECIMAL   hPrev     hSon_USART4     1  AddItem      hPrev to hSon_USART4.CR1  
      16 0 do
       temp$ 256 ERASE s" Bit" temp$ place i 0 <# # # #> temp$ +place   temp$ count drop  hPrev     
       hSon_USART4.CR1     0  AddItem       
      loop      
      
  hex  temp$ 256 ERASE s" CR2:" temp$ place USART4.CR2 @ 0 <# # # # # # # # # #> temp$ +place   temp$ count drop  DECIMAL   hPrev     hSon_USART4     1  AddItem      hPrev to hSon_USART4.CR2  
      16 0 do
       temp$ 256 ERASE s" Bit" temp$ place i 0 <# # # #> temp$ +place   temp$ count drop  hPrev     
       hSon_USART4.CR2      0  AddItem       
      loop       


  hex  temp$ 256 ERASE s" CR3:" temp$ place USART4.CR3 @ 0 <# # # # # # # # # #> temp$ +place   temp$ count drop  DECIMAL   hPrev     hSon_USART4     1  AddItem      hPrev to hSon_USART4.CR3  
      16 0 do
       temp$ 256 ERASE s" Bit" temp$ place i 0 <# # # #> temp$ +place   temp$ count drop  hPrev     
       hSon_USART4.CR3      0  AddItem       
      loop       

  hex  temp$ 256 ERASE s" GTPR:" temp$ place USART4.GTPR @ 0 <# # # # # # # # # #> temp$ +place   temp$ count drop  DECIMAL   hPrev     hSon_USART4     1  AddItem      hPrev to hSon_USART4.GTPR
      16 0 do
       temp$ 256 ERASE s" Bit" temp$ place i 0 <# # # #> temp$ +place   temp$ count drop  hPrev     
       hSon_USART4.GTPR      0  AddItem       
      loop       
      

                   
      ;
