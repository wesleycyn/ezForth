//---------------------------------------------------------------------------

#ifndef DisplayH
#define DisplayH
//---------------------------------------------------------------------------
#include <Classes.hpp>
//---------------------------------------------------------------------------
class DispThread : public TThread
{            
private:
protected:
        void __fastcall Execute();
public:
        __fastcall DispThread(bool CreateSuspended);
        void __fastcall DispThread::Led_display();
};
//---------------------------------------------------------------------------
#endif
