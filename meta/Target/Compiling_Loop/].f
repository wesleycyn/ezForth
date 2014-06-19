: ]   ( -- )
        STATE-T ON  IN-TRANSITION 
        BEGIN   IN-TRANSITION
                TOKEN FIND
                IF      EXECUTE
                ELSE    COUNT NUMBER?
                        IF      [TRANSITION] LITERAL 
                        ELSE    ." Test Point" CR
                                DROP T-IN @ >IN !
                                UNDEFINED ( create forward reference )
                        THEN
                THEN
                STATE-T @ 0=
        UNTIL   ;