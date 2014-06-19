;		GET	Boot\Boot.s         

;
;       外部記憶區:	            0x02-000000 ~ 0x02-03FFFF ( 256K bytes )	 
;		       監督螢幕區 : 0x02-009FFF ~ 0x02-008000 
;		           詞典區 : 0x02-007FFF ~ 0x02-000000
;
;	內部記憶區:                 0x03-000000 ~ 0x03-007FFF ( 32K Bytes )
;         Interrupt Begin Address : 0x03-007FFF ~ 0x03-007FFC
;     	     Interrupt Check Flag : 0x03-007FFB ~ 0x03-007FF8   		
;		   Allocated Area : 0x03-007FF7 ~ 0x03-007FF4     		
;     	     Sound Buffer Address : 0x03-007FF3 ~ 0x03-007FF0
;	           Allocated Area : 0x03-007FEF ~ 0x03-007FE0
;	                   SP_SVC : 0x03-007FDF ~ 0x03-007FA0
;	                   SP_IRQ : 0x03-007F9F ~ 0x03-007F00
;	                   SP_USR : 0x03-007EFF ~ 0x03-007000 ( 多工用 )
;	               資疊堆疊區 : 0x03-006FFF ~ 0x03-006000   
;		       返回堆疊區 : 0x03-005FFF ~ 0x03-004000  
;	   Interrupt Program Text : 0x03-003FFF ~ 0x03-000000  
;
; 	I/O_BASE : 0x04-000000 ~ 0x04-000300
;
;	VRAM_BASE : 0x06-000000 ~ 0x06-17FFF  
;
;	Pak_ROM_BASE : 0x08-000000 ~ 0x09-FFFFFF ( 32M Bytes , Flash ROM )
;
;	Pak_SRAM_BASE : 0x0E-000000 ~ 0x0E-00FFFF ( 128K Bytes, 8bits wide,帶電池 )
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;



;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

; PUSHPA			; 將 R0-R8 內容 放入迴疊中
	MACRO
 PUSHPA
	STMDB	R10!,{R0-R8}	
	MEND
	
; POPPA				; 自迴疊中取回 R0-R8 內容,
	MACRO
 POPPA
	LDMIA	R10!,{R0-R8}	
	MEND



;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;				
;	已建立的 GBA-Forth 的 詞 列表			
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;		
;	程序類 : NEST ,UNNEST 
;       堆疊類 : DROP ,DUP 
;	資移類 : wMOVE ,PwPut(PW!) ,PPut(P!) ,PwGet (PW@), PGet(P@)
;	邏輯類 : Greater ,Equal ,Smaller ,NotEqual ,LogicAND ,LogicOR
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;	                    
;                 
;; GbaForth 基本詞令 身區

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
; DUP     
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;                
       MACRO
 DUP
                BL       DUP_CODE
       MEND

DUP_CODE		
                ldmia	sp!,{R0}	 
		STMDB	sp!,{R0}
		STMDB	sp!,{R0}
		NEXT
			

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
; :CODE WMOVE ( FORM COUNT TO )   2001/12/12 
; input arg:    r0      address of original screen background data
;               r1      bytes of data (length)
;               r2      starting address of VRAM
;.......................................
       MACRO
 wMove      
       BL       wMove_CODE
       MEND
wMove_CODE
        
	LDMIA	SP!,{R0,r1,r2}		
	mov	r4, # 0	    
WMOVE_loop			
	ldrh	r3, [r2], # 2							
	strh	r3, [r0], # 2							
       	add	r4, r4, # 1								
       	cmp	r4, r1
        bne     WMOVE_loop
        NEXT        
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
; :CODE MOVE ( FORM COUNT TO )   2001/12/12 
; input arg:    r0      address of original screen background data
;               r1      bytes of data (length)
;               r2      starting address of VRAM
; 以 字元為單位 作 區塊搬移
;.......................................
       MACRO
 Move      
       BL       Move_CODE
       MEND
Move_CODE
        
	LDMIA	SP!,{R0,r1,r2}		
	mov	r4, # 0	    
MOVE_loop			
	ldrh	r3, [r2], # 2							
	strh	r3, [r0], # 2							
       	add	r4, r4, # 1								
       	cmp	r4, r1
        bne     MOVE_loop
        NEXT
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
; PwPut ( word Rn --- )
       MACRO
 PwPut      
       BL       PwPut_CODE
       MEND
