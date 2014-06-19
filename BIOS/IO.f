CODE ?RX   ( -- c T | F )                   \ Return input character and true, or a false if no input.
FORWARD: QUESTIONRX1
FORWARD: QUESTIONRX2
  WP, $80000000 #               ,MOV        \ Get hardware base
  [P] XP, WP, 140 #             ,LDR        \ Get hardware status
  XP, $00400000 #               ,TST        \ Check if RX fifo empty
  NE, QUESTIONRX1 #             ,B          \ jump back to check again
  [-P!] TOS, SP, 4 #            ,STR        \ push TOS
  [PB] TOS, WP, 480 #           ,LDR        \ get char from Rx buffer
  [-P!] TOS, SP, 4 #            ,STR        \ push TOS
  TOS, 0 #                      ,MVN        \ TOS := TRUE
  QUESTIONRX2 #                 ,B          \ exit 
LABEL: QUESTIONRX1
  [-P!] TOS, SP, 4 #            ,STR        \ SP := SP - 4
  TOS, 0 #                      ,MOV        \ TOS := FALSE
LABEL: QUESTIONRX2
  $NEXT
END-CODE  

CODE TX!   ( c -- )                         \ Send character c to the output device.
  WP, $80000000 #               ,MOV        \ Get hardware base
LABEL: TXSTORE1
  [P] XP, WP, 140 #             ,LDR        \ Get hardware status
  XP, $00800000 #               ,TST        \ Check if TX fifo full
  NE, TXSTORE1 #                ,B          \ jump back to check again
  [PB] TOS, WP, 480 #           ,STR        \ Send char to Tx buffer
  [] TOS, SP, 4 #               ,LDR        \ pop TOS
  $NEXT
END-CODE


CODE !IO   ( -- )                           \ Initialize the serial I/O devices.
  WP, $80000000 #               ,MOV        \ Get hardware base  
  [P] XP, WP, 280 #             ,LDR        \ get current interrupt mask
  XP, XP, $7000 #               ,BIC        \ disable all UART1 interrupt
  [PB] XP, WP, 280 #            ,STR        \ reset current interrupt mask

  XP, $02 #                     ,MOV        \ Set Port B Output
  [PB] XP, WP, 41 #             ,STR
 
  [PB] XP, WP, 1 #              ,LDR        \ Turn off RTS. 
  XP, XP, 2 #                   ,BIC
  [PB] XP, WP, 1 #              ,STR
  [P] XP, WP, 100 #             ,LDR        \ Turn on UART1
  XP, XP, 100 #                 ,ORR
  [P] XP, WP, 100 #             ,STR
  XP, $70000 #                  ,MOV        \ Configure UART1, N81, 115200bps
  XP, XP, $1 #                  ,ORR 
  [P] XP, WP, 4C0 #             ,STR        
  $NEXT
END-CODE

\s

CODE ?RX   ( -- c T | F )                   \ Return input character and true, or a false if no input.
FORWARD: QUESTIONRX1
FORWARD: QUESTIONRX2
  WP, $80000000 #               ,MOV        \ Get hardware base
  [P] XP, WP, 140 #             ,LDR        \ Get hardware status
  XP, $00400000 #               ,TST        \ Check if RX fifo empty
  NE, QUESTIONRX1 #             ,B          \ jump back to check again
  [-P!] TOS, SP, 4 #            ,STR        \ push TOS
  [PB] TOS, WP, 480 #           ,LDR        \ get char from Rx buffer
  [-P!] TOS, SP, 4 #            ,STR        \ push TOS
  TOS, 0 #                      ,MVN        \ TOS := TRUE
  QUESTIONRX2 #                 ,B          \ exit 
LABEL: QUESTIONRX1
  [-P!] TOS, SP, 4 #            ,STR        \ SP := SP - 4
  TOS, 0 #                      ,MOV        \ TOS := FALSE
LABEL: QUESTIONRX2
  $NEXT
END-CODE


CODE TX!   ( c -- )                         \ Send character c to the output device.
  WP, $80000000 #               ,MOV        \ Get hardware base
LABEL: TXSTORE1
  [P] XP, WP, 140 #             ,LDR        \ Get hardware status
  XP, $00800000 #               ,TST        \ Check if TX fifo full
  NE, TXSTORE1 #                ,B          \ jump back to check again
  [PB] TOS, WP, 480 #           ,STR        \ Send char to Tx buffer
  [] TOS, SP, 4 #               ,LDR        \ pop TOS
  $NEXT
END-CODE

CODE !IO   ( -- )                           \ Initialize the serial I/O devices.
  WP<- #$80000000   \ WP, $80000000 #               ,MOV        \ Get hardware base  
  WP<- [WP+#280]    \ [P] XP, WP, 280 #             ,LDR        \ get current interrupt mask
  
  XP, XP, $7000 #               ,BIC        \ disable all UART1 interrupt
  
  XP-> [WP+#280]    \ [PB] XP, WP, 280 #            ,STR        \ reset current interrupt mask
  
  XP<- #$02         \ XP, $02 #                     ,MOV        \ Set Port B Output
  XP-> byte[WP+41]  \ [PB] XP, WP, 41 #             ,STR
  XP<- byte[WP]               \ [PB] XP, WP, 1 #              ,LDR        \ Turn off RTS. 
  
  XP, XP, 2 #                   ,BIC
  
  XP-> [WP+#1]      \ [PB] XP, WP, 1 #              ,STR
  XP<- [WP+#100]    \ [P] XP, WP, 100 #             ,LDR        \ Turn on UART1
  XP<- XP|#100      \ XP, XP, 100 #                 ,ORR
  XP-> [WP+#100]    \ [P] XP, WP, 100 #             ,STR
  XP<- #$7000       \ XP, $70000 #                  ,MOV        \ Configure UART1, N81, 115200bps
  XP<- XP|#$        \ 1  XP, XP, $1 #                  ,ORR 
  XP-> [WP+#4C0]     \ [P] XP, WP, 4C0 #             ,STR        
  $NEXT
END-CODE