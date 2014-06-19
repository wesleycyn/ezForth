CODE P@ ( p -- w )          \ Push io port to the data stack.
 [TOs]->TOS
  $NEXT  \ NEST
END-CODE \ ;CODE

