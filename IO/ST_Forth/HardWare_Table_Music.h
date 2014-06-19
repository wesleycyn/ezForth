

/*
MUSIC tone define table
	p=69+12*log2(f/440) 	
	f=440x2^((p-69)/12)
*/


#define   PCLK		36000000		// VPB Bus CLK             
#define   MCLK		500000		// 原M3062之4Mhz
 
#define	Mb4	PCLK/7902-1
#define	Ma4H	PCLK/7459-1
#define	Ma4	PCLK/7040-1  		
#define	Mg4H	PCLK/6644.9 -1
#define	Mg4	PCLK/6272-1  
#define	Mf4H	PCLK/5920-1
#define	Mf4	PCLK/5587.7-1
#define	Me4	PCLK/5274-1  
#define	Md4H	PCLK/4978-1
#define	Md4	PCLK/293.66-1
#define	Mc4H	PCLK/4435-1   
#define	Mc4	PCLK/4186-1  		

#define	Mb3	PCLK/3951-1
#define	Ma3H	PCLK/3729-1
#define	Ma3	PCLK/3520-1	
#define	Mg3H	PCLK/3322.4-1
#define	Mg3	PCLK/3136-1  
#define	Mf3H	PCLK/2960-1
#define	Mf3	PCLK/2793.8-1
#define	Me3	PCLK/2637-1  
#define	Md3H	PCLK/2489-1
#define	Md3	PCLK/2349.3-1
#define	Mc3H	PCLK/2217.5-1 
#define	Mc3	PCLK/2093-1  		

#define	Mb2	PCLK/1975.5-1
#define	Ma2H	PCLK/1865-1    
#define	Ma2	PCLK/1760-1  		
#define	Mg2H	PCLK/1661.2-1 
#define	Mg2	PCLK/1568-1 
#define	Mf2H	PCLK/1480-1
#define	Mf2	PCLK/1396.9-1
#define	Me2	PCLK/1318.5-1
#define	Md2H	PCLK/1244.5-1 
#define	Md2	PCLK/1174.7-1
#define	Mc2H	PCLK/1108.7-1 
#define	Mc2	PCLK/1046.5-1		

#define	Mb1	PCLK/987.77-1
#define	Ma1H	PCLK/932.33-1
#define	Ma1	PCLK/880-1
#define	Mg1H	PCLK/830.61-1
#define	Mg1	PCLK/783.98-1
#define	Mf1a	PCLK/739.98-1
#define	Mf1	PCLK/698.46-1 
#define	Me1	PCLK/659.25-1
#define	Md1H	PCLK/622.26-1
#define	Md1	PCLK/587.33-1
#define	Mc1H	PCLK/554.37-1
#define	Mc1	PCLK/523.25-1

#define	Mb	PCLK/493.88-1
#define	MaH	PCLK/466.16-1  
#define	Ma	PCLK/440-1		// 國際標準音
#define	MgH	PCLK/415.30-1 
#define	Mg	PCLK/392-1
#define	MfH	PCLK/369.99-1 
#define	Mf	PCLK/349.23-1
#define	Me	PCLK/329.63-1
#define	MdH	PCLK/311.13-1 
#define	Md	PCLK/293.66-1
#define	McH	PCLK/277.18-1 
#define	Mc	PCLK/261.63-1		// 中央c

// Tone                                 // count:tone
#define	MMB0	PCLK/987.77-1           // 36444
#define	MK27	PCLK/2700-1             // 13332

#define	M182	(PCLK/MCLK)*(182+1)-1	// 13175:2732.45

#define	M250	(PCLK/MCLK)*(250+1)-1	// 18071: 1992
#define	M245	(PCLK/MCLK)*(245+1)-1   // 17711:
#define	M196	(PCLK/MCLK)*(196+1)-1   // 14183:
#define	M195	(PCLK/MCLK)*(195+1)-1   // 14111:
#define	M192	(PCLK/MCLK)*(192+1)-1   // 13895:
#define	M190	(PCLK/MCLK)*(190+1)-1   // 13679:
#define	M175	(PCLK/MCLK)*(175+1)-1   // 12671:
#define	M174	(PCLK/MCLK)*(174+1)-1   // 12599:
#define	M168	(PCLK/MCLK)*(168+1)-1   // 12167:
#define	M158	(PCLK/MCLK)*(158+1)-1   // 11447:
#define	M150	(PCLK/MCLK)*(150+1)-1   // 10871:
#define	M145	(PCLK/MCLK)*(145+1)-1   // 10511: 
#define	M142	(PCLK/MCLK)*(142+1)-1   // 10295:
#define	M140	(PCLK/MCLK)*(140+1)-1   // 10151:
#define	M138	(PCLK/MCLK)*(138+1)-1   // 10007:
#define	M134	(PCLK/MCLK)*(134+1)-1   // 9719:
#define	M130	(PCLK/MCLK)*(130+1)-1   // 9431:
#define	M128	(PCLK/MCLK)*(128+1)-1   // 9287: 
#define	M122	(PCLK/MCLK)*(122+1)-1   // 8855:
#define	M118	(PCLK/MCLK)*(118+1)-1   // 8567:4202


	

