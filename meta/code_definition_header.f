( Compile a code definition header )
VARIABLE LAST-T     0 LAST-T !
VARIABLE NP-T                                   
NAME_BASE NP-T !                          \ initialize target name dictionary point

: .WORD ( taddr -- )
  . SPACE >IN @ BL WORD COUNT TYPE >IN ! CR  ;

\ : .'CODE ( -- )
\   CODEE @ .HEAD CONSTANT  
\   DOES>  ( -- )
\     @ ,WORD ;

\ : .'USER  ( -- )
\   CODEE @ .HEAD CONSTANT  
\   DOES>  ( -- )
\     @ ;

: HEADER ( -- )
  ALIGN-T                                 \ force to CELL boundary
  HERE-T .WORD                            \ display cfa   
  BL WORD DUP C@                          \ get name and length of new definition 
  1F AND CELL_SIZE /                      \ length in unit CELL
  3 + CELL_SIZE * NP-T @ SWAP -           \ reserved header space
                                          \ CFA ----- NAMEE
                                          \ LFA ----- NAMEE+CELL*1
                                          \ LEX ----- NAMEE+CELL*1+3
                                          \ STRING -- NAMEE+CELL*1+4
  DUP NP-T !                              \ set name pointer
  HERE-T >R                               \ save CP-T
  ORG                                     \ set CP-T := NP-T
  R@ ,-T                                  \ CFA
  LAST-T DUP @ ,-T                        \ LFA 
  HERE-T SWAP !                           \ reset link point to a current name string
  COUNT DUP C,-T                          \ default LEX+LENGTH
  S,-T                                    \ fill string
  R> ORG                                  \ set assembly counter to code pointer
  ;
