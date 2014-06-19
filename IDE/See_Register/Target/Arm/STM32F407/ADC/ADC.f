: ADC_SR    0x00 ADC  ;
: ADC_CR1   0x04 ADC  ;
: ADC_CR2   0x08 ADC  ;
: ADC_SMPR1 0x0C ADC  ;
: ADC_SMPR2 0x10 ADC  ; 
: ADC_JOFR1 0x14 ADC  ; 
: ADC_JOFR2 0x18 ADC  ; 
: ADC_JOFR3 0x1C ADC  ;
: ADC_JOFR4 0x20 ADC  ;
: ADC_HTR   0x24 ADC  ;
: ADC_LTR   0x28 ADC  ;
: ADC_SQR1  0x2C ADC  ;
: ADC_SQR2  0x30 ADC  ;
: ADC_SQR3  0x34 ADC  ;
: ADC_JSQR  0x38 ADC  ;
: ADC_JDR1  0x3C ADC  ;
: ADC_JDR2  0x40 ADC  ;
: ADC_JDR3  0x44 ADC  ;
: ADC_JDR4  0x48 ADC  ;
: ADC_DR    0x4C ADC  ;


: ADC_CSR   0x00 ADC1 + ;
: ADC_CCR   0x04 ADC1 + ;
  
\s

Table 54. ADC global register map
Offset Register
0x000 - 0x04C ADC1
0x050 - 0x0FC Reserved
0x100 - 0x14C ADC2
0x118 - 0x1FC Reserved
0x200 - 0x24C ADC3
0x250 - 0x2FC Reserved
0x300 - 0x308 Common registers