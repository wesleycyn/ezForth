CODE R@ ( -- w )           \ Copy top of return stack to the data stack.
  TOS->[SP],SP+4->SP
  [RP]->TOS
  $NEXT  \ NEST
END-CODE \ ;CODE 


