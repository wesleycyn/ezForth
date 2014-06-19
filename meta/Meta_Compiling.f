\
\ ARM7META.F   23OCT01 created by Wuja.
\
\ ARM7eForth MetaCompiler.
\
\ (Adapted from WIN32FOR V4.2 MetaCompiler)
\ 
\ V1.00,   23OTC01WUJA,  Adapted from WIN32FOR V4.2 MetaCompiler.
\

\                 ARM7(EP7211) Memory Allocation
\ ---------------------------------------------------------------------------
\ 
\ 
\             RAM_NAME  +------------------------+  MININ+$8000
\                       |                        |
\                       |       Name Area        |
\                       |                        |
\                       |------------------------|
\                       |       Free Space       |
\                       |------------------------|
\                       |                        |
\                       |       Code Area        |
\                       |                        |
\             RAM_CODE  +------------------------+  RPP+$100
\                       |       Reserved         |
\                  RPP  +------------------------+  SPP+$1700
\                       |     Return Stack       |
\                       |      (~512 bytes)      |  
\                       +------------------------+  
\                       |  Terminal Input Buffer |
\                       |     (4096 Bytes)       |
\                  TIB  +------------------------+  SPP+$10
\                       |       Reserved         |  
\                  SPP  +------------------------+  UPP+$500
\                       |      Data Stack        |  
\                       |      (512 bytes)       |
\                       +------------------------+  UPP+$300
\                       |   User Variable Area   |
\                       |      (512 bytes)       |
\                  UPP  +------------------------+  MININT+$100
\                       |       Reserved         |
\                       +------------------------+  MININT+$2
\                       |    Boot Entry Point    |
\               MININT  +------------------------+  $60000000
\


 8000 CONSTANT IMAGE_SIZE
 CREATE IMAGE  IMAGE_SIZE ALLOT
 IMAGE IMAGE_SIZE ERASE


\ Define words in META for metacompiling
IN-META

( Memory Constants )
$60000000 CONSTANT      MININT                 \ bottom of ARM7EF memory map
MININT IMAGE_SIZE + 1 - 
          CONSTANT      MAXINT                 \ top of ARM7EF memory map
$4    CONSTANT   CELL_SIZE                     \ size of one cell
$200  CONSTANT   USER_SIZE                     \ user area size in cells
$200  CONSTANT   RS_SIZE                       \ return stack/TIB size
$200  CONSTANT   DS_SIZE                       \ data stack size
$1000 CONSTANT   TIB_SIZE                      \ TIB size
$200  CONSTANT   USER_SIZE                     \ user variable area size
$100  CONSTANT   INIT_SIZE                     \ initialization area size
$0A   CONSTANT   =BASEE

MININT    CONSTANT MEM_BASE                    \ base of memory
MININT INIT_SIZE +
          CONSTANT =UPP                        \ base of eforth user area
=UPP USER_SIZE + DS_SIZE +
          CONSTANT =SPP                        \ bottom of data stack (SP0)
=SPP $10 + 
          CONSTANT =TIB                        \ base of T.I.B (TIB)
=SPP RS_SIZE + TIB_SIZE +          
          CONSTANT =RPP                        \ bottom of return stack (RP0)
=RPP $100 +
          CONSTANT CODE_BASE                   \ base of CODE area
MININT IMAGE_SIZE +
          CONSTANT NAME_BASE                   \ base of NAME area
$EB000000 CONSTANT =CALL