// 拍
//#define SBAS    PCLK/24-1			// 1/8 sec
#define P1P8    2048			// 1/8 sec
#define SBAS    (PCLK/P1P8-1)			// 1/8 sec

#define SBAS7    (PCLK/P1P8)*7-1			// 7/8 sec
#define SBAS5    (PCLK/P1P8)*5-1			// 5/8 sec
#define SBAS3    (PCLK/P1P8)*3-1			// 5/8 sec
#define SBAS9   (PCLK/P1P8)*9-1			// 5/8 sec

#define MSBAS    20					// M3062 1/8 sec

#define	S255	(PCLK/P1P8)*255/MSBAS-1
#define	S170	(PCLK/P1P8)*170/MSBAS-1
#define	S100	(PCLK/P1P8)*100/MSBAS-1
#define	S80		(PCLK/P1P8)*80/MSBAS-1
#define	S60		(PCLK/P1P8)*60/MSBAS-1
#define	S50		(PCLK/P1P8)*50/MSBAS-1
#define	S35		(PCLK/P1P8)*35/MSBAS-1
#define	S32		(PCLK/P1P8)*32/MSBAS-1
#define	S30		(PCLK/P1P8)*30/MSBAS-1
#define	S24		(PCLK/P1P8)*24/MSBAS-1
#define	S20		(PCLK/P1P8)*20/MSBAS-1

#define	S18		(PCLK/P1P8)*18/MSBAS-1
#define	S17		(PCLK/P1P8)*17/MSBAS-1
#define	S16		(PCLK/P1P8)*16/MSBAS-1
#define	S15		(PCLK/P1P8)*15/MSBAS-1
#define	S14		(PCLK/P1P8)*14/MSBAS-1
#define	S13		(PCLK/P1P8)*13/MSBAS-1
#define	S12		(PCLK/P1P8)*12/MSBAS-1
#define	S11		(PCLK/P1P8)*11/MSBAS-1
#define	S10		(PCLK/P1P8)*10/MSBAS-1            // 1/16
#define	S9		(PCLK/P1P8)*9/MSBAS-1
#define	S8		(PCLK/P1P8)*8/MSBAS-1
#define	S7		(PCLK/P1P8)*7/MSBAS-1
#define	S6		(PCLK/P1P8)*6/MSBAS-1
#define	S5		(PCLK/P1P8)*5/MSBAS-1
#define	S4		(PCLK/P1P8)*4/MSBAS-1
#define	S3		(PCLK/P1P8)*3/MSBAS-1
#define	S2		(PCLK/P1P8)*2/MSBAS-1
#define	S1		(PCLK/P1P8)*1/MSBAS-1




u32 Standard[]=
	{
		MK27,	SBAS7,
                0,      SBAS,
                0,      0
                
	};  // 7/8 S ,2700Hz

u32 WT125M[]={0,SBAS,0,0};  // 1/8 S ,OFF

u32 Beep[]=
	{
		0,		SBAS,	
		MK27,	SBAS*20,
		0,		SBAS,
		0,		0
	};

u32 BFUN1[]=
	{
		MK27,	SBAS,
		0,		SBAS,
		MK27,	SBAS5,
		0,		SBAS,
		0,		0
	};
           
u32 BFUN2[]=
	{
		MK27,	SBAS,       // 1/8 S ,2700Hz
     	0,		SBAS,          // 1/8 S ,OFF
        MK27,	SBAS,       // 1/8 S ,2700Hz
        0,		SBAS,          // 1/8 S ,OFF
        MK27,	SBAS,       // 1/8 S ,2700Hz
        0,		SBAS3,        // 3/8 S ,OFF
        0,		0
	};
                             
