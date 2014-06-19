CODE C@ ( b -- c )          \ Push byte memory location to the data stack.
  [TOS].b->TOS
  $NEXT  \ NEST
END-CODE \ ;CODE


