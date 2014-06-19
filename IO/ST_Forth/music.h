//---------------------------------------------------------------------------

#ifndef musicH
#define musicH
void out_beep(unsigned char data);
void TONE(char data);
void beep_vibrate( unsigned char beep_type ) ;
void beep_1(void) ;
void Play_Music(const unsigned char *Music_tbl);
//---------------------------------------------------------------------------
#endif
