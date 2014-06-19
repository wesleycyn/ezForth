CODE EXECUTE ( ca -- )      \ Execute the word at ca.
 TOS->WP
 [SP]->TOS,SP=4->SP 
 JMP[WP]
 \ $NEXT  \ NEST
END-CODE \ ;CODE



