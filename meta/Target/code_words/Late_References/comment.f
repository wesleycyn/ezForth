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