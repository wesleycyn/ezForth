CODE SP@ ( -- a )               \ Push the current data stack pointer.
 TOS->[SP],SP-4->SP
 SP->TOS
  $NEXT  \ NEST
END-CODE \ ;CODE

