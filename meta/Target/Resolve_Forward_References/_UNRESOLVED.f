: .UNRESOLVED   ( -- )
        0 TO #UNRESOLVED
        FORWARD-LINK
        BEGIN   @ DUP
        WHILE   DUP 2 CELLS - RESOLVED? 0=
                IF      DUP 2 CELLS - BODY> .NAME  ( *SYSDEP* )
                        1 +TO #UNRESOLVED
                THEN
                START/STOP
        REPEAT  DROP
        #UNRESOLVED
        IF      CR ." !!!!!! There were: " #UNRESOLVED . ." words Unresolved !!!!!!"
                3 0 DO BEEP 300 MS LOOP
        ELSE    CR ." *** No words Unresolved ***"
        THEN    ;