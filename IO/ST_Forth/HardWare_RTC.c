#include "stm32f10x_lib.h"
#include "ioReFlex.h"

struct RTCState{
  int Err;
  int Value;
};

extern struct RTCState Data;

extern struct RTCState RTC_read1(unsigned char Addr);
extern unsigned char RTC_write1(unsigned char Addr,unsigned char Data);


struct {
  u8 YearL;
  u8 YearH;
  u8 MonthL;
  u8 MonthH;  
  u8 DayL;
  u8 DayH;
  u8 HourL;
  u8 HourH; 
  u8 MinuteL;
  u8 MinuteH;
  u8 SecondL;
  u8 SecondH;  
  u32 SumSecond;
 }DateTime;


u16 MonthsTable[4][12]=
{
  {0,31,60,91,121,152,182,213,244,274,305,335},
  {0,31,59,90,120,151,181,212,243,273,304,334},
  {0,31,59,90,120,151,181,212,243,273,304,334},
  {0,31,59,90,120,151,181,212,243,273,304,334}  
};

u16 FourYesrDaysTable[4]=
{
  0,366,731,1096
};

void RTC_ISR(void);
void Sec_To_HMS(u32 SumSec);
void Day_To_YMD(u32 SunDay);  
void tDay_To_YMD(u32 SunDay);
void DateTime_To_SumSecond(void);



void Sec_To_HMS(u32 TimeVar)
{    
  u8 Hours,Minutes,Seconds;    
  /* Compute  hours */
  Hours =(TimeVar / 3600)%24; 
  DateTime.HourH = Hours/10 ;
  DateTime.HourL = Hours%10;  
  /* Compute minutes */
  Minutes  =  (TimeVar/60)%60;
  DateTime.MinuteH = Minutes/10;
  DateTime.MinuteL = Minutes%10;
  /* Compute seconds */  
  Seconds =TimeVar % 60;    
  DateTime.SecondH=Seconds/10;   
  DateTime.SecondL=Seconds%10;
} 

void Day_To_YMD( u32 DayVar)
{

  u8 Years,Months,Days;  
  u8 bissextile;
  u32 FourYesrDaysVar;
  
   Years=((DayVar-1)/(365*4+1));
   Years=Years *4; 

  
  
    FourYesrDaysVar=((DayVar-1)%(365*4+1)); 
      if (FourYesrDaysVar>1095)Years=Years+3;
      else if (FourYesrDaysVar>730)Years=Years+2; 
      else if (FourYesrDaysVar>365)Years=Years+1;


   bissextile=Years%4;       
  DayVar=(DayVar-1)%(365*4+1)+1-FourYesrDaysTable[bissextile];
  
if (bissextile==0)
{
   if (DayVar>182 )   
   { 
     if (DayVar>274)
     {
        if(DayVar>335)
        {
          Months=12;Days=DayVar-335;
        }
        else
        {
          if (DayVar>305)
          {
            Months=11;Days=DayVar-305;
          }
          else
          {
            Months=10;Days=DayVar-274;            
          }
        }
     }
     else
     {
       if (DayVar>244)
       {          
             Months=9;Days=DayVar-244;      
       }
       else
       {
         if (DayVar>213)
         {
             Months=8;Days=DayVar-213; 
         }
         else
         {
             Months=7;Days=DayVar-182;          
         }
       }       
     }
   }  
   else 
   {
     if (DayVar>91)
     {
        if (DayVar>152)
        {
             Months=6;Days=DayVar-152;           
        }
        else
        {
          if(DayVar>121)
          {
             Months=5;Days=DayVar-121;             
          }
          else
          {
             Months=4;Days=DayVar-91;            
          }
        }
     }
     else
     {
       if (DayVar>60)
       {
          Months=3;Days=DayVar-60;  
       }
       else
       {
         if(DayVar>31)
         {
            Months=2;Days=DayVar-31;           
         }
         else
         {
            Months=1;Days=DayVar;        
         }
       }
     }
   }
}  
else
{
   if (DayVar>181 )   
   { 
     if (DayVar>273)
     {
        if(DayVar>334)
        {
          Months=12;Days=DayVar-334;
        }
        else
        {
          if (DayVar>304)
          {
            Months=11;Days=DayVar-304;
          }
          else
          {
            Months=10;Days=DayVar-273;            
          }
        }
     }
     else
     {
       if (DayVar>243)
       {          
             Months=9;Days=DayVar-243;      
       }
       else
       {
         if (DayVar>212)
         {
             Months=8;Days=DayVar-212; 
         }
         else
         {
             Months=7;Days=DayVar-181;          
         }
       }       
     }
   }
   else 
   {
     if (DayVar>90)
     {
        if (DayVar>151)
        {
             Months=6;Days=DayVar-151;           
        }
        else
        {
          if(DayVar>120)
          {
             Months=5;Days=DayVar-120;             
          }
          else
          {
             Months=4;Days=DayVar-90;            
          }
        }
     }
     else
     {
       if (DayVar>59)
       {
          Months=3;Days=DayVar-59;  
       }
       else
       {
         if(DayVar>31)
         {
            Months=2;Days=DayVar-31;           
         }
         else
         {
            Months=1;Days=DayVar;        
         }
       }
     }
   }
}   
      	DateTime.DayH=Days/10;
      	DateTime.DayL=Days%10;        
      	DateTime.MonthH=Months/10;
      	DateTime.MonthL=Months%10;        
        DateTime.YearH=Years/10;
        DateTime.YearL=Years%10;         
}

