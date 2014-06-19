0xF800B000      constant Mark_B.W_#<S1b26:I1b13:i2b11:Imm10b25:Imm11b10:0>
0xF0009000      constant code_B.W_#<S1b26:I1b13:i2b11:Imm10b25:Imm11b10:0> 

0xF800B000      constant Mark_B<cond4b11>.W_#<S1b26:I1b13:i2b11:Imm6b21:Imm11b10:0>
0xF0008000      constant code_B<cond4b11>.W_#<S1b26:I1b13:i2b11:Imm6b21:Imm11b10:0> 
  
0xF0008000      constant code_BEQ.W_#<S1b26:I1b13:i2b11:Imm6b21:Imm11b10:0> 
0xF0408000      constant code_BNE.W_#<S1b26:I1b13:i2b11:Imm6b21:Imm11b10:0>
0xF0808000      constant code_BCS.W_#<S1b26:I1b13:i2b11:Imm6b21:Imm11b10:0>
0xF0C08000      constant code_BCC.W_#<S1b26:I1b13:i2b11:Imm6b21:Imm11b10:0>
0xF1008000      constant code_BMI.W_#<S1b26:I1b13:i2b11:Imm6b21:Imm11b10:0>
0xF1408000      constant code_BPL.W_#<S1b26:I1b13:i2b11:Imm6b21:Imm11b10:0>
0xF1808000      constant code_BVS.W_#<S1b26:I1b13:i2b11:Imm6b21:Imm11b10:0>
0xF1C08000      constant code_BVC.W_#<S1b26:I1b13:i2b11:Imm6b21:Imm11b10:0>
0xF2008000      constant code_BHI.W_#<S1b26:I1b13:i2b11:Imm6b21:Imm11b10:0>
0xF2408000      constant code_BLS.W_#<S1b26:I1b13:i2b11:Imm6b21:Imm11b10:0>
0xF2808000      constant code_BGE.W_#<S1b26:I1b13:i2b11:Imm6b21:Imm11b10:0>
0xF2C08000      constant code_BLT.W_#<S1b26:I1b13:i2b11:Imm6b21:Imm11b10:0>
0xF3008000      constant code_BGT.W_#<S1b26:I1b13:i2b11:Imm6b21:Imm11b10:0>
0xF3408000      constant code_BLE.W_#<S1b26:I1b13:i2b11:Imm6b21:Imm11b10:0>
0xF3808000      constant   code_B.W_#<S1b26:I1b13:i2b11:Imm6b21:Imm11b10:0>

\ EQ
: _BEQ.W ( -- )
  arg
  ?Arg_#<S1b26:I1b13:i2b11:Imm6b21:Imm11b10:0>
  case
   code_Arg_#<S1b26:I1b13:i2b11:Imm6b21:Imm11b10:0>   of code_BEQ.W_#<S1b26:I1b13:i2b11:Imm6b21:Imm11b10:0>   #<S1b26:I1b13:i2b11:Imm6b21:Imm11b10:0>   endof                     
  endcase
;

\ NE
: _BNE.W ( -- )
  arg
  ?Arg_#<S1b26:I1b13:i2b11:Imm6b21:Imm11b10:0>|#<S1b26:I1b13:i2b11:Imm10b25:Imm11b10:0>
  case
   code_Arg_#<S1b26:I1b13:i2b11:Imm6b21:Imm11b10:0>   of code_BNE.W_#<S1b26:I1b13:i2b11:Imm6b21:Imm11b10:0>   #<S1b26:I1b13:i2b11:Imm6b21:Imm11b10:0>   endof                     
  endcase
;

\ CS
: _BCS.W ( -- )
  arg
  ?Arg_#<S1b26:I1b13:i2b11:Imm6b21:Imm11b10:0>
  case
   code_Arg_#<S1b26:I1b13:i2b11:Imm6b21:Imm11b10:0>   of code_BCS.W_#<S1b26:I1b13:i2b11:Imm6b21:Imm11b10:0>   #<S1b26:I1b13:i2b11:Imm6b21:Imm11b10:0>   endof                     
  endcase
;

\ CC
: _BCC.W ( -- )
  arg
  ?Arg_#<S1b26:I1b13:i2b11:Imm6b21:Imm11b10:0>
  case
   code_Arg_#<S1b26:I1b13:i2b11:Imm6b21:Imm11b10:0>   of code_BCC.W_#<S1b26:I1b13:i2b11:Imm6b21:Imm11b10:0>   #<S1b26:I1b13:i2b11:Imm6b21:Imm11b10:0>   endof                     
  endcase
