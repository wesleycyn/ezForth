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
  fload meta\Target\code_words\DEFERED.f
  fload meta\Target\code_words\[TARGET].f
  fload meta\Target\code_words\
 
( Find the next word in a single wordlist only )
  fload meta\Target\single_wordlist\DEFINED-IN.f
  fload meta\Target\single_wordlist\'T.f
  fload meta\Target\single_wordlist\'F.f
  fload meta\Target\single_wordlist\[FORWARD].f

( Define transition words, which behave like forth immediate words )
  fload meta\Target\transition_words\T:.f
  fload meta\Target\transition_words\T;.f
  fload meta\Target\transition_words\[TRANSITION].f
  fload meta\Target\transition_words\(.f
  fload meta\Target\transition_words\_.f
  fload meta\Target\transition_words\STRING,-T.f
  fload meta\Target\transition_words\__.f
  \ FORWARD: <(S")>
  \ T: S"    [FORWARD] <(S")>   STRING,-T   T;
  fload meta\Target\transition_words\ABORT_.f