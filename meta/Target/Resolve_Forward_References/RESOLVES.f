: RESOLVES   ( taddr -- )
        FIND-UNRESOLVED
        IF      .NAME ." Already Resolved"   DROP  ( *SYSDEP* )
        ELSE    RESOLVE
        THEN   ;