;

\ MI
: _BMI.W ( -- )
  arg
  ?Arg_#<S1b26:I1b13:i2b11:Imm6b21:Imm11b10:0>
  case
   code_Arg_#<S1b26:I1b13:i2b11:Imm6b21:Imm11b10:0>   of code_BMI.W_#<S1b26:I1b13:i2b11:Imm6b21:Imm11b10:0>   #<S1b26:I1b13:i2b11:Imm6b21:Imm11b10:0>   endof                     
  endcase
;

\ PL
: _BPL.W ( -- )
  arg
  ?Arg_#<S1b26:I1b13:i2b11:Imm6b21:Imm11b10:0>
  case
   code_Arg_#<S1b26:I1b13:i2b11:Imm6b21:Imm11b10:0>   of code_BPL_#<S1b26:I1b13:i2b11:Imm6b21:Imm11b10:0>   #<S1b26:I1b13:i2b11:Imm6b21:Imm11b10:0>   endof                     
  endcase
;

\ VS
: _BVS.W ( -- )
  arg
  ?Arg_#<S1b26:I1b13:i2b11:Imm6b21:Imm11b10:0>
  case
   code_Arg_#<S1b26:I1b13:i2b11:Imm6b21:Imm11b10:0>   of code_BVS.W_#<S1b26:I1b13:i2b11:Imm6b21:Imm11b10:0>   #<S1b26:I1b13:i2b11:Imm6b21:Imm11b10:0>   endof                     
  endcase
;

\ VC
: _BVC.W ( -- )
  arg
  ?Arg_#<S1b26:I1b13:i2b11:Imm6b21:Imm11b10:0>
  case
   code_Arg_#<S1b26:I1b13:i2b11:Imm6b21:Imm11b10:0>   of code_BVC.W_#<S1b26:I1b13:i2b11:Imm6b21:Imm11b10:0>   #<S1b26:I1b13:i2b11:Imm6b21:Imm11b10:0>   endof                     
  endcase
;

\ HI
: _BHI.W ( -- )
  arg
  ?Arg_#<S1b26:I1b13:i2b11:Imm6b21:Imm11b10:0>
  case
   code_Arg_#<S1b26:I1b13:i2b11:Imm6b21:Imm11b10:0>   of code_BHI.W_#<S1b26:I1b13:i2b11:Imm6b21:Imm11b10:0>   #<S1b26:I1b13:i2b11:Imm6b21:Imm11b10:0>   endof                     
  endcase
;

\ LS
: _BLS.W ( -- )
  arg
  ?Arg_#<S1b26:I1b13:i2b11:Imm6b21:Imm11b10:0>
  case
   code_Arg_#<S1b26:I1b13:i2b11:Imm6b21:Imm11b10:0>   of code_BLS.W_#<S1b26:I1b13:i2b11:Imm6b21:Imm11b10:0>   #<S1b26:I1b13:i2b11:Imm6b21:Imm11b10:0>   endof                     
  endcase
;

\ GE
: _BGE.W ( -- )
  arg
  ?Arg_#<S1b26:I1b13:i2b11:Imm6b21:Imm11b10:0>
  case
   code_Arg_#<S1b26:I1b13:i2b11:Imm6b21:Imm11b10:0>   of code_BGE.W_#<S1b26:I1b13:i2b11:Imm6b21:Imm11b10:0>   #<S1b26:I1b13:i2b11:Imm6b21:Imm11b10:0>   endof                     
  endcase
;

\ LT
: _BLT.W ( -- )
  arg
  ?Arg_#<S1b26:I1b13:i2b11:Imm6b21:Imm11b10:0>
  case
   code_Arg_#<S1b26:I1b13:i2b11:Imm6b21:Imm11b10:0>   of code_BLT.W_#<S1b26:I1b13:i2b11:Imm6b21:Imm11b10:0>   #<S1b26:I1b13:i2b11:Imm6b21:Imm11b10:0>   endof                     
  endcase
;

\ GT
: _BGT.W ( -- )
  arg
  ?Arg_#<S1b26:I1b13:i2b11:Imm6b21:Imm11b10:0>
  case
   code_Arg_#<S1b26:I1b13:i2b11:Imm6b21:Imm11b10:0>   of code_BGT.W_#<S1b26:I1b13:i2b11:Imm6b21:Imm11b10:0>   #<S1b26:I1b13:i2b11:Imm6b21:Imm11b10:0>   endof                     
  endcase
