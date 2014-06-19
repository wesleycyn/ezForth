CODE doLIST  ( -- )         \ Colon word run-time code   
 ?RP+4->IP
 IP->[RP],RP+4->RP
 LP->IP 
  $NEXT  \ NEST
END-CODE \ ;CODE

