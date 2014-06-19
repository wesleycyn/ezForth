fload R.f
fload I.f
fload RRI.f
fload AND/AND.f
fload ORR/ORR.f
fload XOR/XOR.f

fload LDR/LDR.f
fload STR/STR.f

fload MOV/MOV.f

: DisASM ( code -- )

  -1 ���O_flag !
  0$>���O

   Mark_AND_<Rd4b11>,<Rn4b19>,#<Imm1b26:Imm3b14:Imm8b7>  ���O_Code @ and code_AND_<Rd4b11>,<Rn4b19>,#<Imm1b26:Imm3b14:Imm8b7> = if $AND_<Rd4b11>,<Rn4b19>,#<Imm1b26:Imm3b14:Imm8b7> then
   Mark_AND_<Rdn3b2>,<Rm3b5>                     ���O_Code @ and code_AND_<Rdn3b2>,<Rm3b5>                    = if $AND_<Rdn3b2>,<Rm3b5>                    then
                                                                                                            
    Mark_XOR_<Rd4b11>,<Rn4b19>,#<Imm1b26:Imm3b14:Imm8b7>  ���O_Code @ and code_XOR_<Rd4b11>,<Rn4b19>,#<Imm1b26:Imm3b14:Imm8b7> = if $XOR_<Rd4b11>,<Rn4b19>,#<Imm1b26:Imm3b14:Imm8b7> then
    Mark_XOR_<Rdn3b2>,<Rm3b5>                     ���O_Code @ and code_XOR_<Rdn3b2>,<Rm3b5>                    = if $XOR_<Rdn3b2>,<Rm3b5>                    then
                                                                                                            
    Mark_ORR_<Rd4b11>,<Rn4b19>,#<Imm1b26:Imm3b14:Imm8b7>  ���O_Code @ and code_ORR_<Rd4b11>,<Rn4b19>,#<Imm1b26:Imm3b14:Imm8b7> = if $ORR_<Rd4b11>,<Rn4b19>,#<Imm1b26:Imm3b14:Imm8b7> then
    Mark_ORR_<Rdn3b2>,<Rm3b5>                     ���O_Code @ and code_ORR_<Rdn3b2>,<Rm3b5>                    = if $ORR_<Rdn3b2>,<Rm3b5>                    then
                                                                                                            
   Mark_LDR_<Rt3b2>,[<Rn3b5>,#<Imm5b10>]         ���O_Code @ and code_LDR_<Rt3b2>,[<Rn3b5>,#<Imm5b10>]        = if $LDR_<Rt3b2>,[<Rn3b5>,#<Imm5b10>]        then
   Mark_LDR_<Rt3b10>,[PC,#<Imm8b7>]              ���O_Code @ and code_LDR_<Rt3b10>,[PC,#<Imm8b7>]             = if $LDR_<Rt3b10>,[PC,#<Imm8b7>]             then
   Mark_LDR_<Rt3b10>,[SP,#<Imm8b7>]              ���O_Code @ and code_LDR_<Rt3b10>,[SP,#<Imm8b7>]             = if $LDR_<Rt3b10>,[SP,#<Imm8b7>]             then
   Mark_LDR_<Rt4b15>,[<Rn4b19>,#<Imm8b7>]        ���O_Code @ and code_LDR_<Rt4b15>,[<Rn4b19>,#<Imm8b7>]       = if $LDR_<Rt4b15>,[<Rn4b19>,#<Imm8b7>]       then
   Mark_LDR_<Rt4b15>,[<Rn4b19>,#<Imm8b7>]!       ���O_Code @ and code_LDR_<Rt4b15>,[<Rn4b19>,#<Imm8b7>]!      = if $LDR_<Rt4b15>,[<Rn4b19>,#<Imm8b7>]!      then
   Mark_LDR_<Rt4b15>,[<Rn4b19>],#<Imm8b7>        ���O_Code @ and code_LDR_<Rt4b15>,[<Rn4b19>],#<Imm8b7>       = if $LDR_<Rt4b15>,[<Rn4b19>],#<Imm8b7>       then
   Mark_LDR_<Rt3b2>,[<Rn3b5>,<Rm3b8>]            ���O_Code @ and code_LDR_<Rt3b2>,[<Rn3b5>,<Rm3b8>]           = if $LDR_<Rt3b2>,[<Rn3b5>,<Rm3b8>]           then
                                                                                                            
   Mark_STR_<Rt3b2>,[<Rn3b5>,#<Imm5b10>]         ���O_Code @ and code_STR_<Rt3b2>,[<Rn3b5>,#<Imm5b10>]        = if $STR_<Rt3b2>,[<Rn3b5>,#<Imm5b10>]        then
   Mark_STR_<Rt3b10>,[PC,#<Imm8b7>]              ���O_Code @ and code_STR_<Rt3b10>,[PC,#<Imm8b7>]             = if $STR_<Rt3b10>,[PC,#<Imm8b7>]             then
   Mark_STR_<Rt3b10>,[SP,#<Imm8b7>]              ���O_Code @ and code_STR_<Rt3b10>,[SP,#<Imm8b7>]             = if $STR_<Rt3b10>,[SP,#<Imm8b7>]             then
   Mark_STR_<Rt4b15>,[<Rn4b19>,#<Imm8b7>]        ���O_Code @ and code_STR_<Rt4b15>,[<Rn4b19>,#<Imm8b7>]       = if $STR_<Rt4b15>,[<Rn4b19>,#<Imm8b7>]       then
   Mark_STR_<Rt4b15>,[<Rn4b19>,#<Imm8b7>]!       ���O_Code @ and code_STR_<Rt4b15>,[<Rn4b19>,#<Imm8b7>]!      = if $STR_<Rt4b15>,[<Rn4b19>,#<Imm8b7>]!      then
   Mark_STR_<Rt4b15>,[<Rn4b19>],#<Imm8b7>        ���O_Code @ and code_STR_<Rt4b15>,[<Rn4b19>],#<Imm8b7>       = if $STR_<Rt4b15>,[<Rn4b19>],#<Imm8b7>       then
   Mark_STR_<Rt3b2>,[<Rn3b5>,<Rm3b8>]            ���O_Code @ and code_STR_<Rt3b2>,[<Rn3b5>,<Rm3b8>]           = if $STR_<Rt3b2>,[<Rn3b5>,<Rm3b8>]           then  
                                                                                                            
   Mark_MOV_<Rd3b10>,#<Imm8b7>                   ���O_Code @ and code_MOV_<Rd3b10>,#<Imm8b7>                  = if $MOV_<Rd3b10>,#<Imm8b7>                  then
   Mark_MOV_<D1b7Rd3b2>,<Rm4b6>                  ���O_Code @ and code_MOV_<D1b7Rd3b2>,<Rm4b6>                 = if $MOV_<D1b7Rd3b2>,<Rm4b6>                 then  
   
  $�������O?
;


\s

: DisASM ( code -- )
  dup ���O_Code !
  -1 ���O_flag !
  0$>���O
  case

   code_AND_<Rd4b11>,<Rn4b19>,#<Imm1b26:Imm8b7> of $AND_<Rd4b11>,<Rn4b19>,#<Imm1b26:Imm8b7> endof
   code_AND_<Rdn3b2>,<Rm3b5>                    of $AND_<Rdn3b2>,<Rm3b5>                    endof

   code_XOR_<Rd4b11>,<Rn4b19>,#<Imm1b26:Imm8b7> of $XOR_<Rd4b11>,<Rn4b19>,#<Imm1b26:Imm8b7> endof
   code_XOR_<Rdn3b2>,<Rm3b5>                    of $XOR_<Rdn3b2>,<Rm3b5>                    endof

   code_ORR_<Rd4b11>,<Rn4b19>,#<Imm1b26:Imm8b7> of $ORR_<Rd4b11>,<Rn4b19>,#<Imm1b26:Imm8b7> endof
   code_ORR_<Rdn3b2>,<Rm3b5>                    of $ORR_<Rdn3b2>,<Rm3b5>                    endof

   code_LDR_<Rt3b2>,[<Rn3b5>,#<Imm5b10>]        of $LDR_<Rt3b2>,[<Rn3b5>,#<Imm5b10>]        endof
   code_LDR_<Rt3b10>,[PC,#<Imm8b7>]             of $LDR_<Rt3b10>,[PC,#<Imm8b7>]             endof
   code_LDR_<Rt3b10>,[SP,#<Imm8b7>]             of $LDR_<Rt3b10>,[SP,#<Imm8b7>]             endof
   code_LDR_<Rt4b15>,[<Rn4b19>,#<Imm8b7>]       of $LDR_<Rt4b15>,[<Rn4b19>,#<Imm8b7>]       endof
   code_LDR_<Rt4b15>,[<Rn4b19>,#<Imm8b7>]!      of $LDR_<Rt4b15>,[<Rn4b19>,#<Imm8b7>]!      endof
   code_LDR_<Rt4b15>,[<Rn4b19>],#<Imm8b7>       of $LDR_<Rt4b15>,[<Rn4b19>],#<Imm8b7>       endof
   code_LDR_<Rt3b2>,[<Rn3b5>,<Rm3b8>]           of $LDR_<Rt3b2>,[<Rn3b5>,<Rm3b8>]           endof
   
   code_STR_<Rt3b2>,[<Rn3b5>,#<Imm5b10>]        of $STR_<Rt3b2>,[<Rn3b5>,#<Imm5b10>]        endof
   code_STR_<Rt3b10>,[PC,#<Imm8b7>]             of $STR_<Rt3b10>,[PC,#<Imm8b7>]             endof
   code_STR_<Rt3b10>,[SP,#<Imm8b7>]             of $STR_<Rt3b10>,[SP,#<Imm8b7>]             endof
   code_STR_<Rt4b15>,[<Rn4b19>,#<Imm8b7>]       of $STR_<Rt4b15>,[<Rn4b19>,#<Imm8b7>]       endof
   code_STR_<Rt4b15>,[<Rn4b19>,#<Imm8b7>]!      of $STR_<Rt4b15>,[<Rn4b19>,#<Imm8b7>]!      endof
   code_STR_<Rt4b15>,[<Rn4b19>],#<Imm8b7>       of $STR_<Rt4b15>,[<Rn4b19>],#<Imm8b7>       endof
   code_STR_<Rt3b2>,[<Rn3b5>,<Rm3b8>]           of $STR_<Rt3b2>,[<Rn3b5>,<Rm3b8>]           endof   
   
   code_MOV_<Rd3b10>,#<Imm8b7>                  of $MOV_<Rd3b10>,#<Imm8b7>                  endof
   code_MOV_<D1b7Rd3b2>,<Rm4b6>                 of $MOV_<D1b7Rd3b2>,<Rm4b6>                 endof   
   
   
   
   
   
  endcase
  $�������O?
;









\ DisAsm Mark code_instructions

                                        \ 1 1 1 1 0 0 1 1 1 0 1 0 (1)(1)(1) (1) 1 0 (0) 0 (0) 0 0 0 0 0 0 0 0 0 0 1
fload thumb2.f

\ eforth

fload ADC/ADC.f 
\ fload ADC/ADC_test.f
fload LDR/LDR.f

\ fload LDR/LDR_test.f
fload LDRB/LDRB.f
fload STR/STR.f 
\ fload STR/STR_test.f
fload STRB/STRB.f
fload MOV/MOV.f 
fload ADD/ADD.f
\ fload AND/AND.f
 fload ORR/ORR.f
 fload XOR/XOR.f
 
\ �@��