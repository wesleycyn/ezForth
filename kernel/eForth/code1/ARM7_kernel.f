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

CODE doLIT  ( -- w )                        \ Push an inline literal.
  STR   TOS, [SP], #4       ;\ push TOS
  LDR   TOS, [IP], #4       ;\ TOS := [IP], IP := IP+4
  NEXT
END-CODE

CODE doLIST  ( -- )         ;\ Colon word run-time code   
?  [-P!] IP, RP, 4 #             ,STR        \ push IP
    STR IP, [RP], #4        ;\ push IP
  MOV   IP, LP              ;\ IP := LP
  NEXT
END-CODE  
                
CODE EXIT    ( -- )         ;\ Terminate a colon definition.
  LDR   IP, [RP], #4        ;\ pop IP
  NEXT
END-CODE

CODE EXECUTE ( ca -- )      ;\ Execute the word at ca.
  MOV   WP, TOS,            ;\ get next CFA
  LDR   TOS, [SP], #4       ;\ pop TOS
  BX    WP                  ;\ jump to next CFA

CODE _next ( -- )                            \ Run time code for the single index loop.
FORWARD: NEXT1
FORWARD: NEXT2
  [] WP, RP                     ,LDR        \ get current index
  S, WP, WP,                    ,MOV        \ WP := WP
  NE, NEXT1 #                   ,B          \ jump if index <> 0
  RP, RP, $4 #                  ,ADD        \ RP := RP+4
  IP, IP, $4 #                  ,ADD        \ IP := IP+4
  NEXT2 #                       ,B          \ exit
LABEL: NEXT1
  WP, WP, 1 #                   ,SUB        \ WP := WP -1
  [] WP, RP                     ,STR        \ [RP] := WP
  [] IP, IP                     ,LDR        \ IP := [IP]
LABEL: NEXT2
  NEXT
END-CODE

CODE ?branch  ( f -- )                      \ Branch if flag is zero.
FORWARD: QUESTIONBRANCH1
FORWARD: QUESTIONBRANCH2
  MOVS  WP, TOS             ;\ get f
  LDR   TOS, [SP], #4       ;\ pop TOS
  BNE   #QUESTIONBRANCH1    ;\ jump if f <> 0  
  LDR   IP, [IP]            ;\ IP := [IP]
  B     #QUESTIONBRANCH2    ;\ exit
LABEL: QUESTIONBRANCH1
  ADD   IP, IP, #4          ;\ IP := IP+4
LABEL: QUESTIONBRANCH2
  NEXT
  END-CODE

CODE branch  ( -- )         ;\ Branch to an inline address.
  LDR   IP,[IP]             ;\ IP := [IP]
  NEXT
END-CODE

CODE ! ( w a -- )           ;\ Pop the data stack to memory.
  LDR   WP, [SP], #4        ;\ get w, SP := SP+4
  STR   WP, [TOS]           ;\ a := w
  LDR   TOS,[SP],#4         ;\ pop TOS
  NEXT
END-CODE  

CODE @ ( a -- w )           ;\ Push memory location to the data stack.
  LDR   TOS,[TOS]           ;\ TOS := [TOS]
  NEXT
END-CODE

CODE C! ( c b -- )          ;\ Pop the data stack to byte memory.
  LDR   WP, [SP], #4        ;\ get c, SP := SP+4
  STRB  WP,[TOS]            ;\ b := c
  LDR   TOS,[SP],#4         ;\ pop TOS
  NEXT
END-CODE

CODE C@ ( b -- c )          ;\ Push byte memory location to the data stack.
  LDRB  TOS, [TOS]          ;\ TOS := byte [TOS]
  NEXT
END-CODE

CODE P! ( w p -- )          ;\ Pop the data stack to io port.
  LDR   WP, [SP],# 4        ;\ get w, SP := SP+4
  STR   WP, [TOS]           ;\ p := w
  LDR   TOS, [SP], #4       ;\ pop TOS
  NEXT
END-CODE  
 
CODE P@ ( p -- w )          ;\ Push io port to the data stack.
  LDR TOS,[TOS]             ;\ TOS := [TOS]
  NEXT
END-CODE

CODE RP@ ( -- a )           ;\ Push the current RP to the data stack.
?  [-P!] TOS, SP, 4 #            ,STR        \ push TOS
  STR   TOS, [SP], #4       ;\ push TOS  
  MOV   TOS, RP             ;\ TOS := RP
  NEXT
END-CODE  

CODE RP! ( a -- )           ;\ Set the return stack pointer.
  MOV   RP, TOS             ;\ RP := TOS
  LDR   TOS, [SP], #4       ;\ pop TOS
  NEXT
END-CODE

CODE R> ( -- w )                            \ Pop the return stack to the data stack.
?  [-P!] TOS, SP, 4 #            ,STR        \ push TOS
  STR   TOS, [SP], #4       ;\ push TOS
  LDR   TOS, [RP], #4       ;\ pop TOS from RS
  NEXT
END-CODE

CODE R@ ;( -- w )           ;\ Copy top of return stack to the data stack.
  STR   TOS,[SP],#4         ;\ push TOS
  LDR   TOS,[RP]            ;\ TOS := [RP]
  NEXT
