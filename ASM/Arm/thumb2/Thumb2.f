0 CONSTANT r0
1 CONSTANT r1
2 CONSTANT r2
3 CONSTANT r3
4 CONSTANT r4
5 CONSTANT r5
6 CONSTANT r6
7 CONSTANT r7
8 CONSTANT r8
9 CONSTANT r9
10 CONSTANT r10
11 CONSTANT r11
12 CONSTANT r12
13 CONSTANT r13
14 CONSTANT r14
15 CONSTANT r15


R14 CONSTANT SP
R15 CONSTANT PC


0x19 CONSTANT op_<Rd4b11>,<Rn4b19>,<Rm4b3> 
0x30 CONSTANT op_<Rt4b15>,[<Rn4b19>]
18 CONSTANT op_<Rdn3b2>,<Rm3b5>
26 CONSTANT op_<Rd4b11>,<Rn4b19>,#<i1b26+imm8b7> 

: Rn? ( str$ -- n/str$ f )
  find 
  if 
     execute 1 
   \  ." op=" . ." Rn=" . cr     
  else 
     ." error" 0 
   \  ." op=" . ." Rn=" . cr       
  then 
  ;  


: [Rn]? ( str$ -- op )
  count s" [" search  
  if
    ascii [ skip temp$ place
    temp$ count s" ]" search
    if
     drop drop
     \ 去 ]  
     temp$ @ 1 - temp$ c!
     temp$ Rn?  
 \    ." [Rn] "  
     3 +
 \    ." op2=" . ." Rn=" . cr
    else
     drop drop    
     temp$ Rn?  
      if 
        dup 8 >
       if
        dup 
        case
         14 of 
           \   ." (SP) " 
              2 
           \   ." op2=" . ." Rn=" . cr              
            endof 
         15 of 
           \  ." (PC) " 
             3
           \  ." op2=" . ." Rn=" . cr 
             endof
        endcase
       else
       \ ." (R0~R7) "    
        1
       \ ." op2=" . ." Rn=" . cr
       then     
      else
       0
      then
    then
  else
  \ drop 1 - Rn? 
  drop
     ." error" 0 
  then
   
 
 ;
  


: Imm5/8?  ( str$ -- )
 \  count type 
 dup count s" -" search 
 if
  drop drop
  count number?
  if
   drop 
   4 
  \ 2dup ." OK4! op3=" . ." Num=" . cr      
  else
   0 
  \ ." op3=" . ." error!" . cr  
  then 
 else
  number?
  if
   drop   
   dup 32 >
   if 
    swap drop     
    3 
   \ 2dup ." OK3! op3=" . ." Num=" . cr \ 沒測出 
   else
    swap   drop  
    2 
   \ 2dup ." OK2! op3=" . ." Num=" . cr  
   then 
  else
   0 
  \ ." op3=" . ." error!" . cr  
  then     
 then 

  ;

: Rn/Imm5/8?  ( str$ -- )
  \ 10 dump
 dup
 count s" #" search 
 if
  drop drop \ type
    \ 去 #  op+=#
  count  ascii # skip temp$ place
  temp$ \ count type
  Imm5/8? 
 else
    drop drop 
    Rn? 
  \  2dup ." OKR! op3=" . ." Rn=" . cr
 then 
  ;

: Rn/Imm5/8]? ( str$ -- )
 \ 10 dump
 dup
 count s" ]" search 
 if
  drop drop \ type
    \ 去 ]  op+=]
    dup dup c@ 1 - swap c!
 else
    drop drop 
    \ op+=no] 
 then
    Rn/Imm5/8?
 ;

: Rn/Imm5/8]!? ( str$ -- op )
  dup 
  count s" !" search 
   if 
    drop drop \ type 
    \ 去 !  op+=!
    dup dup c@ 1 - swap c!
    Rn/Imm5/8]?   
    4 +
   else
    drop drop
    \ op+=no!
   Rn/Imm5/8]?    
   then

  ;

: Rn/Imm8? ( str$ -- op )

 ;
 
: Rn/Imm8/7? ( str$ -- op )

 ;

: Rn/Imm7? ( str$ -- op )

 ;


: Rn/Imm12? ( str$ -- op )

 ;

: Rn/Imm12/type2imm5? ( str$ -- op )

 ;






