 : CALL,  ( taddr -- ) 
\  HERE-T CELL- DUP ORG @-T THERE [ ASSEMBLER ]  # ,BL [ META ] ;          \ call with link to taddr
 ;