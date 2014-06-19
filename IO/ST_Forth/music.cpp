#include "BCorHardWare.h"

typedef unsigned char u8;
typedef unsigned short u16;
typedef unsigned long u32;

#ifdef _HardWare
 #include <Table_Music.h>
extern void Play_Music(const unsigned char *Music_tbl);
#else //BC6
//---------------------------------------------------------------------------
#pragma hdrstop
#include <vcl.h>
#include "music.h"
#include "Unit1.h"
#include <winbase.h>
//---------------------------------------------------------------------------
extern void dly_ms(unsigned long dly);
void Play_Music(const unsigned char *Music_tbl);
#endif

extern unsigned int SYS_sec;
  
void beep_1(void) ; //short beep
void beep_vibrate( unsigned char beep_type );


void beep_vibrate( unsigned char beep_type )
{
   switch( beep_type )
   {
            case 0 :
                   Play_Music(Standard);
                   break;
            case 1 :
		   Play_Music(BFUN1);
                   break;
            case 2 :
		   Play_Music(BFUN2);
                   break;
            case 3 :
		   Play_Music(BFUN3);
                   break;       
            case 4 :
                   Play_Music(Ring);
                   break;
            case 5 :
                   Play_Music(Arpeggio);
                   break;
            case 6 :
                   Play_Music(Astral);
                   break;
            case 7 :
                   Play_Music(Triangle);
                   break;       
            case 8 :
                   Play_Music(Soundwave); // tone
                   break;
            default:
                   SYS_sec = 1 ;
                   Play_Music(Chirp); // chirp
                   break;
   }
}

// [Description ]
// This is PC simulate Beep sound and vibrate stop function
// Return value : no return variable
// [LIB include]
// music.h
// [Variable]
// [example]
// beep_vibrate_stop() ;
// this example will stop beep or vibrate
// [Description ]
// This is key tone sound function
// Return value : no return variable
// [LIB include]
// music.h
// [Variable]
// [example]
// beep_1() ;
// this example will beep short tone
void beep_1(void)
{
   beep_vibrate( 9 ) ; //short beep
}

#ifdef _HardWare
#else
void Play_Music(const unsigned char *Music_tbl)
{
  int i;
  //MusicFlg = True;
    LARGE_INTEGER CurrTicks, TicksCount; 

    QueryPerformanceFrequency( &TicksCount );
    QueryPerformanceCounter( &CurrTicks );

    TicksCount.QuadPart = TicksCount.QuadPart * SYS_sec /10i64;
    TicksCount.QuadPart += CurrTicks.QuadPart; 

    while(CurrTicks.QuadPart<TicksCount.QuadPart){
       for (i = 0 ; ;i+=2){
         if ( Music_tbl[i+1] == 0 ) break;
         if (Music_tbl[i] == 0 )
           dly_ms(Music_tbl[i + 1] * 10);
         else
           Beep(4000000 / 8 / (Music_tbl[i] + 1), Music_tbl[i + 1] * 10) ;
       }
       QueryPerformanceCounter( &CurrTicks );
    }
}
#endif
