: IMMEDIATE   ( -- )
        LAST-T @  DUP C@-T =IMMEDIATE OR  ( Precedence Bit )  SWAP C!-T ;