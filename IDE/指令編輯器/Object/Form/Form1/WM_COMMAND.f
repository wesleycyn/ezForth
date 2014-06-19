:M WM_COMMAND   ( hwnd msg wparam lparam -- res )
   dup 0=      \ id is from a menu if lparam is zero
  if                         
    over LOWORD CurrentMenu if dup DoMenu: CurrentMenu then
    CurrentPopup if dup DoMenu: CurrentPopup then drop                                                                             
  else	  
   over LOWORD ( ID )
   case
    Button1_ID  of  Button1_Op endof                        
    TextBox1_ID of TextBox1_op endof
    TextBox2_ID of TextBox2_op endof
    TextBox3_ID of TextBox3_op endof
    TextBox4_ID of TextBox4_op endof
    TextBox5_ID of TextBox5_op endof
    
    Arg1_ID     of     Arg1_op endof
    Arg2_ID     of     Arg2_op endof
    Arg3_ID     of     Arg3_op endof
    Arg4_ID     of     Arg4_op endof    
                
    bit0_ID     of     bit0_op endof            
    bit1_ID     of     bit1_op endof
    bit2_ID     of     bit2_op endof
    bit3_ID     of     bit3_op endof
    bit4_ID     of     bit4_op endof
    bit5_ID     of     bit5_op endof
    bit6_ID     of     bit6_op endof
    bit7_ID     of     bit7_op endof
    bit8_ID     of     bit8_op endof
    bit9_ID     of     bit9_op endof
    bit10_ID    of     bit10_op endof            
    bit11_ID    of     bit11_op endof
    bit12_ID    of     bit12_op endof
    bit13_ID    of     bit13_op endof
    bit14_ID    of     bit14_op endof
    bit15_ID    of     bit15_op endof
    bit16_ID    of     bit16_op endof
    bit17_ID    of     bit17_op endof
    bit18_ID    of     bit18_op endof
    bit19_ID    of     bit19_op endof
    bit10_ID    of     bit20_op endof            
    bit21_ID    of     bit21_op endof
    bit22_ID    of     bit22_op endof
    bit23_ID    of     bit23_op endof
    bit24_ID    of     bit24_op endof
    bit25_ID    of     bit25_op endof
    bit26_ID    of     bit26_op endof
    bit27_ID    of     bit27_op endof
    bit28_ID    of     bit28_op endof
    bit29_ID    of     bit29_op endof
    bit30_ID    of     bit30_op endof            
    bit31_ID    of     bit31_op endof                                                        
   endcase
 then   
  0
 ;M



\s


:M WM_COMMAND   ( h m w l -- res )
   dup 0=      \ id is from a menu if lparam is zero
   if                         
    over LOWORD CurrentMenu if dup DoMenu: CurrentMenu then
    CurrentPopup if dup DoMenu: CurrentPopup then drop
                          
                                                   
    else	  over LOWORD ( ID ) self   \ object address on stack
                          WMCommand-Func ?dup    \ must not be zero
                          if        execute
                          else    
                               2drop   \ drop ID and object address
                          
                          then
                then      0 
 ;M
 
 \ ShellExecute(handle,'open','notepad.exe',nil,nil,SW_ShowNormal); 
                SW_ShowNormal 
                0 
                0             
                z" notepad.exe" 
                z" open"   
                hWnd 
                call ShellExecute                                                              
                Close: self          endof
\