IN-META

( Define meta branching constructs )
: ?CONDITION TRUE - ABORT" Conditionals not paired" ;

: ?>MARK    ( -- f addr ) TRUE HERE-T 0 ,-T ;                  \ forward reference
: ?>RESOLVE ( f addr -- ) HERE-T SWAP !-T ?CONDITION ;         \ resolve forward reference
: ?<MARK    ( -- f addr ) TRUE HERE-T ;                        \ back reference
: ?<RESOLVE ( f addr -- ) ,-T ?CONDITION ;                     \ resolve backward reference

( Meta compiler forward reference linking )
VARIABLE FORWARD-LINK    0 FORWARD-LINK !

: MAKE-CODE ( pfa -- )  
    @ ,-T ;
    
: LINK-BACKWARDS ( pfa -- )
    HERE-T OVER @ ,-T SWAP ! ;
: RESOLVED? ( pfa -- f )
    CELL+ @ ;
    
: DO-FORWARD ( -- )
    DOES> 
      DUP RESOLVED?
        IF MAKE-CODE
        ELSE LINK-BACKWARDS 
        THEN
    ;
    
: (FORWARD)  ( taddr -- )
    GET-CURRENT >R
    FORWARD-WORDLIST SET-CURRENT
    CREATE
      ,  ( taddr )
      FALSE , ( resolve flag )
      HERE FORWARD-LINK @ , FORWARD-LINK !
    DO-FORWARD
    R> SET-CURRENT ;

: FORWARD: ( -- )
    0 (FORWARD) ;
    
: UNDEFINED ( -- )
    HERE-T (FORWARD) 0 ,-T ;