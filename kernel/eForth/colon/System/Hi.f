: hi ( -- )                                 \ Display the sign-on message of eForth.
  !IO \ initialize IO device & sign on
  CR ." ARM7eForth v1.0"
  ; COMPILE-ONLY

CREATE 'BOOT    ' hi ,                      \ application vector