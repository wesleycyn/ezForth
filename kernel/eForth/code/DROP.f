CODE DROP ( w -- )          \ Discard top stack item.
 [SP+4]->TOS
 [SP]->TOS,SP+4->SP
  $NEXT  \ NEST
END-CODE \ ;CODE

