: (FORWARD)  ( taddr -- )
    GET-CURRENT >R
    FORWARD-WORDLIST SET-CURRENT
    CREATE
      ,  ( taddr )
      FALSE , ( resolve flag )
      HERE FORWARD-LINK @ , FORWARD-LINK !
    DO-FORWARD
    R> SET-CURRENT ;