IN-ASSEMBLER
variable ASM_Display_flag
0 ASM_Display_flag !

: AsmCode!
  ;

: AsmCode2!
\   u. cr
  ;

: AsmCode4!
\   u. cr
  ;



\ : n?b? ( m n b -- s )
\   swap
\   lshift
\   ;

: n1b20  ( m  -- n )
  1 and
  20 lshift   \ 20-1+1 = 20
  ;

: n2b5  ( m  -- n )
  3 and
  4 lshift   \ 5-2+1 = 4
  ;

: n3b2  ( m  -- n )
  7 and
             \ 2-3+1 = 0
  ;

: n3b4  ( m  -- n )
  7 and
  2 lshift   \ 4-3+1 = 2
  ;

: n3b5  ( m  -- n )
  7 and
  3 lshift   \ 5-3+1 = 3
  ;

: n3b6  ( m  -- n )
  7 and
  4 lshift   \ 6-3+1 = 4
  ;


: n3b8  ( m  -- n )
  7 and
  6 lshift   \ 8-3+1 = 6
  ;

: n3b10  ( m  -- n )
  7 and
  8 lshift   \ 10-3+1 = 8
  ;

: n4b3  ( m  -- n )
  15 and
             \ 3-4+1 = 0
  ;

: n4b6  ( m  -- n )
  0xf and
  3 lshift   \ 6-4+1 = 3
  ;


: n4b11  ( m  -- n )
  15 and
  8 lshift   \ 11-4+1 = 8
  ;

: n4b15  ( m  -- n )
  15 and
  12 lshift   \ 15-4+1 = 12
  ;

: n4b19  ( m  -- n )
  15 and
  16 lshift   \ 19-4+1 = 16
  ;

: n5b10  ( m  -- n )
  31 and
  6 lshift   \ 10-5+1 = 6
  ;

: n7b6  ( m  -- n )
  0x7f and
             \ 6-7+1 = 0
  ;

: n8b7  ( m  -- n )
  0xff and
             \ 7-8+1 = 0
  ;

: n8b10  ( m  -- n )
  255 and
  3 lshift   \ 10-8+1 = 3
  ;

: n12b11  ( m  -- n )
  4095 and
             \ 11-12+1 = 0
  ;




: $>reg ( adr count  -- n )
  1 - swap
  1 + swap
  number?
  drop drop
  ;


: $Rn>n ( adr -- n )
  find
  if
     execute
  else
     dup
     count IS-NUMBER?
     if
       count number?
       drop drop
     else
       drop ." error"
     then
  then
  ;

: $>imm5 ( adr count -- n )
  number?
  drop drop
  ;

: $>imm8 ( adr count -- n )
  number?
  drop drop
  ;

: $>imm12 ( adr count -- n )
  number?
  drop drop
  ;

: $>u ( adr count -- n )

  ;

: $>shift ( adr count -- n )

  ;



