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








