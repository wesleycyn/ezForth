: COLD ( -- )                               \ The hilevel cold start sequence.
  BEGIN
    ROM_USER [ =UPP ] LITERAL ROM_USER_SIZE @
    CMOVE
    INTO-LOCAL CONSOLE
    PRESET 'BOOT @EXECUTE
    FORTH CONTEXT @ DUP
    CURRENT 2! OVERT
    QUIT
  AGAIN ;