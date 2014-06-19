
CODE branch  ( -- )         \ Branch to an inline address.
 [IP]->IP
  $NEXT  \ NEST
END-CODE \ ;CODE
