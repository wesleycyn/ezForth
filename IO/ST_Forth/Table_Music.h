

/*
MUSIC tone define table
	p=69+12*log2(f/440) 	
	f=440x2^((p-69)/12)
*/



#pragma package(smart_init)
#define   MMB0    252             //4 MHz /8 /(252+1) / 2 = 988 Hz
#define   MC1     238             //4 MHz /8 /(238+1) / 2 = 1046 Hz
#define   MC1H    224             //MAIN CLOCK = 4MHz CLOCK = 4MHz / 8 = 500KHz
#define   MD1     212             
#define   MD1H    200
#define   ME1     189
#define   MF1     178
#define   MF1H    168
#define   MG1     158
#define   MG1H    149
#define   MA1     141
#define   MA1H    133
#define   MMB1    126
#define   MC2     118
#define   MC2H    112
#define   MD2     105
#define   MD2H    99
#define   ME2     94
#define   MF2     89
#define   MF2H    83
#define   MG2     79
#define   MG2H    74
#define   MA2     70
#define   MA2H    66
#define   MMB2    62
#define   MC3     59
#define   MC3H    55
#define   MD3     52
#define   MD3H    49
#define   ME3     46
#define   MF3     44
#define   MF3H    41
#define   MG3     39
#define   MG3H    37
#define   MA3     35
#define   MA3H    33
#define   MMB3    31
#define   MK27    182
			
#define   FA0     178     // 349 Hz ;1Mhz / 16 = 62.5K
#define   SO0     158     // 390 Hz ;1Mhz / 16 = 62.5K
#define   RA0     141     // 440 Hz ;1Mhz / 16 = 62.5K
#define   SHI0    126     // 496 Hz ;1Mhz / 16 = 62.5K
#define   DO1     118     // 523 Hz ;1Mhz / 16 = 62.5K, 62.5K / 60 = 521 Hz *2
#define   RE1     105     // 587 Hz ;1Mhz / 16 = 62.5K
#define   MI1     94      // 659 Hz ;1Mhz / 16 = 62.5K
#define   FA1     89      // 698 Hz ;1Mhz / 16 = 62.5K
#define   SO1     79      // 784 Hz ;1Mhz / 16 = 62.5K
#define   RA1     70      // 880 Hz ;1Mhz / 16 = 62.5K
#define   SHI1    62      // 988 Hz ;1Mhz / 16 = 62.5K
#define   DO2     59      // 1046 Hz ;1Mhz / 16 = 62.5K
#define   RE2     52      // 1174 Hz ;1Mhz / 16 = 62.5K
#define   MI2     46      // 1318 Hz ;1Mhz / 16 = 62.5K
#define   FA2     44      // 1318 Hz ;1Mhz / 16 = 62.5K


/* MUSIC tone define table
C  = 523.25Hz,239   ;C  = 1046.5Hz,119   ;C  = 2093  Hz,60   ;C  = 4186  Hz
C# = 554.37Hz,225   ;C# = 1108.7Hz,113   ;C# = 2217.5Hz,56   ;C# = 4435  Hz
D  = 587.33Hz,213   ;D  = 1174.7Hz,106   ;D  = 2349.3Hz,53   ;D  = 4698.6Hz
D# = 622.26Hz,201   ;D# = 1244.5Hz,100   ;D# = 2489  Hz,50   ;D# = 4978  Hz
E  = 659.25Hz,190   ;E  = 1318.5Hz,95    ;E  = 2637  Hz,47   ;E  = 5274  Hz
F  = 698.46Hz,179   ;F  = 1396.9Hz,90    ;F  = 2793.8Hz,45   ;F  = 5587.7Hz
F# = 739.98Hz,169   ;F# = 1480  Hz,84    ;F# = 2960  Hz,42   ;F# = 5920  Hz
G  = 783.98Hz,159   ;G  = 1568  Hz,80    ;G  = 3136  Hz,40   ;G  = 6272  Hz
G# = 830.61Hz,150   ;G# = 1661.2Hz,75    ;G# = 3322.4Hz,38   ;G# = 6644.9Hz
A  = 880.00Hz,142   ;A  = 1760  Hz,71    ;A  = 3520  Hz,36   ;A  = 7040  Hz
A# = 932.33Hz,134   ;A# = 1865  Hz,67    ;A# = 3729  Hz,34   ;A# = 7459  Hz
B  = 987.77Hz,127   ;B  = 1975.5Hz,63    ;B  = 3951  Hz,32   ;B  = 7902  Hz

FIRST DIGIT IS FREQUENCE (250KHz)
SECOND DIGIT IS TIME LENGTH */


