	AREA _plasma, CODE, READONLY
		GET	Define\Define.s		;
		GET	Boot\Boot.s 		
;		GET	ForthBase\GbaForth.s	; GBA-Forth OS Defing
		
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;		符式系統 GBA-Forth V1.2004.12.15 張燕南著
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;	暫存器
;			R0~3	: 不受中斷影響,但FORTH也不保護
;       	R4~8    : USER 可使用,但需 PushReg & PopReg 來保護
;			R8		:
;			R9		:
;			r10		:
;			R11		: 
;			R12		: Forth 的資疊指標
;       	R13(SP) : ARM7 SP 返回堆疊指標
;       	R14(LR) : ARM7 副程式返回,Link Call 用,Forth 的IP
;       	R15(PC) : ARM7 程序計數
;       	CPSR	: ARM7(System&USER Mode)狀態 		
		
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
; NEXT
        MACRO
 NEXT   
        MOV    pc, lr
        MEND    
;        
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;        
; NEST
        MACRO
 NEST        
	STMDB	SP!,{LR}	; PUSH LR TO [RP]
	MEND
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
; UNNEST
        MACRO
 UNNEST        
	LDMIA	SP!,{LR}	; POP [RP] TO LR
	NEXT
	MEND
	
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
; EXECUTE
	MACRO
 EXECUTE
        LDMIA	SP!,{PC}         ; jmp [w] PC->LR           
	NEXT
	MEND	
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
; LIT	
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
; 編譯
        MACRO	
 LIT    $p1    
        BL     LIT_CODE
        DCD	$p1
        MEND 
; 頭區
        
; 身區           
LIT_CODE
    LDR     R0,[LR]
	stmdb	r12!,{R0}				
	add		LR,LR,#4	
	NEXT		
		
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
; DROP
       MACRO
 DROP      
       BL       DROP_CODE
       MEND
DROP_CODE
	
	ldmia	r12!,{R0}	 
	NEXT		
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;	
; 冒號定義詞    		
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
        MACRO
 Cold        
        BL      Cold_CODE 
        MEND

Cold_CODE
         NEST
         LIT   1234
         DROP
	UNNEST		
				
Start
	mov 	r0, #Cpu_Mode_IRQ:OR:0x80:OR:0x40	; Disable interrupts
	msr 	CPSR_c, r0		; Enable IRQ mode
	ldr 	r13,=0x03007FA0	; 設定IRQ 的 堆疊位址為 0x03007FA0
	
;	ldr	r0,=REG_INTERRUPT	 ; 設定中斷服務程式 起始位址
;	ldr	r1,=ServiceInterrupt
;	str	r1,[r0]
					;
    MOV     R0, #0x1F               ;
    MSR     CPSR_c, R0              ;

    LDR     SP,=0x03007000          ; 設定資疊 SP 為 0x03007000      
				       				;
    LDR     r10,=0x03006000         ;設定迴疊 r10 位址為 0x03006000       
        

        
        MOV     r12, #0		 	; 執行 cold  
        MOV     r11, #0                                                            
        LDR     r8,=Cold_CODE   			; PUSH Cold_CFA
        STMDB   sp!,{r8}                        
        EXECUTE

		LTORG
			      		
		END