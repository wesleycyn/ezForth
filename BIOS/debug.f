CODE _DEBUG ( -- )                          \ Debug loop
  WP, $80000000 #                ,MOV       \ Get hardware base
  
  [P] XP, WP, 280 #              ,LDR       \ get current interrupt mask
  XP, XP, $7000 #                ,BIC       \ disable all UART1 interrupt
  [PB] XP, WP, 280 #             ,STR       \ reset current interrupt mask

  XP, $02 #                      ,MOV       \ Set Port B Output
  [PB] XP, WP, 41 #              ,STR

  [PB] XP, WP, 1 #               ,LDR       \ Turn off RTS. 
  XP, XP, 2 #                    ,BIC
  [PB] XP, WP, 1 #               ,STR
  [P] XP, WP, 100 #              ,LDR       \ Turn on UART1
  XP, XP, 100 #                  ,ORR
  [P] XP, WP, 100 #              ,STR
  XP, $70000 #                   ,MOV       \ Configure UART1, N81, 115200bps
  XP, XP, $1 #                   ,ORR 
  [P] XP, WP, 4C0 #              ,STR        

LABEL: TEST_LOOP1
  [P] XP, WP, 140 #              ,LDR       \ Get hardware status
  XP, $00800000 #                ,TST       \ Check if TX fifo full
  NE, TEST_LOOP1 #               ,B         \ jump back to check again
  TOS, ASCII B #                 ,MOV       \ TOS='B'
  [PB] TOS, WP, 480 #            ,STR       \ Send char to Tx buffer

LABEL: TEST_LOOP2
  [P] XP, WP, 140 #              ,LDR       \ Get hardware status
  XP, $00800000 #                ,TST       \ Check if TX fifo full
  NE, TEST_LOOP2 #               ,B         \ jump back to check again
  TOS, ASCII l  #                ,MOV       \ TOS='l'
  [PB] TOS, WP, 480 #            ,STR       \ Send char to Tx buffer

LABEL: TEST_LOOP3
  [P] XP, WP, 140 #              ,LDR       \ Get hardware status
  XP, $00800000 #                ,TST       \ Check if TX fifo full
  NE, TEST_LOOP3 #               ,B         \ jump back to check again
  TOS, ASCII u  #                ,MOV       \ TOS='u'
  [PB] TOS, WP, 480 #            ,STR       \ Send char to Tx buffer

LABEL: TEST_LOOP4
  [P] XP, WP, 140 #              ,LDR       \ Get hardware status
  XP, $00800000 #                ,TST       \ Check if TX fifo full
  NE, TEST_LOOP4 #               ,B         \ jump back to check again
  TOS, ASCII e  #                ,MOV       \ TOS='e'
  [PB] TOS, WP, 480 #            ,STR       \ Send char to Tx buffer

LABEL: TEST_LOOP5
  [P] XP, WP, 140 #              ,LDR       \ Get hardware status
  XP, $00800000 #                ,TST       \ Check if TX fifo full
  NE, TEST_LOOP5 #               ,B         \ jump back to check again
  TOS, ASCII P  #                ,MOV       \ TOS='P'
  [PB] TOS, WP, 480 #            ,STR       \ Send char to Tx buffer

LABEL: TEST_LOOP6
  [P] XP, WP, 140 #              ,LDR       \ Get hardware status
  XP, $00800000 #                ,TST       \ Check if TX fifo full
  NE, TEST_LOOP6 #               ,B         \ jump back to check again
  TOS, ASCII u  #                ,MOV       \ TOS='U'
  [PB] TOS, WP, 480 #            ,STR       \ Send char to Tx buffer

LABEL: TEST_LOOP7
  [P] XP, WP, 140 #              ,LDR       \ Get hardware status
  XP, $00800000 #                ,TST       \ Check if TX fifo full
  NE, TEST_LOOP7 #               ,B         \ jump back to check again
  TOS, ASCII t  #                ,MOV       \ TOS='t'
  [PB] TOS, WP, 480 #            ,STR       \ Send char to Tx buffer

LABEL: TEST_LOOP8
  [P] XP, WP, 140 #              ,LDR       \ Get hardware status
  XP, $00800000 #                ,TST       \ Check if TX fifo full
  NE, TEST_LOOP8 #               ,B         \ jump back to check again
  TOS, ASCII e  #                ,MOV       \ TOS='e'
  [PB] TOS, WP, 480 #            ,STR       \ Send char to Tx buffer

