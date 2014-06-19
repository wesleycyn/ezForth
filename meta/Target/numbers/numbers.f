: NUMBER?  ( addr len -- n f )
        OVER C@ [CHAR] - =              \ leading minus sign?
        DUP >R IF  1 /STRING  THEN
        0 0 2SWAP >NUMBER 0= NIP NIP  ( -- u f )
        R> IF SWAP NEGATE SWAP THEN ;