: FIND&EXECUTE  ( addr len wordlist -- ? )
        SEARCH-WORDLIST 0= ABORT" Target word not found"  EXECUTE ;