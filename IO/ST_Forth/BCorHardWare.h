// 2008/10/31           Wesley 增加 LPC2210.c Timer0_isr() LED_change判斷 
// 2008/10/31           Lee 增加 SelfTest.cpp test_mode() 雙色測試 
// 2008/11/1 pm1:27     Wesly 增加 E-Block 三個入口函數 
//                              0x80010001  self_test_entry()  
//                              0x8001000d  UART_pro_entry()
//                              0x80010019  time_entry()
// 2008/11/1 pm1:39    Wesley Note: LPC2210.c  Timer0_isr 與  lpc2xxx_cstartup_Jmp2IRQ.s f FIQ 位置須一致  
//                              0x40000218  Timer0_isr (IAR 目前無法連動,須手動確認)             
// 2008/11/1 pm4:19    Wesley 修改 char Warning 
// 2008/11/3 pm3:39    Wesley Open JTAG debug RTCLK  
// 2008/11/03 pm6:06    Wesley Set upgrade.cpp To @"UpgradeROM" 
// 2008/11/04          1.修改RTC真正硬體Check
//                     2.修改Upgrade真正擺入進入程式// 
// 2008/11/12 pm1:36   BZTM ok 

// 2008/11/13 pm3:45   BZTY=9 ok  
// 2008/12/08 am10:48  Latch 由P2.21改為 P2.22 
// 2008/12/08 15:14    P0.24 永為low(LRCM Power Ctl)  
// 2008/12/09 am11:50  Hold Time太長未結束無法立即反應,修改Delay函數
// 2008/12/09 am11:50  十字二十字通用版本從1.0開始 
// 2008/12/19 pm18:05  修改 第一通記憶計程算錯誤  delete_node1
// 2009/01/08 pm4:27  增加 2000~2099年閏年換算
// 2009/01/08 pm4:43  增加 LED_ON_flag 控制 ; LED_ON_flag=0 close LED&Buzzer!?
// 2009/01/20 pm5:31  增加 const MarkStrBoot 替代 原先 Define Mark 
// 2009/02/02 pm5:08  修改 LED_change,msTi,RecProcessing 為 volatile
// 2009/02/09 pm1:46  非優化 mdy_bits() ; 排除 雙行模式-字不全現象
// 2009/02/09 pm5:38  SoftWare Reset OK
// 2009/03/13 pm4:26  補掛 GALEDCLRDY nml_timer 
// 2009/03/16 pm4:26  非優化  Flash 特效 ; 排除 單行flash模式-字不全現象
// 2009/03/17 pm12:54 補time_entry()於 HardWare_1sec.c
#define  _HardWare 
//#define BCB_New_Version