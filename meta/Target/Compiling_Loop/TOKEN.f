: TOKEN  ( -- addr )
        BEGIN   >IN @ T-IN !
                BL WORD  DUP C@ 0=
        WHILE   DROP REFILL  0= ABORT" end of file in definition"
        REPEAT  ?UPPERCASE ;