END-CODE  

CODE >R ;( w -- )           ;\ Push the data stack to the return stack.
?  [-P!] TOS, RP, 4 #            ,STR        \ push TOS to RS
    STR TOS,[RP],#4         ;\ push TOS to RS
    LDR TOS,[SP],#4         ;\ pop TOS
  NEXT  
END-CODE

CODE SP@ ;( -- a )          ;\ Push the current data stack pointer.
?  [-P!] TOS, SP, 4 #            ,STR        \ push TOS
  STR   TOS, [SP], #4       ;\ push TOS
  MOV   TOS, SP             ;\ TOS := SP
  NEXT
END-CODE  

CODE SP! ;( a -- )          ;\ Set the data stack pointer.
  MOV   SP, TOS             ;\ SP := TOS
  LDR   TOS,[SP],#4         ;\ pop TOS
  NEXT
END-CODE

CODE DROP ;( w -- )          ;\ Discard top stack item.
?  [] TOS, SP, 4 #               ,LDR        \ pop TOS
    LDR TOS, SP, #4         ;\ pop TOS
  NEXT
END-CODE

CODE DUP ;( w -- w w )                       ;\ Duplicate the top stack item.
?  [-P!] TOS, SP, 4 #            ,STR        \ push TOS
  STR   TOS, [SP], #4 
  NEXT
END-CODE  

CODE SWAP ;( w1 w2 -- w2 w1 )   ;\ Exchange top two stack items.
  LDR   WP, [SP]            ;\ WP := [SP]
  STR   TOS, [SP]           ;\ [SP] := TOS
  MOV   TOS, WP             ;\ TOS := WP
  NEXT
END-CODE

CODE OVER ;( w1 w2 -- w1 w2 w1 )             ;\ Copy second stack item to top.
?  [-P!] TOS, SP, 4 #            ,STR        \ push TOS
?  [P] TOS, SP, 4 #              ,LDR        \ TOS := [SP+4] 

  STR   TOS,[SP],#4         ;\ push TOS
  LDR   TOS,[SP],#4         ;\ TOS := [SP+4]
  NEXT
END-CODE  

CODE 0< ;( n -- t )         ;\ Return true if n is negative.
  MOV   WP, #0              ;\ WP := 0
  ADD   TOS, WP, TOS,ASR#20 ;\ TOS := 0 + (0|-1)
  NEXT
END-CODE

CODE AND ;( w1 w2 -- w )    ;\ Bitwise AND.
  LDR   WP, [SP], #4        ;\ WP = [SP], SP := SP+4
  AND   TOS, TOS, WP        ;\ TOS := TOS and WP
  NEXT
END-CODE  
  
CODE OR ;( w w -- w )        ;\ Bitwise inclusive OR.
  LDR   WP, [SP],#4         ;\ WP = [SP], SP := SP+4
  ORR   TOS, TOS, WP        ;\ TOS := TOS or WP
  NEXT
END-CODE  

CODE XOR ;( w w -- w )      ;\ Bitwise exclusive OR.
  LDR   WP,[SP],#4          ;\ WP = [SP], SP := SP+4
  eor   TOS,TOS,WP          ;\ TOS := TOS xor WP
  NEXT
END-CODE  

CODE UM+ ;( w1 w2 -- w cy ) ;\ Add two numbers, return the sum and carry flag.
  LDR   WP,[SP]             ;\ WP = [SP]
  ADDS  WP,WP,TOS           ;\ WP := WP ADD TOS
  MOV   TOS,#0              ;\ TOS := 0
  ADC   TOS,TOS,#0          ;\ TOS := TOS+Carry
  STR   WP,[SP]             ;\ [SP] := WP
  NEXT 
END-CODE  

CODE UM/MOD ( udl udh u -- ur uq )          \ Unsigned divide of a double by a single. Return mod and quotient.
  YP, 1 #                       ,MOV        \ YP := 1  
  [] WP, SP, 4 #                ,LDR        \ WP := [SP](udh) , SP := SP+4
  [] XP, SP                     ,LDR        \ XP := [SP](udl)  
  
  S, XP, XP, XP                 ,ADD        \ XP := XP*2
  S, WP, WP, WP                 ,ADC        \ WP := WP*2+C
  CC, PC, PC, 8 #               ,ADD        \ jump to normal sub  
  WP, WP, TOS                   ,SUB        \ WP := WP-TOS (if carry)
  XP, XP, 1 #                   ,ADD        \ XP := XP+1
  PC, PC, C #                   ,ADD        \ jump to check
  S, WP, WP, TOS                ,SUB        \ WP := WP-TOS
  CS, XP, XP, 1 #               ,ADD        \ XP := XP+1   
  CS, PC, PC, 0 #               ,ADD        \ jump to check 
  WP, WP, TOS                   ,ADD        \ restore WP 
  S, YP, YP, YP                 ,ADD        \ YP := YP*2
  CC, PC, PC, 34 #              ,SUB        \ go back loop
  
  TOS, XP                       ,MOV        \ TOS := XP
  [] WP, SP                     ,STR        \ [SP] := WP
  $NEXT
END-CODE 

 