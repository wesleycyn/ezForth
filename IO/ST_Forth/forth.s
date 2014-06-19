;******************** (C) COPYRIGHT 2008 STMicroelectronics ********************
;* File Name          : cortexm3_macro.s
;* Author             : MCD Application Team
;* Version            : V2.0.3
;* Date               : 09/22/2008
;* Description        : Instruction wrappers for special Cortex-M3 instructions.
;*                      to be used with EWARM5.x toolchain.
;*******************************************************************************
; THE PRESENT FIRMWARE WHICH IS FOR GUIDANCE ONLY AIMS AT PROVIDING CUSTOMERS
; WITH CODING INFORMATION REGARDING THEIR PRODUCTS IN ORDER FOR THEM TO SAVE TIME.
; AS A RESULT, STMICROELECTRONICS SHALL NOT BE HELD LIABLE FOR ANY DIRECT,
; INDIRECT OR CONSEQUENTIAL DAMAGES WITH RESPECT TO ANY CLAIMS ARISING FROM THE
; CONTENT OF SUCH FIRMWARE AND/OR THE USE MADE BY CUSTOMERS OF THE CODING
; INFORMATION CONTAINED HEREIN IN CONNECTION WITH THEIR PRODUCTS.
;*******************************************************************************
;\ The ARM7EF kernel
;CODE doLIT  ( -- w )                        \ Push an inline literal.
;CODE doLIST  ( -- )                         \ Colon word run-time code                   
;CODE EXIT    ( -- )                         \ Terminate a colon definition.
;CODE EXECUTE ( ca -- )                      \ Execute the word at ca.
;CODE ?branch  ( f -- )                      \ Branch if flag is zero.
;CODE branch  ( -- )                         \ Branch to an inline address.
;CODE ! ( w a -- )                           \ Pop the data stack to memory.
;CODE @ ( a -- w )                           \ Push memory location to the data stack.
;CODE C! ( c b -- )                          \ Pop the data stack to byte memory.
;CODE C@ ( b -- c )                          \ Push byte memory location to the data stack.
;CODE P! ( w p -- )                          \ Pop the data stack to io port.  
;CODE P@ ( p -- w )                          \ Push io port to the data stack.
;CODE RP@ ( -- a )                           \ Push the current RP to the data stack.
;CODE RP! ( a -- )                           \ Set the return stack pointer.
;CODE R> ( -- w )                            \ Pop the return stack to the data stack.
;CODE R@ ( -- w )                            \ Copy top of return stack to the data stack. 
;CODE >R ( w -- )                            \ Push the data stack to the return stack.
;CODE SP@ ( -- a )                           \ Push the current data stack pointer.  
;CODE SP! ( a -- )                           \ Set the data stack pointer.
;CODE DROP ( w -- )                          \ Discard top stack item.
;CODE DUP ( w -- w w )                       \ Duplicate the top stack item.
;CODE SWAP ( w1 w2 -- w2 w1 )                \ Exchange top two stack items.
;CODE OVER ( w1 w2 -- w1 w2 w1 )             \ Copy second stack item to top. 
;CODE 0< ( n -- t )                          \ Return true if n is negative.
;CODE AND ( w1 w2 -- w )                     \ Bitwise AND.   
;CODE OR ( w w -- w )                        \ Bitwise inclusive OR.
;CODE XOR ( w w -- w )                       \ Bitwise exclusive OR. 
;CODE UM+ ( w1 w2 -- w cy )                  \ Add two numbers, return the sum and carry flag.
;
;
; next
;   bx LR
;
; nest MACRO
;      
;   MEND    
;
; unnest MACRO
;
;   MEND
;
; ATPCS
    
  SECTION .text:CODE(2)




f_XOR
    
    BX r14

;*******************************************************************************
; Function Name  : __REV_Word
; Description    : Reverses the byte order in Word(32-bit) input variable.
; Input          : - r0 : specifies the input variable
; Return         : - r0 : holds tve variable value after byte reversing.
;*******************************************************************************
__REV_Word 
 
  REV r0, r0
  BX r14
  
  END
  
;******************* (C) COPYRIGHT 2008 STMicroelectronics *****END OF FILE*****
