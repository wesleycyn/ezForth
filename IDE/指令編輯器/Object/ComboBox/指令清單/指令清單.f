ComboBox 指令清單

0   value 指令清單_SETCURSEL

\ 331 464 100 25 Move: bit0
331 value 指令清單_x
470  value 指令清單_y
100  value 指令清單_w
25  value 指令清單_h

create 指令清單_Item$0 ," 0" 0 c,
create 指令清單_Item$1 ," ADC" 0 c,
create 指令清單_Item$2 ," ADCS" 0 c,
create 指令清單_Item$3 ," ADC.W" 0 c,
create 指令清單_Item$4 ," ADCS.W" 0 c,


: 指令清單_Init

                self Start: 指令清單
                0 74 103 883 Move: 指令清單
                Handle: Winfont SetFont: 指令清單
                \ 指令清單_x 指令清單_y 指令清單_w 指令清單_h  Move: 指令清單 ( x y w h )                
                0 0 CB_RESETCONTENT GetID: 指令清單 SendDlgItemMessage: self drop
                指令清單_Item$0 count drop  0 CB_ADDSTRING GetID: 指令清單 SendDlgItemMessage: self drop
                指令清單_Item$1 count drop  0 CB_ADDSTRING GetID: 指令清單 SendDlgItemMessage: self drop
                指令清單_Item$2 count drop  0 CB_ADDSTRING GetID: 指令清單 SendDlgItemMessage: self drop                
                0 指令清單_SETCURSEL CB_SETCURSEL    GetID: 指令清單 SendDlgItemMessage: self drop 
;

: 指令清單_Op ;

\s

create 指令清單_Item$0 ," 0" 0 c,
create 指令清單_Item$1 ," ADC    Rd4b11,Rn4b19,#Imm26b1:Imm3b14:Imm8b7" 0 c,
create 指令清單_Item$2 ," ADCS   Rd4b11,Rn4b19,#Imm26b1:Imm3b14:Imm8b7" 0 c,
create 指令清單_Item$3 ," ADC    Rd3b2,Rm3b5" 0 c,
create 指令清單_Item$4 ," ADC.W  Rd4b11,Rn4b19,Rm4b3,shift2b5" 0 c,
create 指令清單_Item$5 ," ADCS.W Rd4b11,Rn4b19,Rm4b3,shift2b5" 0 c,

create 指令清單_Item$5 ," ADD    Rd3b2,Rn3b5,#Imm3b8" 0 c,
create 指令清單_Item$1 ," ADD    Rd4b11,Rn4b19,#Imm26b1:Imm3b14:Imm8b7" 0 c,
create 指令清單_Item$2 ," ADDS   Rd4b11,Rn4b19,#Imm26b1:Imm3b14:Imm8b7" 0 c,
create 指令清單_Item$2 ," ADDW   Rd4b11,Rn4b19,#Imm26b1:Imm3b14:Imm8b7" 0 c,

create 指令清單_Item$2 ," ADD    Rd3b2,Rn3b5,Rm3b8" 0 c,
create 指令清單_Item$2 ," ADD    dn1b7Rd3b2,Rm4b6" 0 c,
create 指令清單_Item$4 ," ADD.W  Rd4b11,Rn4b19,Rm4b3,shift2b5" 0 c,
create 指令清單_Item$5 ," ADDS.W Rd4b11,Rn4b19,Rm4b3,shift2b5" 0 c,



