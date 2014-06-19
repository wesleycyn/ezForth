: DO-FORWARD ( -- )
    DOES> 
      DUP RESOLVED?
        IF MAKE-CODE
        ELSE LINK-BACKWARDS 
        THEN
    ;