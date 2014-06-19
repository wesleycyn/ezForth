:M On_Init:     ( -- )
   s" MS Sans Serif" SetFaceName: WinFont
   8 Width: WinFont
   Create: WinFont
   \ set form color to system color
   COLOR_BTNFACE Call GetSysColor NewColor: FrmColor

  \ Button1_Init
  \ ComboBox1_Init
  \ Label1_Init 
  \ Radio1_Init 
  \ TextBox1_Init 
 
            
            
 \ ComboBox2_Init
 \ ComboBox3_Init                
 \ ComboBox4_Init
 \ ComboBox5_Init
 \ ComboBox6_Init
 \ ComboBox7_Init             
            
            
                指令清單_Init               
                Arg1_Init


                self Start: Arg2
                \ 190 74 49 21 Move: Arg2
                Arg2_x Arg2_y Arg2_w Arg2_h  Move: Arg2 ( x y w h )                
                0 0 CB_RESETCONTENT GetID: Arg2 SendDlgItemMessage: self drop
                Arg2_Item$0 count drop  0 CB_ADDSTRING GetID: Arg2 SendDlgItemMessage: self drop
                Arg2_Item$1 count drop  0 CB_ADDSTRING GetID: Arg2 SendDlgItemMessage: self drop
                Arg2_Item$2 count drop  0 CB_ADDSTRING GetID: Arg2 SendDlgItemMessage: self drop                
                0 Arg2_SETCURSEL CB_SETCURSEL    GetID: Arg2 SendDlgItemMessage: self drop

                self Start: Arg3
                \ 265 75 46 22 Move: Arg3
                Arg3_x Arg3_y Arg3_w Arg3_h  Move: Arg3 ( x y w h )                
                0 0 CB_RESETCONTENT GetID: Arg3 SendDlgItemMessage: self drop
                Arg3_Item$0 count drop  0 CB_ADDSTRING GetID: Arg3 SendDlgItemMessage: self drop
                Arg3_Item$1 count drop  0 CB_ADDSTRING GetID: Arg3 SendDlgItemMessage: self drop
                0 Arg3_SETCURSEL CB_SETCURSEL    GetID: Arg3 SendDlgItemMessage: self drop

                self Start: Arg4
                \ 327 74 51 22 Move: Arg4
                Arg4_x Arg4_y Arg4_w Arg4_h  Move: Arg4 ( x y w h )                
                0 0 CB_RESETCONTENT GetID: Arg4 SendDlgItemMessage: self drop
                Arg4_Item$0 count drop  0 CB_ADDSTRING GetID: Arg4 SendDlgItemMessage: self drop
                Arg4_Item$1 count drop  0 CB_ADDSTRING GetID: Arg4 SendDlgItemMessage: self drop
                0 Arg4_SETCURSEL CB_SETCURSEL    GetID: Arg4 SendDlgItemMessage: self drop


                self Start: bit31
                9 159 89 25 Move: bit31
                Handle: Winfont SetFont: bit31
                \ bit31_x bit31_y bit31_w bit31_h  Move: bit31 ( x y w h )                
                0 0 CB_RESETCONTENT GetID: bit31 SendDlgItemMessage: self drop
                bit31_Item$0 count drop  0 CB_ADDSTRING GetID: bit31 SendDlgItemMessage: self drop
                bit31_Item$1 count drop  0 CB_ADDSTRING GetID: bit31 SendDlgItemMessage: self drop
                bit31_Item$2 count drop  0 CB_ADDSTRING GetID: bit31 SendDlgItemMessage: self drop                
                0 bit31_SETCURSEL CB_SETCURSEL    GetID: bit31 SendDlgItemMessage: self drop                 

                self Start: bit30
                106 159 100 25 Move: bit30
                Handle: Winfont SetFont: bit30
                \ bit30_x bit30_y bit30_w bit30_h  Move: bit30 ( x y w h )                
                0 0 CB_RESETCONTENT GetID: bit30 SendDlgItemMessage: self drop
                bit30_Item$0 count drop  0 CB_ADDSTRING GetID: bit30 SendDlgItemMessage: self drop
                bit30_Item$1 count drop  0 CB_ADDSTRING GetID: bit30 SendDlgItemMessage: self drop
                bit30_Item$2 count drop  0 CB_ADDSTRING GetID: bit30 SendDlgItemMessage: self drop                
                0 bit30_SETCURSEL CB_SETCURSEL    GetID: bit30 SendDlgItemMessage: self drop                 

                self Start: bit29
                213 157 100 25 Move: bit29
                Handle: Winfont SetFont: bit29
                \ bit29_x bit29_y bit29_w bit29_h  Move: bit29 ( x y w h )                
                0 0 CB_RESETCONTENT GetID: bit29 SendDlgItemMessage: self drop
                bit29_Item$0 count drop  0 CB_ADDSTRING GetID: bit29 SendDlgItemMessage: self drop
                bit29_Item$1 count drop  0 CB_ADDSTRING GetID: bit29 SendDlgItemMessage: self drop
                bit29_Item$2 count drop  0 CB_ADDSTRING GetID: bit29 SendDlgItemMessage: self drop                
                0 bit29_SETCURSEL CB_SETCURSEL    GetID: bit29 SendDlgItemMessage: self drop                 

                self Start: bit28
                323 158 100 25 Move: bit28
                Handle: Winfont SetFont: bit28
                \ bit28_x bit28_y bit28_w bit28_h  Move: bit28 ( x y w h )                
                0 0 CB_RESETCONTENT GetID: bit28 SendDlgItemMessage: self drop
                bit28_Item$0 count drop  0 CB_ADDSTRING GetID: bit28 SendDlgItemMessage: self drop
                bit28_Item$1 count drop  0 CB_ADDSTRING GetID: bit28 SendDlgItemMessage: self drop
                bit28_Item$2 count drop  0 CB_ADDSTRING GetID: bit28 SendDlgItemMessage: self drop                
                0 bit28_SETCURSEL CB_SETCURSEL    GetID: bit28 SendDlgItemMessage: self drop                 

                self Start: bit27
                9 191 90 25 Move: bit27
                Handle: Winfont SetFont: bit27
                \ bit27_x bit27_y bit27_w bit27_h  Move: bit27 ( x y w h )                
                0 0 CB_RESETCONTENT GetID: bit27 SendDlgItemMessage: self drop
                bit27_Item$0 count drop  0 CB_ADDSTRING GetID: bit27 SendDlgItemMessage: self drop
                bit27_Item$1 count drop  0 CB_ADDSTRING GetID: bit27 SendDlgItemMessage: self drop
                bit27_Item$2 count drop  0 CB_ADDSTRING GetID: bit27 SendDlgItemMessage: self drop                
                0 bit27_SETCURSEL CB_SETCURSEL    GetID: bit27 SendDlgItemMessage: self drop                 

                self Start: bit26
                107 187 100 25 Move: bit26
                Handle: Winfont SetFont: bit26
                \ bit26_x bit26_y bit26_w bit26_h  Move: bit26 ( x y w h )                
                0 0 CB_RESETCONTENT GetID: bit26 SendDlgItemMessage: self drop
                bit26_Item$0 count drop  0 CB_ADDSTRING GetID: bit26 SendDlgItemMessage: self drop
                bit26_Item$1 count drop  0 CB_ADDSTRING GetID: bit26 SendDlgItemMessage: self drop
                bit26_Item$2 count drop  0 CB_ADDSTRING GetID: bit26 SendDlgItemMessage: self drop                
                0 bit26_SETCURSEL CB_SETCURSEL    GetID: bit26 SendDlgItemMessage: self drop                 

                self Start: bit25
                216 187 100 25 Move: bit25
                Handle: Winfont SetFont: bit25
                \ bit25_x bit25_y bit25_w bit25_h  Move: bit25 ( x y w h )                
                0 0 CB_RESETCONTENT GetID: bit25 SendDlgItemMessage: self drop
                bit25_Item$0 count drop  0 CB_ADDSTRING GetID: bit25 SendDlgItemMessage: self drop
                bit25_Item$1 count drop  0 CB_ADDSTRING GetID: bit25 SendDlgItemMessage: self drop
                bit25_Item$2 count drop  0 CB_ADDSTRING GetID: bit25 SendDlgItemMessage: self drop                
                0 bit25_SETCURSEL CB_SETCURSEL    GetID: bit25 SendDlgItemMessage: self drop                 
                

                self Start: bit24
                328 188 100 25 Move: bit24
                Handle: Winfont SetFont: bit24
                \ bit24_x bit24_y bit24_w bit24_h  Move: bit24 ( x y w h )                
                0 0 CB_RESETCONTENT GetID: bit24 SendDlgItemMessage: self drop
                bit24_Item$0 count drop  0 CB_ADDSTRING GetID: bit24 SendDlgItemMessage: self drop
                bit24_Item$1 count drop  0 CB_ADDSTRING GetID: bit24 SendDlgItemMessage: self drop
                bit24_Item$2 count drop  0 CB_ADDSTRING GetID: bit24 SendDlgItemMessage: self drop                
                0 bit24_SETCURSEL CB_SETCURSEL    GetID: bit24 SendDlgItemMessage: self drop 


                self Start: bit23
                4 246 100 25 Move: bit23
                Handle: Winfont SetFont: bit23
                \ bit23_x bit23_y bit23_w bit23_h  Move: bit23 ( x y w h )                
                0 0 CB_RESETCONTENT GetID: bit23 SendDlgItemMessage: self drop
                bit23_Item$0 count drop  0 CB_ADDSTRING GetID: bit23 SendDlgItemMessage: self drop
                bit23_Item$1 count drop  0 CB_ADDSTRING GetID: bit23 SendDlgItemMessage: self drop
                bit23_Item$2 count drop  0 CB_ADDSTRING GetID: bit23 SendDlgItemMessage: self drop                
                0 bit23_SETCURSEL CB_SETCURSEL    GetID: bit23 SendDlgItemMessage: self drop                 

                self Start: bit22
                112 247 100 25 Move: bit22
                Handle: Winfont SetFont: bit22
                \ bit22_x bit22_y bit22_w bit22_h  Move: bit22 ( x y w h )                
                0 0 CB_RESETCONTENT GetID: bit22 SendDlgItemMessage: self drop
                bit22_Item$0 count drop  0 CB_ADDSTRING GetID: bit22 SendDlgItemMessage: self drop
                bit22_Item$1 count drop  0 CB_ADDSTRING GetID: bit22 SendDlgItemMessage: self drop
                bit22_Item$2 count drop  0 CB_ADDSTRING GetID: bit22 SendDlgItemMessage: self drop                
                0 bit22_SETCURSEL CB_SETCURSEL    GetID: bit22 SendDlgItemMessage: self drop                 

                self Start: bit21
                219 246 100 25 Move: bit21
                Handle: Winfont SetFont: bit21
                \ bit21_x bit21_y bit21_w bit21_h  Move: bit21 ( x y w h )                
                0 0 CB_RESETCONTENT GetID: bit21 SendDlgItemMessage: self drop
                bit21_Item$0 count drop  0 CB_ADDSTRING GetID: bit21 SendDlgItemMessage: self drop
                bit21_Item$1 count drop  0 CB_ADDSTRING GetID: bit21 SendDlgItemMessage: self drop
                bit21_Item$2 count drop  0 CB_ADDSTRING GetID: bit21 SendDlgItemMessage: self drop                
                0 bit21_SETCURSEL CB_SETCURSEL    GetID: bit21 SendDlgItemMessage: self drop                 

                self Start: bit20
                330 244 100 25 Move: bit20
                Handle: Winfont SetFont: bit20
                \ bit20_x bit20_y bit20_w bit20_h  Move: bit20 ( x y w h )                
                0 0 CB_RESETCONTENT GetID: bit20 SendDlgItemMessage: self drop
                bit20_Item$0 count drop  0 CB_ADDSTRING GetID: bit20 SendDlgItemMessage: self drop
                bit20_Item$1 count drop  0 CB_ADDSTRING GetID: bit20 SendDlgItemMessage: self drop
                bit20_Item$2 count drop  0 CB_ADDSTRING GetID: bit20 SendDlgItemMessage: self drop                
                0 bit20_SETCURSEL CB_SETCURSEL    GetID: bit20 SendDlgItemMessage: self drop                 

                self Start: bit19
                4 279 100 25 Move: bit19
                Handle: Winfont SetFont: bit19
                \ bit19_x bit19_y bit19_w bit19_h  Move: bit19 ( x y w h )                
                0 0 CB_RESETCONTENT GetID: bit19 SendDlgItemMessage: self drop
                bit19_Item$0 count drop  0 CB_ADDSTRING GetID: bit19 SendDlgItemMessage: self drop
                bit19_Item$1 count drop  0 CB_ADDSTRING GetID: bit19 SendDlgItemMessage: self drop
                bit19_Item$2 count drop  0 CB_ADDSTRING GetID: bit19 SendDlgItemMessage: self drop                
                0 bit19_SETCURSEL CB_SETCURSEL    GetID: bit19 SendDlgItemMessage: self drop                 

                self Start: bit18
                113 279 100 25 Move: bit18
                Handle: Winfont SetFont: bit18
                \ bit18_x bit18_y bit18_w bit18_h  Move: bit18 ( x y w h )                
                0 0 CB_RESETCONTENT GetID: bit18 SendDlgItemMessage: self drop
                bit18_Item$0 count drop  0 CB_ADDSTRING GetID: bit18 SendDlgItemMessage: self drop
                bit18_Item$1 count drop  0 CB_ADDSTRING GetID: bit18 SendDlgItemMessage: self drop
                bit18_Item$2 count drop  0 CB_ADDSTRING GetID: bit18 SendDlgItemMessage: self drop                
                0 bit18_SETCURSEL CB_SETCURSEL    GetID: bit18 SendDlgItemMessage: self drop                 

                self Start: bit17
                220 278 100 25 Move: bit17
                Handle: Winfont SetFont: bit17
                \ bit17_x bit17_y bit17_w bit17_h  Move: bit17 ( x y w h )                
                0 0 CB_RESETCONTENT GetID: bit17 SendDlgItemMessage: self drop
                bit17_Item$0 count drop  0 CB_ADDSTRING GetID: bit17 SendDlgItemMessage: self drop
                bit17_Item$1 count drop  0 CB_ADDSTRING GetID: bit17 SendDlgItemMessage: self drop
                bit17_Item$2 count drop  0 CB_ADDSTRING GetID: bit17 SendDlgItemMessage: self drop                
                0 bit17_SETCURSEL CB_SETCURSEL    GetID: bit17 SendDlgItemMessage: self drop                 

                self Start: bit16
                331 277 100 25 Move: bit16
                Handle: Winfont SetFont: bit16
                \ bit16_x bit16_y bit16_w bit16_h  Move: bit16 ( x y w h )                
                0 0 CB_RESETCONTENT GetID: bit16 SendDlgItemMessage: self drop
                bit16_Item$0 count drop  0 CB_ADDSTRING GetID: bit16 SendDlgItemMessage: self drop
                bit16_Item$1 count drop  0 CB_ADDSTRING GetID: bit16 SendDlgItemMessage: self drop
                bit16_Item$2 count drop  0 CB_ADDSTRING GetID: bit16 SendDlgItemMessage: self drop                
                0 bit16_SETCURSEL CB_SETCURSEL    GetID: bit16 SendDlgItemMessage: self drop                 

                self Start: bit15
                10 344 98 25 Move: bit15
                Handle: Winfont SetFont: bit15
                \ bit15_x bit15_y bit15_w bit15_h  Move: bit15 ( x y w h )                
                0 0 CB_RESETCONTENT GetID: bit15 SendDlgItemMessage: self drop
                bit15_Item$0 count drop  0 CB_ADDSTRING GetID: bit15 SendDlgItemMessage: self drop
                bit15_Item$1 count drop  0 CB_ADDSTRING GetID: bit15 SendDlgItemMessage: self drop
                bit15_Item$2 count drop  0 CB_ADDSTRING GetID: bit15 SendDlgItemMessage: self drop                
                0 bit15_SETCURSEL CB_SETCURSEL    GetID: bit15 SendDlgItemMessage: self drop                 

                self Start: bit14
                117 343 100 25 Move: bit14
                Handle: Winfont SetFont: bit14
                \ bit14_x bit14_y bit14_w bit14_h  Move: bit14 ( x y w h )                
                0 0 CB_RESETCONTENT GetID: bit14 SendDlgItemMessage: self drop
                bit14_Item$0 count drop  0 CB_ADDSTRING GetID: bit14 SendDlgItemMessage: self drop
                bit14_Item$1 count drop  0 CB_ADDSTRING GetID: bit14 SendDlgItemMessage: self drop
                bit14_Item$2 count drop  0 CB_ADDSTRING GetID: bit14 SendDlgItemMessage: self drop                
                0 bit14_SETCURSEL CB_SETCURSEL    GetID: bit14 SendDlgItemMessage: self drop                 

                self Start: bit13
                221 342 100 25 Move: bit13
                Handle: Winfont SetFont: bit13
                \ bit13_x bit13_y bit13_w bit13_h  Move: bit13 ( x y w h )                
                0 0 CB_RESETCONTENT GetID: bit13 SendDlgItemMessage: self drop
                bit13_Item$0 count drop  0 CB_ADDSTRING GetID: bit13 SendDlgItemMessage: self drop
                bit13_Item$1 count drop  0 CB_ADDSTRING GetID: bit13 SendDlgItemMessage: self drop
                bit13_Item$2 count drop  0 CB_ADDSTRING GetID: bit13 SendDlgItemMessage: self drop                
                0 bit13_SETCURSEL CB_SETCURSEL    GetID: bit13 SendDlgItemMessage: self drop                 
                

                self Start: bit12
                326 341 100 25 Move: bit12
                Handle: Winfont SetFont: bit12
                \ bit12_x bit12_y bit12_w bit12_h  Move: bit12 ( x y w h )                
                0 0 CB_RESETCONTENT GetID: bit12 SendDlgItemMessage: self drop
                bit12_Item$0 count drop  0 CB_ADDSTRING GetID: bit12 SendDlgItemMessage: self drop
                bit12_Item$1 count drop  0 CB_ADDSTRING GetID: bit12 SendDlgItemMessage: self drop
                bit12_Item$2 count drop  0 CB_ADDSTRING GetID: bit12 SendDlgItemMessage: self drop                
                0 bit12_SETCURSEL CB_SETCURSEL    GetID: bit12 SendDlgItemMessage: self drop                
                

                self Start: bit11
                11 375 100 25 Move: bit11
                Handle: Winfont SetFont: bit11
                \ bit11_x bit11_y bit11_w bit11_h  Move: bit11 ( x y w h )                
                0 0 CB_RESETCONTENT GetID: bit11 SendDlgItemMessage: self drop
                bit11_Item$0 count drop  0 CB_ADDSTRING GetID: bit11 SendDlgItemMessage: self drop
                bit11_Item$1 count drop  0 CB_ADDSTRING GetID: bit11 SendDlgItemMessage: self drop
                bit11_Item$2 count drop  0 CB_ADDSTRING GetID: bit11 SendDlgItemMessage: self drop                
                0 bit11_SETCURSEL CB_SETCURSEL    GetID: bit11 SendDlgItemMessage: self drop                

                self Start: bit10
                117 373 100 25 Move: bit10
                Handle: Winfont SetFont: bit10
                \ bit10_x bit10_y bit10_w bit10_h  Move: bit10 ( x y w h )                
                0 0 CB_RESETCONTENT GetID: bit10 SendDlgItemMessage: self drop
                bit10_Item$0 count drop  0 CB_ADDSTRING GetID: bit10 SendDlgItemMessage: self drop
                bit10_Item$1 count drop  0 CB_ADDSTRING GetID: bit10 SendDlgItemMessage: self drop
                bit10_Item$2 count drop  0 CB_ADDSTRING GetID: bit10 SendDlgItemMessage: self drop                
                0 bit10_SETCURSEL CB_SETCURSEL    GetID: bit10 SendDlgItemMessage: self drop                

                self Start: bit9
                220 371 100 25 Move: bit9
                Handle: Winfont SetFont: bit9
                \ bit9_x bit9_y bit9_w bit9_h  Move: bit9 ( x y w h )                
                0 0 CB_RESETCONTENT GetID: bit9 SendDlgItemMessage: self drop
                bit9_Item$0 count drop  0 CB_ADDSTRING GetID: bit9 SendDlgItemMessage: self drop
                bit9_Item$1 count drop  0 CB_ADDSTRING GetID: bit9 SendDlgItemMessage: self drop
                bit9_Item$2 count drop  0 CB_ADDSTRING GetID: bit9 SendDlgItemMessage: self drop                
                0 bit9_SETCURSEL CB_SETCURSEL    GetID: bit9 SendDlgItemMessage: self drop                
                

                self Start: bit8
                326 370 100 25 Move: bit8
                Handle: Winfont SetFont: bit8
                \ bit8_x bit8_y bit8_w bit8_h  Move: bit8 ( x y w h )                
                0 0 CB_RESETCONTENT GetID: bit8 SendDlgItemMessage: self drop
                bit8_Item$0 count drop  0 CB_ADDSTRING GetID: bit8 SendDlgItemMessage: self drop
                bit8_Item$1 count drop  0 CB_ADDSTRING GetID: bit8 SendDlgItemMessage: self drop
                bit8_Item$2 count drop  0 CB_ADDSTRING GetID: bit8 SendDlgItemMessage: self drop                
                0 bit8_SETCURSEL CB_SETCURSEL    GetID: bit8 SendDlgItemMessage: self drop


                self Start: bit7
                13 440 100 25 Move: bit7
                Handle: Winfont SetFont: bit7
                \ bit7_x bit7_y bit7_w bit7_h  Move: bit7 ( x y w h )                
                0 0 CB_RESETCONTENT GetID: bit7 SendDlgItemMessage: self drop
                bit7_Item$0 count drop  0 CB_ADDSTRING GetID: bit7 SendDlgItemMessage: self drop
                bit7_Item$1 count drop  0 CB_ADDSTRING GetID: bit7 SendDlgItemMessage: self drop
                bit7_Item$2 count drop  0 CB_ADDSTRING GetID: bit7 SendDlgItemMessage: self drop                
                0 bit7_SETCURSEL CB_SETCURSEL    GetID: bit7 SendDlgItemMessage: self drop


                self Start: bit6
                118 437 100 25 Move: bit6
                Handle: Winfont SetFont: bit6
                \ bit6_x bit6_y bit6_w bit6_h  Move: bit6 ( x y w h )                
                0 0 CB_RESETCONTENT GetID: bit6 SendDlgItemMessage: self drop
                bit6_Item$0 count drop  0 CB_ADDSTRING GetID: bit6 SendDlgItemMessage: self drop
                bit6_Item$1 count drop  0 CB_ADDSTRING GetID: bit6 SendDlgItemMessage: self drop
                bit6_Item$2 count drop  0 CB_ADDSTRING GetID: bit6 SendDlgItemMessage: self drop                
                0 bit6_SETCURSEL CB_SETCURSEL    GetID: bit6 SendDlgItemMessage: self drop                

                self Start: bit5
                226 437 100 25 Move: bit5
                Handle: Winfont SetFont: bit5
                \ bit5_x bit5_y bit5_w bit5_h  Move: bit5 ( x y w h )                
                0 0 CB_RESETCONTENT GetID: bit4 SendDlgItemMessage: self drop
                bit5_Item$0 count drop  0 CB_ADDSTRING GetID: bit5 SendDlgItemMessage: self drop
                bit5_Item$1 count drop  0 CB_ADDSTRING GetID: bit5 SendDlgItemMessage: self drop
                bit5_Item$2 count drop  0 CB_ADDSTRING GetID: bit5 SendDlgItemMessage: self drop                
                0 bit5_SETCURSEL CB_SETCURSEL    GetID: bit5 SendDlgItemMessage: self drop                  
                
                
                self Start: bit4
                333 436 100 25 Move: bit4
                Handle: Winfont SetFont: bit4
                \ bit4_x bit4_y bit4_w bit4_h  Move: bit4 ( x y w h )                
                0 0 CB_RESETCONTENT GetID: bit4 SendDlgItemMessage: self drop
                bit4_Item$0 count drop  0 CB_ADDSTRING GetID: bit4 SendDlgItemMessage: self drop
                bit4_Item$1 count drop  0 CB_ADDSTRING GetID: bit4 SendDlgItemMessage: self drop
                bit4_Item$2 count drop  0 CB_ADDSTRING GetID: bit4 SendDlgItemMessage: self drop                
                0 bit4_SETCURSEL CB_SETCURSEL    GetID: bit4 SendDlgItemMessage: self drop                      
                                                                            
                self Start: bit3
                Handle: Winfont SetFont: bit3
                bit3_x bit3_y bit3_w bit3_h  Move: bit3 ( x y w h )                
                0 0 CB_RESETCONTENT GetID: bit3 SendDlgItemMessage: self drop
                bit3_Item$0 count drop  0 CB_ADDSTRING GetID: bit3 SendDlgItemMessage: self drop
                bit3_Item$1 count drop  0 CB_ADDSTRING GetID: bit3 SendDlgItemMessage: self drop
                bit3_Item$2 count drop  0 CB_ADDSTRING GetID: bit3 SendDlgItemMessage: self drop                
                0 bit3_SETCURSEL CB_SETCURSEL    GetID: bit3 SendDlgItemMessage: self drop                
                
                

                self Start: bit2
                Handle: Winfont SetFont: bit2
                bit2_x bit2_y bit2_w bit2_h  Move: bit2 ( x y w h )                
                0 0 CB_RESETCONTENT GetID: bit2 SendDlgItemMessage: self drop
                bit2_Item$0 count drop  0 CB_ADDSTRING GetID: bit2 SendDlgItemMessage: self drop
                bit2_Item$1 count drop  0 CB_ADDSTRING GetID: bit2 SendDlgItemMessage: self drop
                bit2_Item$2 count drop  0 CB_ADDSTRING GetID: bit2 SendDlgItemMessage: self drop                
                0 bit2_SETCURSEL CB_SETCURSEL GetID: bit2 SendDlgItemMessage: self drop 


                self Start: bit1
                Handle: Winfont SetFont: bit1
                bit1_x bit1_y bit1_w bit1_h  Move: bit1 ( x y w h )                
                0 0 CB_RESETCONTENT GetID: bit1 SendDlgItemMessage: self drop
                bit1_Item$0 count drop  0 CB_ADDSTRING GetID: bit1 SendDlgItemMessage: self drop
                bit1_Item$1 count drop  0 CB_ADDSTRING GetID: bit1 SendDlgItemMessage: self drop
                bit1_Item$2 count drop  0 CB_ADDSTRING GetID: bit1 SendDlgItemMessage: self drop                
                0 bit1_SETCURSEL CB_SETCURSEL    GetID: bit1 SendDlgItemMessage: self drop                
                              
                self Start: bit0
                Handle: Winfont SetFont: bit0
                bit0_x bit0_y bit0_w bit0_h  Move: bit0 ( x y w h )                
                0 0 CB_RESETCONTENT GetID: bit0 SendDlgItemMessage: self drop
                bit0_Item$0 count drop  0 CB_ADDSTRING GetID: bit0 SendDlgItemMessage: self drop
                bit0_Item$1 count drop  0 CB_ADDSTRING GetID: bit0 SendDlgItemMessage: self drop
                bit0_Item$2 count drop  0 CB_ADDSTRING GetID: bit0 SendDlgItemMessage: self drop                
                0 bit0_SETCURSEL CB_SETCURSEL    GetID: bit0 SendDlgItemMessage: self drop

 \ Button1_Init
                Button1_ID  SetID: Button1
                self Start: Button1
                370 520 60 25 Move: Button1
                Handle: Winfont SetFont: Button1
                s" 加入" SetText: Button1

 \ TextBox1_Init
                TextBox1_ID  SetID: TextBox1
                self Start: TextBox1
                3 38 100 25 Move: TextBox1
                Handle: Winfont SetFont: TextBox1

                TextBox2_ID  SetID: TextBox2
                self Start: TextBox2
                118 40 47 23 Move: TextBox2
                Handle: Winfont SetFont: TextBox2

                TextBox3_ID  SetID: TextBox3
                self Start: TextBox3
                187 42 55 21 Move: TextBox3
                Handle: Winfont SetFont: TextBox3

                TextBox4_ID  SetID: TextBox4
                self Start: TextBox4
                263 42 48 22 Move: TextBox4
                Handle: Winfont SetFont: TextBox4

                TextBox5_ID  SetID: TextBox5
                self Start: TextBox5
                326 42 44 22 Move: TextBox5
                Handle: Winfont SetFont: TextBox5





 \ Radio1_Init

                IDIGNORE SetID: Radio1
                self Start: Radio1
                13 134 100 25 Move: Radio1
                Handle: Winfont SetFont: Radio1
                s" Radio1" SetText: Radio1

                self Start: Radio2
                13 220 100 25 Move: Radio2
                Handle: Winfont SetFont: Radio2
                s" Radio2" SetText: Radio2

                self Start: Radio3
                8 311 100 25 Move: Radio3
                Handle: Winfont SetFont: Radio3
                s" Radio3" SetText: Radio3



                self Start: Radio4
                12 408 100 25 Move: Radio4
                Handle: Winfont SetFont: Radio4
                s" Radio4" SetText: Radio4
\ Label1_Init

                self Start: Label1
                7 1 100 23 Move: Label1
                Handle: Winfont SetFont: Label1
                s" ASM" SetText: Label1

                self Start: Label2
                2 113 100 25 Move: Label2
                Handle: Winfont SetFont: Label2
                s" DISASM" SetText: Label2

                self Start: Label3
                173 41 10 23 Move: Label3
                Handle: Winfont SetFont: Label3
                s" ," SetText: Label3

                self Start: Label4
                247 40 14 21 Move: Label4
                Handle: Winfont SetFont: Label4
                s" ," SetText: Label4

                self Start: Label5
                314 46 17 20 Move: Label5
                Handle: Winfont SetFont: Label5
                s" ," SetText: Label5

                ;M