u32 BFUN3[]=
	{
		MK27,	SBAS,       
        0,		SBAS,          
        MK27,	SBAS,       
        0,		SBAS,          
        MK27,	SBAS,       
        0,		SBAS,          
        MK27,	SBAS,       
        0,		SBAS9,        
        0,		0
	};

u32 NRBEP[]=
	{
    	MMB0,	S10,           
        0,		0
    };

u32 keytone[]=
	{
        M250,	S3,           
		0,		0
	};
	
/*	
u32 Chirp[]=
	{	    
        Mg,		2*SBAS,                 
        Me,		2*SBAS,
        Me,		2*SBAS,
        0,		2*SBAS,

        Mf,		2*SBAS,
        Md,		2*SBAS,
        Md,		2*SBAS,
        0,		2*SBAS,

        Mc,		2*SBAS,
        Md,		2*SBAS,
        Me,		2*SBAS,
        Mf,		2*SBAS,

        Mg,		2*SBAS,
        Mg,		2*SBAS,
        Mg,		2*SBAS,
        0,		2*SBAS,

        Mg,		2*SBAS,
        Mf,		2*SBAS,
        Me,		3*SBAS,
        0,		1*SBAS,

        0,		0
    };                             

*/
u32 Chirp[]=
	{
       M118,	S10,
        0,		S50,
        0,		0
    };



                             
u32 Alarm[]=
	{
    	M196,	S16,        
		M175,	S24,        
		M145,	S16,        
		0,		S16,
		M196,	S16,        
		M175,	S24,        
		M145,	S16,        
		0,		S16,        
		M196,	S16,        
		M175,	S24,        
		M145,	S16,        
		0,		S100
	};

u32 SILN3S[]=
	{
		0,		S100
	};

u32 SILN2S[]=
	{
		0,		S170
	};

u32 SILN1S[]=
	{
		0,		S30,            
        0,		0
    };

#define	  SBEP    12

u32 LOBEP[]=
	{
		MK27,	S32,            
		0,		S16,
		MK27,	S32,            
		0,		S16,
		MK27,	S32,            
		0,		S16,
		MK27,	S32,            
		0,		S16,
		MK27,	S32,            
		0,		S16,
        MK27,	S32,            
        0,		S255,
        0,		0
     };

u32 Ring[]=
	{
		M140,	S6,            
		M168,	S6,
		M140,	S6,            
		M168,	S6,            
		M140,	S6,            
		M168,	S6,            
		M140,	S6,            
		M168,	S6,            
		M140,	S6,            
		M168,	S6,            
		M140,	S6,            
		M168,	S6,            
		M140,	S6,            
		M168,	S6,            
		M140,	S6,            
		M168,	S6,            
		0,		S80,            
		0,		0
	};
                              
u32 Soundwave[]=
	{
		M118,	S6,            
		M128,	S8,
		M138,	S8,
		M128,	S8,            
		M118,	S6,            
		M128,	S8,            
		M118,	S6,            
		M128,	S8,
		M138,	S8,
		M128,	S8,            
		M118,	S6,            
		M128,	S8,            
		M118,	S6,            
		M128,	S8,
		M138,	S8,
		M128,	S8,            
		M118,	S6,            
		0,		S80,            
		0,		0
	};                              
                              
u32 DingDong[]=
	{   
		M122,	S8,
		0,		S2,         
		M122,	S8,         
		0,		S2,         
		M122,	S8,           
		0,		S2,         
		M122,	S8,       
		0,		S2,             
		M122,	S8,       
		0,		S2,             
		M192,	S8,       
		0,		S2,             
		M192,	S8,       
		0,		S2,
		M192,	S8,
		0,		S2,
		M192,	S8,
		0,		S2,
		M192,	S18,
		0,		S80,
		0,		0
	}; 
	
u32 Astral[]=
	{                      
		M190,	S8,
		M174,	S11,
		M158,	S8,
		M150,	S11,
		M142,	S8,
		M134,	S11,
		M142,	S8,
		M150,	S11,
		M158,	S8,
		M174,	S11,
		M190,	S8,
		0,		S80,
		0,		0
		};

u32 Triangle[]=
	{                      
		M250,	S35,
		M195,	S35,
		M130,	S60,                
		0,		S80,
		0,		0
	};
                              
u32 Arpeggio[]=
	{
		M190,	S15,
		M245,	S15,
		M190,	S18,
		M145,	S15,
		M190,	S15,
		M245,	S20,
		0,		S80,            
		0,		0
	};