PwPut_CODE      	
		ldmia   SP!,{r0}	
		LDMIA	SP!,{r1}
		strh	r1,[r0]	
		NEXT    		
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
; PPut ( dword Rn --- )
       MACRO
 PPut      
       BL       PPut_CODE
       MEND
PPut_CODE      	
		ldmia   SP!,{r0}	
		LDMIA	SP!,{r1}
		str	r1,[r0]	
		NEXT
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
; PwGet (  Rn --- n ) 
       MACRO
 PwGet      
       BL       PwGet_CODE
       MEND
PwGet_CODE
		ldmia   SP!,{r0}
		mov	r1,#0	
		ldrh	r1,[r0]	
		stmdb	SP!,{r1}
		NEXT
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
; PGet (  Rn --- n ) 
       MACRO
 PGet      
       BL       PGet_CODE
       MEND
PGet_CODE      	
		ldmia   SP!,{r0}	
		ldr	r1,[r0]	
		stmdb	SP!,{r1}
		NEXT
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
; > Greater ( n1 n2 --- n1>n2|T )      
       MACRO
 Greater      
       BL       Greater_CODE
       MEND
Greater_CODE
		ldmia   SP!,{r2}	
		LDMIA	SP!,{r1}
		cmp	r1,r2
		bgt	Greater_gt				
		mov	r0,#0
		b	Greater_end		
Greater_gt	mov	r0,#-1			
Greater_end		
		stmdb	SP!,{R0}
		NEXT	
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
; < Smaller ( n1 n2 --- n1<n2|T ) 
       MACRO
 Smaller      
       BL       Smaller_CODE
       MEND
Smaller_CODE     	
		ldmia   SP!,{r2}	
		LDMIA	SP!,{r1}
		cmp	r1,r2
		blt	Smaller_lt				
		mov	r0,#0
		bl	Smaller_end		
Smaller_lt	mov	r0,#-1			
Smaller_end		
		stmdb	SP!,{R0}
		NEXT         
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
; = Equal ( n1 n2 ---  n1=n2|T )
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;; 
       MACRO
 Equal      
       BL       Equal_CODE
       MEND
Equal
        	ldmia   SP!,{r2}	
		LDMIA	SP!,{r1}
		cmp	r1,r2
		beq	Equal_eq				
		mov	r0,#0
		b	Equal_end		
Equal_eq	mov	r0,#-1			
Equal_end		
		stmdb	SP!,{R0}
		NEXT
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
; <> NotEqual ( n1 n2 ---  n1<>n2|T )
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;; 
       MACRO
 NotEqual      
       BL       NotEqual_CODE
       MEND
NotEqual_CODE
          	ldmia   SP!,{r2}	
		LDMIA	SP!,{r1}
		cmp	r1,r2
		beq	NotEqual_eq				
		mov	r0,#0
		b	NotEqual_end		
NotEqual_eq	mov	r0,#-1			
NotEqual_end		
		stmdb	SP!,{R0}					
		NEXT       
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;  LogicAND ( n1 n2 ---  n1 and n2 ) 
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
       MACRO
 LogicAND      
       BL       LogicAND_CODE
       MEND
       
LogicAND_CODE
         	ldmia   SP!,{r1,r2}	
		and	r0,r1,r2
		stmdb	SP!,{R0}					
		NEXT   	
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;  LogicOR ( n1 n2 ---  n1 or n2 ) 
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
       MACRO
 LogicOR
                BL       LogicOR_CODE
       MEND

LogicOR_CODE
                ldmia   sp!,{r1,r2}			
		orr	r0,r1,r2
		stmdb	sp!,{R0}
		NEXT      	
                    
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;  Addition ( n1 n2 ---  n1 + n2 ) 
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
        MACRO
 Addition        
        BL      Addition_CODE 
        MEND

Addition_CODE       
        ldmia   sp!,{r1,r2}			
		add	r0,r1,r2
		stmdb	sp!,{R0}
		NEXT
                    			       


;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;			
		LTORG	            
		END
;;;;;;;;;;;;;;; 待建的 Forth 基本詞令 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;





					
	

		
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
; Scan	
				
		NEXT
skip				