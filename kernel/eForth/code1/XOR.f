CODE XOR ( w w -- w )      \ Bitwise exclusive OR.
 [SP]->WP,SP+4->SP
 TOS^WP->TOS
  $NEXT  \ NEST
END-CODE \ ;CODE

