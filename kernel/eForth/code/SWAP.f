CODE SWAP ( w1 w2 -- w2 w1 )   \ Exchange top two stack items.
 [SP]->TOS
 TOS->[SP]
 WP->TOS
  $NEXT  \ NEST
END-CODE \ ;CODE
