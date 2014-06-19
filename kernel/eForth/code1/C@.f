CODE C@ ( b -- c )          \ Push byte memory location to the data stack.
  byte[TOS]->TOS
  $NEXT  \ NEST
END-CODE \ ;CODE


