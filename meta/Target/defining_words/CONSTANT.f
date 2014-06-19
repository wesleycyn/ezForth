


: CONSTANT   ( n -- )
        RECREATE  [TARGET] DOLIST CALL, 
        [TARGET] DOCON  DUP ,-T   
        CONSTANT ;




\s
: CONSTANT  ( -- )
        RECREATE  [TARGET] DOLIST CALL, [TARGET] 
        DOVAR HERE-T CONSTANT  ;
\s
: CONSTANT   ( n -- )
        RECREATE  [TARGET] DOLIST CALL, 
        [TARGET] DOCON  DUP ,-T   
        CONSTANT ;