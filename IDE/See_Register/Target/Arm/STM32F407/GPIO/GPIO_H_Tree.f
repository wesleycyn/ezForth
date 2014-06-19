int hSon_GPIO_H

int hSon_GPIO_H.MODER 
int hSon_GPIO_H.OTYPER
int hSon_GPIO_H.OSPEED
int hSon_GPIO_H.PUPDR 
int hSon_GPIO_H.IDR   
int hSon_GPIO_H.ODR   
int hSon_GPIO_H.BSRR   
int hSon_GPIO_H.LCKR  
int hSon_GPIO_H.AFRL  
int hSon_GPIO_H.AFRH  


: Tree_GPIO_H 
  z" GPIO_H"        hPrev     hSon_GPIO     1  AddItem     hPrev to hSon_GPIO_H
  hex  temp$ 256 ERASE s" MODER:" temp$ place GPIO_H.MODER @ 0 <# # # # # # # # # #> temp$ +place   temp$ count drop  DECIMAL   hPrev     hSon_GPIO_H     1  AddItem      hPrev to hSon_GPIO_H.MODER  
      16 0 do
       temp$ 256 ERASE s" Bit" temp$ place i 0 <# # # #> temp$ +place   temp$ count drop  hPrev     
       hSon_GPIO_H.MODER      0  AddItem       
      loop   

  hex  temp$ 256 ERASE s" OTYPER:" temp$ place GPIO_H.OTYPER @ 0 <# # # # # # # # # #> temp$ +place   temp$ count drop  DECIMAL   hPrev     hSon_GPIO_H     1  AddItem      hPrev to hSon_GPIO_H.OTYPER 
      16 0 do
       temp$ 256 ERASE s" Bit" temp$ place i 0 <# # # #> temp$ +place   temp$ count drop  hPrev     
       hSon_GPIO_H.OTYPER      0  AddItem       
      loop   
                      
  hex  temp$ 256 ERASE s" OSPEED:" temp$ place GPIO_H.OSPEED @ 0 <# # # # # # # # # #> temp$ +place   temp$ count drop  DECIMAL   hPrev     hSon_GPIO_H     1  AddItem      hPrev to hSon_GPIO_H.OSPEED  
      16 0 do
       temp$ 256 ERASE s" Bit" temp$ place i 0 <# # # #> temp$ +place   temp$ count drop  hPrev     
       hSon_GPIO_H.OSPEED      0  AddItem       
      loop   
      
  hex  temp$ 256 ERASE s" PUPDR:" temp$ place GPIO_H.PUPDR @ 0 <# # # # # # # # # #> temp$ +place   temp$ count drop  DECIMAL   hPrev     hSon_GPIO_H     1  AddItem      hPrev to hSon_GPIO_H.PUPDR  
      16 0 do
       temp$ 256 ERASE s" Bit" temp$ place i 0 <# # # #> temp$ +place   temp$ count drop  hPrev     
       hSon_GPIO_H.PUPDR     0  AddItem       
      loop      
      
  hex  temp$ 256 ERASE s" IDR:" temp$ place GPIO_H.IDR @ 0 <# # # # # # # # # #> temp$ +place   temp$ count drop  DECIMAL   hPrev     hSon_GPIO_H     1  AddItem      hPrev to hSon_GPIO_H.IDR  
      16 0 do
       temp$ 256 ERASE s" Bit" temp$ place i 0 <# # # #> temp$ +place   temp$ count drop  hPrev     
       hSon_GPIO_H.IDR      0  AddItem       
      loop       


  hex  temp$ 256 ERASE s" ODR:" temp$ place GPIO_H.ODR @ 0 <# # # # # # # # # #> temp$ +place   temp$ count drop  DECIMAL   hPrev     hSon_GPIO_H     1  AddItem      hPrev to hSon_GPIO_H.ODR  
      16 0 do
       temp$ 256 ERASE s" Bit" temp$ place i 0 <# # # #> temp$ +place   temp$ count drop  hPrev     
       hSon_GPIO_H.ODR      0  AddItem       
      loop       

  hex  temp$ 256 ERASE s" BSRR:" temp$ place GPIO_H.BSRR @ 0 <# # # # # # # # # #> temp$ +place   temp$ count drop  DECIMAL   hPrev     hSon_GPIO_H     1  AddItem      hPrev to hSon_GPIO_H.BSRR
      16 0 do
       temp$ 256 ERASE s" Bit" temp$ place i 0 <# # # #> temp$ +place   temp$ count drop  hPrev     
       hSon_GPIO_H.BSRR      0  AddItem       
      loop       
      
  hex  temp$ 256 ERASE s" LCKR:" temp$ place GPIO_H.LCKR @ 0 <# # # # # # # # # #> temp$ +place   temp$ count drop  DECIMAL   hPrev     hSon_GPIO_H     1  AddItem      hPrev to hSon_GPIO_H.LCKR  
      16 0 do
       temp$ 256 ERASE s" Bit" temp$ place i 0 <# # # #> temp$ +place   temp$ count drop  hPrev     
       hSon_GPIO_H.LCKR      0  AddItem       
      loop       


  hex  temp$ 256 ERASE s" AFRL:" temp$ place GPIO_H.AFRL @ 0 <# # # # # # # # # #> temp$ +place   temp$ count drop  DECIMAL   hPrev     hSon_GPIO_H     1  AddItem      hPrev to hSon_GPIO_H.AFRL  
      16 0 do
       temp$ 256 ERASE s" Bit" temp$ place i 0 <# # # #> temp$ +place   temp$ count drop  hPrev     
       hSon_GPIO_H.AFRL      0  AddItem       
      loop       

  hex  temp$ 256 ERASE s" AFRH:" temp$ place GPIO_H.AFRH @ 0 <# # # # # # # # # #> temp$ +place   temp$ count drop  DECIMAL   hPrev     hSon_GPIO_H     1  AddItem      hPrev to hSon_GPIO_H.AFRH
      16 0 do
       temp$ 256 ERASE s" Bit" temp$ place i 0 <# # # #> temp$ +place   temp$ count drop  hPrev     
       hSon_GPIO_H.AFRH      0  AddItem       
      loop 
                   
      ;