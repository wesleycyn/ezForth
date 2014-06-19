0xF800      constant Mark_B_#<Imm11b10>
0xE000      constant code_B_#<Imm11b10>

0xFF00      constant Mark_B<cond4b11>_#<Imm8b7>
0xD000      constant code_B<cond4b11>_#<Imm8b7>  

0xD000      constant code_BEQ_#<Imm8b7> 
0xD100      constant code_BNE_#<Imm8b7>
0xD200      constant code_BCS_#<Imm8b7>
0xD300      constant code_BCC_#<Imm8b7>
0xD400      constant code_BMI_#<Imm8b7>
0xD500      constant code_BPL_#<Imm8b7>
0xD600      constant code_BVS_#<Imm8b7>
0xD700      constant code_BVC_#<Imm8b7>
0xD800      constant code_BHI_#<Imm8b7>
0xD900      constant code_BLS_#<Imm8b7>
0xDA00      constant code_BGE_#<Imm8b7>
0xDB00      constant code_BLT_#<Imm8b7>
0xDC00      constant code_BGT_#<Imm8b7>
0xDD00      constant code_BLE_#<Imm8b7>
0xDE00      constant code_B_#<Imm8b7>






\ EQ
: _BEQ ( -- )
  arg
  ?Arg_#<Imm8b7>|#<Imm11b10>
  case
   code_Arg_#<Imm8b7>   of code_BEQ_#<Imm8b7>   #<Imm8b7>   endof                     
  endcase
;

\ NE
: _BNE ( -- )
  arg
  ?Arg_#<Imm8b7>|#<Imm11b10>
  case
   code_Arg_#<Imm8b7>   of code_BNE_#<Imm8b7>   #<Imm8b7>   endof                     
  endcase
;

\ CS
: _BCS ( -- )
  arg
  ?Arg_#<Imm8b7>|#<Imm11b10>
  case
   code_Arg_#<Imm8b7>   of code_BCS_#<Imm8b7>   #<Imm8b7>   endof                     
  endcase
;

\ CC
: _BCC ( -- )
  arg
  ?Arg_#<Imm8b7>|#<Imm11b10>
  case
   code_Arg_#<Imm8b7>   of code_BCC_#<Imm8b7>   #<Imm8b7>   endof                     
  endcase
;

\ MI
: _BMI ( -- )
  arg
  ?Arg_#<Imm8b7>|#<Imm11b10>
  case
   code_Arg_#<Imm8b7>   of code_BMI_#<Imm8b7>   #<Imm8b7>   endof                     
  endcase
;

\ PL
: _BPL ( -- )
  arg
  ?Arg_#<Imm8b7>|#<Imm11b10>
  case
   code_Arg_#<Imm8b7>   of code_BPL_#<Imm8b7>   #<Imm8b7>   endof                     
  endcase
;

\ VS
: _BVS ( -- )
  arg
  ?Arg_#<Imm8b7>|#<Imm11b10>
  case
   code_Arg_#<Imm8b7>   of code_BVS_#<Imm8b7>   #<Imm8b7>   endof                     
  endcase
;

\ VC
: _BVC ( -- )
  arg
  ?Arg_#<Imm8b7>|#<Imm11b10>
  case
   code_Arg_#<Imm8b7>   of code_BVC_#<Imm8b7>   #<Imm8b7>   endof                     
  endcase
;

\ HI
: _BHI ( -- )
  arg
  ?Arg_#<Imm8b7>|#<Imm11b10>
  case
   code_Arg_#<Imm8b7>   of code_BHI_#<Imm8b7>   #<Imm8b7>   endof                     
  endcase
;

\ LS
: _BLS ( -- )
  arg
  ?Arg_#<Imm8b7>|#<Imm11b10>
  case
   code_Arg_#<Imm8b7>   of code_BLS_#<Imm8b7>   #<Imm8b7>   endof                     
  endcase
;

