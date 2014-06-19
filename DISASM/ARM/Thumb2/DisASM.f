variable 指令_Code
variable 指令_flag
create $指令 256 allot

: $>指令
  $指令 +place
 ;

: 0$>指令
 0 $指令 c!  
 ;

: $未知指令? ( -- )
 hex
 指令_flag @
 0 = 
 if
   ." 機械碼:" 指令_Code @ 0 <# # # # # # # # # #> type ."  "  ." 指令: " $指令 count type  cr 
 else
   ." 機械碼:" 指令_Code @ 0 <# # # # # # # # # #> type ."  " ." 未知指令" cr \ $>指令
 then
 ;

\s 

fload Thumb2.f

\ AND
0xF0000000 DisASM
0x4000     DisASM

\ ORR
0xF0400000 DisASM
0x4300     DisASM

\ XOR
0xF0800000 DisASM
0x4040     DisASM

\ LDR
0x6800     DisASM
0x4800     DisASM
0x9800     DisASM
0xF8500C00 DisASM
0xF8500D00 DisASM
0xF8500900 DisASM
0x5800     DisASM

\ STR
0x6000     DisASM
0x4000     DisASM
0x9000     DisASM
0xF8400C00 DisASM
0xF8400D00 DisASM
0xF8400900 DisASM
0x5000     DisASM

\ MOV
0x2000     DisASM
0x4600     DisASM















\s
: DisASM ( code -- )
  指令_Code !
  0$>指令
