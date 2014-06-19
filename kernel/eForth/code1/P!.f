CODE P! ( w p -- )          \ Pop the data stack to io port.
 [SP]->WP,SP+4->SP
 WP->[TOS]
 [SP]->TOS,SP+4->SP 
  $NEXT  \ NEST
END-CODE \ ;CODE


