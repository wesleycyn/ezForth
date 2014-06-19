CODE doLIT  ( -- w )                        \ Push an inline literal.
 TOS->[SP],SP+4->SP
 [IP]->TOS,IP+4->IP
  $NEXT  \ NEST
END-CODE \ ;CODE
