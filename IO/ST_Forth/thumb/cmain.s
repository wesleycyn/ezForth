/**************************************************
 *
 * Part two of the system initialization code, contains C-level
 * initialization, thumb-2 only variant.
 *
 * Copyright 2006 IAR Systems. All rights reserved.
 *
 * $Revision: 21694 $
 *
 **************************************************/


; --------------------------------------------------
; Module ?cmain, C-level initialization.
;

        SECTION .text:CODE:NOROOT(2)

        PUBLIC  __iar_program_start
        EXTERN  __vector_table
        EXTERN  __iar_data_init2
        EXTERN  __low_level_init
        EXTERN  __call_ctors
        EXTERN  main
        EXTERN  exit

        THUMB
__iar_program_start

; Initialize segments.
; __segment_init and __low_level_init are assumed to use the same
; instruction set and to be reachable by BL from the ICODE segment
; (it is safest to link them in segment ICODE).

        bl      __low_level_init     
        cmp     r0,#0
        beq     l1
        bl      __iar_data_init2

l1:
        REQUIRE l2

; Call the constructors of all global objects. This code will only
; be used if any EC++ modules defines global objects that need to
; have its constructor called before main.

        SECTION .text:CODE:NOROOT(2)    
        PUBLIC  __iar_cstart_call_ctors

        THUMB

__iar_cstart_call_ctors:

        ;; ILink guarantees that PREINIT_ARRAY and INIT_ARRAY are
        ;; grouped together.
        LDR.N   r0, pibase
        LDR.N   r1, ilimit
        BL      __call_ctors

        
        SECTION .text:CODE:NOROOT(2)    

        PUBLIC  _main
        THUMB
        
__iar_init$$done:               ; Copy initialization is done

        ;; Place this here, so that the interrupt vector is not marked as
        ;; needed for initialization
        REQUIRE __vector_table

l2:
        MOVS    r0,#0   ;  No parameters
        BL      main
_main:
        BL      exit

; ----------------------------------------
; Explicitly encoded constant table.
;
; This should be placed in a section with the same name as the code above
; to ensure the code can reach the entries.
;
; If we would use the "=" notation the constant table would be placed
; after the constructor initalization section, making it impossible to
; fall through to the next section.
;

        SECTION .text:CODE:NOROOT(2)

        DATA

        EXTERN  SHT$$PREINIT_ARRAY$$Base
pibase  DC32    SHT$$PREINIT_ARRAY$$Base

        EXTERN  SHT$$INIT_ARRAY$$Limit
ilimit  DC32    SHT$$INIT_ARRAY$$Limit

        END

