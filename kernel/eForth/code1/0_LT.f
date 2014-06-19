CODE 0< ( n -- t )         \ Return true if n is negative.
 0->WP
 WP+TOS>>20->TOS 
  $NEXT  \ NEST
END-CODE \ ;CODE

