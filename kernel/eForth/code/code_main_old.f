\ Copyright (c) 2001 by Blueputer Technology Inc.
\ All rights reserved 
\
\ ARM7KERL.F   24OCT01 created by Wuja.
\
\ ARM7eForth low-level definitions.
\
\ (Translated from eForth 1.0 by Bill Muench and C. H. Ting, 1990)
\ 
\ V1.00,   24OTC01WUJA,  Translate low-level defintions from eForth 1.0.
\


                 
\ The ARM7EF kernel
fload  kernel/eForth/code/doLIT.f       \ Push an inline literal.


fload  kernel/eForth/code/doLIST                       \ Colon word run-time code   
  
                
fload  kernel/eForth/code/EXIT                          \ Terminate a colon definition.


fload  kernel/eForth/code/EXECUTE              \ Execute the word at ca.


\ CODE _next ( -- )                            \ Run time code for the single index loop.
\ FORWARD: NEXT1
\ FORWARD: NEXT2
\  [] WP, RP                     ,LDR        \ get current index
\  S, WP, WP,                    ,MOV        \ WP := WP
\  NE, NEXT1 #                   ,B          \ jump if index <> 0
\  RP, RP, $4 #                  ,ADD        \ RP := RP+4
\  IP, IP, $4 #                  ,ADD        \ IP := IP+4
\  NEXT2 #                       ,B          \ exit
\ LABEL: NEXT1
\  WP, WP, 1 #                   ,SUB        \ WP := WP -1
\  [] WP, RP                     ,STR        \ [RP] := WP
\  [] IP, IP                     ,LDR        \ IP := [IP]
\ LABEL: NEXT2
\  $NEXT
\ END-CODE

\ fload  kernel/eForth/code/QUESTION_BRANCH.f                     \ Branch if flag is zero.
\ CODE ?branch  ( f -- )                      \ Branch if flag is zero.
\ FORWARD: QUESTIONBRANCH1
\ FORWARD: QUESTIONBRANCH2
\   S, WP, TOS,                   ,MOV        \ get f
\  [] TOS, SP, 4 #               ,LDR        \ pop TOS
\  NE, QUESTIONBRANCH1 #         ,B          \ jump if f <> 0  
\  [] IP, IP                     ,LDR        \ IP := [IP]
\  QUESTIONBRANCH2 #             ,B          \ exit
\ LABEL: QUESTIONBRANCH1
\  IP, IP, $4  #                 ,ADD        \ IP := IP+4
\ LABEL: QUESTIONBRANCH2
\  $NEXT
\  END-CODE

fload  kernel/eForth/code/branch.f     \ Branch to an inline address.
fload  kernel/eForth/code/!.f            \ Pop the data stack to memory.
fload  kernel/eForth/code/@.f             \ Push memory location to the data stack.
fload  kernel/eForth/code/C!.f      \ Pop the data stack to byte memory.
fload  kernel/eForth/code/C@.f  \ Push byte memory location to the data stack.
fload  kernel/eForth/code/P!.f   \ Pop the data stack to io port.
fload  kernel/eForth/code/P@.f   \ Push io port to the data stack.
fload  kernel/eForth/code/RP@.f  \ Push the current RP to the data stack.
fload  kernel/eForth/code/RP!.f  \ Set the return stack pointer.
fload  kernel/eForth/code/R_GT.f \ Pop the return stack to the data stack.
fload  kernel/eForth/code/R@.f              \ Copy top of return stack to the data stack.
fload  kernel/eForth/code/GT_R.f                      \ Push the data stack to the return stack.
fload  kernel/eForth/code/SP@.f   \ Push the current data stack pointer.
fload  kernel/eForth/code/SP!.f                       \ Set the data stack pointer.


fload  kernel/eForth/code/DROP.f   \ Discard top stack item.
fload  kernel/eForth/code/DUP.f    \ Duplicate the top stack item.
fload  kernel/eForth/code/SWAP.f   \ Exchange top two stack items.
fload  kernel/eForth/code/OVER.f \ Copy second stack item to top.
 




fload  kernel/eForth/code/0_LT.f   \ Return true if n is negative.
\ fload  kernel/eForth/code/AND.f  
\ CODE AND ( w1 w2 -- w )                     \ Bitwise AND.
\  [] WP, SP, 4 #                ,LDR        \ WP = [SP], SP := SP+4
\  TOS, TOS, WP                  ,AND        \ TOS := TOS and WP
\  $NEXT
\ END-CODE


fload  kernel/eForth/code/OR.f 
fload  kernel/eForth/code/XOR.f
fload  kernel/eForth/code/UM+.f

 

