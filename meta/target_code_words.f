      ( Create target code words )
: INIT-ASSEMBLER  ( -- )
  [ ASSEMBLER ] CLEAR_ALL# [ META ]
  ASSEMBLER DEFINITIONS ;
  
: CODE  ( -- )
  TARGET-CREATE INIT-ASSEMBLER ;

 : CALL,  ( taddr -- ) 
\  HERE-T CELL- DUP ORG @-T THERE [ ASSEMBLER ]  # ,BL [ META ] ;          \ call with link to taddr
 ;
 
ASSEMBLER DEFINITIONS
: END-CODE IN-META ;
: C; END-CODE ;
META DEFINITIONS

comment:

( Late reference define word )
1F CONSTANT WIDTH 
: TOKENED ( a u a -- a )
  OVER WIDTH >
  ABORT" Token name is too long."
  DUP >R 2DUP C! CHAR+ SWAP MOVE R> ;
 
: TOKEN, ( a u -- )
   HERE OVER 1 + ALLOT ALIGN
   TOKENED DROP ;
 
: $TOKEN ( -- a )
   ((")) ;

: REFERENCE ( xt -<string>- )
   [ ' $TOKEN ] LITERAL COMPILE, BL WORD COUNT TOKEN, COMPILE, ;
 
: LATE ( a -- )
  FIND 
    IF EXECUTE
    ELSE ." =>" COUNT TYPE SPACE TRUE ABORT" is not yet defined."
    THEN
  ;
  
: [TARGET] ( | <string> -- )
  [ ' TARGET ] LITERAL COMPILE, 
  [ ' LATE ] LITERAL REFERENCE 
  [ ' META ] LITERAL COMPILE, ; IMMEDIATE

comment;

: FIND&EXECUTE  ( addr len wordlist -- ? )
        SEARCH-WORDLIST 0= ABORT" Target word not found"  EXECUTE ;

: DEFERED  ( wordlist -- )
        BL WORD COUNT POSTPONE SLITERAL
        POSTPONE LITERAL
        POSTPONE FIND&EXECUTE ;

: [TARGET]  ( -- )  TARGET-WORDLIST    DEFERED ; IMMEDIATE
 
( Find the next word in a single wordlist only )
: DEFINED-IN  ( -- xt )
        ' ( BL WORD COUNT ROT SEARCH-WORDLIST  0= ?MISSING ) ;

: 'T   ( -- xt )   ONLY ALSO TARGET DEFINED-IN ONLY FORTH ALSO META ALSO ;
: 'F   ( -- xt )   ONLY ALSO FORWARD DEFINED-IN ONLY FORTH ALSO META ALSO ;

: [FORWARD]   ( -- )    'F COMPILE, ;   IMMEDIATE

( Define transition words, which behave like forth immediate words )

: T:   TRANSITION DEFINITIONS  META  :  ;
: T;   [COMPILE] ;  META DEFINITIONS ; IMMEDIATE

: [TRANSITION]  ONLY ALSO TRANSITION DEFINED-IN COMPILE, ONLY FORTH ALSO META ALSO ; IMMEDIATE

T: (   [COMPILE] (   T;
T: \   [COMPILE] \   T;

: STRING,-T  [CHAR] " PARSE  DUP C,-T  S,-T ALIGN-T  ;

FORWARD: <(.")>

T: ."   [FORWARD]  <(.")>   STRING,-T   T;

\ FORWARD: <(S")>
\ T: S"    [FORWARD] <(S")>   STRING,-T   T;

FORWARD: <(ABORT")>
T: ABORT"   [FORWARD] <(ABORT")>    STRING,-T   T;