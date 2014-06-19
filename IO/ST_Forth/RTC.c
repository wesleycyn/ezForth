/*----------------------------------------------------*/
/*  2003/10/30 12:51PM             Author:Jonathan Lee
    These Fuction For RICOH RS5C372A
    I2C Bus Serial Interface
    Real-Time Clock Ic

    2004/5/17 04:05PM Modify
    You Can R/W Second,Minute,Hour,Day,Month,Year BCD Code
    Periodic Interrupt Cycle Is Every Second
    When Interrupt Is occurred, You Have To Call RTC_Interrupt()
    If Return Value=0X04 Then Periodic Interrupt Operation
    ...

    Read Second:
    Example:
      struct RTCState Data;
      Data=RTC_read1(RTCSecond);
      Data.Value --> Return Value
      Data.Err   --> When Error Return 1

    Write Second:
    Example:
      i=RTC_write1(RTCSecond,New Value);
      i --> When Error Return 1
*/

/*----------------------------------------------------*/
        #include "LPC22xx.h"

// I2C
      #define SCL_Hi	IO0SET=P02
      #define SCL_Lo	IO0CLR=P02
      #define SCL_In	IO0DIR=IO0DIR&(!P02)
      #define SCL_Out	IO0DIR=IO0DIR|P02
      #define SCL		IO0PIN&P02

      #define SDA_Hi	IO0SET=P03
      #define SDA_Lo	IO0CLR=P03
      #define SDA_In	IO0DIR=IO0DIR&(!P03)
      #define SDA_Out	IO0DIR=IO0DIR|P03
      #define SDA		IO0PIN&P03

unsigned char RTC_DataIn(void);
unsigned char RTC_DataOut(unsigned char Data);
struct RTCState RTC_read1(unsigned char Addr);
unsigned char RTC_write1(unsigned char Addr,unsigned char Data);
unsigned char RTC_Interrupt(void);

struct RTCState{
  unsigned char Err;
  unsigned char Value;
};

/*----------------------------------------------------*/
void RTC_Delay(unsigned char Time){
	do{
  	}while(Time--);
}

/*----------------------------------------------------*/
void RTC_Start(void){
	SDA_Hi;
  	//RTC_Delay(3);
	SCL_Hi;
  	RTC_Delay(3);
  	SDA_Lo;
  	RTC_Delay(3);
  	SCL_Lo;
  	//RTC_Delay(3);
}

/*----------------------------------------------------*/
void RTC_Stop(void){
	SDA_Lo;
  	//RTC_Delay(3);
  	SCL_Hi;
  	RTC_Delay(3);
  	SDA_Hi;
  	RTC_Delay(3);
  	//RTC_Delay(2);
}

/*----------------------------------------------------*/
struct RTCState RTC_read1(unsigned char Addr){
  	struct RTCState Data;
  	Data.Err=0;
  	Data.Value=0;
  	Addr=Addr<<4;

  	RTC_Start();                                          //Send Start Bit
  	Data.Err=RTC_DataOut(0x64);                           //Send Control Byte
  	if(!Data.Err)Data.Err=RTC_DataOut(Addr);              //Send Address
  	if(!Data.Err)RTC_Start();                             //Send Start Bit
  	if(!Data.Err)RTC_DataOut(0x65);                       //Send Control Byte
  	if(!Data.Err)Data.Value=RTC_DataIn();                 //Read Data
  	if(!Data.Err)RTC_Stop();                              //Send Stop Bit
  	return Data;                                          //Read Failed(Ack Error)
}

/*----------------------------------------------------*/
unsigned char RTC_write1(unsigned char Addr,unsigned char Data){
  	unsigned char i;
  	Addr=Addr<<4;

  	RTC_Start();                                          //Send Start Bit
  	i=RTC_DataOut(0x64);                                  //Send Control Byte
  	if(!i)i=RTC_DataOut(Addr);                            //Send Address
  	if(!i)i=RTC_DataOut(Data);                            //Send Data
  	if(!i)RTC_Stop();                                     //Send Stop Bit
  	if(i)
	{
    	return 1;                                           //Write Failed(Ack Error)
  	}
	else
	{
    	return 0;                                           //Write Ok
  	}/*END If*/
}

/*----------------------------------------------------*/
unsigned char RTC_DataIn(void){
	unsigned char BitMask;
  	unsigned char Data;
  	BitMask=0x80;
  	Data=0;
  	SDA_Hi;
	RTC_Delay(3);

  	SDA_In;                                             //Input Port
	while(BitMask)
	{
    	SCL_Hi;
    	RTC_Delay(3);
    	if(SDA) 
		{
			Data|=BitMask;
		}
    	SCL_Lo;
    	RTC_Delay(3);
    	BitMask=BitMask>>1;
  	}
  //For Ack
	SDA_Out;                                             //Output Port
	RTC_Delay(3);
  	SCL_Hi;                                             //Inform Read Has Been Completed
  	RTC_Delay(3);                                         //By Not Generating An Acknowledge Signal
  	SCL_Lo;                                             //To The Slave Side
	RTC_Delay(3);
	SDA_Hi;
	RTC_Delay(3);

  	return Data;
}

/*----------------------------------------------------*/
unsigned char RTC_DataOut(unsigned char Data){
  	unsigned char BitMask;
  	BitMask=0x80;

  	while(BitMask)
	{
    	if(BitMask&Data)
		{
      		SDA_Hi;
    	}
		else
		{
      		SDA_Lo;
	    }/*END If*/
    	RTC_Delay(3);
    	SCL_Hi;
    	RTC_Delay(3);
    	SCL_Lo;
    	RTC_Delay(3);
    	BitMask=BitMask>>1;
  }

	//For Ack 
 	SDA_In;                                             //Input Port
  	RTC_Delay(3);
  	SCL_Hi;
  	BitMask=10;                                           //Ack Timeout
  	do{
  	}while(SDA&&(--BitMask));

  	RTC_Delay(3);
  	SCL_Lo;
  	RTC_Delay(3);

  	SDA_Out;                                             //Output Port
  	if(BitMask)
	{
	   return 0;                                           //Send Ok
  	}
	else
	{
    	return 1;                                           //Send Failed(Ack Error)
  	}/*END If*/
}
