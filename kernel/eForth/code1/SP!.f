CODE SP! ( a -- )          \ Set the data stack pointer.
 TOS->SP
 [SP]->TOS,SP=4->SP
  $NEXT  \ NEST
END-CODE \ ;CODE
