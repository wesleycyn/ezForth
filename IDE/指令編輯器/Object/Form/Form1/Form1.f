:Object Form1                <Super DialogWindow

Font WinFont           \ default font
' 2drop value WmCommand-Func   \ function pointer for WM_COMMAND
ColorObject FrmColor      \ the background color 

fload Object/Form/Form1/Form1_List.f
fload Object/Form/Form1/ClassInit.f
fload Object/Form/Form1/WindowStyle.f
fload Object/Form/Form1/ParentWindow.f
fload Object/Form/Form1/WindowTitle.f
fload Object/Form/Form1/StartSize.f
fload Object/Form/Form1/StartPos.f
fload Object/Form/Form1/Close.f
fload Object/Form/Form1/WM_COMMAND.f
fload Object/Form/Form1/SetCommand.f
fload Object/Form/Form1/On_Init.f
fload Object/Form/Form1/On_Paint.f
fload Object/Form/Form1/On_Done.f
;Object