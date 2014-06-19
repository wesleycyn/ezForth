: .WORD ( taddr -- )
  . SPACE >IN @ BL WORD COUNT TYPE >IN ! CR  ;

\ : .'CODE ( -- )
\   CODEE @ .HEAD CONSTANT  
\   DOES>  ( -- )
\     @ ,WORD ;

\ : .'USER  ( -- )
\   CODEE @ .HEAD CONSTANT  
\   DOES>  ( -- )
\     @ ;