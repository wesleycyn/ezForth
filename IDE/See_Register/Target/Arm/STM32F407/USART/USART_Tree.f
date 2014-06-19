int hSon_USART

fload Target\Arm\STM32F407\USART\USART1_Tree.f
fload Target\Arm\STM32F407\USART\USART2_Tree.f
fload Target\Arm\STM32F407\USART\USART3_Tree.f
fload Target\Arm\STM32F407\USART\USART4_Tree.f

: USART
\ USART 
   z" USART"        hPrev     hRoot     1  AddItem     hPrev to hSon_USART
    Tree_USART1
    Tree_USART2
    Tree_USART3
    Tree_USART4
       ;