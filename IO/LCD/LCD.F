\ Copyright (c) 2001 by Blueputer Technology Inc.
\ All rights reserved 
\
\ ARM7EXT.F   19NOV01 created by Wuja.
\
\ ARM7eForth extension file for drivers of LCD and Keyboard. 
\
\ V1.00,   19NOV01WUJA,  Create.  
\ 

HEX

: PD0-OUT ( -- )
  80000043 DUP C@ FE AND SWAP C! ;

: PD0-ON ( -- )
  80000003 DUP C@ 1 OR SWAP C! ;
  
: PD0-OFF ( -- )
  80000003 DUP C@ FE AND SWAP C! ;


\ Key Matrix
\
\           A0  A1  A2  A3  A4  A5  A6  A7  E0  E1  E2  E3  E4  E5  E6   E7   
\        +--------------------------------------------------------------------+  
\     C0 | esc   1 Tab CpL   `  Sp ArL ArU ArD ArR ShL Ctl  Fn LAlt RAlt ShR  |
\     C1 |  F5   6   T   G   B   /   ;   P   - F10                            |
\     C2 |  F4   5   R   F   V Del   '   [   = Num                            |
\     C3 |  F3   4   E   D   C Ins       ]  BS Prt                            |
\     C4 |  F2   3   W   S   X     Ret   \     ScL                            |
\     C5 |  F1   2   Q   A   Z End PgD PgU  Hm Brk                            |
\     C6 |  F6   7   Y   H   N   .   L   O   0  F9                            |
\     C7 |  F7   8   U   J   M   ,   K   I   9  F8                            |
\

: C, ( n -- ) HERE 1 ALLOT C! ; 

CREATE NORMAL-KEY-ASCII
      1B C, 31 C, 09 C, 00 C, 60 C, 20 C, 00 C, 00 C,         \ SEGMENT 0
      00 C, 00 C, 00 C, 00 C, 00 C, 00 C, 00 C, 00 C,         \ SEGMENT 1
      00 C, 36 C, 54 C, 47 C, 42 C, 2F C, 3B C, 50 C,         \ SEGMENT 2
      2D C, 00 C, 00 C, 00 C, 00 C, 00 C, 00 C, 00 C,         \ SEGMENT 3
      00 C, 35 C, 52 C, 46 C, 56 C, 7F C, 27 C, 5B C,         \ SEGMENT 4
      3D C, 00 C, 00 C, 00 C, 00 C, 00 C, 00 C, 00 C,         \ SEGMENT 5
      00 C, 34 C, 45 C, 44 C, 43 C, 00 C, 00 C, 5D C,         \ SEGMENT 6
      08 C, 00 C, 00 C, 00 C, 00 C, 00 C, 00 C, 00 C,         \ SEGMENT 7
      00 C, 33 C, 57 C, 53 C, 58 C, 00 C, 0D C, 5C C,         \ SEGMENT 8
      00 C, 00 C, 00 C, 00 C, 00 C, 00 C, 00 C, 00 C,         \ SEGMENT 9
      00 C, 32 C, 51 C, 41 C, 5A C, 00 C, 00 C, 00 C,         \ SEGMENT A
      00 C, 00 C, 00 C, 00 C, 00 C, 00 C, 00 C, 00 C,         \ SEGMENT B
      00 C, 37 C, 59 C, 48 C, 4E C, 2E C, 4C C, 4F C,         \ SEGMENT C
      30 C, 00 C, 00 C, 00 C, 00 C, 00 C, 00 C, 00 C,         \ SEGMENT D
      00 C, 38 C, 55 C, 4A C, 4D C, 2C C, 4B C, 49 C,         \ SEGMENT E
      39 C, 00 C, 00 C, 00 C, 00 C, 00 C, 00 C, 00 C,         \ SEGMENT F

CREATE KEY-ARRAY 10 ALLOT   

VARIABLE SYSCON1-REG      80000100 SYSCON1-REG !
VARIABLE KEY-SCAN-MASK    FFFFFFF0 KEY-SCAN-MASK !
VARIABLE PORTA-DATA       80000000 PORTA-DATA !
VARIABLE PORTA-DIR        80000040 PORTA-DIR ! 
VARIABLE PORT-EXT         30000000 PORT-EXT !
VARIABLE CONTROL-KEY             0 CONTROL-KEY !

: SCAN-OFF ( -- )
  SYSCON1-REG @ DUP P@
  KEY-SCAN-MASK @ AND
  2 OR SWAP P! ;

: INIT-KEYBOARD ( -- )
  00 PORTA-DIR @ C! 
  SCAN-OFF ;

: SCAN-LINE-ON ( n -- )
  SYSCON1-REG @ SWAP OVER P@ 
  KEY-SCAN-MASK @ AND
  SWAP 8 + OR 
  SWAP P! ;
  
: WAIT ( n -- )
  FOR NEXT ;

: SCAN-ONE-SEGMENT ( n -- bit )
  2 /MOD SCAN-LINE-ON
    IF PORT-EXT @ C@ 
    ELSE PORTA-DATA @ C@
    THEN
  SCAN-OFF ;   

: GET-BIT ( n -- bit-index true | 0 )
  7 FOR 
    2 /MOD SWAP
      IF DROP 7 R> - 1 EXIT
      THEN
    NEXT 
  ;     

: CHECK-CHANGE ( bit index -- bit-index true | 0 )
  KEY-ARRAY + C@ XOR GET-BIT ;

: SAVE-CHANGE ( index -- )
  DUP SCAN-ONE-SEGMENT 
  SWAP KEY-ARRAY + C! ; 

: TO-ASCII ( bit-index index -- c )
  8 * NORMAL-KEY-ASCII + + C@ ; 

: TO-SHIFT ( ascii -- shift-ascii )
  DUP 27 = IF DROP 22 EXIT THEN              \ "
  DUP 2D = IF DROP 5F EXIT THEN              \ _
  DUP 30 = IF DROP 29 EXIT THEN              \ )
  DUP 31 = IF DROP 21 EXIT THEN              \ !
  DUP 32 = IF DROP 40 EXIT THEN              \ @
  DUP 36 = IF DROP 5E EXIT THEN              \ ^
  DUP 37 = IF DROP 26 EXIT THEN              \ &
  DUP 38 = IF DROP 2A EXIT THEN              \ *
  DUP 39 = IF DROP 28 EXIT THEN              \ (
  DUP 3B = IF DROP 3A EXIT THEN              \ :
  DUP 3D = IF DROP 2B EXIT THEN              \ +
  DUP 60 = IF DROP 7E EXIT THEN              \ ~
  DUP 2C 30 WITHIN IF 10 + EXIT THEN         \ < > ?
  DUP 33 36 WITHIN IF 10 - EXIT THEN         \ # $ %
  DUP 5B 5E WITHIN IF 20 + EXIT THEN         \ { | } 
  DUP 41 5B WITHIN IF 20 + EXIT THEN ;       \ english letter

: REFLASH-CONTROL-KEY ( -- ) 
  KEY-ARRAY 
  DUP C@ 08 AND 
                IF CONTROL-KEY DUP @ 01 XOR SWAP ! 
                THEN                                \ check CAPS-LOCK key
  DUP 1 + C@ 84 AND                                 \ check both SHIFT keys 
                IF CONTROL-KEY DUP @ 02 OR SWAP !
                ELSE CONTROL-KEY DUP @ FFFFFFFD AND SWAP !
                THEN
  DROP ;              

: SCAN-TEST ( -- )
  BEGIN
    F FOR 
        R@ SCAN-ONE-SEGMENT DUP
          IF DROP R@ SCAN-ONE-SEGMENT ?DUP THEN       \ scan again for debounce
          IF R@ CHECK-CHANGE
            IF R@ SAVE-CHANGE
               REFLASH-CONTROL-KEY
               CR ." KEY IS:" 
               CONTROL-KEY @ 03 AND SWAP
               OVER 00 = IF R@ TO-ASCII DUP 41 5B WITHIN
                           IF TO-SHIFT THEN
                        THEN   
               OVER 01 = IF R@ TO-ASCII THEN
               OVER 02 = IF R@ TO-ASCII DUP 41 5B WITHIN NOT
                           IF TO-SHIFT THEN
                        THEN   
               OVER 03 = IF R@ TO-ASCII TO-SHIFT THEN
               EMIT DROP             
            THEN
          THEN
         R@ SAVE-CHANGE
      NEXT          
    ?KEY 
  UNTIL DROP ;

VARIABLE SEGMENT-INDEX           0 SEGMENT-INDEX ! 
  
: NEXT-SEGMENT ( -- n ) 
  SEGMENT-INDEX DUP @ 10 =
    IF 0 1
    ELSE DUP @ DUP 1 +
    THEN
  ROT ! ;  

: ?RX-LOCAL ( -- c T | F )
  NEXT-SEGMENT >R
  R@ SCAN-ONE-SEGMENT DUP
    IF DROP R@ SCAN-ONE-SEGMENT ?DUP THEN       \ scan again for debounce
      IF R@ CHECK-CHANGE
        IF R@ SAVE-CHANGE
           REFLASH-CONTROL-KEY
           CONTROL-KEY @ 03 AND SWAP
           OVER 00 = IF R@ TO-ASCII DUP 41 5B WITHIN
                       IF TO-SHIFT THEN
                    THEN   
           OVER 01 = IF R@ TO-ASCII THEN
           OVER 02 = IF R@ TO-ASCII DUP 41 5B WITHIN NOT
                       IF TO-SHIFT THEN
                    THEN   
           OVER 03 = IF R@ TO-ASCII TO-SHIFT THEN
           SWAP DROP DUP
           0 = IF R> 2DROP 0 
               ELSE -1 R> DROP 
               THEN EXIT   
           \ EMIT DROP             
        THEN
      THEN
     R@ SAVE-CHANGE
  R> DROP 0 ;         

VARIABLE LCDCON-REG   800002C0 LCDCON-REG !
VARIABLE PALLSW-REG   80000580 PALLSW-REG !
VARIABLE PALMSW-REG   80000540 PALMSW-REG !
VARIABLE FBADDR-REG   80001000 FBADDR-REG !

: PD1-OUT ( -- )
  80000043 DUP C@ FD AND SWAP C! ;
  
: PD2-OUT ( -- )
  80000043 DUP C@ FB AND SWAP C! ;

: PD3-OUT ( -- )
  80000043 DUP C@ F7 AND SWAP C! ;

: LCD-DCDC-ON ( -- )
  80000003 DUP C@ 2 OR SWAP C! ;
  
: LCD-DCDC-OFF ( -- )
  80000003 DUP C@ FD AND SWAP C! ;

: LCD-POWER-ON ( -- )
  80000003 DUP C@ 4 OR SWAP C! ;
  
: LCD-POWER-OFF ( -- )
  80000003 DUP C@ FB AND SWAP C! ;
  
: LCD-BL-ON ( -- )
  80000003 DUP C@ 8 OR SWAP C! ;
  
: LCD-BL-OFF ( -- )
  80000003 DUP C@ F7 AND SWAP C! ;

: LCD-ENABLE ( -- )
  PD1-OUT PD2-OUT PD3-OUT
  76543210 ( 77777778 ) PALLSW-REG @ !
  FEDCBA98 ( 77777777 ) PALMSW-REG @ ! 
  F01CF2BF ( 000004AF ) LCDCON-REG @ ! ;  \ one bit pixel grey scale
   
: LCD-ON ( -- )   
  SYSCON1-REG @ DUP @ 1000 OR SWAP ! 
  LCD-POWER-ON
  LCD-DCDC-ON ;
  
: LCD-OFF ( -- )  
  LCD-DCDC-OFF
  LCD-POWER-OFF 
  SYSCON1-REG @ DUP @ FFFFEFFF AND SWAP ! ;
  
: LCD-CLS ( -- )
  C0000000 12C00 88 ( 4B00 00 ) FILL ;

VARIABLE CURSOR-X                0 CURSOR-X !
VARIABLE CURSOR-Y                0 CURSOR-Y !
VARIABLE ASCII-PATTERN    00008000 ASCII-PATTERN !

: CURSOR-ON ( -- )
  F FOR 
    CURSOR-Y @ 1400 ( 500 ) * R@ 140 ( 50 ) * + CURSOR-X @  4 * +
    C0000000 + 4 77 FILL ( FF SWAP C! )
    NEXT ;
   
: CURSOR-OFF ( -- )
  F FOR 
    CURSOR-Y @ 1400 ( 500 ) * R@ 140 ( 50 ) * + CURSOR-X @ 4 * +
    C0000000 + 4 88 FILL ( 00 SWAP C! )
    NEXT ;
    
: PRINT-PIXEL ( x y color -- )
  >R 14 * OVER 2 / + C0000000 + DUP C@
  ROT 2 MOD  
    IF 0F AND R> 10 *     
    ELSE F0 AND R> 
    THEN OR
  SWAP C! ;

CREATE BYTE-BUFFER 4 ALLOT
CREATE DOT-PATTERN
88 C, 78 C, 87 C, 77 C,  
  
: PRINT-BYTE ( x y byte -- )
   3 FOR
      4 /MOD SWAP DOT-PATTERN + C@
       BYTE-BUFFER R@ + C!
     NEXT DROP
   140 * SWAP 2 / + C0000000 + 
   BYTE-BUFFER SWAP 4 CMOVE ;  

\ : PRINT-CHAR ( ascii -- )
\   7 FOR 
\       DUP 8 * ASCII-PATTERN @ + R@ + C@ DUP
\       CURSOR-X @ 8 * CURSOR-Y @ 10 * R@ 2 * + ROT 
\       PRINT-BYTE
\       CURSOR-X @ 8 * CURSOR-Y @ 10 * R@ 2 * 1 + + ROT 
\       PRINT-BYTE
\      NEXT
\   DROP ;

\ : PRINT-CHAR ( ascii -- )
\   8 * 00008000 +  
\   CURSOR-X @ 8 * CURSOR-Y @ 500 * C0000000 +
\   7 FOR
\       2DUP SWAP R@ + SWAP
\       R@ A0 * + 2DUP C!
\       50 + C!
\     NEXT
\   DROP DROP ;    

: PRINT-CHAR ( ascii -- )
  20 * 00008800 + 
  CURSOR-X @ 4 * CURSOR-Y @ 1400 * + C0000000 +
  7 FOR
      2DUP SWAP R@ 4 * + SWAP
      R@ 280 * + 2DUP 4 CMOVE
      140 + 4 CMOVE
    NEXT
  DROP DROP ;    

: PRINT-TEST ( -- )
  0 CURSOR-Y !
  E FOR 
      0 CURSOR-X !
      4F FOR
           41 4F R@ - + PRINT-CHAR
           CURSOR-X DUP @ 1 + SWAP !
         NEXT
      CURSOR-Y DUP @ 1 + SWAP !
    NEXT 
  ;         
    
: SCROLL-LCD ( n -- )
  >R R@ 1400 ( 500 ) * C0000000 + 
  C0000000 F R@ - 1400 ( 500 ) * CMOVE
  F R@ - 1400 ( 500 ) * C0000000 + R> 1400 ( 500 ) * 88 ( 00 ) FILL
  ;
  
: TX!-LOCAL ( c -- )
  CURSOR-OFF
  >R
  \ R@ 00 = IF R> DROP EXIT THEN  
  R@ 08 =
  R@ 0A = OR 
  R@ 0D = OR
    IF
      R@ 08 =   
        IF
          CURSOR-OFF
          CURSOR-X DUP @ 1 - SWAP !
          CURSOR-X @ 0<
            IF 0 CURSOR-X ! THEN  
        THEN   
      R@ 0A =   
        IF 0 CURSOR-X !
        THEN   
      R@ 0D =  
        IF CURSOR-Y DUP @ 1 + SWAP !
           0 CURSOR-X ! 
        THEN
      R> DROP
    ELSE   
      R> PRINT-CHAR
      CURSOR-X DUP @ 1 + SWAP !
    THEN
  CURSOR-X @ 50 = 
    IF CURSOR-Y DUP @ 1 + SWAP !
       0 CURSOR-X !
    THEN   
  CURSOR-Y @ F =
    IF 1 SCROLL-LCD
       CURSOR-Y DUP @ 1 - SWAP !
    THEN
  CURSOR-ON  
  ;          
           
: SPEED-UP ( -- )
  80002200 DUP @ 06 OR SWAP ! ;

: INTO-LOCAL ( -- )
  PD0-OUT
  PD0-ON
  SPEED-UP
  INIT-KEYBOARD
  LCD-ENABLE
  LCD-ON
  LCD-CLS
  LCD-BL-ON
  [ ' ?RX-LOCAL ] LITERAL I/O !
  [ ' TX!-LOCAL ] LITERAL I/O 4 + ! ;

: LOCAL-IO ( -- )
  INTO-LOCAL
  CR ." Change to local terminal..." CR
  QUIT ;

: REMOTE-IO ( -- )
  [ ' ?RX ] LITERAL I/O ! 
  [ ' TX! ] LITERAL I/O 4 + ! 
  CR ." Change to remote terminal..." CR
  QUIT ;