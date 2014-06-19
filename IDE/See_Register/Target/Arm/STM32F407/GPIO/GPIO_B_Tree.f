int hSon_GPIO_B

int hSon_GPIO_B.MODER 
int hSon_GPIO_B.OTYPER
int hSon_GPIO_B.OSPEED
int hSon_GPIO_B.PUPDR 
int hSon_GPIO_B.IDR   
int hSon_GPIO_B.ODR   
int hSon_GPIO_B.BSRR   
int hSon_GPIO_B.LCKR  
int hSon_GPIO_B.AFRL  
int hSon_GPIO_B.AFRH  


: Tree_GPIO_B 
  z" GPIO_B"        hPrev     hSon_GPIO     1  AddItem     hPrev to hSon_GPIO_B
  hex  temp$ 256 ERASE s" MODER:" temp$ place GPIO_B.MODER @ 0 <# # # # # # # # # #> temp$ +place   temp$ count drop  DECIMAL   hPrev     hSon_GPIO_B     1  AddItem      hPrev to hSon_GPIO_B.MODER  
      16 0 do
       temp$ 256 ERASE s" Bit" temp$ place i 0 <# # # #> temp$ +place   temp$ count drop  hPrev     
       hSon_GPIO_B.MODER      0  AddItem       
      loop   

  hex  temp$ 256 ERASE s" OTYPER:" temp$ place GPIO_B.OTYPER @ 0 <# # # # # # # # # #> temp$ +place   temp$ count drop  DECIMAL   hPrev     hSon_GPIO_B     1  AddItem      hPrev to hSon_GPIO_B.OTYPER 
      16 0 do
       temp$ 256 ERASE s" Bit" temp$ place i 0 <# # # #> temp$ +place   temp$ count drop  hPrev     
       hSon_GPIO_B.OTYPER      0  AddItem       
      loop   
                      
  hex  temp$ 256 ERASE s" OSPEED:" temp$ place GPIO_B.OSPEED @ 0 <# # # # # # # # # #> temp$ +place   temp$ count drop  DECIMAL   hPrev     hSon_GPIO_B     1  AddItem      hPrev to hSon_GPIO_B.OSPEED  
      16 0 do
       temp$ 256 ERASE s" Bit" temp$ place i 0 <# # # #> temp$ +place   temp$ count drop  hPrev     
       hSon_GPIO_B.OSPEED      0  AddItem       
      loop   
      
  hex  temp$ 256 ERASE s" PUPDR:" temp$ place GPIO_B.PUPDR @ 0 <# # # # # # # # # #> temp$ +place   temp$ count drop  DECIMAL   hPrev     hSon_GPIO_B     1  AddItem      hPrev to hSon_GPIO_B.PUPDR  
      16 0 do
       temp$ 256 ERASE s" Bit" temp$ place i 0 <# # # #> temp$ +place   temp$ count drop  hPrev     
       hSon_GPIO_B.PUPDR     0  AddItem       
      loop      
      
  hex  temp$ 256 ERASE s" IDR:" temp$ place GPIO_B.IDR @ 0 <# # # # # # # # # #> temp$ +place   temp$ count drop  DECIMAL   hPrev     hSon_GPIO_B     1  AddItem      hPrev to hSon_GPIO_B.IDR  
      16 0 do
       temp$ 256 ERASE s" Bit" temp$ place i 0 <# # # #> temp$ +place   temp$ count drop  hPrev     
       hSon_GPIO_B.IDR      0  AddItem       
      loop       


  hex  temp$ 256 ERASE s" ODR:" temp$ place GPIO_B.ODR @ 0 <# # # # # # # # # #> temp$ +place   temp$ count drop  DECIMAL   hPrev     hSon_GPIO_B     1  AddItem      hPrev to hSon_GPIO_B.ODR  
      16 0 do
       temp$ 256 ERASE s" Bit" temp$ place i 0 <# # # #> temp$ +place   temp$ count drop  hPrev     
       hSon_GPIO_B.ODR      0  AddItem       
      loop       

  hex  temp$ 256 ERASE s" BSRR:" temp$ place GPIO_B.BSRR @ 0 <# # # # # # # # # #> temp$ +place   temp$ count drop  DECIMAL   hPrev     hSon_GPIO_B     1  AddItem      hPrev to hSon_GPIO_B.BSRR
      16 0 do
       temp$ 256 ERASE s" Bit" temp$ place i 0 <# # # #> temp$ +place   temp$ count drop  hPrev     
       hSon_GPIO_B.BSRR      0  AddItem       
      loop       
      
  hex  temp$ 256 ERASE s" LCKR:" temp$ place GPIO_B.LCKR @ 0 <# # # # # # # # # #> temp$ +place   temp$ count drop  DECIMAL   hPrev     hSon_GPIO_B     1  AddItem      hPrev to hSon_GPIO_B.LCKR  
      16 0 do
       temp$ 256 ERASE s" Bit" temp$ place i 0 <# # # #> temp$ +place   temp$ count drop  hPrev     
       hSon_GPIO_B.LCKR      0  AddItem       
      loop       


  hex  temp$ 256 ERASE s" AFRL:" temp$ place GPIO_B.AFRL @ 0 <# # # # # # # # # #> temp$ +place   temp$ count drop  DECIMAL   hPrev     hSon_GPIO_B     1  AddItem      hPrev to hSon_GPIO_B.AFRL  
      16 0 do
       temp$ 256 ERASE s" Bit" temp$ place i 0 <# # # #> temp$ +place   temp$ count drop  hPrev     
       hSon_GPIO_B.AFRL      0  AddItem       
      loop       

  hex  temp$ 256 ERASE s" AFRH:" temp$ place GPIO_B.AFRH @ 0 <# # # # # # # # # #> temp$ +place   temp$ count drop  DECIMAL   hPrev     hSon_GPIO_B     1  AddItem      hPrev to hSon_GPIO_B.AFRH
      16 0 do
       temp$ 256 ERASE s" Bit" temp$ place i 0 <# # # #> temp$ +place   temp$ count drop  hPrev     
       hSon_GPIO_B.AFRH      0  AddItem       
      loop 
                   
      ;