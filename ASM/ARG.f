\ asm arg

create 	a1$	512 allot	
create 	a2$	512 allot	
create 	a3$	512 allot	  
create 	a4$	512 allot

: arg	( --- kiss )
		BL word count a1$ place
		\ ascii ; word count a1$ place    
		\ 0x0a word count a1$ place
        
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