LABEL: TEST_LOOP9
  [P] XP, WP, 140 #              ,LDR       \ Get hardware status
  XP, $00800000 #                ,TST       \ Check if TX fifo full
  NE, TEST_LOOP9 #               ,B         \ jump back to check again
  TOS, ASCII r  #                ,MOV       \ TOS='r'
  [PB] TOS, WP, 480 #            ,STR       \ Send char to Tx buffer

LABEL: TEST_LOOP10
  [P] XP, WP, 140 #              ,LDR       \ Get hardware status
  XP, $00800000 #                ,TST       \ Check if TX fifo full
  NE, TEST_LOOP10 #              ,B         \ jump back to check again
  TOS, 20 #                      ,MOV       \ TOS=' '
  [PB] TOS, WP, 480 #            ,STR       \ Send char to Tx buffer

LABEL: TEST_LOOP11
  [P] XP, WP, 140 #              ,LDR       \ Get hardware status
  XP, $00800000 #                ,TST       \ Check if TX fifo full
  NE, TEST_LOOP11 #              ,B         \ jump back to check again
  TOS, ASCII T  #                ,MOV       \ TOS='T'
  [PB] TOS, WP, 480 #            ,STR       \ Send char to Tx buffer

LABEL: TEST_LOOP12
  [P] XP, WP, 140 #              ,LDR       \ Get hardware status
  XP, $00800000 #                ,TST       \ Check if TX fifo full
  NE, TEST_LOOP12 #              ,B         \ jump back to check again
  TOS, ASCII e  #                ,MOV       \ TOS='e'
  [PB] TOS, WP, 480 #            ,STR       \ Send char to Tx buffer

LABEL: TEST_LOOP13
  [P] XP, WP, 140 #              ,LDR       \ Get hardware status
  XP, $00800000 #                ,TST       \ Check if TX fifo full
  NE, TEST_LOOP13 #              ,B         \ jump back to check again
  TOS, ASCII s  #                ,MOV       \ TOS='s'
  [PB] TOS, WP, 480 #            ,STR       \ Send char to Tx buffer

LABEL: TEST_LOOP14
  [P] XP, WP, 140 #              ,LDR       \ Get hardware status
  XP, $00800000 #                ,TST       \ Check if TX fifo full
  NE, TEST_LOOP14 #              ,B         \ jump back to check again
  TOS, ASCII t  #                ,MOV       \ TOS='t'
  [PB] TOS, WP, 480 #            ,STR       \ Send char to Tx buffer
  
LABEL: TEST_LOOP15
  [P] XP, WP, 140 #              ,LDR       \ Get hardware status
  XP, $00800000 #                ,TST       \ Check if TX fifo full
  NE, TEST_LOOP15 #              ,B         \ jump back to check again
  TOS, $0D #                     ,MOV       \ TOS=CR
  [PB] TOS, WP, 480 #            ,STR       \ Send char to Tx buffer

LABEL: TEST_LOOP16
  [P] XP, WP, 140 #              ,LDR       \ Get hardware status
  XP, $00800000 #                ,TST       \ Check if TX fifo full
  NE, TEST_LOOP16 #              ,B         \ jump back to check again
  TOS, $0A #                     ,MOV       \ TOS=LF
  [PB] TOS, WP, 480 #            ,STR       \ Send char to Tx buffer

  [P] XP, WP, 140 #              ,LDR       \ Get hardware status
  XP, $00400000 #                ,TST       \ Check if RX fifo empty
  NE, TEST_LOOP1 #               ,B         \ jump back to check again
  [PB] TOS, WP, 480 #            ,LDR       \ get char from Rx buffer

LABEL: TEST_LOOP17
  [P] XP, WP, 140 #              ,LDR       \ Get hardware status
  XP, $00400000 #                ,TST       \ Check if RX fifo empty
  NE, TEST_LOOP17 #              ,B         \ jump back to check again
  [PB] TOS, WP, 480 #            ,LDR       \ get char from Rx buffer
  TEST_LOOP1 #                   ,B         \ jump back to check again
  
  $NEXT
END-CODE  