\ GE
: _BGE ( -- )
  arg
  ?Arg_#<Imm8b7>|#<Imm11b10>
  case
   code_Arg_#<Imm8b7>   of code_BGE_#<Imm8b7>   #<Imm8b7>   endof                     
  endcase
;

\ LT
: _BLT ( -- )
  arg
  ?Arg_#<Imm8b7>|#<Imm11b10>
  case
   code_Arg_#<Imm8b7>   of code_BLT_#<Imm8b7>   #<Imm8b7>   endof                     
  endcase
;

\ GT
: _BGT ( -- )
  arg
  ?Arg_#<Imm8b7>|#<Imm11b10>
  case
   code_Arg_#<Imm8b7>   of code_BGT_#<Imm8b7>   #<Imm8b7>   endof                     
  endcase
;

\ LE
: _B ( -- )
  arg
  ?Arg_#<Imm8b7>|#<Imm11b10>
  case
   code_Arg_#<Imm8b7>   of code_BLE_#<Imm8b7>   #<Imm8b7>   endof                     
  endcase
;


\ B,BAL
: _B ( -- )
  arg
  ?Arg_#<Imm8b7>|#<Imm11b10>
  case
   code_Arg_#<Imm8b7>   of code_B_#<Imm8b7>   #<Imm8b7>   endof   
   code_Arg_#<Imm11b10> of code_B_#<Imm11b10> #<Imm11b10> endof                    
  endcase
;

\ BEQ
: BEQ	( --- )
	state @ 
	if
   \ _BEQ [COMPILE]  .case
  else
   _BEQ
  then
  ; IMMEDIATE	

\BNE
: BNE	( --- )
	state @ 
	if
   \ _BNE [COMPILE]  .case
  else
   _BNE
  then
  ; IMMEDIATE	

\ BCS
: BCS	( --- )
	state @ 
	if
   \ _BCS [COMPILE]  .case
  else
   _BCS
  then
  ; IMMEDIATE	

\ BCC
: B	( --- )
	state @ 
	if
   \ _BCC [COMPILE]  .case
  else
   _BCC
  then
  ; IMMEDIATE	

\ BMI
: B	( --- )
	state @ 
	if
   \ _BMI [COMPILE]  .case
  else
   _BMI
  then
  ; IMMEDIATE	

\ BPL
: BPL	( --- )
	state @ 
	if
   \ _BPL [COMPILE]  .case
  else
   _BPL
  then
  ; IMMEDIATE	

\ BVS
: BVS	( --- )
	state @ 
	if
   \ _BVS [COMPILE]  .case
  else
   _BVS
  then
  ; IMMEDIATE	

\ BVC
: B	( --- )
	state @ 
	if
   \ _BVC [COMPILE]  .case
  else
   _BVC
  then
  ; IMMEDIATE	

\ BHI
: B	( --- )
	state @ 
	if
   \ _BHI [COMPILE]  .case
  else
   _BHI
  then
  ; IMMEDIATE	

\ BLS
: BLS	( --- )
	state @ 
	if
   \ _BLS [COMPILE]  .case
  else
   _BLS
  then
  ; IMMEDIATE	

\ BGE
: B	( --- )
	state @ 
	if
   \ _BGE [COMPILE]  .case
  else
   _BGE
  then
  ; IMMEDIATE	

\ BLT
: BLT	( --- )
	state @ 
	if
   \ _BLT [COMPILE]  .case
  else
   _BLT
  then
  ; IMMEDIATE	

\ BGT
: BGT	( --- )
	state @ 
	if
   \ _BGT [COMPILE]  .case
  else
   _BGT
  then
  ; IMMEDIATE	

\ BLE
: BLE	( --- )
	state @ 
	if
   \ _BLE [COMPILE]  .case
  else
   _BLE
  then
  ; IMMEDIATE	

: B	( --- )
	state @ 
	if
   \ _B [COMPILE]  .case
  else
   _B
  then
  ; IMMEDIATE	