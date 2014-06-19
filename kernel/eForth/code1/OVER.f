CODE OVER ( w1 w2 -- w1 w2 w1 )             \ Copy second stack item to top.

TOS->[SP+4]            \ push TOS
[SP+4]->TOS            \ TOS := [SP+4] 
TOS->[SP],SP+4->SP4    \ push TOS
[SP+4]->TOS            \ TOS := [SP+4]
  $NEXT  \ NEST
END-CODE \ ;CODE