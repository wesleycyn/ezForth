( ARM ELF Header Defintion )
: 4TOW,  ( n1 n2 n3 n4 -- n )
  18 LSHIFT
  SWAP 10 LSHIFT OR
  SWAP 08 LSHIFT OR
  SWAP OR , ;

: 2TOW,  ( n1 n2 -- n )
  10 LSHIFT
  SWAP OR , ;
  

\ ELF Header Defintion
B0 CONSTANT HEADER_SIZE 
CREATE ELF_HEADER
7F CHAR E CHAR L CHAR F 4TOW,            \ (00) 0X7F,'E','L','F' -- EI_MAG0~3
01 01 01 00 4TOW,                        \ (04) EI_CLASS, EI_DATA, EI_VERSION, EI_PAD
00 00 00 00 4TOW,                        \ (08) EI_PAD...
00 00 00 00 4TOW,                        \ (0C) EI_PAD..., EI_NIDENT
02 28 2TOW,                              \ (10) ET_EXEC, EM_ARM  
01 ,                                     \ (14) EV_CURRENT
MEM_BASE ,                               \ (18) Entry Point under ANGEL
34 ,                                     \ (1C) E_PHOFF               
54 ,                                     \ (20) E_SHOFF               
02 ,                                     \ (24) E_FLAGS
34 20 2TOW,                              \ (28) E_EHSIZE, E_PHENTSIZE 
01 28 2TOW,                              \ (2C) E_PHNUM, E_SHENTSIZE  
02 01 2TOW,                              \ (30) E_SHNUM, E_SHSTRNDX   
\ Program Header Defintion (Offset=$34)
01 ,                                     \ (34) P_TYPE = PT_LOAD
HEADER_SIZE ,                            \ (38) P_OFFSET             
MEM_BASE ,                               \ (3C) P_VADDR
00 ,                                     \ (40) P_PADDR
IMAGE_SIZE ,                             \ (44) P_FILESZ              
IMAGE_SIZE ,                             \ (48) P_MEMSZ                
05 ,                                     \ (4C) P_FLAGS = PF_X+PF_R
04 ,                                     \ (50) P_ALIGN
\ Dummy Section Header Table(#0) Defition (Offset=$54)
00 ,                                     \ (54) SH_NAME
00 ,                                     \ (58) SH_TYPE
00 ,                                     \ (5C) SH_FLAGS
00 ,                                     \ (60) SH_ADDR
00 ,                                     \ (64) SH_OFFSET
00 ,                                     \ (68) SH_SIZE
00 ,                                     \ (6C) SH_LINK
00 ,                                     \ (70) SH_INFO
00 ,                                     \ (74) SH_ADDRALIGN
00 ,                                     \ (78) SH_ENTSIZE
\ Dummy Section Header Table(#1) Defition (Offset=$7C)
00 ,                                     \ (7C) SH_NAME
03 ,                                     \ (80) SH_TYPE(=SHT_STRTAB)
00 ,                                     \ (84) SH_FLAGS
00 ,                                     \ (88) SH_ADDR
A4 ,                                     \ (8C) SH_OFFSET
0C ,                                     \ (90) SH_SIZE
00 ,                                     \ (94) SH_LINK
00 ,                                     \ (98) SH_INFO
00 ,                                     \ (9C) SH_ADDRALIGN
00 ,                                     \ (A0) SH_ENTSIZE
\ Dummy String Table Definition (Offset=$A4)
CHAR A CHAR R CHAR M CHAR 7 4TOW,        \ (A4) 'ARM7'
CHAR E CHAR F CHAR V CHAR 1 4TOW,        \ (A8) 'EFV1'
CHAR . CHAR 0 CHAR 0 0      4TOW,        \ (AC) '.00 '