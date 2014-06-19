//---------------------------------------------------------------------------

#ifndef UARTH
#define UARTH
//---------------------------------------------------------------------------
#include <Classes.hpp>
//---------------------------------------------------------------------------
class UartThread : public TThread
{            
private:
protected:
        void __fastcall Execute();
public:
        __fastcall UartThread(bool CreateSuspended);
};
//---------------------------------------------------------------------------
#endif
