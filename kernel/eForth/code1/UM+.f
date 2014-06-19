CODE UM+ ( w1 w2 -- w cy )                  \ Add two numbers, return the sum and carry flag.
  [SP]->WP
  TOS+WP->WP
  0->TOS
  TOS+Carry->TOS
  WP->[SP]
  $NEXT  \ NEST
END-CODE \ ;CODE
