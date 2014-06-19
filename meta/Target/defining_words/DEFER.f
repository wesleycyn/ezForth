: DEFER   ( -- )
        TARGET-CREATE   [TARGET] DODEFER 
        0 ,-T
        HERE-T  DEFER-LIST-T @ ,-T  DEFER-LIST-T !
        0 ,-T  ;