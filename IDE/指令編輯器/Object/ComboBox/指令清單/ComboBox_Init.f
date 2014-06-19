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