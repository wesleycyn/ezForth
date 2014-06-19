int hSon_GPIO_G

int hSon_GPIO_G.MODER 
int hSon_GPIO_G.OTYPER
int hSon_GPIO_G.OSPEED
int hSon_GPIO_G.PUPDR 
int hSon_GPIO_G.IDR   
int hSon_GPIO_G.ODR   
int hSon_GPIO_G.BSRR   
int hSon_GPIO_G.LCKR  
int hSon_GPIO_G.AFRL  
int hSon_GPIO_G.AFRH  


: Tree_GPIO_G 
  z" GPIO_G"        hPrev     hSon_GPIO     1  AddItem     hPrev to hSon_GPIO_G
  hex  temp$ 256 ERASE s" MODER:" temp$ place GPIO_G.MODER @ 0 <# # # # # # # # # #> temp$ +place   temp$ count drop  DECIMAL   hPrev     hSon_GPIO_G     1  AddItem      hPrev to hSon_GPIO_G.MODER  
      16 0 do
       temp$ 256 ERASE s" Bit" temp$ place i 0 <# # # #> temp$ +place   temp$ count drop  hPrev     
       hSon_GPIO_G.MODER      0  AddItem       
      loop   

  hex  temp$ 256 ERASE s" OTYPER:" temp$ place GPIO_G.OTYPER @ 0 <# # # # # # # # # #> temp$ +place   temp$ count drop  DECIMAL   hPrev     hSon_GPIO_G     1  AddItem      hPrev to hSon_GPIO_G.OTYPER 
      16 0 do
       temp$ 256 ERASE s" Bit" temp$ place i 0 <# # # #> temp$ +place   temp$ count drop  hPrev     
       hSon_GPIO_G.OTYPER      0  AddItem       
      loop   
                      
  hex  temp$ 256 ERASE s" OSPEED:" temp$ place GPIO_G.OSPEED @ 0 <# # # # # # # # # #> temp$ +place   temp$ count drop  DECIMAL   hPrev     hSon_GPIO_G     1  AddItem      hPrev to hSon_GPIO_G.OSPEED  
      16 0 do
       temp$ 256 ERASE s" Bit" temp$ place i 0 <# # # #> temp$ +place   temp$ count drop  hPrev     
       hSon_GPIO_G.OSPEED      0  AddItem       
      loop   
      
  hex  temp$ 256 ERASE s" PUPDR:" temp$ place GPIO_G.PUPDR @ 0 <# # # # # # # # # #> temp$ +place   temp$ count drop  DECIMAL   hPrev     hSon_GPIO_G     1  AddItem      hPrev to hSon_GPIO_G.PUPDR  
      16 0 do
       temp$ 256 ERASE s" Bit" temp$ place i 0 <# # # #> temp$ +place   temp$ count drop  hPrev     
       hSon_GPIO_G.PUPDR     0  AddItem       
      loop      
      
  hex  temp$ 256 ERASE s" IDR:" temp$ place GPIO_G.IDR @ 0 <# # # # # # # # # #> temp$ +place   temp$ count drop  DECIMAL   hPrev     hSon_GPIO_G     1  AddItem      hPrev to hSon_GPIO_G.IDR  
      16 0 do
       temp$ 256 ERASE s" Bit" temp$ place i 0 <# # # #> temp$ +place   temp$ count drop  hPrev     
       hSon_GPIO_G.IDR      0  AddItem       
      loop       


  hex  temp$ 256 ERASE s" ODR:" temp$ place GPIO_G.ODR @ 0 <# # # # # # # # # #> temp$ +place   temp$ count drop  DECIMAL   hPrev     hSon_GPIO_G     1  AddItem      hPrev to hSon_GPIO_G.ODR  
      16 0 do
       temp$ 256 ERASE s" Bit" temp$ place i 0 <# # # #> temp$ +place   temp$ count drop  hPrev     
       hSon_GPIO_G.ODR      0  AddItem       
      loop       

  hex  temp$ 256 ERASE s" BSRR:" temp$ place GPIO_G.BSRR @ 0 <# # # # # # # # # #> temp$ +place   temp$ count drop  DECIMAL   hPrev     hSon_GPIO_G     1  AddItem      hPrev to hSon_GPIO_G.BSRR
      16 0 do
       temp$ 256 ERASE s" Bit" temp$ place i 0 <# # # #> temp$ +place   temp$ count drop  hPrev     
       hSon_GPIO_G.BSRR      0  AddItem       
      loop       
      
  hex  temp$ 256 ERASE s" LCKR:" temp$ place GPIO_G.LCKR @ 0 <# # # # # # # # # #> temp$ +place   temp$ count drop  DECIMAL   hPrev     hSon_GPIO_G     1  AddItem      hPrev to hSon_GPIO_G.LCKR  
      16 0 do
       temp$ 256 ERASE s" Bit" temp$ place i 0 <# # # #> temp$ +place   temp$ count drop  hPrev     
       hSon_GPIO_G.LCKR      0  AddItem       
      loop       


  hex  temp$ 256 ERASE s" AFRL:" temp$ place GPIO_G.AFRL @ 0 <# # # # # # # # # #> temp$ +place   temp$ count drop  DECIMAL   hPrev     hSon_GPIO_G     1  AddItem      hPrev to hSon_GPIO_G.AFRL  
      16 0 do
       temp$ 256 ERASE s" Bit" temp$ place i 0 <# # # #> temp$ +place   temp$ count drop  hPrev     
       hSon_GPIO_G.AFRL      0  AddItem       
      loop       

  hex  temp$ 256 ERASE s" AFRH:" temp$ place GPIO_G.AFRH @ 0 <# # # # # # # # # #> temp$ +place   temp$ count drop  DECIMAL   hPrev     hSon_GPIO_G     1  AddItem      hPrev to hSon_GPIO_G.AFRH
      16 0 do
       temp$ 256 ERASE s" Bit" temp$ place i 0 <# # # #> temp$ +place   temp$ count drop  hPrev     
       hSon_GPIO_G.AFRH      0  AddItem       
      loop 
                   
      ;