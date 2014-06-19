CODE EXIT    ( -- )         \ Terminate a colon definition.
 [RP]->IP,RP+4->RP 
  $NEXT  \ NEST
END-CODE \ ;CODE

