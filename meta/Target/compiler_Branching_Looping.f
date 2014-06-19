( Meta compiler Branching & Looping )
  fload meta\Target\Branching&Looping\IF.f
  fload meta\Target\Branching&Looping\THEN.f
  fload meta\Target\Branching&Looping\ELSE.f
  fload meta\Target\Branching&Looping\BEGIN.f
  fload meta\Target\Branching&Looping\AGAIN.f
  fload meta\Target\Branching&Looping\UNTIL.f
  fload meta\Target\Branching&Looping\WHILE.f
  fload meta\Target\Branching&Looping\REPEAT.f
  fload meta\Target\Branching&Looping\FOR.f
  fload meta\Target\Branching&Looping\NEXT.f
  fload meta\Target\Branching&Looping\AFT.f
  fload meta\Target\Branching&Looping\_DO.f
  fload meta\Target\Branching&Looping\DO.f
  fload meta\Target\Branching&Looping\LOOP.f
  fload meta\Target\Branching&Looping\+LOOP.f

( Meta compiler literals )
  fload meta\Target\literals\LITERAL.f
  fload meta\Target\literals\[CHAR].f
  fload meta\Target\literals\['].f


( Meta compiler defining words )
  fload meta\Target\defining_words\USER.f
  fload meta\Target\defining_words\CREATE.f
  fload meta\Target\defining_words\VARIABLE.f
  fload meta\Target\defining_words\CONSTANT.f
  
  FORTH VARIABLE DEFER-LIST-T META
  
  fload meta\Target\defining_words\DEFER.f

\ FORWARD: <(;CODE)>

\ T: ;CODE   ( -- addr )
\        [FORWARD] <(;CODE)>   HERE-T
\        STATE-T OFF   IN-META
\        INIT-ASSEMBLER T;

\ T: DOES>     ( -- addr )
\        [FORWARD] <(;CODE)>   HERE-T                   \        [TARGET] DODOES CALL,   T;

( Identify numbers single numbers only )
  fload meta\Target\numbers
  
( Meta Compiler Compiling Loop. )
  FORTH VARIABLE T-IN META
  fload meta\Target\Compiling_Loop\TOKEN.f
  fload meta\Target\Compiling_Loop\].f
  fload meta\Target\Compiling_Loop\[.f
  fload meta\Target\Compiling_Loop\;.f
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
  fload meta\Target\Interpretive_words\!.f    
  fload meta\Target\Interpretive_words\'.f    
  fload meta\Target\Interpretive_words\,.f    
  fload meta\Target\Interpretive_words\W,.f   
  fload meta\Target\Interpretive_words\C,.f   
  fload meta\Target\Interpretive_words\HERE.f 
  fload meta\Target\Interpretive_words\ALLOT.f
  fload meta\Target\Interpretive_words\,".f   
  fload meta\Target\Interpretive_words\&gt;BODY.f
  fload meta\Target\Interpretive_words\_.f
