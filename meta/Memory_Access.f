\ eForth Builder Variabler
VARIABLE LINKK  0 LINKK !                      \ initial link pointer

( Memory access words )
VARIABLE CP-T    
CODE_BASE CP-T !                   \ initialize target code dictionary point

: ORG     ( taddr -- )       CP-T !   ;

: THERE   ( taddr -- addr )  MEM_BASE - IMAGE +  ;
: C@-T    ( taddr -- c )     THERE C@ ;
: W@-T    ( taddr -- w )     THERE w@ ;
: @-T     ( taddr -- n )     THERE @  ;
: C!-T    ( c taddr -- )     THERE C! ;
: W!-T    ( w taddr -- )     THERE w! ;
: !-T     ( n taddr -- )     THERE !  ;
: HERE-T  ( -- taddr )       CP-T @   ;
: ALLOT-T ( n -- )           CP-T +!  ;
: C,-T    ( c -- )           HERE-T C!-T 1 CP-T +! ;
: W,-T    ( w -- )           DUP C,-T $FF /  C,-T  ;
: ,-T     ( n -- )           HERE-T !-T 4 CP-T +!  ;
: S,-T    ( addr len -- )    0 ?DO COUNT C,-T LOOP DROP ;
: ALIGN-T ( -- )             HERE-T ALIGNED HERE-T - ALLOT-T ;
: '-T     ( -- a )           ' ;