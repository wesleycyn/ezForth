//---------------------------------------------------------------------------

#ifndef SelfTestH
#define SelfTestH
//---------------------------------------------------------------------------
#include <Classes.hpp>
#include <SysUtils.hpp>
#include <DateUtils.hpp>
//---------------------------------------------------------------------------
class SelfTest : public TThread
{            
private:
protected:
        void __fastcall Execute();
public:
        __fastcall SelfTest(bool CreateSuspended);
};
//---------------------------------------------------------------------------
#endif
