( Define target vocabularies uh, wordlists )

VARIABLE VOC-LINK-T
FORWARD: <VOCABULARY>

: VOCABULARY   ( -- )
        TARGET-CREATE
        [TARGET] DOLIST CALL, 
        [FORWARD] <VOCABULARY>
        0 ,-T
        HERE-T  VOC-LINK-T @ ,-T   VOC-LINK-T ! 
        ;

$80       CONSTANT =IMMEDIATE
$40       CONSTANT =COMPILE-ONLY
$7F7F7F1F CONSTANT =MASK


: IMMEDIATE   ( -- )
        LAST-T @  DUP C@-T =IMMEDIATE OR  ( Precedence Bit )  SWAP C!-T ;
  
: COMPILE-ONLY ( -- )
        LAST-T @  DUP C@-T =COMPILE-ONLY OR  ( compiler-only Bit )  SWAP C!-T ;

VARIABLE STATE-T

T: [COMPILE]   'T EXECUTE    T;

: >BODY-T  4 + ;

\ FORWARD: <(IS)>
\ T: IS      [FORWARD] <(IS)>    T;
\ :  IS    'T >BODY @ >BODY-T  2DUP !-T  8 + !-T ;
\  ( patches both current and default value of defered word )

( Meta Compiler Resolve Forward References )

0 VALUE #UNRESOLVED

: .UNRESOLVED   ( -- )
        0 TO #UNRESOLVED
        FORWARD-LINK
        BEGIN   @ DUP
        WHILE   DUP 2 CELLS - RESOLVED? 0=
                IF      DUP 2 CELLS - BODY> .NAME  ( *SYSDEP* )
                        1 +TO #UNRESOLVED
                THEN
                START/STOP
        REPEAT  DROP
        #UNRESOLVED
        IF      CR ." !!!!!! There were: " #UNRESOLVED . ." words Unresolved !!!!!!"
                3 0 DO BEEP 300 MS LOOP
        ELSE    CR ." *** No words Unresolved ***"
        THEN    ;

: FIND-UNRESOLVED   ( -- cfa f )
        'F    DUP  >BODY RESOLVED?     ;

: RESOLVE   ( taddr cfa -- )
        >BODY   2DUP TRUE OVER CELL+ !   @
        BEGIN   DUP
        WHILE   2DUP @-T   -ROT SWAP !-T
        REPEAT  2DROP  !   ;

: RESOLVES   ( taddr -- )
        FIND-UNRESOLVED
        IF      .NAME ." Already Resolved"   DROP  ( *SYSDEP* )
        ELSE    RESOLVE
        THEN   ;