CODE R> ( -- w )                            \ Pop the return stack to the data stack.
  TOS->[SP+4]
  TOS->[SP],SP+4->SP
  [RP]->TOS,RP+4->RP
  $NEXT  \ NEST
END-CODE \ ;CODE