: <Rt3b10>,[SP,#<imm8b7>] ( BaseCode op1 op2 op3 -- <HexCode> )
  >R
  n8b7 
  swap drop 
  swap n3b10 or  
  R> or
  AsmCode2! 
  ;

: <Rt3b2>,[<Rn3b5>,#<imm5b10>] ( BaseCode op1 op2 op3 -- <HexCode> )
  >R
  n5b10 swap
  n3b5 or swap   
  n3b2 or
  R> or
  AsmCode2!    
 ;

: <Rt3b10>,[PC,#<imm8b7>] ( BaseCode op1 op2 op3 -- <HexCode> )
  >r
  n8b7
  swap drop 
  swap n3b10 or  
  r> or
  AsmCode2!  
  ;


: <Rt4b15>,[<Rn4b19>,#+/-<imm8b7>] ( BaseCode op1 op2 op3 -- <HexCode> )
  ;
  
: <Rt4b15>,[<Rn4b19>,#+/-<imm8b7>]! ( BaseCode op1 op2 op3 -- <HexCode> )
  >R
  n8b7 
  swap n4b19 or
  swap n4b15 or  
  R> or
  AsmCode4!
  ;
  
: <Rt4b15>,[<Rn4b19>],#+/-<imm8b7> ( BaseCode op1 op2 op3 -- <HexCode> )
  >R
  n8b7 
  swap n4b19 or
  swap n4b15 or  
  R> or
  AsmCode4!
  ;
  
: <Rt4b15>,[<Rn4b19>,#-<imm8b7>] ( BaseCode op1 op2 op3 -- <HexCode> )
  >R
  n8b7 
  swap n4b19 or
  swap n4b15 or  
  R> or
  AsmCode4!
  ;
  
: <Rt3b2>,[<Rn3b5>,<Rm3b8>] ( BaseCode op1 op2 op3 -- <HexCode> )
  >R
  n3b8 
  swap n3b5 or
  swap n3b8 or  
  R> or
  AsmCode2! 
  ;

: <Rt3b2>,[<Rn3b5>,<Rm3b8>] ( BaseCode op1 op2 op3 -- <HexCode> )
  >R
  n3b8 
  swap n3b5 or
  swap n3b8 or  
  R> or
  AsmCode2! 
  ;

: <Rd3b2>,<Rn3b5>,#<imm3b8> ( BaseCode op1 op2 op3 -- <HexCode> )
  >R
  n3b5 
  swap n3b8 or
  swap drop
  R> or
  AsmCode2!   
  ;
  
: <Rdn3b10>,#<imm8b7>       ( BaseCode op1 op2 op3 -- <HexCode> )
  >R
  n3b10   
  swap n8b7 or
  swap drop  
  R> or
  AsmCode2!   
  ;
  
: <Rd3b2>,<Rn3b5>,<Rm3b8>            ( BaseCode op1 op2 op3 -- <HexCode> )
  >R
  n3b2   
  swap n3b5 or  
  swap n3b8 or  
  R> or
  AsmCode2!   
  ;
  
: <Rdn3b2>,<Rm3b6>          ( BaseCode op1 op2 op3 -- <HexCode> )
  >R
  n3b2  
  swap n3b6 or
  swap drop  
  R> or
  AsmCode2!   
  ;
  
: <Rd3b10>,SP,#<Imm8b7>     ( BaseCode op1 op2 op3 -- <HexCode> )
  >R
  n3b10
  swap drop    
  swap n8b7 or  
  R> or
  AsmCode2!   
  ;
  
: SP,SP,#<Imm7b6>           ( BaseCode op1 op2 op3 -- <HexCode> )
  >R
  drop
  drop    
  swap n7b6 or
  R> or
  AsmCode2!   
  ;
  
: <Rdm3b2>,SP,<Rdm3b2>      ( BaseCode op1 op2 op3 -- <HexCode> )
  >R
  n3b2
  swap drop    
  swap n3b2 or   
  R> or
  AsmCode2!   
  ;
 
: SP,<Rm4b6>                ( BaseCode op1 op2 op3 -- <HexCode> )
  >R
  drop
  drop    
  swap n4b6 or   
  R> or
  AsmCode2!   
  ;

: <Rd4b11>,<Rn4b19>,#<Imm1b26+Imm3b14+Imm8b7>            ( BaseCode op1 op2 op3 -- <HexCode> )
  >R

  R> or
  AsmCode2!   
  ;

: <Rd4b11>,<Rn4b19>,<Rm4b3>{,type2b5_#imm3b14+imm2b7}    ( BaseCode op1 op2 op3 -- <HexCode> )
  >R

  R> or
  AsmCode2!   
  ;

: <Rd4b11>,SP,#<Imm1b26+Imm3b14+Imm8b7>                  ( BaseCode op1 op2 op3 -- <HexCode> )
  >R

  R> or
  AsmCode2!   
  ;

: <Rd4b11>,SP,<Rm4b3>{,type2b5_#imm3b14+imm2b7}          ( BaseCode op1 op2 op3 -- <HexCode> )
  >R

  R> or
  AsmCode2!   
  ;
  
: i1b26+imm3b14+imm8b7 ( m -- n )  
  ;

: <Rd4b11>,<Rn4b19>,#<i1b26+imm8b7> ( BaseCode op3 op2 op1 -- <HexCode> )
  >R
  n8b7       \ i1b26+imm8b7
  swap n4b19 or
  swap n4b11 or
  R> or
  AsmCode2!   
  ;

: <Rdn3b2>,<Rm3b5> ( BaseCode op1 op2 op3 -- <HexCode> )
  >R

  R> or
  AsmCode2!   
  ;
  
  
: <Rd4b11>,<Rn4b19>,<Rm4b3>{,type2b5_imm3b14+imm2b7} ( BaseCode op1 op2 op3 op4 -- <HexCode> )
  >R

  R> or
  AsmCode4! 

  ;

: <Rd4b11>,<Rn4b19>,<Rm4b3> ( BaseCode op1 op2 op3 -- <HexCode> )
  >R
  n4b11   
  swap n4b19 or  
  swap n4b3 or  
  R> or
  AsmCode4! 
  ;
  
: <Rt4b15>,[<Rn4b19>] ( BaseCode op3 op2 op1 -- <HexCode> )
  >R
  
  drop
  n4b19
     
  swap  n4b15 or  

  R> or
  AsmCode4! 
  ;
  
: <D1b7Rd3b2>,<Rm4b6>  ( BaseCode op3 op2 op1 -- <HexCode> )
  >R
  drop
  n4b6
  swap  
   dup  7 >
   if
    n3b2 0x80 or  
   else
    n3b2   
   then
   or 
  R> or
  AsmCode2! 
  ;
  
  
: <Rd3b10>,#<imm8b7> ( BaseCode op3 op2 op1 -- <HexCode> )
  >R
  
  drop
  n8b7
     
  swap  n3b10 or  

  R> or
  AsmCode4! 
  ;
     