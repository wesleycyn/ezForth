PushButton Button1
21  value Button1_ID

: Button1_Op 
  ( 指令清單_Item$2 count drop )
  
  z" ddd"
   0 CB_ADDSTRING GetID: 指令清單 SendDlgItemMessage: self drop
;

