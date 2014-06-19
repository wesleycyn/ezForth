/**************************************************
 *
 * __exit -- halts the system, non-debug version.
 *
 * Copyright 2006 IAR Systems. All rights reserved.
 *
 * $Revision: 20956 $
 *
 **************************************************/

                
        MODULE  ?__exit
        PUBLIC  __exit

        SECTION .text:CODE:NOROOT(2)

        THUMB
__exit
        LDR     r1,=0x20026
        MOVS    r0,#0x18
        BKPT    0xAB
        B       __exit

        LTORG
        
        END
