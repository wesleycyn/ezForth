\ «Å§i ComboBox
ComboBox Arg1
31  value Arg1_ID

\ ªì©l¤Æ ComboBox
 
0   value Arg1_SETCURSEL
122 value Arg1_x
75  value Arg1_y
46  value Arg1_w
22  value Arg1_h

create Arg1_Item$0 ," -" 0 c,
create Arg1_Item$1 ," Rd4b11" 0 c,
create Arg1_Item$2 ," Rd3b2" 0 c,

: Arg1_Init
                self Start: Arg1
              \ 190 74 49 21 Move: Arg2                
                Arg1_x Arg1_y Arg1_w Arg1_h  Move: Arg1 ( x y w h )
                Handle: Winfont SetFont: Arg1
                0 0 CB_RESETCONTENT GetID: Arg1 SendDlgItemMessage: self drop
                Arg1_Item$0 count drop  0 CB_ADDSTRING GetID: Arg1 SendDlgItemMessage: self drop
                Arg1_Item$1 count drop  0 CB_ADDSTRING GetID: Arg1 SendDlgItemMessage: self drop
                0 Arg1_SETCURSEL CB_SETCURSEL    GetID: Arg1 SendDlgItemMessage: self drop
 ;
 
: Arg1_Op ;

