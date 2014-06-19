int hSon_USART3

int hSon_USART3.SR  
int hSon_USART3.DR  
int hSon_USART3.BRR 
int hSon_USART3.CR1 
int hSon_USART3.CR2 
int hSon_USART3.CR3 
int hSon_USART3.GTPR 


  



: Tree_USART3 
  z" USART3"        hPrev     hSon_USART     1  AddItem     hPrev to hSon_USART3
  hex  temp$ 256 ERASE s" SR:" temp$ place USART3.SR @ 0 <# # # # # # # # # #> temp$ +place   temp$ count drop  DECIMAL   hPrev     hSon_USART3     1  AddItem      hPrev to hSon_USART3.SR  
      16 0 do
       temp$ 256 ERASE s" Bit" temp$ place i 0 <# # # #> temp$ +place   temp$ count drop  hPrev     
       hSon_USART3.SR      0  AddItem       
      loop   

  hex  temp$ 256 ERASE s" DR:" temp$ place USART3.DR @ 0 <# # # # # # # # # #> temp$ +place   temp$ count drop  DECIMAL   hPrev     hSon_USART3     1  AddItem      hPrev to hSon_USART3.DR  
      16 0 do
       temp$ 256 ERASE s" Bit" temp$ place i 0 <# # # #> temp$ +place   temp$ count drop  hPrev     
       hSon_USART3.DR      0  AddItem       
      loop   
                      
  hex  temp$ 256 ERASE s" BRR:" temp$ place USART3.BRR @ 0 <# # # # # # # # # #> temp$ +place   temp$ count drop  DECIMAL   hPrev     hSon_USART3     1  AddItem      hPrev to hSon_USART3.BRR  
      16 0 do
       temp$ 256 ERASE s" Bit" temp$ place i 0 <# # # #> temp$ +place   temp$ count drop  hPrev     
       hSon_USART3.BRR      0  AddItem       
      loop   
      
  hex  temp$ 256 ERASE s" CR1:" temp$ place USART3.CR1 @ 0 <# # # # # # # # # #> temp$ +place   temp$ count drop  DECIMAL   hPrev     hSon_USART3     1  AddItem      hPrev to hSon_USART3.CR1  
      16 0 do
       temp$ 256 ERASE s" Bit" temp$ place i 0 <# # # #> temp$ +place   temp$ count drop  hPrev     
       hSon_USART3.CR1     0  AddItem       
      loop      
      
  hex  temp$ 256 ERASE s" CR2:" temp$ place USART3.CR2 @ 0 <# # # # # # # # # #> temp$ +place   temp$ count drop  DECIMAL   hPrev     hSon_USART3     1  AddItem      hPrev to hSon_USART3.CR2  
      16 0 do
       temp$ 256 ERASE s" Bit" temp$ place i 0 <# # # #> temp$ +place   temp$ count drop  hPrev     
       hSon_USART3.CR2      0  AddItem       
      loop       


  hex  temp$ 256 ERASE s" CR3:" temp$ place USART3.CR3 @ 0 <# # # # # # # # # #> temp$ +place   temp$ count drop  DECIMAL   hPrev     hSon_USART3     1  AddItem      hPrev to hSon_USART3.CR3  
      16 0 do
       temp$ 256 ERASE s" Bit" temp$ place i 0 <# # # #> temp$ +place   temp$ count drop  hPrev     
       hSon_USART3.CR3      0  AddItem       
      loop       

  hex  temp$ 256 ERASE s" GTPR:" temp$ place USART3.GTPR @ 0 <# # # # # # # # # #> temp$ +place   temp$ count drop  DECIMAL   hPrev     hSon_USART3     1  AddItem      hPrev to hSon_USART3.GTPR
      16 0 do
       temp$ 256 ERASE s" Bit" temp$ place i 0 <# # # #> temp$ +place   temp$ count drop  hPrev     
       hSon_USART3.GTPR      0  AddItem       
      loop       
      

                   
      ;