void tDay_To_YMD( u32 DayVar)
{
  u8 Years,Months,Days;

  Years=DayVar/360;
  Months=(DayVar%360)/30;
  Days= DayVar%30; 

      	DateTime.DayH=Days/10;
      	DateTime.DayL=Days%10;        
      	DateTime.MonthH=Months/10;
      	DateTime.MonthL=Months%10;        
        DateTime.YearH=Years/10;
        DateTime.YearL=Years%10;         
}

void DateTime_To_SumSecond(void)
{
  u8 Years,Months,Days;
  u8 Hours,Minutes,Seconds;   
  u8 bissextile;
  Years=DateTime.YearH*10+DateTime.YearL;
  Months=DateTime.MonthH*10+DateTime.MonthL;
  Days=DateTime.DayH*10+DateTime.DayL;    
  Hours=DateTime.HourH*10+DateTime.HourL;
  Minutes=DateTime.MinuteH*10+DateTime.MinuteL;
  Seconds=DateTime.SecondH*10+DateTime.SecondL;    
  if ((Years%4)==0)
  DateTime.SumSecond=((((Years/4*1461)+(Years%4)*365+MonthsTable[Years%4][Months-1]+Days)*24+Hours)*60 +Minutes)*60 +Seconds;     
  else
  DateTime.SumSecond=((((Years/4*1461)+(Years%4)*365+1+MonthsTable[Years%4][Months-1]+Days)*24+Hours)*60 +Minutes)*60 +Seconds;  
}


                            
                           
struct RTCState RTC_read1(unsigned char Addr)
{
  u32 TimeVar;
  
  TimeVar=RTC_GetCounter();
  Sec_To_HMS(TimeVar%86400);
  Day_To_YMD(TimeVar/86400);   
//  tDay_To_YMD(TimeVar/86400);  
  Data.Err=0;
  Data.Value=0;
  switch (Addr){
    case RTCSecond:
       	Data.Value = DateTime.SecondH*16+DateTime.SecondL;
       	break;
    case RTCMinute:
      	Data.Value = DateTime.MinuteH*16+DateTime.MinuteL;
    	break;
    case RTCHour:
      	Data.Value = DateTime.HourH*16+DateTime.HourL;
    	break;
    case RTCDay:
      	Data.Value = DateTime.DayH*16+DateTime.DayL;
    	break;
    case RTCMonth:
      	Data.Value =DateTime.MonthH*16+DateTime.MonthL;
    	break;
    case RTCYear:
      	Data.Value =DateTime.YearH*16+DateTime.YearL;
        break;
  }    
  return Data;
}

unsigned char RTC_write1(unsigned char Addr,unsigned char Data)
{
    /* Wait until last write operation on RTC registers has finished */
  RTC_WaitForLastTask();
  /* Change the current time */
  switch (Addr){
    case RTCSecond:
        DateTime.SecondH=Data/0x10;
        DateTime.SecondL=Data&0xf;        
       	break;
    case RTCMinute:
      	DateTime.MinuteH=Data/0x10;
      	DateTime.MinuteL=Data&0xf;        
    	break;
    case RTCHour:
      	DateTime.HourH=Data/0x10;
      	DateTime.HourL=Data&0xf;        
    	break;
    case RTCDay:
      	DateTime.DayH=Data/0x10;
      	DateTime.DayL=Data&0xf;        
    	break;
    case RTCMonth:
      	DateTime.MonthH=Data/0x10;
      	DateTime.MonthL=Data&0xf;        
    	break;
    case RTCYear:
        DateTime.YearH=Data/0x10;
        DateTime.YearL=Data&0xf;        
        break;
 }
 
   DateTime_To_SumSecond(); 
   RTC_SetCounter(DateTime.SumSecond);
  
  /* Wait until last write operation on RTC registers has finished */
  RTC_WaitForLastTask();
       return 0;
}


void RTC_ISR(void)
{
  if (RTC_GetITStatus(RTC_IT_SEC) != RESET)
  {
    /* Clear the RTC Second interrupt */
    RTC_ClearITPendingBit(RTC_IT_SEC);

    /* Toggle GPIO_LED pin 6 each 1s */


    /* Enable time update */


    /* Wait until last write operation on RTC registers has finished */
    RTC_WaitForLastTask();
    /* Reset RTC Counter when Time is 23:59:59 */
//    if (RTC_GetCounter() == 0x00015180)
//    {
//      RTC_SetCounter(0x0);
      /* Wait until last write operation on RTC registers has finished */
//      RTC_WaitForLastTask();      
//    }
  }
}