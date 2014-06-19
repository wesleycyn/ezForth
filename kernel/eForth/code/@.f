CODE @ ( a -- w )           \ Push memory location to the data stack.
 [TOS]->TOS
  $NEXT  \ NEST
END-CODE \ ;CODE


