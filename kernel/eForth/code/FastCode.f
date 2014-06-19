CODE UM* ( u1 u2 -- udl udh )               \ Unsigned multiply. Return double product.
  [] WP, SP                     ,LDR        \ WP := u1
  XP, TOS, TOS, WP              ,UMULL      \ TOS:XP := TOS*WP
  [] XP, SP                     ,STR        \ [SP] := XP(udl)
  $NEXT  \ NEST
END-CODE \ ;CODE