#pragma memory=constseg(ROMDATA):far

#define   SBAS    20
const unsigned char Standard[]=  // 7/8 S ,2700Hz
{
		MK27,	SBAS*7,
                0,      SBAS,
                0,      0};


const unsigned char WT125M[]={0,SBAS,0,0};  // 1/8 S ,OFF

const unsigned char Beep1[]={SBAS,MK27,
                             SBAS*20,0,
                             SBAS,0
                             ,0
                             };

const unsigned char BFUN1[]={MK27,SBAS,0,SBAS,MK27,SBAS*5,0,SBAS,0,0};
           
const unsigned char BFUN2[]={MK27,SBAS,       // 1/8 S ,2700Hz
                             0,SBAS,          // 1/8 S ,OFF
                             MK27,SBAS,       // 1/8 S ,2700Hz
                             0,SBAS,          // 1/8 S ,OFF
                             MK27,SBAS,       // 1/8 S ,2700Hz
                             0,SBAS*3,        // 3/8 S ,OFF
                             0,0};
                             
const unsigned char BFUN3[]={MK27,SBAS,       
                             0,SBAS,          
                             MK27,SBAS,       
                             0,SBAS,          
                             MK27,SBAS,       
                             0,SBAS,          
                             MK27,SBAS,       
                             0,SBAS*9,        
                             0,0};

const unsigned char NRBEP[]={
                             MMB0,10,           
                             0,0};

const unsigned char keytone[]={
                             250,3,           
                             0,0};
const unsigned char Chirp[]={
                             118,10,
                             0,50,
                             0,0};                             
                             
const unsigned char Alarm[]={
                              196,16,        
                              175,24,        
                              145,16,        
                              0,16,
                              196,16,        
                              175,24,        
                              145,16,        
                               0,16,        
                              196,16,        
                              175,24,        
                              145,16,        
                              0,100};

const unsigned char SILN3S[]={0,100};

const unsigned char SILN2S[]={0,170};

const unsigned char SILN1S[]={0,30,            
                              0,0};

#define	  SBEP    12
const unsigned char LOBEP[]={
                             MK27,32,            
                             0,16,
                             MK27,32,            
                             0,16,
                             MK27,32,            
                             0,16,
                             MK27,32,            
                             0,16,
                             MK27,32,            
                             0,16,
                             MK27,32,            
                             0,255,
                             0,0};

const unsigned char Ring[]={
                             140,6,            
                             168,6,
                             140,6,            
                             168,6,            
                             140,6,            
                             168,6,            
                             140,6,            
                             168,6,            
                             140,6,            
                             168,6,            
                             140,6,            
                             168,6,            
                             140,6,            
                             168,6,            
                             140,6,            
                             168,6,            
                              0,80,            
                              0,0};
                              
const unsigned char Soundwave[]={
                             118,6,            
                             128,8,
                             138,8,
                             128,8,            
                             118,6,            
                             128,8,            
                             118,6,            
                             128,8,
                             138,8,
                             128,8,            
                             118,6,            
                             128,8,            
                             118,6,            
                             128,8,
                             138,8,
                             128,8,            
                             118,6,            
                              0,80,            
                              0,0};                              
                              
const unsigned char DingDong[]={   
                             122,8,
                               0,2,         
                             122,8,         
                             0,2,         
                             122,8,           
                             0,2,         
                             122,8,       
                             0,2,             
                             122,8,       
                             0,2,             
                             192,8,       
                             0,2,             
                             192,8,       
                             0,2,             
                             192,8,       
                             0,2,             
                             192,8,       
                             0,2,             
                             192,18,
                             0,80,
                               0,0};        
const unsigned char Astral[]={                      
                             190,8,                
                             174,11,                
                             158,8,                
                             150,11,                
                             142,8,                
                             134,11,                
                             142,8,                
                             150,11,                
                             158,8,                
                             174,11,                
                             190,8,                
                             0,80,                
                              0,0};

const unsigned char Triangle[]={                      
                             250,35,                
                             195,35,                
                             130,60,                
                             0,80,                
                              0,0};
                              
const unsigned char Arpeggio[]={
                             190,15,                
                             245,15,                
                             190,18,                
                             145,15,                
                             190,15,
                             245,20,                
                             0,80,                
                             0,0};


