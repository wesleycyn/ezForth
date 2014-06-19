\ asm arg

create 	a1$	512 allot	
create 	a2$	512 allot	
create 	a3$	512 allot	  
create 	a4$	512 allot

: arg	( --- kiss )
		0x0a word count a1$ place
		a1$ count ascii ; scan temp$ place 		\ 眔爹秆 
		a1$ c@ temp$ c@ - a1$ c!	  		\ 眔把计	
		a1$ count ascii , scan a2$ place	\ だ瞒 材蛤把计		
		a1$ c@ a2$ c@ - a1$ c!		\ 眔 材把计
		a1$ dup count BL skip rot place			\ 	材把计繷
		a1$ dup count  -trailing rot place		\ 	材把计Ю			
		a2$ dup count ascii , skip rot place		\ 	材把计繷
		a2$ count ascii , scan a3$ place	\ だ瞒 材蛤把计
		a2$ c@ a3$ c@ - a2$ c!		\ 眔 材把计
		a2$ dup count  -trailing rot place		\ 	材把计Ю			
		a3$ dup count ascii , skip rot place		\	材把计繷		
		a3$ dup count  -trailing rot place		\ 	材把计Ю
    ;

: AsmCode!
  ;

: AsmCode2!
   u.
  ;

: n4b11  ( m  -- n )
  8 lshift   \ 11-4+1 = 8
  ;
  
: n4b19  ( m  -- n )
  16 lshift   \ 19-4+1 = 16
  ;
  
: n1b20  ( m  -- n )
  20 lshift   \ 20-1+1 = 20
  ;  

: $>reg ( adr count  --- n )
  1 - swap
  1 + swap
  number?
  drop drop
  ;

\ Thumb2 
\ ADC

: ADC_<Rd4b11>,<Rn4b19> ( -- )
  0xF1400000                   \ Code_ADC
  0  n1b20                  or \ 0 S1b20    
  A1$ count $>reg ( dup rd ! ) n4b11 or \ a$1---> Rd4b11
  A2$ count $>reg ( dup rn ! ) n4b19 or \ a$2---> Rn4b19
  AsmCode2! 
 ;
    

: _ADC ( -- )
	arg 
  ADC_<Rd4b11>,<Rn4b19>
 ;

: ADC	( --- )
	state @ 
	if
   \ _ADC [COMPILE]  .case
  else
   _ADC
  then
  ; IMMEDIATE	 
    
\s

\ asm arg

create 	a1$	512 allot	
create 	a2$	512 allot	
create 	a3$	512 allot	  
create 	a4$	512 allot

: arg	( --- kiss )
		0x0a word count a1$ place
		a1$ count ascii ; scan temp$ place 		\ 眔爹秆 
		a1$ c@ temp$ c@ - a1$ c!	  		\ 眔把计	
		a1$ count ascii , scan a2$ place	\ だ瞒 材蛤把计		
		a1$ c@ a2$ c@ - a1$ c!		\ 眔 材把计
		a1$ dup count BL skip rot place			\ 	材把计繷
		a1$ dup count  -trailing rot place		\ 	材把计Ю			
		a2$ dup count ascii , skip rot place		\ 	材把计繷
		a2$ count ascii , scan a3$ place	\ だ瞒 材蛤把计
		a2$ c@ a3$ c@ - a2$ c!		\ 眔 材把计
		a2$ dup count  -trailing rot place		\ 	材把计Ю			
		a3$ dup count ascii , skip rot place		\	材把计繷		
		a3$ dup count  -trailing rot place		\ 	材把计Ю
    ;

: AsmCode!
  ;

: AsmCode2!
  ;

: n4b11  ( m  -- n )
  8 lshift   \ 11-4+1 = 8
  ;
  
: n4b19  ( m  -- n )
  16 lshift   \ 19-4+1 = 16
  ;

: $>reg ( adr count  --- n )
  1 - swap
  1 + swap
  number?
  drop drop
  ;

\ Thumb2 
\ ADC

: ADC_<Rd4b11>,<Rn4b19> ( -- )
  0xF1400000                   \ Code_ADC
  0  n1b20                  or \ 0 S1b20    
  A$1 $>reg ( dup rd ! ) n4b11 or \ a$1---> Rd4b11
  A$2 $>reg ( dup rn ! ) n4b19 or \ a$2---> Rn4b19
  AsmCode2! 
 ;
    

: _ADC ( -- )
	arg 
	case
	 2 of  ADC_<Rd4b11>,<Rn4b19>  endof
	 3 of  ADC_<Rd4b11>,<Rn4b19>,#<I1b26:Imm3b14:imm8b7>	  endof
	endcase
    ?error
 ;

: ADC	( --- )
	state @ 
	if
   _ADC [COMPILE]  .case
  else
   _ADC
  then
  ; IMMEDIATE	  