CODE C! ( c b -- )          \ Pop the data stack to byte memory.
  [SP]->WP,SP+4->SP
  WP->[TOS]
  [SP]->TOS,SP+4->SP
  $NEXT  \ NEST
END-CODE \ ;CODE


