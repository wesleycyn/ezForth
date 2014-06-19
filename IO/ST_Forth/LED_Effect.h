//***前功能************************
void scroll_left(void);  //向左移入
void scroll_leftB(void);  //Binary 向左移入
void scroll_leftX(int len); //向左移入1
void scroll_right(void); //向右移入
void scroll_up(void);    //向上捲入
void scroll_down(void);  //向下捲入
void animate(void);      //動畫帶入
void shot_left(int page_num);    //射入
void Vrain_down(void);   //下雨
void Snow(void);         //雪花
void jmp_right(int page_num);    //跳入
void over_down(void);    //覆蓋向下
void over_right(void);   //覆蓋向右
void appear(void);       //立即顯現
void appearRight(void);
//*********************************

//***後功能************************
void flash_Out(void);      //反白閃爍
void Vrain_down_Out(void); //蒸發
void Snow_Out(void);       //腐蝕
void animate_Out(void);    //動畫帶出
void jmp_right_Out(int page_num);  //跳出
void over_down_Out(void);  //覆蓋向下後功能
void over_right_Out(void);     //覆蓋向右後功能
void scroll_left_Out(void);  //向左移出
void scroll_right_Out(void); //向右移出
void scroll_up_Out(void);    //向上捲出
void scroll_down_Out(void);  //向下捲出
void flash_NormalOut(void);  //閃爍
void disappear(void); //立即消失

#ifdef _HardWare
#else //BC6
void scroll_left_str(int page_num);
#endif

void jmp_right_Out_str(void); //字串跳出
//*********************************