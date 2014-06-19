CODE DUP ( w -- w w )                      \ Duplicate the top stack item.
 TOS->[SP],SP-4->SP
  $NEXT  \ NEST
END-CODE \ ;CODE
