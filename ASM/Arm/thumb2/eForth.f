: IP R0 ;
\ : SP R1 ;
: RP R2 ;
: UP R3 ;
: WP R4 ;
: TOS R5 ;
: XP R6 ;
: YP R7 ;
\ : LP R14 ;
\ : PC R15 ;


\ : CONSTANT      ( n "name" -- )  \ create a constant (unchangeable) value
\                HEADER DOCON COMPILE, , ;

: cCONSTANT      ( n "name" -- )  \ create a constant (unchangeable) value
                HEADER DOCON COMPILE, c, ;

: wCONSTANT      ( n "name" -- )  \ create a constant (unchangeable) value
                HEADER DOCON COMPILE, w, ;

ADC  TOS,TOS,#0          CONSTANT TOS+Carry->TOS

ADD  WP,WP,TOS          wCONSTANT TOS+WP->WP
ADD  IP,IP,#4           wCONSTANT IP+4->IP
ADD  TOS,WP,TOS,ASR#20  wCONSTANT WP+TOS>>20->TOS

\ AND.W  TOS,TOS,WP        CONSTANT TOS&WP->TOS

LDR  TOS,[RP]            CONSTANT [RP]->TOS
LDR  TOS,[RP],#4         CONSTANT [RP]->TOS,RP+4->RP
LDR  TOS,[SP],#4         CONSTANT [SP]->TOS,SP+4->SP
LDR  PC,[IP],#4          CONSTANT [IP]->PC,IP+4->IP

LDR  WP,[SP]             CONSTANT [SP]->WP
LDR  WP,[SP],#4          CONSTANT [SP]->WP,SP+4->SP
LDR  TOS,[IP],#4         CONSTANT [IP]->TOS,IP+4->IP
LDR  IP,[RP],#4          CONSTANT [RP]->IP,RP+4->RP
LDR  TOS,[SP]            CONSTANT [SP]->TOS
LDR  TOS,[SP,#4]         CONSTANT [SP+4]->TOS


LDR  TOS,[TOS]           CONSTANT [TOS]->TOS
LDR  IP,[IP]             CONSTANT [IP]->IP

LDRB TOS,[TOS]          CONSTANT  byte[TOS]->TOS
LDRB TOS,[TOS]          CONSTANT  [TOS].b->TOS
MOV  TOS,#0             wCONSTANT 0->TOS
MOV  RP,TOS             wCONSTANT TOS->RP
MOV  SP,TOS             wCONSTANT TOS->SP
MOV  WP,TOS             wCONSTANT TOS->WP
MOV  WP,#0              wCONSTANT 0->WP
MOV  TOS,RP             wCONSTANT RP->TOS
MOV  TOS,SP             wCONSTANT SP->TOS
MOV  TOS,WP             wCONSTANT WP->TOS
MOV  IP,LP              wCONSTANT LP->IP

ORR.W  TOS,TOS,WP        CONSTANT TOS|WP->TOS

STR  TOS,[SP],#4         CONSTANT TOS->[SP],SP+4->SP
STR  TOS,[SP],#-4        CONSTANT TOS->[SP],SP-4->SP
STR  TOS,[SP,#4]        wCONSTANT TOS->[SP+4]


STR  WP,[SP]             CONSTANT WP->[SP]
STR  WP,[TOS]            CONSTANT WP->[TOS]
STR  IP,[RP,#4]!         CONSTANT ?RP+4->IP
                         

STR  IP,[IP]             CONSTANT [IP]->IP
STR  IP,[RP],#4          CONSTANT IP->[RP],RP+4->RP
STR  IP,[RP],#-4         CONSTANT IP->[RP],RP-4->RP
STR  TOS,[RP],#4         CONSTANT TOS->[RP],RP+4->RP
STR  TOS,[RP],#-4        CONSTANT TOS->[RP],RP-4->RP
STR  TOS,[RP,#4]         CONSTANT TOS->[RP+4]
STR  TOS,[SP]            CONSTANT TOS->[SP]

STRB WP,[TOS]            CONSTANT WP->byte[TOS]
STRB WP,[TOS]            CONSTANT WP.B->[TOS]

XOR.W  TOS,TOS,WP        CONSTANT TOS^WP->TOS

\ TOS->[SP],SP+4->SP4
\ [SP]->TOS,SP=4->SP

: BX ;

 BX   WP                wCONSTANT  JMP[WP]
\ B    QUESTIONBRANCH2   wCONSTANT  JMP_QUESTIONBRANCH2
\ BNE  QUESTIONBRANCH2   wCONSTANT   BNE_QUESTIONBRANCH1    ;\ jump if f <> 0

\ LABEL:QUESTIONBRANCH1
\ LABEL:QUESTIONBRANCH2
\ FORWARD:QUESTIONBRANCH1
\ FORWARD:QUESTIONBRANCH2

0 wCONSTANT  JMP[WP]

\ 0   CONSTANT TOS&WP->TOS
\ AND.W  TOS,TOS,WP        CONSTANT TOS&WP->TOS

\ other

LDR  PC,[IP,#4]         CONSTANT  [IP+4]->PC


\ boot.f
\ SP<-#$80000000