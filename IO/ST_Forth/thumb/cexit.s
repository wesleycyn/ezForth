/**************************************************
 *
 * Code for handling system exit, thumb 2 version.
 *
 * Copyright 2006 IAR Systems. All rights reserved.
 *
 * $Revision: 22586 $
 *
 **************************************************/

;-----------------------------------------------------------------------------
; This file contains the exit code used by the ICCARM C compiler.
;
; The modules in this file are included in the libraries, and may be replaced
; by any user-defined modules that define the PUBLIC symbols ?cstartup etc.
;
; All code in the modules will be placed in the ICODE segment,
;
; Cortex-M version
;
; $Revision: 22586 $
;
;-----------------------------------------------------------------------------

;
; Naming covention of labels in this file:
;
;  ?xxx   - External labels only accessed from assembler.
;  __xxx  - External labels accessed from or defined in C.
;  xxx    - Labels local to one module (note: this file contains
;           several modules).
;  main   - The starting point of the user program.
;



;---------------------------------------------------------------
; ?_EXIT
; main may return an exit code in R0, or _exit may be called with
; the exit code in R0.
; If the exit code is needed for som reason, R0 should be stored
; in e.g. one of the registers R4-R7, so that the value is
; preserved when calling __call_dtors and _Close_all.
;---------------------------------------------------------------

        MODULE  ?cexit

        PUBLIC  _exit

        SECTION .text:CODE:NOROOT(2)
        REQUIRE ?jump_to_exit

        THUMB
_exit:
        MOV     R7,R0   
        ;; Fall through to the next fragment



; ----------------------------------------
; The standard library REQUIRE:s the label __cstart_call_dtors, if
; needed.
;
        
        PUBLIC  __cstart_call_dtors
        EXTERN  __call_dtors

        SECTION .text:CODE:NOROOT(1)        
        THUMB
        
__cstart_call_dtors:
        BL      __call_dtors
        
        ;; Fall through.


; ----------------------------------------
; The standard library REQUIRE:s the label __cstart_closeall, if
; needed.
;

        PUBLIC  __cstart_closeall
        EXTERN  _Close_all

        SECTION .text:CODE:NOROOT(1)

        THUMB
__cstart_closeall:
        BL      _Close_all
        
        ;; Fall through.


        EXTERN  __exit

        SECTION .text:CODE:NOROOT(1)

        THUMB           
?jump_to_exit:
        MOV     R0,R7
        BL      __exit
        B       ?jump_to_exit

        END
