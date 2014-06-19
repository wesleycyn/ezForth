int hSon_GPIO_F

int hSon_GPIO_F.MODER 
int hSon_GPIO_F.OTYPER
int hSon_GPIO_F.OSPEED
int hSon_GPIO_F.PUPDR 
int hSon_GPIO_F.IDR   
int hSon_GPIO_F.ODR   
int hSon_GPIO_F.BSRR   
int hSon_GPIO_F.LCKR  
int hSon_GPIO_F.AFRL  
int hSon_GPIO_F.AFRH  


: Tree_GPIO_F 
  z" GPIO_F"        hPrev     hSon_GPIO     1  AddItem     hPrev to hSon_GPIO_F
  hex  temp$ 256 ERASE s" MODER:" temp$ place GPIO_F.MODER @ 0 <# # # # # # # # # #> temp$ +place   temp$ count drop  DECIMAL   hPrev     hSon_GPIO_F     1  AddItem      hPrev to hSon_GPIO_F.MODER  
      16 0 do
       temp$ 256 ERASE s" Bit" temp$ place i 0 <# # # #> temp$ +place   temp$ count drop  hPrev     
       hSon_GPIO_F.MODER      0  AddItem       
      loop   

  hex  temp$ 256 ERASE s" OTYPER:" temp$ place GPIO_F.OTYPER @ 0 <# # # # # # # # # #> temp$ +place   temp$ count drop  DECIMAL   hPrev     hSon_GPIO_F     1  AddItem      hPrev to hSon_GPIO_F.OTYPER 
      16 0 do
       temp$ 256 ERASE s" Bit" temp$ place i 0 <# # # #> temp$ +place   temp$ count drop  hPrev     
       hSon_GPIO_F.OTYPER      0  AddItem       
      loop   
                      
  hex  temp$ 256 ERASE s" OSPEED:" temp$ place GPIO_F.OSPEED @ 0 <# # # # # # # # # #> temp$ +place   temp$ count drop  DECIMAL   hPrev     hSon_GPIO_F     1  AddItem      hPrev to hSon_GPIO_F.OSPEED  
      16 0 do
       temp$ 256 ERASE s" Bit" temp$ place i 0 <# # # #> temp$ +place   temp$ count drop  hPrev     
       hSon_GPIO_F.OSPEED      0  AddItem       
      loop   
      
  hex  temp$ 256 ERASE s" PUPDR:" temp$ place GPIO_F.PUPDR @ 0 <# # # # # # # # # #> temp$ +place   temp$ count drop  DECIMAL   hPrev     hSon_GPIO_F     1  AddItem      hPrev to hSon_GPIO_F.PUPDR  
      16 0 do
       temp$ 256 ERASE s" Bit" temp$ place i 0 <# # # #> temp$ +place   temp$ count drop  hPrev     
       hSon_GPIO_F.PUPDR     0  AddItem       
      loop      
      
  hex  temp$ 256 ERASE s" IDR:" temp$ place GPIO_F.IDR @ 0 <# # # # # # # # # #> temp$ +place   temp$ count drop  DECIMAL   hPrev     hSon_GPIO_F     1  AddItem      hPrev to hSon_GPIO_F.IDR  
      16 0 do
       temp$ 256 ERASE s" Bit" temp$ place i 0 <# # # #> temp$ +place   temp$ count drop  hPrev     
       hSon_GPIO_F.IDR      0  AddItem       
      loop       


  hex  temp$ 256 ERASE s" ODR:" temp$ place GPIO_F.ODR @ 0 <# # # # # # # # # #> temp$ +place   temp$ count drop  DECIMAL   hPrev     hSon_GPIO_F     1  AddItem      hPrev to hSon_GPIO_F.ODR  
      16 0 do
       temp$ 256 ERASE s" Bit" temp$ place i 0 <# # # #> temp$ +place   temp$ count drop  hPrev     
       hSon_GPIO_F.ODR      0  AddItem       
      loop       

  hex  temp$ 256 ERASE s" BSRR:" temp$ place GPIO_F.BSRR @ 0 <# # # # # # # # # #> temp$ +place   temp$ count drop  DECIMAL   hPrev     hSon_GPIO_F     1  AddItem      hPrev to hSon_GPIO_F.BSRR
      16 0 do
       temp$ 256 ERASE s" Bit" temp$ place i 0 <# # # #> temp$ +place   temp$ count drop  hPrev     
       hSon_GPIO_F.BSRR      0  AddItem       
      loop       
      
  hex  temp$ 256 ERASE s" LCKR:" temp$ place GPIO_F.LCKR @ 0 <# # # # # # # # # #> temp$ +place   temp$ count drop  DECIMAL   hPrev     hSon_GPIO_F     1  AddItem      hPrev to hSon_GPIO_F.LCKR  
      16 0 do
       temp$ 256 ERASE s" Bit" temp$ place i 0 <# # # #> temp$ +place   temp$ count drop  hPrev     
       hSon_GPIO_F.LCKR      0  AddItem       
      loop       


  hex  temp$ 256 ERASE s" AFRL:" temp$ place GPIO_F.AFRL @ 0 <# # # # # # # # # #> temp$ +place   temp$ count drop  DECIMAL   hPrev     hSon_GPIO_F     1  AddItem      hPrev to hSon_GPIO_F.AFRL  
      16 0 do
       temp$ 256 ERASE s" Bit" temp$ place i 0 <# # # #> temp$ +place   temp$ count drop  hPrev     
       hSon_GPIO_F.AFRL      0  AddItem       
      loop       

  hex  temp$ 256 ERASE s" AFRH:" temp$ place GPIO_F.AFRH @ 0 <# # # # # # # # # #> temp$ +place   temp$ count drop  DECIMAL   hPrev     hSon_GPIO_F     1  AddItem      hPrev to hSon_GPIO_F.AFRH
      16 0 do
       temp$ 256 ERASE s" Bit" temp$ place i 0 <# # # #> temp$ +place   temp$ count drop  hPrev     
       hSon_GPIO_F.AFRH      0  AddItem       
      loop 
                   
      ;