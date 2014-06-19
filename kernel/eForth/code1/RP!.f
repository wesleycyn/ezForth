CODE RP! ( a -- )           \ Set the return stack pointer.
 TOS->RP
 [SP]->TOS,SP+4->SP
  $NEXT  \ NEST
END-CODE \ ;CODE


