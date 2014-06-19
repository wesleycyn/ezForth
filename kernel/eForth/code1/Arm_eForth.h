

;( Registers of ARM7 eForth VM ) 
#define IP R0 
#define SP R1
#define RP R2
#define UP R3
#define WP R4 
#define TOS R5
#define XP R6
#define YP R7
#define LP R14 
#define PC R15 


;CODE
Forth_CODE   MACRO 
       ENDM 
         
         
;END-CODE
Forth_EndCODE MACRO 
       ENDM          
         
; NEXT
        
NEXT   MACRO 
       MOV    pc, lr
       ENDM  
         
         
         
;CODE _next ( -- )                            \ Run time code for the single index loop.
;FORWARD: NEXT1
;FORWARD: NEXT2
;  [] WP, RP                     ,LDR        \ get current index
;  S, WP, WP,                    ,MOV        \ WP := WP
;  NE, NEXT1 #                   ,B          \ jump if index <> 0
;  RP, RP, $4 #                  ,ADD        \ RP := RP+4
;  IP, IP, $4 #                  ,ADD        \ IP := IP+4
;  NEXT2 #                       ,B          \ exit
;LABEL: NEXT1
;  WP, WP, 1 #                   ,SUB        \ WP := WP -1
;  [] WP, RP                     ,STR        \ [RP] := WP
;  [] IP, IP                     ,LDR        \ IP := [IP]
L;ABEL: NEXT2
;  NEXT
;END-CODE         