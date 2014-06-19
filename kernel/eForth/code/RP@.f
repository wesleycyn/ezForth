CODE RP@ ( -- a )           \ Push the current RP to the data stack.
 TOS->[SP],SP-4->SP
 RP->TOS
  $NEXT  \ NEST
END-CODE \ ;CODE
