CODE OR ( w w -- w )        \ Bitwise inclusive OR.
 [SP]->WP,SP+4->SP
 TOS|WP->TOS
  $NEXT  \ NEST
END-CODE \ ;CODE