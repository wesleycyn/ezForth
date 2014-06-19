int hSon_GPIO_D

int hSon_GPIO_D.MODER 
int hSon_GPIO_D.OTYPER
int hSon_GPIO_D.OSPEED
int hSon_GPIO_D.PUPDR 
int hSon_GPIO_D.IDR   
int hSon_GPIO_D.ODR   
int hSon_GPIO_D.BSRR   
int hSon_GPIO_D.LCKR  
int hSon_GPIO_D.AFRL  
int hSon_GPIO_D.AFRH  


: Tree_GPIO_D 
  z" GPIO_D"        hPrev     hSon_GPIO     1  AddItem     hPrev to hSon_GPIO_D
  hex  temp$ 256 ERASE s" MODER:" temp$ place GPIO_D.MODER @ 0 <# # # # # # # # # #> temp$ +place   temp$ count drop  DECIMAL   hPrev     hSon_GPIO_D     1  AddItem      hPrev to hSon_GPIO_D.MODER  
      16 0 do
       temp$ 256 ERASE s" Bit" temp$ place i 0 <# # # #> temp$ +place   temp$ count drop  hPrev     
       hSon_GPIO_D.MODER      0  AddItem       
      loop   

  hex  temp$ 256 ERASE s" OTYPER:" temp$ place GPIO_D.OTYPER @ 0 <# # # # # # # # # #> temp$ +place   temp$ count drop  DECIMAL   hPrev     hSon_GPIO_D     1  AddItem      hPrev to hSon_GPIO_D.OTYPER 
      16 0 do
       temp$ 256 ERASE s" Bit" temp$ place i 0 <# # # #> temp$ +place   temp$ count drop  hPrev     
       hSon_GPIO_D.OTYPER      0  AddItem       
      loop   
                      
  hex  temp$ 256 ERASE s" OSPEED:" temp$ place GPIO_D.OSPEED @ 0 <# # # # # # # # # #> temp$ +place   temp$ count drop  DECIMAL   hPrev     hSon_GPIO_D     1  AddItem      hPrev to hSon_GPIO_D.OSPEED  
      16 0 do
       temp$ 256 ERASE s" Bit" temp$ place i 0 <# # # #> temp$ +place   temp$ count drop  hPrev     
       hSon_GPIO_D.OSPEED      0  AddItem       
      loop   
      
  hex  temp$ 256 ERASE s" PUPDR:" temp$ place GPIO_D.PUPDR @ 0 <# # # # # # # # # #> temp$ +place   temp$ count drop  DECIMAL   hPrev     hSon_GPIO_D     1  AddItem      hPrev to hSon_GPIO_D.PUPDR  
      16 0 do
       temp$ 256 ERASE s" Bit" temp$ place i 0 <# # # #> temp$ +place   temp$ count drop  hPrev     
       hSon_GPIO_D.PUPDR     0  AddItem       
      loop      
      
  hex  temp$ 256 ERASE s" IDR:" temp$ place GPIO_D.IDR @ 0 <# # # # # # # # # #> temp$ +place   temp$ count drop  DECIMAL   hPrev     hSon_GPIO_D     1  AddItem      hPrev to hSon_GPIO_D.IDR  
      16 0 do
       temp$ 256 ERASE s" Bit" temp$ place i 0 <# # # #> temp$ +place   temp$ count drop  hPrev     
       hSon_GPIO_D.IDR      0  AddItem       
      loop       


  hex  temp$ 256 ERASE s" ODR:" temp$ place GPIO_D.ODR @ 0 <# # # # # # # # # #> temp$ +place   temp$ count drop  DECIMAL   hPrev     hSon_GPIO_D     1  AddItem      hPrev to hSon_GPIO_D.ODR  
      16 0 do
       temp$ 256 ERASE s" Bit" temp$ place i 0 <# # # #> temp$ +place   temp$ count drop  hPrev     
       hSon_GPIO_D.ODR      0  AddItem       
      loop       

  hex  temp$ 256 ERASE s" BSRR:" temp$ place GPIO_D.BSRR @ 0 <# # # # # # # # # #> temp$ +place   temp$ count drop  DECIMAL   hPrev     hSon_GPIO_D     1  AddItem      hPrev to hSon_GPIO_D.BSRR
      16 0 do
       temp$ 256 ERASE s" Bit" temp$ place i 0 <# # # #> temp$ +place   temp$ count drop  hPrev     
       hSon_GPIO_D.BSRR      0  AddItem       
      loop       
      
  hex  temp$ 256 ERASE s" LCKR:" temp$ place GPIO_D.LCKR @ 0 <# # # # # # # # # #> temp$ +place   temp$ count drop  DECIMAL   hPrev     hSon_GPIO_D     1  AddItem      hPrev to hSon_GPIO_D.LCKR  
      16 0 do
       temp$ 256 ERASE s" Bit" temp$ place i 0 <# # # #> temp$ +place   temp$ count drop  hPrev     
       hSon_GPIO_D.LCKR      0  AddItem       
      loop       


  hex  temp$ 256 ERASE s" AFRL:" temp$ place GPIO_D.AFRL @ 0 <# # # # # # # # # #> temp$ +place   temp$ count drop  DECIMAL   hPrev     hSon_GPIO_D     1  AddItem      hPrev to hSon_GPIO_D.AFRL  
      16 0 do
       temp$ 256 ERASE s" Bit" temp$ place i 0 <# # # #> temp$ +place   temp$ count drop  hPrev     
       hSon_GPIO_D.AFRL      0  AddItem       
      loop       

  hex  temp$ 256 ERASE s" AFRH:" temp$ place GPIO_D.AFRH @ 0 <# # # # # # # # # #> temp$ +place   temp$ count drop  DECIMAL   hPrev     hSon_GPIO_D     1  AddItem      hPrev to hSon_GPIO_D.AFRH
      16 0 do
       temp$ 256 ERASE s" Bit" temp$ place i 0 <# # # #> temp$ +place   temp$ count drop  hPrev     
       hSon_GPIO_D.AFRH      0  AddItem       
      loop 
                   
      ;