;

\ LE
: _BLE.W ( -- )
  arg
  ?Arg_#<S1b26:I1b13:i2b11:Imm6b21:Imm11b10:0>
  case
   code_Arg_#<S1b26:I1b13:i2b11:Imm6b21:Imm11b10:0>   of code_BLE.W_#<S1b26:I1b13:i2b11:Imm6b21:Imm11b10:0>   #<S1b26:I1b13:i2b11:Imm6b21:Imm11b10:0>   endof                     
  endcase
;


\ B,BAL
: _B.W ( -- )
  arg
  ?Arg_#<S1b26:I1b13:i2b11:Imm6b21:Imm11b10:0>|#<S1b26:I1b13:i2b11:Imm10b25:Imm11b10:0>
  case
   code_Arg_#<S1b26:I1b13:i2b11:Imm6b21:Imm11b10:0>   of code_B.W_#<S1b26:I1b13:i2b11:Imm6b21:Imm11b10:0>   #<S1b26:I1b13:i2b11:Imm6b21:Imm11b10:0>   endof   
   code_Arg_#<S1b26:I1b13:i2b11:Imm10b25:Imm11b10:0>  of code_B.W_#<S1b26:I1b13:i2b11:Imm10b25:Imm11b10:0> #<S1b26:I1b13:i2b11:Imm10b25:Imm11b10:0>   endof                    
  endcase
;

\ BEQ
: BEQ.W	( --- )
	state @ 
	if
   \ _BEQ.W [COMPILE]  .case
  else
   _BEQ.W
  then
  ; IMMEDIATE	

\BNE
: BNE.W	( --- )
	state @ 
	if
   \ _BNE.W [COMPILE]  .case
  else
   _BNE.W
  then
  ; IMMEDIATE	

\ BCS
: BCS.W	( --- )
	state @ 
	if
   \ _BCS.W [COMPILE]  .case
  else
   _BCS.W
  then
  ; IMMEDIATE	

\ BCC
: BCC.W	( --- )
	state @ 
	if
   \ _BCC.W [COMPILE]  .case
  else
   _BCC.W
  then
  ; IMMEDIATE	

\ BMI
: BMI.W	( --- )
	state @ 
	if
   \ _BMI.W [COMPILE]  .case
  else
   _BMI.W
  then
  ; IMMEDIATE	

\ BPL
: BPL.W	( --- )
	state @ 
	if
   \ _BPL.W [COMPILE]  .case
  else
   _BPL.W
  then
  ; IMMEDIATE	

\ BVS
: BVS.W	( --- )
	state @ 
	if
   \ _BVS.W [COMPILE]  .case
  else
   _BVS.W
  then
  ; IMMEDIATE	

\ BVC
: BVC.W	( --- )
	state @ 
	if
   \ _BVC.W [COMPILE]  .case
  else
   _BVC.W
  then
  ; IMMEDIATE	

\ BHI
: BHI.W	( --- )
	state @ 
	if
   \ _BHI.W [COMPILE]  .case
  else
   _BHI.W
  then
  ; IMMEDIATE	

\ BLS
: BLS.W	( --- )
	state @ 
	if
   \ _BLS.W [COMPILE]  .case
  else
   _BLS.W
  then
  ; IMMEDIATE	

\ BGE
: BGE.W	( --- )
	state @ 
	if
   \ _BGE.W [COMPILE]  .case
  else
   _BGE.W
  then
  ; IMMEDIATE	

\ BLT
: BLT.W	( --- )
	state @ 
	if
   \ _BLT.W [COMPILE]  .case
  else
   _BLT.W
  then
  ; IMMEDIATE	

\ BGT
: BGT.W	( --- )
	state @ 
	if
   \ _BGT.W [COMPILE]  .case
  else
   _BGT.W
  then
  ; IMMEDIATE	

\ BLE
: BLE.W	( --- )
	state @ 
	if
   \ _BLE.W [COMPILE]  .case
  else
   _BLE.W
  then
  ; IMMEDIATE	

: B.W	( --- )
	state @ 
	if
   \ _B.W [COMPILE]  .case
  else
   _B.W
  then
  ; IMMEDIATE	  