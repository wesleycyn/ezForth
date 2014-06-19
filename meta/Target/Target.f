IN-META

( Define meta branching constructs )
  fload meta/Target/branching_constructs/_CONDITION.f
  fload meta/Target/branching_constructs/_&gt;MARK.f   
  fload meta/Target/branching_constructs/_&gt;RESOLVE.f
  fload meta/Target/branching_constructs/_&lt;TMARK.f   
  fload meta/Target/branching_constructs/_&lt;RESOLVE.f

( Meta compiler forward reference linking )
  VARIABLE FORWARD-LINK    0 FORWARD-LINK !
  fload meta/Target/forward_reference_linking/MAKE-CODE.f
  fload meta/Target/forward_reference_linking/LINK-BACKWARDS.f    
  fload meta/Target/forward_reference_linking/RESOLVED_.f
  fload meta/Target/forward_reference_linking/DO-FORWARD.f
  fload meta/Target/forward_reference_linking/(FORWARD).f    
  fload meta/Target/forward_reference_linking/FORWARD_.f    
  fload meta/Target/forward_reference_linking/UNDEFINED.f 

( Compile a code definition header )
  VARIABLE LAST-T     0 LAST-T !
  VARIABLE NP-T                                   
  NAME_BASE NP-T !                          \ initialize target name dictionary point
  fload meta/Target/code_definition_header/_WORD.f
  fload meta/Target/code_definition_header/HEADER.f  

( Meta compiler create target image )
  VARIABLE TARGET-LINK
  0 TARGET-LINK !
  fload meta\Target\target_image\DO-TARGET.f  
  fload meta\Target\target_image\TARGET-CREATE.f  
  fload meta\Target\target_image\RECREATE.f 
\   : CALL,  ( taddr -- ) 
\    HERE-T CELL- DUP ORG @-T THERE [ ASSEMBLER ]  # ,BL [ META ] ;

( Create target code words )
  fload meta\Target\code_words\INIT-ASSEMBLER.f      
  fload meta\Target\code_words\CODE.f
  fload meta\Target\code_words\CALL,.f

ASSEMBLER DEFINITIONS
  : END-CODE IN-META ;
  : C; END-CODE ;

META DEFINITIONS
  fload meta\Target\code_words\Late_References\comment.f
  fload meta\Target\code_words\FIND&EXECUTE.f
  fload meta\Target\code_words\DEFERED.f.f
  fload meta\Target\code_words\[TARGET].f
\  fload meta\Target\code_words\
 
( Find the next word in a single wordlist only )
  fload meta\Target\single_wordlist\DEFINED-IN.f
  fload meta\Target\single_wordlist\'T.f
  fload meta\Target\single_wordlist\'F.f
  fload meta\Target\single_wordlist\[FORWARD].f

( Define transition words, which behave like forth immediate words )
  fload meta\Target\transition_words\T_.f
  fload meta\Target\transition_words\T;.f
  fload meta\Target\transition_words\[TRANSITION].f
  fload meta\Target\transition_words\(.f
  fload meta\Target\transition_words\_.f
  fload meta\Target\transition_words\STRING,-T.f
  fload meta\Target\transition_words\__.f
  \ FORWARD: <(S")>
  \ T: S"    [FORWARD] <(S")>   STRING,-T   T;
  fload meta\Target\transition_words\ABORT_.f



( Define target vocabularies uh, wordlists )
  VARIABLE VOC-LINK-T
  FORWARD: <VOCABULARY>
  
  fload meta\Target\vocabularies\VOCABULARY.f
  
  $80       CONSTANT =IMMEDIATE
  $40       CONSTANT =COMPILE-ONLY
  $7F7F7F1F CONSTANT =MASK
  

  
  fload meta\Target\vocabularies\IMMEDIATE.f
  fload meta\Target\vocabularies\COMPILE-ONLY.f
  
  VARIABLE STATE-T
  
  fload meta\Target\vocabularies\[COMPILE].f
  fload meta\Target\vocabularies\&gt;BODY-T.f
  \ FORWARD: <(IS)>
  \ T: IS      [FORWARD] <(IS)>    T;
  \ :  IS    'T >BODY @ >BODY-T  2DUP !-T  8 + !-T ;
  \  ( patches both current and default value of defered word )

( Meta Compiler Resolve Forward References )

0 VALUE #UNRESOLVED

fload meta\Target\Resolve_Forward_References\_UNRESOLVED.f
fload meta\Target\Resolve_Forward_References\FIND-UNRESOLVED.f
fload meta\Target\Resolve_Forward_References\RESOLVE.f
fload meta\Target\Resolve_Forward_References\RESOLVES.f


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
  fload meta\Target\numbers\numbers.f
  
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
  fload meta\Target\Interpretive_words\,_.f   
  fload meta\Target\Interpretive_words\&gt;BODY.f      
  fload meta\Target\Interpretive_words\_.f

