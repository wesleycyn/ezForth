CODE P@ ( p -- w )          \ Push io port to the data stack.
 [TOS]->TOS
  $NEXT  \ NEST
END-CODE \ ;CODE

