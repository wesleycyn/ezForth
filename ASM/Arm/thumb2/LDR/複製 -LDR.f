\ LDR
\ LDR (immediate)
\ LDR (literal)
\ LDR (register)

\ LDR (immediate)

: LDR_<Rt>,[<Rn>,#<imm>] ( -- )
  0x6800
  A1$ count $>reg   n3b2 or 
  A3$ count $>reg   n3b5 or   
  A4$ count $>imm5  n5b10 or   
  AsmCode2!  
 ;

: LDR_<Rt>,[SP,#<imm>]
  0x9100
  A1$ count $>reg   n3b10 or  
  A4$ count $>imm8  n8b7 or   
  AsmCode2!  
 ;

: LDR.W_<Rt>,[<Rn>,#<imm12>]
  0xF8D00000
  A1$ count $>reg   n4b15 or
  A3$ count $>reg   n4b19 or    
  A4$ count $>imm8  n12b11 or   
  AsmCode2!  
 ;

: LDR_<Rt>,[<Rn>,#+/-<imm8>]
 ;
: LDR_<Rt>,[<Rn>],#+/-<imm8>
 ;
: LDR_<Rt4b15>,[<Rn4b19>,#+/-<imm8>]!
  ;


\ : LDR_<Rt>,[<Rn> {, #+/-<imm>}] ( -- )         \Offset: index==TRUE, wback==FALSE
\ : LDR_<Rt>,[<Rn>, #+/-<imm>]!   ( -- )        \ Pre-indexed: index==TRUE, wback==TRUE
\ : LDR_<Rt3b2>,[<Rn>], #+/-<imm>    ( -- )        \ Post-indexed: index==FALSE, wback==TRUE



: LDR_<Rt3b10>,[PC,#<imm8b7>] ( -- )
  0x4800
  A1$ count $>reg ( dup rt ! )  n3b10 or \ a$1---> Rt43b15
  A3$ count $>imm8              n8b10 or \ a$2---> Rn4b19  
  AsmCode2!  
  ;


: LDR.W_<Rt>,[PC,#+/-<imm12>] ( -- )
  0xF8BF0000
  A1$ count $>reg ( dup rt ! )  n4b15 or \ a$1---> Rt43b15
  A3$ count $>U      
  A4$ count $>imm12             n12b11 or \ a$4---> Rn4b19  
  AsmCode2!   
  ;


: LDR_<Rt3b2>,[<Rn3b5>,<Rm3b8>] ( -- )
  0x6800
  A3$ count $>reg ( dup rm ! ) n3b8 or \ a$3---> Rm3b8
  A2$ count $>reg ( dup rn ! ) n3b5 or \ a$2---> Rn3b5
  A1$ count $>reg ( dup rt ! ) n3b2 or \ a$1---> Rt3b2
  AsmCode4!
  ;

: LDR.W_<Rt4b15>,[<Rn4b19>,<Rm4b3>{,LSL#<shift2b5>}>] ( -- )
  0xF0600000
  A1$ count $>reg ( dup rt ! ) n4b15 or \ a$1---> Rt43b15
  A2$ count $>reg ( dup rn ! ) n4b19 or \ a$2---> Rn4b19
  A3$ count $>reg ( dup rm ! ) n4b3  or \ a$3---> Rm4b3
  A4$ count $>shift            n2b5  or \ a$4---> s2b5       
  AsmCode4!
  ;
 
: LDR.W_<Rt4b15>,[<Rn4b19>,<Rm4b3>] ( -- )
  0xF0600000
  A1$ count $>reg ( dup rt ! ) n4b15 or \ a$1---> Rt43b15
  A2$ count $>reg ( dup rn ! ) n4b19 or \ a$2---> Rn4b19
  A3$ count $>reg ( dup rm ! ) n4b3  or \ a$3---> Rm4b3
\  A4$ count $>shift  ( 0 )    n2b5  or \ a$4---> s2b5       
  AsmCode4!
  ; 
 
: LDR_BNF ( -- )

  ;

: LDR.W_BNF ( -- )
  ;




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

: _LDR ( -- )
	arg
  cr
  a1$ count type a1$ ." ::=" Rn?            \ 2dup   ." op1=" . ." Rn=" . cr   
\  .s
  2 *
\  .s
  a2$ count type a2$ ." ::=" [Rn]?          \ 2dup   ." op2=" . ." Rn=" . cr
  rot + 
\  .s
  8 *
\  .s
  a3$ count type a3$ ." ::=" Rn/Imm5/8]!?   \ 2dup   ." op3=" . ." Num=" . cr 
  rot +
  \ . . . .
  \ a4$ count type cr
  cr
  
  case
   0x1A of LDR_<Rt>,[<Rn>,#<imm5>] endof  
  
  endcase
\ "   LDR<c> <Rt>, [<Rn>, #<imm5>]"
\ "LDR<c> <Rt>,[<Rn>,#-<imm8>]"
\ "LDR<c> <Rt>,[<Rn>],#+/-<imm8>"
\ "LDR<c> <Rt>,[<Rn>,#+/-<imm8>]!"
\ "LDR<c> <Rt>,[<Rn>,#<imm>]"
\ "LDR<c> <Rt>,[SP,#<imm>]"
\ "LDR<c> <Rt>,[PC,#<imm>]"
\ "LDR<c> <Rt>,[<Rn>,<Rm>]"  
  
  ;  
  
  


: LDR	( --- )
	state @ 
	if
   \ _LDR [COMPILE]  .case
  else
   _LDR
  then
  ; IMMEDIATE	 
        
: _LDR.W ( -- )
	arg
  LDR.W_BNF
  case  
   1 of LDR.W_<Rt4b15>,[<Rn4b19>,<Rm4b3>{,LSL#<shift2b5>}>] endof
   2 of LDR.W_<Rt4b15>,[<Rn4b19>,<Rm4b3>] endof  
  
\ "LDR<c>.W <Rt>,[<Rn>,<Rm>{,LSL #<shift>}]"
\ "LDR<c>.W <Rt>,[PC,#+/-<imm12>]"
\ "LDR<c>.W <Rt>,[<Rn>,#<imm12>]"                 
  endcase
 ;    
    
: LDR.W	( --- )
	state @ 
	if
   \ _LDR.W [COMPILE]  .case
  else
   _LDR.W
  then
  ; IMMEDIATE
  
  
  \s
  
  (  
  LDR_BNF
  case 
\ "LDR<c> <Rt>,[<Rn>,#-<imm8>]"
\ "LDR<c> <Rt>,[<Rn>],#+/-<imm8>"
\ "LDR<c> <Rt>,[<Rn>,#+/-<imm8>]!"
\ "LDR<c> <Rt>,[<Rn>,#<imm>]"
\ "LDR<c> <Rt>,[SP,#<imm>]"
\ "LDR<c> <Rt>,[PC,#<imm>]"
\ "LDR<c> <Rt>,[<Rn>,<Rm>]"


\ LDR                            op=op1*32+op2*8+op3
LDR   <Rt>,   [<Rn>,    #<imm5>]"                   ( op1=0; op2=0; op3=0 )
LDR  <Rt>,    [<Rn>,    #-<imm8>]"                  ( op1=0; op2=0; op3=1 )
LDR  <Rt>,    [<Rn>,    #+/-<imm8>]!"             ( op1=0; op2=0; op3=2 )
LDR  <Rt>,    [<Rn>,     <Rm>]"                        ( op1=0; op2=0; op3=4 )
LDR   <Rt>,   [SP,         #<imm8>]"                   ( op1=0; op2=1; op3=5 )
LDR   <Rt>,    [PC,        #<imm8>]"                   ( op1=0; op2=2; op3=5 )
LDR   <Rt>,    [<Rn>],   #+/-<imm8>"               ( op1=0; op2=3; op3=6 )


   10 of LDR_<Rt3b2>,[<Rn3b5>,<Rm3b8>] endof                
  endcase
)  
 ;