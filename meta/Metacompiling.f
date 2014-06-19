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

( ARM ELF Header Defintion )
: 4TOW,  ( n1 n2 n3 n4 -- n )
  18 LSHIFT
  SWAP 10 LSHIFT OR
  SWAP 08 LSHIFT OR
  SWAP OR , ;

: 2TOW,  ( n1 n2 -- n )
  10 LSHIFT
  SWAP OR , ;