: RESOLVE   ( taddr cfa -- )
        >BODY   2DUP TRUE OVER CELL+ !   @
        BEGIN   DUP
        WHILE   2DUP @-T   -ROT SWAP !-T
        REPEAT  2DROP  !   ;