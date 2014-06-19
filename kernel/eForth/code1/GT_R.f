CODE >R ( w -- )           \ Push the data stack to the return stack.
 TOS->[RP+4]
 TOS->[RP],RP+4->RP
 [SP]->TOS,SP+4->SP
  $NEXT  \ NEST
END-CODE \ ;CODE



