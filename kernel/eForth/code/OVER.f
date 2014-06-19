CODE OVER ( w1 w2 -- w1 w2 w1 )             \ Copy second stack item to top.
 TOS->[SP],SP-4->SP  \ push TOS
 [SP+4]->TOS           \ TOS
  $NEXT  \ NEST
END-CODE \ ;CODE