case
 code_ADC            of    $ADC         endof
 code_ADD            of    $ADD         endof
 code_ADR            of    $ADR         endof
 code_AND            of    $AND         endof
 code_ASR            of    $ASR         endof
 code_B              of    $B           endof
 code_BFC            of    $BFC         endof
 code_BFI            of    $BFI         endof
 code_BIC            of    $BIC         endof
 code_BKPT           of    $BKPT        endof
 code_BL             of    $BL          endof
 code_BLX            of    $BLX         endof
 code_BXJ            of    $BXJ         endof
 code_CBNZ           of    $CBNZ        endof
 code_CBZ            of    $CBZ         endof
 code_CDP            of    $CDP         endof
 code_CLREX          of    $CLREX       endof
 code_CLZ            of    $CLZ         endof
 code_CMN            of    $CMN         endof
 code_CMP            of    $CMP         endof
 code_CPS            of    $CPS         endof
 code_CPY            of    $CPY         endof
 code_DBG            of    $DBG         endof
 code_DMB            of    $DMB         endof
 code_DSB            of    $DSB         endof
 code_EOR            of    $EOR         endof
 code_ISB            of    $ISB         endof
 code_IT             of    $IT          endof
 code_LDC            of    $LDC         endof
 code_LDMDB          of    $LDMDB       endof
 code_LDMEA          of    $LDMEA       endof
 code_LDR            of    $LDR         endof
 code_LDRB           of    $LDRB        endof
 code_LDRBT          of    $LDRBT       endof
 code_LDRD           of    $LDRD        endof
 code_LDREX          of    $LDREX       endof
 code_LDREXB         of    $LDREXB      endof
 code_LDREXD         of    $LDREXD      endof
 code_LDREXH         of    $LDREXH      endof
 code_LDRH           of    $LDRH        endof
 code_LDRHHT         of    $LDRHHT      endof
 code_LDRSB          of    $LDRSB       endof
 code_LDRSBT         of    $LDRSBT      endof
 code_LDRSH          of    $LDRSH       endof
 code_LDRSHT         of    $LDRSHT      endof
 code_LDRT           of    $LDRT        endof
 code_LSL            of    $LSL         endof
 code_LSR            of    $LSR         endof
 code_MCR            of    $MCR         endof
 code_MCRR           of    $MCRR        endof
 code_MRS            of    $MRS         endof
 code_MSR            of    $MSR         endof
 code_MUL            of    $MUL         endof
 code_MVN            of    $MVN         endof
 code_NEG            of    $NEG         endof
 code_NOP            of    $NOP         endof
 code_ORN            of    $ORN         endof
 code_ORR            of    $ORR         endof
 code_PKH            of    $PKH         endof
 code_PLD            of    $PLD         endof
 code_PLI            of    $PLI         endof
 code_POP            of    $POP         endof
 code_PUSH           of    $PUSH        endof
 code_QADD           of    $QADD        endof
 code_QADD16         of    $QADD16      endof
 code_QADD8          of    $QADD8       endof
 code_QASX           of    $QASX        endof
 code_QDADD          of    $QDADD       endof
 code_QDSUB          of    $QDSUB       endof
 code_QSUB16         of    $QSUB16      endof
 code_QSUB8          of    $QSUB8       endof
 code_RBIT           of    $RBIT        endof
 code_REV            of    $REV         endof
 code_REV16          of    $REV16       endof
 code_REVSH          of    $REVSH       endof
 code_RFE            of    $RFE         endof
 code_ROR            of    $ROR         endof
 code_RRX            of    $RRX         endof
 code_RSB            of    $RSB         endof
 code_SADD16         of    $SADD16      endof
 code_SADD8          of    $SADD8       endof
 code_SASX           of    $SASX        endof
 code_SBC            of    $SBC         endof
 code_SBFX           of    $SBFX        endof
 code_SDIV           of    $SDIV        endof
 code_SEL            of    $SEL         endof
 code_SETEND         of    $SETEND      endof
 code_SEV            of    $SEV         endof
 code_SHADD16        of    $SHADD16     endof
 code_SHADD8         of    $SHADD8      endof
 code_SHASX          of    $SHASX       endof
 code_SHSAX          of    $SHSAX       endof
 code_SHSUB16        of    $SHSUB16     endof
 code_SHSUB8         of    $SHSUB8      endof
 code_SMC            of    $SMC         endof
 code_SMLABB         of    $SMLABB      endof
 code_SMLABT         of    $SMLABT      endof
 code_SMLATB         of    $SMLATB      endof
 code_SMLATT         of    $SMLATT      endof
 code_SMLAD          of    $SMLAD       endof
 code_SMLAD          of    $SMLAD       endof
 code_SMLAL          of    $SMLAL       endof
 code_SMLALBB        of    $SMLALBB     endof
 code_SMLALBT        of    $SMLALBT     endof
 code_SMLALTB        of    $SMLALTB     endof
 code_SMLALTT        of    $SMLALTT     endof
 code_SMLALD         of    $SMLALD      endof
 code_SMLAWB         of    $SMLAWB      endof
 code_SMLAWT         of    $SMLAWT      endof
 code_SMLSD          of    $SMLSD       endof
 code_SMLSLD         of    $SMLSLD      endof
 code_SMMLA          of    $SMMLA       endof
 code_SMMLS          of    $SMMLS       endof
 code_SMMUL          of    $SMMUL       endof
 code_SMUAD          of    $SMUAD       endof
 code_SMULBB         of    $SMULBB      endof
 code_SMULBT         of    $SMULBT      endof
 code_SMULTB         of    $SMULTB      endof
 code_SMULTT         of    $SMULTT      endof
 code_SMULL          of    $SMULL       endof
 code_SMULWB         of    $SMULWB      endof
 code_SMULWT         of    $SMULWT      endof
 code_SMUSD          of    $SMUSD       endof
 code_SRS            of    $SRS         endof
 code_SSAT           of    $SSAT        endof
 code_SSAT16         of    $SSAT16      endof
 code_SSAX           of    $SSAX        endof
 code_SSUB16         of    $SSUB16      endof
 code_SSUB8          of    $SSUB8       endof
 code_STC            of    $STC         endof
 code_STMDB          of    $STMDB       endof
 code_STMFD          of    $STMFD       endof
 code_STMIA          of    $STMIA       endof
 code_STMEA          of    $STMEA       endof
 code_STR            of    $STR         endof
 code_STRB           of    $STRB        endof
 code_STRBT          of    $STRBT       endof
 code_STRD           of    $STRD        endof
 code_STREX          of    $STREX       endof
 code_STREXB         of    $STREXB      endof
 code_STREXD         of    $STREXD      endof
 code_STREXH         of    $STREXH      endof
 code_STRH           of    $STRH        endof
 code_STRHT          of    $STRHT       endof
 code_STRT           of    $STRT        endof
 code_SUB            of    $SUB         endof
 code_SVC            of    $SVC         endof
 code_SWI            of    $SWI         endof
 code_SXTAB          of    $SXTAB       endof
 code_SXTAB16        of    $SXTAB16     endof
 code_SXTAH          of    $SXTAH       endof
 code_SXTB           of    $SXTB        endof
 code_SXTB16         of    $SXTB16      endof
 code_SXTH           of    $SXTH        endof
 code_TBB            of    $TBB         endof
 code_TBH            of    $TBH         endof
 code_TEQ            of    $TEQ         endof
 code_TST            of    $TST         endof
 code_UADD16         of    $UADD16      endof
 code_UAdd8          of    $UAdd8       endof
 code_UASX           of    $UASX        endof
 code_UBFX           of    $UBFX        endof
 code_UDIV           of    $UDIV        endof
 code_UHADD16        of    $UHADD16     endof
 code_UHADD8         of    $UHADD8      endof
 code_UMAAL          of    $UMAAL       endof
 code_UMLAL          of    $UMLAL       endof
 code_UQADD16        of    $UQADD16     endof
 code_UQADD8         of    $UQADD8      endof
 code_UQASX          of    $UQASX       endof
 code_UQSAX          of    $UQSAX       endof
 code_UQSUB16        of    $UQSUB16     endof
 code_UQSUB8         of    $UQSUB8      endof
 code_USAD8          of    $USAD8       endof
 code_USADA8         of    $USADA8      endof
 code_USAT           of    $USAT        endof
 code_USAT16         of    $USAT16      endof
 code_USAX           of    $USAX        endof
 code_USUB16         of    $USUB16      endof
 code_USUB8          of    $USUB8       endof
 code_UXTAB          of    $UXTAB       endof
 code_UXTAB16        of    $UXTAB16     endof
 code_UXTAH          of    $UXTAH       endof
 code_UXTB           of    $UXTB        endof
 code_UXTB16         of    $UXTB16      endof
 code_UXTH           of    $UXTH        endof
 code_WFE            of    $WFE         endof
 code_WFI            of    $WFI         endof
 code_YIELD          of    $YIELD       endof
endcase
 $未知指令?
;

: $未知指令? ( -- )
 指令_Code @
 0 <> 
 if
   ." 指令: " 
 else
  $未知指令 $>指令
 then
 ;