\ Copyright (c) 2001 by Blueputer Technology Inc.
\ All rights reserved 
\
\ ARM7EF.F   26OCT01 created by Wuja.
\
\ ARM7eForth high-level definitions.
\
\ (Translated from eForth 1.0 by Bill Muench and C. H. Ting, 1990)
\ 
\ V1.00,   26OTC01WUJA,  Translate high-level defintions from eForth 1.0.
\

\ System and user variables

: doVAR ( -- a )                            \ Run time routine for VARIABLE and CREATE.
  R> ; COMPILE-ONLY
  
\ ROM version USER veriables
CREATE ROM_USER 
4 CELLS ALLOT                               \ reserved space
1 CELLS ALLOT                               \ (SP0)      Pointer to bottom of the data stack.
1 CELLS ALLOT                               \ (RP0)      Pointer to bottom of the return stack.
1 CELLS ALLOT                               \ ('?KEY)    Execution vector of ?KEY.
1 CELLS ALLOT                               \ ('EMIT)    Execution vector of EMIT.
1 CELLS ALLOT                               \ ('EXPECT)  Execution vector of EXPECT.
1 CELLS ALLOT                               \ ('TAP)     Execution vector of TAP.
1 CELLS ALLOT                               \ ('ECHO)    Execution vector of ECHO.
1 CELLS ALLOT                               \ ('PROMPT)  Execution vector of PROMPT.
1 CELLS ALLOT                               \ (BASE)     Storage of the radix base for numeric I/O.
1 CELLS ALLOT                               \ (tmp)      A temporary storage location used in parse and find.
1 CELLS ALLOT                               \ (SPAN)     Hold character count received by EXPECT.
1 CELLS ALLOT                               \ (>IN)      Hold the character pointer while parsing input stream.
1 CELLS ALLOT                               \ (#TIB)     Hold the current count. 
1 CELLS ALLOT                               \            Pointer to TIB 
1 CELLS ALLOT                               \ (CSP)      Hold the stack pointer for error checking.
1 CELLS ALLOT                               \ ('EVAL)    Execution vector of EVAL.
1 CELLS ALLOT                               \ ('NUMBER)  Execution vector of NUMBER?.
1 CELLS ALLOT                               \ (HLD)      Hold a pointer in building a numeric output string.
1 CELLS ALLOT                               \ (HANDLER)  Hold the return stack pointer for error handling.
1 CELLS ALLOT                               \ (CONTEXTA) Area to specify vocabulary search order.
8 CELLS ALLOT                               \            Vocabulary stack 
1 CELLS ALLOT                               \ (CURRENT)  Point to the vocabulary to be extended.
1 CELLS ALLOT                               \            vocabulary link pointer
1 CELLS ALLOT                               \ (CP)       Point to the top of the code dictionary.
1 CELLS ALLOT                               \ (NP)       Point to the bottom of the name dictionary.
1 CELLS ALLOT                               \ (LAST)     Point to the last name in the name dictionary.

VARIABLE ROM_USER_SIZE  25 CELLS ROM_USER_SIZE !

VARIABLE UP     =UPP UP !

: + ( w w -- sum )                          \ Add top two items.
  UM+ DROP ;

: doUSER ( -- a )                           \ Run time routine for user variables.
  R> @  UP @ + ; COMPILE-ONLY
  
4 CELLS
DUP USER SP0     ( -- a )   CELL+           \ Pointer to bottom of the data stack.
DUP USER RP0     ( -- a )   CELL+           \ Pointer to bottom of the return stack.
DUP USER '?KEY   ( -- a )   CELL+           \ Execution vector of ?KEY.
DUP USER 'EMIT   ( -- a )   CELL+           \ Execution vector of EMIT.
DUP USER 'EXPECT ( -- a )   CELL+           \ Execution vector of EXPECT.
DUP USER 'TAP    ( -- a )   CELL+           \ Execution vector of TAP.
DUP USER 'ECHO   ( -- a )   CELL+           \ Execution vector of ECHO.
DUP USER 'PROMPT ( -- a )   CELL+           \ Execution vector of PROMPT.
DUP USER BASE    ( -- a )   CELL+           \ Storage of the radix base for numeric I/O.
DUP USER tmp     ( -- a )   CELL+           \ A temporary storage location used in parse and find.
DUP USER SPAN    ( -- a )   CELL+           \ Hold character count received by EXPECT.
DUP USER >IN     ( -- a )   CELL+           \ Hold the character pointer while parsing input stream.
DUP USER #TIB    ( -- a )   CELL+           \ Hold the current count. 
1 CELLS ALLOT               CELL+           \ Pointer to TIB 
DUP USER CSP     ( -- a )   CELL+           \ Hold the stack pointer for error checking.
DUP USER 'EVAL   ( -- a )   CELL+           \ Execution vector of EVAL.
DUP USER 'NUMBER ( -- a )   CELL+           \ Execution vector of NUMBER?.
DUP USER HLD     ( -- a )   CELL+           \ Hold a pointer in building a numeric output string.
DUP USER HANDLER ( -- a )   CELL+           \ Hold the return stack pointer for error handling.
DUP USER CONTEXT ( -- a )   CELL+           \ A area to specify vocabulary search order.
8 CELLS DUP ALLOT +                         \ Vocabulary stack 
DUP USER CURRENT ( -- a )   CELL+           \ Point to the vocabulary to be extended.
1 CELLS ALLOT               CELL+           \ vocabulary link pointer
DUP USER CP      ( -- a )   CELL+           \ Point to the top of the code dictionary.
DUP USER NP      ( -- a )   CELL+           \ Point to the bottom of the name dictionary.
DUP USER LAST    ( -- a )   CELL+           \ Point to the last name in the name dictionary.
DROP

\ Common functions

: doVOC ( -- )                              \ Run time action of VOCABULARY's.
  R> CONTEXT ! ;

VOCABULARY FORTH                            \ FORTH vocabulary.

: ?DUP ( w -- w w | 0 )                     \ Dup tos if its is not zero.
  DUP IF DUP THEN ;

: ROT ( w1 w2 w3 -- w2 w3 w1 )              \ Rot 3rd item to top.
  >R SWAP R> SWAP ;

: 2DROP ( w w -- )                          \ Discard two items on stack.
  DROP DROP ;

: 2DUP ( w1 w2 -- w1 w2 w1 w2 )             \ Duplicate top two items.
  OVER OVER ;

: D+ ( d d -- d )                           \ Double addition, as an example using UM+.
  >R SWAP >R UM+ R> R> + + ;

: NOT ( w -- w )                            \ One's complement of tos.
  -1 XOR ;

: NEGATE ( n -- -n )                        \ Two's complement of tos.
  NOT 1 + ;

: DNEGATE ( d -- -d )                       \ Two's complement of top double.
  NOT >R NOT 1 + R> + ;

: - ( n1 n2 -- n1-n2 )                      \ Subtraction.
  NEGATE + ;

: ABS ( n -- n )                            \ Return the absolute value of n.
  DUP 0< IF NEGATE THEN ;

: = ( w w -- t )                            \ Return true if top two are equal.
  XOR IF 0 EXIT THEN -1 ;

: U< ( u u -- t )                           \ Unsigned compare of top two items.
  2DUP XOR 0< 
    IF SWAP DROP 0< EXIT
    THEN
  - 0< ;

: < ( n1 n2 -- t )                          \ Signed compare of top two items.
  2DUP XOR 0< 
    IF DROP 0< EXIT
    THEN
  - 0< ;
    

: MAX ( n n -- n )                          \ Return the greater of two top stack items.
  2DUP < 
    IF SWAP
    THEN 
  DROP ;
    
: MIN ( n n -- n )                          \ Return the smaller of top two stack items.
  2DUP SWAP <
    IF SWAP
    THEN
  DROP ;

: WITHIN ( u ul uh -- t )                   \ Return true if u is within the range of ul and uh.
  OVER - >R                                 \ ul <= u < uh
  - R> U< ;      

\ Divide
\ : UM/MOD ( udl udh u -- ur uq )             \ Unsigned divide of a double by a single. Return mod and quotient.
\  2DUP U<
\  IF NEGATE 1F
\    FOR >R DUP  UM+  >R >R DUP  UM+  R> + DUP
\        R> R@ SWAP >R  UM+  R> OR
\      IF >R DROP 1 + R> ELSE DROP THEN R>
\    NEXT DROP SWAP EXIT
\  THEN DROP 2DROP  -1 DUP ;

  

: M/MOD ( d n -- r q )                      \ Signed floored divide of double by single. Return mod and quotient.
  DUP 0<  DUP >R
    IF NEGATE >R DNEGATE R>
    THEN >R DUP 0< IF R@ + THEN R> UM/MOD R>
    IF SWAP NEGATE SWAP 
    THEN 
  ;

: /MOD ( n n -- r q )                       \ Signed divide. Return mod and quotient.
  OVER 0< SWAP M/MOD ;

: MOD ( n n -- r )                          \ Signed divide. Return mod only.
  /MOD DROP ;

: / ( n n -- q )                            \ Signed divide. Return quotient only.
  /MOD SWAP DROP ;

\ Multiply
\ : UM* ( u1 u2 -- udl udh )                  \ Unsigned multiply. Return double product.
\  42 TX!
\  0 SWAP 1F
\  FOR DUP  UM+  >R >R DUP  UM+  R> + R>
\    IF >R OVER  UM+  R> + THEN
\  NEXT ROT DROP ;

  

: * ( n n -- n )                            \ Signed multiply. Return single product.
  UM* DROP ;

: M* ( n n -- d )                           \ Signed multiply. Return double product.
  2DUP XOR 0< >R ABS SWAP ABS UM* R>
    IF DNEGATE 
    THEN 
   ;

: */MOD ( n1 n2 n3 -- r q )                 \ Multiply n1 and n2, then divide by n3. Return mod and quotient.
  >R M* R> M/MOD ;

: */ ( n1 n2 n3 -- q )                      \ Multiply n1 by n2, then divide by n3. Return quotient only.
  */MOD SWAP DROP ;

\ Miscellaneous

: CELL+ ( a -- a )                          \ Add cell size in byte to address.
  [ 4 ] LITERAL + ;

: CELL- ( a -- a )                          \ Subtract cell size in byte from address.
  [ -4 ] LITERAL + ;

: CELLS ( n -- n )                          \ Multiply tos by cell size in bytes.
  [ 4 ] LITERAL * ;

: ALIGNED ( b -- a )                        \ Align address to the cell boundary.
  DUP 0 1 CELLS UM/MOD DROP DUP 
    IF NEGATE CELL+ 
    THEN
  + ;

: BL ( -- 32 )                              \ Return 32, the blank character.
  20 ;

: >CHAR ( c -- c )                          \ Filter non-printing characters.
  7F AND DUP 7F BL WITHIN
    IF DROP [ CHAR _ ] LITERAL
    THEN
  ;

: DEPTH ( -- n )                            \ Return the depth of the data stack.
  SP@ SP0 @ SWAP - 4 / ;

: PICK ( ... +n -- ... w )                  \ Copy the nth stack item to tos.
  1 + CELLS SP@ + @ ;

\ Memory access
: +! ( n a -- )                             \ Add n to the contents at address a.
  SWAP OVER @ + SWAP ! ;

: 2! ( d a -- )                             \ Store the double integer to address a.
  SWAP OVER ! CELL+ ! ;

: 2@ ( a -- d )                             \ Fetch double integer from address a.
  DUP CELL+ @ SWAP @ ;

: COUNT ( b -- b +n )                       \ Return count byte of a string and add 1 to byte address.
  DUP 1 + SWAP C@ ;

: HERE ( -- a )                             \ Return the top of the code dictionary.
  CP @ ;

: PAD ( -- a )                              \ Return the address of a temporary buffer.
  HERE 50 + ;

: TIB ( -- a )                              \ Return the address of the terminal input buffer.
  #TIB CELL+ @ ;

: @EXECUTE ( a -- )                         \ Execute vector stored in address a.
  @ ?DUP
    IF EXECUTE
    THEN
  ;



: FILL ( b u c -- )                         \ Fill u bytes of character c to area beginning at b.
  SWAP FOR SWAP AFT 2DUP C! 1 + THEN NEXT 2DROP ;

: ERASE ( b u -- ) 0 FILL ;                 \ Fill u bytes of 0 to area begining at b.

: -TRAILING ( b u -- b u )                  \ Adjust the count to eliminate trailing white space.
  FOR 
    AFT BL OVER R@ + C@ <
        IF R> 1 + EXIT THEN 
    THEN
  NEXT 0 ;

: PACK$ ( b u a -- a )                      \ Build a counted string with u characters from b. Null fill.
  ALIGNED DUP >R
  OVER DUP 0 4 UM/MOD DROP
  - OVER + 0 SWAP !
  2DUP C! 1 +
  SWAP CMOVE R> ;

\ Numeric output, single precision
: DIGIT ( u -- c )                          \ Convert digit u to a character.
  9 OVER < 7 AND + [ CHAR 0 ] LITERAL + ;

: EXTRACT ( n base -- n c )                 \ Extract the least significant digit from n.
  0 SWAP UM/MOD SWAP DIGIT ;

: <# ( -- )                                 \ Initiate the numeric output process.
  PAD HLD ! ;

: HOLD ( c -- )                             \ Insert a character into the numeric output string.
  HLD @ 1 - DUP HLD ! C! ;

: # ( u -- u )                              \ Extract one digit from u and append the digit to output string.
  BASE @ EXTRACT HOLD ;              

: #S ( u -- 0 )                             \ Convert u until all digits are added to the output string.
  BEGIN # DUP WHILE REPEAT ;

: SIGN ( n -- )                             \ Add a minus sign to the numeric output string.
  0< IF [ CHAR - ] LITERAL HOLD THEN ;                

: #> ( w -- b u )                           \ Prepare the output string to be TYPE'd.
  DROP HLD @ PAD OVER - ;

: str ( n -- b u )                          \ Convert a signed integer to a numeric string.
  DUP >R ABS <# #S R> SIGN #> ;

: HEX ( -- )                                \ Use radix 16 as base for numeric conversions.
  10 BASE ! ;

: DECIMAL ( -- )                            \ Use radix 10 as base for numeric conversions.
  0A BASE ! ;

\ Numeric input, single precision
: DIGIT? ( c base -- u t )                  \ Convert a character to its numeric value. A flag indicates success.
  >R [ CHAR 0 ] LITERAL - 9 OVER <
    IF 7 - DUP 0A < OR 
    THEN 
  DUP R> U< ;

: NUMBER? ( a -- n T | a F )                \ Convert a number string to integer. Push a flag on tos.
  BASE @ >R  0 OVER COUNT ( a 0 b n)
  OVER C@ [ CHAR $ ] LITERAL =
    IF HEX SWAP 1 + SWAP 1 - THEN ( a 0 b' n')
  OVER C@ [ CHAR - ] LITERAL = >R ( a 0 b n)
  SWAP R@ - SWAP R@ + ( a 0 b" n") ?DUP
    IF 1 - ( a 0 b n)
      FOR DUP >R C@ BASE @ DIGIT?
        WHILE SWAP BASE @ * +  R> 1 +
      NEXT R@ ( ?sign) SWAP DROP ( b) 
        IF NEGATE THEN SWAP
        ELSE R> R> ( b index) 2DROP ( digit number) 2DROP 0
        THEN DUP
    THEN
  R> ( n ?sign) 2DROP R> BASE ! ;

\ Basic I/O
: ?KEY ( -- c T | F )                       \ Return input character and true, or a false if no input.
  '?KEY @EXECUTE ;                

: KEY ( -- c )                              \ Wait for and return an input character.
  BEGIN ?KEY UNTIL ;

: EMIT ( c -- )                             \ Send a character to the output device.
  'EMIT @EXECUTE ;

: NUF? ( -- t )                             \ Return false if no input, else pause and if CR return true.
  ?KEY DUP 
    IF 2DROP KEY 0D = 
    THEN
  ;

: PACE ( -- )                               \ Send a pace character for the file downloading process.
  0B EMIT ;

: SPACE ( -- )                              \ Send the blank character to the output device.
  BL EMIT ;

: SPACES ( +n -- )                          \ Send n spaces to the output device.
  0 MAX FOR 
      AFT SPACE THEN 
    NEXT ;

: TYPE ( b u -- )                           \ Output u characters from b.
  FOR 
    AFT COUNT EMIT THEN 
  NEXT DROP ;
  

: CR ( -- )                                 \ Output a carriage return and a line feed.
  0D EMIT 0A EMIT ; 

: do$ ( -- a )                              \ Return the address of a compiled string.
  R> R@ R> COUNT + ALIGNED >R SWAP >R ; COMPILE-ONLY

: $"| ( -- a )                              \ Run time routine compiled by $". Return address of a compiled string.
  do$ ; COMPILE-ONLY

: .$ ( a -- ) COUNT TYPE ;

: ."| ( -- )                                \ Run time routine of ." . Output a compiled string.
  do$ .$ ; COMPILE-ONLY

: .R ( n +n -- )                            \ Display an integer in a field of n columns, right justified.
  >R str R> OVER - SPACES TYPE ;

: U.R ( u +n -- )                           \ Display an unsigned integer in n column, right justified.
  >R <# #S #> R> OVER - SPACES TYPE ;

: U. ( u -- )                               \ Display an unsigned integer in free format.
  <# #S #> SPACE TYPE ;

: . ( w -- )                                \ Display an integer in free format, preceeded by a space.
  BASE @ 0A XOR 
    IF U. EXIT 
    THEN 
  str SPACE TYPE ;

: ? ( a -- )                                \ Display the contents in a memory cell.
  @ . ;

\ Parsing
: (parse) ( b u c -- b u delta ; <string> ) \ Scan string delimited by c. Return found string and its offset.
  tmp !  OVER >R  DUP
  IF 1 -  tmp @ BL =
    IF 
      FOR BL OVER C@ - 0< NOT
        WHILE 1 +
      NEXT R> DROP 0 DUP EXIT
        THEN  R>
    THEN OVER SWAP \ b' b' u' \ 'scan'
    FOR tmp @ OVER C@ - tmp @ BL =
      IF 0< THEN WHILE 1 +
    NEXT DUP >R  
      ELSE R> DROP DUP 1 + >R
      THEN OVER -  R>  R> - EXIT
  THEN ( b u) OVER R> - ;

: PARSE ( c -- b u ; <string> )             \ Scan input stream and return counted string delimited by c.
  >R  TIB >IN @ +  #TIB @ >IN @ -  R> (parse) >IN +! ;

: .( ( -- )                                 \ Output following string up to next ) .
  [ CHAR ) ] LITERAL PARSE TYPE ; IMMEDIATE

: ( ( -- )                                  \ Ignore following string up to next ) . A comment.
  [ CHAR ) ] LITERAL PARSE 2DROP ; IMMEDIATE

: \ ( -- )                                  \ Ignore following text till the end of line.
  #TIB @ >IN ! ; IMMEDIATE

: CHAR ( -- c )                             \ Parse next word and return its first character.
  BL PARSE DROP C@ ;

: TOKEN ( -- a ; <string> )                 \ Parse a word from input stream and copy it to name dictionary.
  BL PARSE 1F MIN NP @ OVER - CELL- PACK$ ;
  
: WORD ( c -- a ; <string> )                \ Parse a word from input stream and copy it to code dictionary.
  PARSE HERE PACK$ ;

\ Dictionary search
: NAME> ( na -- ca )                        \ Return a code address given a name address.
  2 CELLS - @ ;

: SAME? ( a a u -- a a f \ -0+ )            \ Compare u cells in two strings. Return 0 if identical.
  FOR AFT OVER R@ CELLS + @
          OVER R@ CELLS + @ -  ?DUP
    IF R> DROP EXIT THEN THEN
  NEXT 0 ;

: find ( a va -- ca na | a F )              \ Search a vocabulary for a string. Return ca and na if succeeded.
  SWAP              \ va a
  DUP C@ 4 / tmp ! \ va a  \ get cell count
  DUP @ >R          \ va a  \ count byte & 1st char
  CELL+ SWAP        \ a' va
  BEGIN @ DUP       \ a' na na
    IF DUP @ [ =MASK ] LITERAL AND  R@ XOR \ ignore lexicon bits
      IF CELL+ -1 ELSE CELL+ tmp @ SAME? THEN
    ELSE R> DROP SWAP CELL- SWAP EXIT
    THEN
  WHILE 2 CELLS -   \ a' la
  REPEAT R> DROP SWAP DROP CELL- DUP NAME> SWAP ;

: NAME? ( a -- ca na | a F )                \ Search all context vocabularies for a string.
  CONTEXT  DUP 2@ XOR IF CELL- THEN >R  \ context<>also
  BEGIN R>  CELL+  DUP >R  @  ?DUP
  WHILE find  ?DUP
  UNTIL R> DROP EXIT THEN R> DROP  0 ;

\ Terminal response
: ^H ( bot eot cur -- bot eot cur )         \ Backup the cursor by one character.
  >R OVER R> SWAP OVER XOR
     IF 08 'ECHO @EXECUTE 1 - BL 'ECHO @EXECUTE  \ back, fill blank, and back again
        08 'ECHO @EXECUTE 
     THEN
  ;

: TAP ( bot eot cur c -- bot eot cur )      \ Accept and echo the key stroke and bump the cursor.
  DUP 'ECHO @EXECUTE OVER C! 1 + ;

: kTAP ( bot eot cur c -- bot eot cur )     \ Process a key stroke, CR or backspace.
  DUP 0D XOR
    IF 08 XOR 
      IF BL TAP 
      ELSE ^H 
      THEN EXIT
    THEN 
  DROP SWAP DROP DUP ;

: accept ( b u -- b u )                     \ Accept characters to input buffer. Return with actual count.
  OVER + OVER
  BEGIN 2DUP XOR
  WHILE KEY DUP BL 7F WITHIN  
    IF TAP ELSE 'TAP @EXECUTE THEN
  REPEAT DROP OVER - ;

: EXPECT ( b u -- )                         \ Accept input stream and store count in SPAN.
  'EXPECT @EXECUTE SPAN ! DROP ;

: QUERY  ( -- )                             \ Accept input stream to terminal input buffer.
  TIB 50 'EXPECT @EXECUTE #TIB !  DROP 0 >IN ! ;

\ Error handling
: CATCH ( ca -- 0 | err# )                  \ Execute word at ca and set up an error frame for it.
  SP@ >R  HANDLER @ >R  RP@ HANDLER !
  EXECUTE
  R> HANDLER !  R> DROP  0 ;

: THROW ( err# -- err# )                    \ Reset system to current local error frame an update error flag.
  HANDLER @ RP!  R> HANDLER !  R> SWAP >R SP! DROP R> ;

VARIABLE NULL$   0 NULL$ !

: ABORT ( -- )                              \ Reset data stack and jump to QUIT.
  NULL$ THROW ;

: _abort" ( f -- )                          \ Run time routine of ABORT" . Abort with a message.
  IF do$ THROW 
  THEN do$ DROP ; COMPILE-ONLY

\ The text interpreter
: $INTERPRET  ( a -- )                      \ Interpret a word. If failed, try to convert it to an integer.
  NAME? ?DUP
  IF @ [ =COMPILE-ONLY ] LITERAL AND
    ABORT" compile ONLY" EXECUTE EXIT
  THEN
  'NUMBER @EXECUTE
  IF EXIT THEN THROW ;

: [ ( -- )                                  \ Start the text interpreter.
  [ ' $INTERPRET ] LITERAL 'EVAL ! ; IMMEDIATE

: .OK ( -- )                                \ Display 'ok' only while interpreting.
  [ ' $INTERPRET ] LITERAL 'EVAL @ = 
    IF ."  ok" 
    THEN 
  CR ;

: ?STACK ( -- )                             \ Abort if the data stack underflows.
  DEPTH 0< ABORT" underflow" ;

: EVAL ( -- )                               \ Interpret the input stream.
  BEGIN TOKEN DUP C@
  WHILE 'EVAL @EXECUTE ?STACK
  REPEAT DROP 'PROMPT @EXECUTE ;

\ Shell
: PRESET ( -- )                             \ Reset data stack pointer and the terminal input buffer.
  SP0 @ SP!  [ =TIB ] LITERAL #TIB CELL+ ! ;

: xio ( a a a -- )                          \ Reset the I/O vectors 'EXPECT, 'TAP, 'ECHO and 'PROMPT.
  [ ' accept ] LITERAL 'EXPECT !
  'TAP !  'ECHO !  'PROMPT ! ;

: FILE ( -- )                               \ Select I/O vectors for file download.
  [ ' PACE ] LITERAL [ ' DROP ] LITERAL [ ' kTAP ] LITERAL XIO ;

: HAND ( -- )                               \ Select I/O vectors for terminal interface.
  [ ' .OK  ] LITERAL 'EMIT @ [ ' kTAP ] LITERAL XIO ;

 CREATE I/O  ' ?RX ,   ' TX! ,               \ defaults

: CONSOLE ( -- )                            \ Initiate terminal interface.
  I/O 2@ '?KEY 2! HAND ;

: QUIT ( -- )                               \ Reset return stack pointer and start text interpreter.
  PRESET CONSOLE                            \ Added for READ and OK
  RP0 @ RP!
  BEGIN [COMPILE] [
    BEGIN QUERY [ ' EVAL ] LITERAL CATCH ?DUP
    UNTIL ( a)
    'PROMPT @ SWAP
    CONSOLE  NULL$ OVER XOR
    IF SPACE COUNT TYPE ." ?" THEN
    [ ' .OK ] LITERAL XOR
    IF 1B EMIT THEN
    PRESET
  AGAIN ;

\ The compiler
: ' ( -- ca )                               \ Search context vocabularies for the next word in input stream.
  TOKEN NAME? IF EXIT THEN THROW ;

: ALLOT ( n -- )                            \ Allocate n bytes to the code dictionary.
  CP +! ;

: , ( w -- )                                \ Compile an integer into the code dictionary.
  HERE ALIGNED DUP CELL+ CP ! ! ;

: [COMPILE] ( -- ; <string> )               \ Compile the next immediate word into code dictionary.
  ' , ; IMMEDIATE

: COMPILE ( -- )                            \ Compile the next address in colon list to code dictionary.
  R> DUP @ , CELL+ >R ; COMPILE-ONLY

: LITERAL ( w -- )                          \ Compile tos to code dictionary as an integer literal.
  COMPILE doLIT , ; IMMEDIATE

: $," ( -- )                                \ Compile a literal string up to next " .
  [ CHAR " ] LITERAL WORD COUNT + ALIGNED CP ! ;

: RECURSE ( -- )                            \ Make the current word available for compilation.
  LAST @ NAME> , ; IMMEDIATE

\ Structures
: FOR ( -- a )                              \ Start a FOR-NEXT loop structure in a colon definition.
  COMPILE >R HERE ; IMMEDIATE

: BEGIN ( -- a )                            \ Start an infinite or indefinite loop structure.
  HERE ; IMMEDIATE

: NEXT ( a -- )                             \ Terminate a FOR-NEXT loop structure.
  COMPILE _next , ; IMMEDIATE

: UNTIL ( a -- )                            \ Terminate a BEGIN-UNTIL indefinite loop structure.
  COMPILE ?branch , ; IMMEDIATE

: AGAIN ( a -- )                            \ Terminate a BEGIN-AGAIN infinite loop structure.
  COMPILE  branch , ; IMMEDIATE

: IF ( -- A )                               \ Begin a conditional branch structure.
  COMPILE ?branch HERE 0 , ; IMMEDIATE

: AHEAD ( -- A )                            \ Compile a forward branch instruction.
  COMPILE branch HERE 0 , ; IMMEDIATE

: REPEAT ( A a -- )                         \ Terminate a BEGIN-WHILE-REPEAT indefinite loop.
  [COMPILE] AGAIN HERE SWAP ! ; IMMEDIATE

: THEN ( A -- )                             \ Terminate a conditional branch structure.
  HERE SWAP ! ; IMMEDIATE

: AFT ( a -- a A )                          \ Jump to THEN in a FOR-AFT-THEN-NEXT loop the first time through.
  DROP [COMPILE] AHEAD [COMPILE] BEGIN SWAP ; IMMEDIATE

: ELSE ( A -- A )                           \ Start the false clause in an IF-ELSE-THEN structure.
  [COMPILE] AHEAD SWAP [COMPILE] THEN ; IMMEDIATE

: WHILE ( a -- A a )                        \ Conditional branch out of a BEGIN-WHILE-REPEAT loop.
  [COMPILE] IF SWAP ; IMMEDIATE

: ABORT"      ( -- ; <string> )             \ Conditional abort with an error message.
  COMPILE _abort" $," ; IMMEDIATE

: $" ( -- ; <string> )                      \ Compile an inline string literal.
  COMPILE $"| $," ; IMMEDIATE

: ." ( -- ; <string> )                      \ Compile an inline string literal to be typed out at run time.
  COMPILE ."| $," ; IMMEDIATE

\ Name compiler
: ?UNIQUE ( a -- a )                        \ Display a warning message if the word already exists.
  DUP NAME? 
    IF ."  reDef " OVER .$ 
    THEN 
  DROP ;

: $,n ( na -- )                             \ Build a new dictionary name using the string at na.
  DUP C@
  IF ?UNIQUE
    ( na) DUP LAST ! \ for OVERT
    ( na) HERE ALIGNED SWAP
    ( cp na) CELL-
    ( cp la) CURRENT @ @
    ( cp la na') OVER !
    ( cp la) CELL- DUP NP ! ( ptr) ! EXIT
  THEN ABORT" name" ;

\ FORTH compiler
: $COMPILE ( a -- )                         \ Compile next word to code dictionary as a token or literal.
  NAME? ?DUP
  IF C@ [ =IMMEDIATE ] LITERAL AND
    IF EXECUTE ELSE , THEN EXIT
  THEN
  'NUMBER @EXECUTE
  IF [COMPILE] LITERAL EXIT
  THEN THROW ;

: OVERT ( -- )                              \ Link a new word into the current vocabulary.
  LAST @ CURRENT @  ! ;

: ; ( -- )                                  \ Terminate a colon definition.
  COMPILE EXIT [COMPILE] [ OVERT ; COMPILE-ONLY IMMEDIATE

: ] ( -- )                                  \ Start compiling the words in the input stream.
  [ ' $COMPILE ] LITERAL 'EVAL ! ;

: call, ( ca -- )                           \ Assemble a call instruction to ca.
  HERE CELL+ CELL+ - 4 / FFFFFF AND [ =CALL ] LITERAL OR , ; 

: : ( -- ; <string> )                       \ Start a new colon definition using next word as its name.
  TOKEN $,n [ ' doLIST ] LITERAL CALL, ] ;

: IMMEDIATE ( -- )                          \ Make the last compiled word an immediate word.
  [ =IMMEDIATE ] LITERAL LAST @ C@ OR LAST @ C! ;

\ Defining words
: USER ( u -- ; <string> )                  \ Compile a new user variable.
  TOKEN $,n [ ' doLIST ] LITERAL CALL, OVERT COMPILE doUSER , ;

: CREATE ( -- ; <string> )                  \ Compile a new array entry without allocating code space.
  TOKEN $,n [ ' doLIST ] LITERAL CALL, OVERT COMPILE doVAR ;

: VARIABLE ( -- ; <string> )                \ Compile a new variable initialized to 0.
  CREATE 0 , ;

\ Tools
: _TYPE ( b u -- )                          \ Display a string. Filter non-printing characters.
  FOR 
    AFT COUNT >CHAR EMIT THEN 
  NEXT DROP ;

: dm+ ( a u -- a )                          \ Dump u bytes from a, leaving a+u on the stack.
  OVER 4 U.R SPACE 
  FOR 
    AFT COUNT 3 U.R THEN 
  NEXT ;
 
: DUMP ( a u -- )                           \ Dump u bytes from a, in a formatted manner.
  BASE @ >R HEX  10 /
  FOR CR 10 2DUP dm+ ROT ROT 2 SPACES _TYPE NUF? 0 = WHILE
  NEXT ELSE R> DROP THEN DROP  R> BASE ! ;

: .S ( ... -- ... )                         \ Display the contents of the data stack.
  CR DEPTH FOR AFT R@ PICK . THEN NEXT ."  <tos" ;

: !CSP ( -- )                               \ Save stack pointer in CSP for error checking.
  SP@ CSP ! ;

: ?CSP ( -- )                               \ Abort if stack pointer differs from that saved in CSP.
  SP@ CSP @ XOR ABORT" stack depth" ;

: >NAME ( ca -- na | F )                    \ Convert code address to a name address.
  CURRENT
    BEGIN CELL+ @ ?DUP WHILE 2DUP
      BEGIN @ DUP WHILE 2DUP NAME> XOR
      WHILE 1 CELLS -
      REPEAT      THEN SWAP DROP ?DUP
    UNTIL 
  SWAP DROP SWAP DROP EXIT THEN 0 SWAP DROP ;

: .ID ( na -- )                             \ Display the name at address.
  ?DUP IF COUNT 001F AND TYPE EXIT THEN ." {noName}" ;

\ : SEE ( -- ; <string> )                     \ A simple decompiler.
\                $COLON  3,'SEE',SEE

: WORDS ( -- )                              \ Display the names in the context vocabulary.
  CR  CONTEXT @
  BEGIN @ ?DUP
  WHILE DUP SPACE .ID 1 CELLS -  NUF?
  UNTIL DROP THEN ;

: READ ( -- )
  PAD 100 +
  BEGIN 
    KEY 
     DUP 5C =
          IF DROP 20 BEGIN KEY 0D = UNTIL THEN
     DUP 0D =
          IF DROP 20 THEN
     DUP 0A =
          IF DROP 20 THEN
     DUP 1A XOR
    WHILE OVER C! 1 +
  REPEAT DROP 
  PAD 100 + - SPAN ! ;
  
: OK ( -- )
  PAD 100 + #TIB 4 + ! SPAN @ #TIB ! 0 >IN !
  EVAL QUIT ;

\ Hardware reset
VARIABLE VER    100 VER ! 

: hi ( -- )                                 \ Display the sign-on message of eForth.
  !IO \ initialize IO device & sign on
  CR ." ARM7eForth v1.0"
  ; COMPILE-ONLY

CREATE 'BOOT    ' hi ,                      \ application vector

: COLD ( -- )                               \ The hilevel cold start sequence.
  BEGIN 
    ROM_USER [ =UPP ] LITERAL ROM_USER_SIZE @ 
    CMOVE
    INTO-LOCAL CONSOLE
    PRESET 'BOOT @EXECUTE
    FORTH CONTEXT @ DUP
    CURRENT 2! OVERT
    QUIT
  AGAIN ;

   
   




