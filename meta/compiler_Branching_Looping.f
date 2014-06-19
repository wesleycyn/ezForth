          ( Meta compiler Branching & Looping )

T: IF      [TARGET] ?BRANCH  ?>MARK   T;

T: THEN                      ?>RESOLVE    T;
T: ELSE    [TARGET] BRANCH   ?>MARK   2SWAP ?>RESOLVE   T;

T: BEGIN                     ?<MARK   T;
T: AGAIN   [TARGET] BRANCH   ?<RESOLVE   T;
T: UNTIL   [TARGET] ?BRANCH  ?<RESOLVE   T;
T: WHILE   [TARGET] ?BRANCH  ?>MARK  2SWAP  T;
T: REPEAT  [TARGET] BRANCH   ?<RESOLVE  ?>RESOLVE   T;

T: FOR     [TARGET] >R       ?<MARK   T;
T: NEXT    [TARGET] _next    ?<RESOLVE T;
T: AFT     [TARGET] BRANCH   2DROP ?>MARK  ?<MARK 2SWAP T;      

T: ?DO     [TARGET] (?DO)    ?>MARK   T;
T: DO      [TARGET] (DO)     ?>MARK   T;
T: LOOP    [TARGET] (LOOP)   2DUP CELL+   ?<RESOLVE   ?>RESOLVE   T;
T: +LOOP   [TARGET] (+LOOP)  2DUP CELL+   ?<RESOLVE   ?>RESOLVE   T;

( Meta compiler literals )

T: LITERAL   ( n -- )   [TARGET] DOLIT  ,-T T;
T: [CHAR]    ( -- )     CHAR        [TRANSITION] LITERAL   T;
T: [']       ( -- )     'T >BODY @  [TRANSITION] LITERAL   T;

( Meta compiler defining words )

: USER  ( n -- )        
        RECREATE  [TARGET] DOLIST CALL, [TARGET] DOUSER 
        DUP ,-T   CONSTANT   ;

: CREATE  ( -- )
        RECREATE  [TARGET] DOLIST CALL, [TARGET] DOVAR 
        HERE-T CONSTANT  ;

: VARIABLE  ( -- )
        CREATE   0 ,-T   ;

: CONSTANT   ( n -- )
        RECREATE  [TARGET] DOLIST CALL, [TARGET] DOCON 
        DUP ,-T   CONSTANT   ;

FORTH VARIABLE DEFER-LIST-T META

: DEFER   ( -- )
        TARGET-CREATE   [TARGET] DODEFER 
        0 ,-T
        HERE-T  DEFER-LIST-T @ ,-T  DEFER-LIST-T !
        0 ,-T  ;

\ FORWARD: <(;CODE)>

\ T: ;CODE   ( -- addr )
\        [FORWARD] <(;CODE)>   HERE-T
\        STATE-T OFF   IN-META
\        INIT-ASSEMBLER T;

\ T: DOES>     ( -- addr )
\        [FORWARD] <(;CODE)>   HERE-T
\        [TARGET] DODOES CALL,   T;

( Identify numbers single numbers only )

: NUMBER?  ( addr len -- n f )
        OVER C@ [CHAR] - =              \ leading minus sign?
        DUP >R IF  1 /STRING  THEN
        0 0 2SWAP >NUMBER 0= NIP NIP  ( -- u f )
        R> IF SWAP NEGATE SWAP THEN ;

( Meta Compiler Compiling Loop. )

FORTH VARIABLE T-IN META
: TOKEN  ( -- addr )
        BEGIN   >IN @ T-IN !
                BL WORD  DUP C@ 0=
        WHILE   DROP REFILL  0= ABORT" end of file in definition"
        REPEAT  ?UPPERCASE ;

: ]   ( -- )
        STATE-T ON  IN-TRANSITION 
        BEGIN   IN-TRANSITION
                TOKEN FIND
                IF      EXECUTE
                ELSE    COUNT NUMBER?
                        IF      [TRANSITION] LITERAL 
                        ELSE    ." Test Point" CR
                                DROP T-IN @ >IN !
                                UNDEFINED ( create forward reference )
                        THEN
                THEN
                STATE-T @ 0=
        UNTIL   ;

T: [   IN-META   STATE-T OFF   T;
T: ;   [TARGET] EXIT [TRANSITION] [   T;

\ IN-ASSEMBLER
\ : $NEXT ( -- )
 \ -------- ITC Version1 ---------
 \ WP, IP,            ,MOV                \ get next CFA
 \ IP, IP, 4 #        ,ADD                \ point to new CFA
 \ WP                 ,BX                 \ jump to next CFA
 \ -------- ITC Version2 ---------

\  [] PC, IP, 4 #      ,LDR                \ direct jump
\   [IP+4]->PC
 
\  ;  
IN-META

( Interpretive words for Meta )
: !            !-T ; 
: '            'T >BODY @   ;
: ,           ,-T ;
: W,         W,-T ;
: C,         C,-T ;
: HERE     HERE-T ;
: ALLOT   ALLOT-T ;
: ,"    STRING,-T ;
: >BODY   >BODY-T ;

: :   TARGET-CREATE  [TARGET] DOLIST CALL, ] ;