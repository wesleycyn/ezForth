//----------------------------------------------------------------------------
#ifndef Unit5H
#define Unit5H
//----------------------------------------------------------------------------
#include <vcl\Buttons.hpp>
#include <vcl\StdCtrls.hpp>
#include <vcl\Controls.hpp>
#include <vcl\Forms.hpp>
#include <vcl\Graphics.hpp>
#include <vcl\Classes.hpp>
#include <vcl\SysUtils.hpp>
#include <vcl\Windows.hpp>
#include <vcl\System.hpp>
//----------------------------------------------------------------------------
class TPasswordDlg1 : public TForm
{
__published:
	TLabel *Label1;
	TEdit *Password;
	TButton *OKBtn;
	TButton *CancelBtn;
        void __fastcall OKBtnClick(TObject *Sender);
private:
public:
	virtual __fastcall TPasswordDlg1(TComponent* AOwner);
};
//----------------------------------------------------------------------------
extern PACKAGE TPasswordDlg1 *PasswordDlg1;
//----------------------------------------------------------------------------
#endif    
