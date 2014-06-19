//---------------------------------------------------------------------------

#ifndef Unit1H
#define Unit1H
//---------------------------------------------------------------------------
#include <Classes.hpp>
#include <Controls.hpp>
#include <StdCtrls.hpp>
#include <Forms.hpp>
#include <ExtCtrls.hpp>
#include <Menus.hpp>
//#define H_Bytes     20
//#define V_Dots      16
//---------------------------------------------------------------------------
class TForm1 : public TForm
{
__published:	// IDE-managed Components
        TPanel *Panel1;
        TPanel *Panel2;
        TButton *Button2;
        TTimer *Timer1;
        TGroupBox *GroupBox1;
        TImage *Image1;
        TPanel *Panel3;
        TLabel *Label1;
        TComboBox *ComboBox1;
        TButton *Button1;
        TGroupBox *GroupBox3;
        TGroupBox *GroupBox2;
        TLabel *Label2;
        TLabel *Label3;
        TLabel *Label4;
        TLabel *Label5;
        TLabel *Label12;
        TEdit *edtID;
        TEdit *edtDate;
        TComboBox *cboBatt;
        TComboBox *cboForm;
        TComboBox *cboLang;
        TButton *Button6;
        TMemo *mem1;
        TMainMenu *MainMenu1;
        TMenuItem *System1;
        TMenuItem *Admin1;
        TLabel *lblType;
        void __fastcall FormShow(TObject *Sender);
        void __fastcall FormCreate(TObject *Sender);
        void __fastcall Button2Click(TObject *Sender);
        void __fastcall Timer1Timer(TObject *Sender);
        void __fastcall Button1Click(TObject *Sender);
        void __fastcall Button6Click(TObject *Sender);
        void __fastcall Admin1Click(TObject *Sender);
private:	// User declarations
public:		// User declarations
        __fastcall TForm1(TComponent* Owner);
};
//---------------------------------------------------------------------------
extern PACKAGE TForm1 *Form1;
//---------------------------------------------------------------------------
#endif
