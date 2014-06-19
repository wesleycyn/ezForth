int hSon_USART1

int hSon_USART1.SR  
int hSon_USART1.DR  
int hSon_USART1.BRR 
int hSon_USART1.CR1 
int hSon_USART1.CR2 
int hSon_USART1.CR3 
int hSon_USART1.GTPR 


  



: Tree_USART1 
  z" USART1"        hPrev     hSon_USART     1  AddItem     hPrev to hSon_USART1
  hex  temp$ 256 ERASE s" SR:" temp$ place USART1.SR @ 0 <# # # # # # # # # #> temp$ +place   temp$ count drop  DECIMAL   hPrev     hSon_USART1     1  AddItem      hPrev to hSon_USART1.SR  
      16 0 do
       temp$ 256 ERASE s" Bit" temp$ place i 0 <# # # #> temp$ +place   temp$ count drop  hPrev     
       hSon_USART1.SR      0  AddItem       
      loop   

  hex  temp$ 256 ERASE s" DR:" temp$ place USART1.DR @ 0 <# # # # # # # # # #> temp$ +place   temp$ count drop  DECIMAL   hPrev     hSon_USART1     1  AddItem      hPrev to hSon_USART1.DR  
      16 0 do
       temp$ 256 ERASE s" Bit" temp$ place i 0 <# # # #> temp$ +place   temp$ count drop  hPrev     
       hSon_USART1.DR      0  AddItem       
      loop   
                      
  hex  temp$ 256 ERASE s" BRR:" temp$ place USART1.BRR @ 0 <# # # # # # # # # #> temp$ +place   temp$ count drop  DECIMAL   hPrev     hSon_USART1     1  AddItem      hPrev to hSon_USART1.BRR  
      16 0 do
       temp$ 256 ERASE s" Bit" temp$ place i 0 <# # # #> temp$ +place   temp$ count drop  hPrev     
       hSon_USART1.BRR      0  AddItem       
      loop   
      
  hex  temp$ 256 ERASE s" CR1:" temp$ place USART1.CR1 @ 0 <# # # # # # # # # #> temp$ +place   temp$ count drop  DECIMAL   hPrev     hSon_USART1     1  AddItem      hPrev to hSon_USART1.CR1  
      16 0 do
       temp$ 256 ERASE s" Bit" temp$ place i 0 <# # # #> temp$ +place   temp$ count drop  hPrev     
       hSon_USART1.CR1     0  AddItem       
      loop      
      
  hex  temp$ 256 ERASE s" CR2:" temp$ place USART1.CR2 @ 0 <# # # # # # # # # #> temp$ +place   temp$ count drop  DECIMAL   hPrev     hSon_USART1     1  AddItem      hPrev to hSon_USART1.CR2  
      16 0 do
       temp$ 256 ERASE s" Bit" temp$ place i 0 <# # # #> temp$ +place   temp$ count drop  hPrev     
       hSon_USART1.CR2      0  AddItem       
      loop       


  hex  temp$ 256 ERASE s" CR3:" temp$ place USART1.CR3 @ 0 <# # # # # # # # # #> temp$ +place   temp$ count drop  DECIMAL   hPrev     hSon_USART1     1  AddItem      hPrev to hSon_USART1.CR3  
      16 0 do
       temp$ 256 ERASE s" Bit" temp$ place i 0 <# # # #> temp$ +place   temp$ count drop  hPrev     
       hSon_USART1.CR3      0  AddItem       
      loop       

  hex  temp$ 256 ERASE s" GTPR:" temp$ place USART1.GTPR @ 0 <# # # # # # # # # #> temp$ +place   temp$ count drop  DECIMAL   hPrev     hSon_USART1     1  AddItem      hPrev to hSon_USART1.GTPR
      16 0 do
       temp$ 256 ERASE s" Bit" temp$ place i 0 <# # # #> temp$ +place   temp$ count drop  hPrev     
       hSon_USART1.GTPR      0  AddItem       
      loop       
      

                   
      ;
