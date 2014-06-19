
fload asm.f
fload ARG.f
chdir arm/thumb2/

variable ASM_Display_flag
0 ASM_Display_flag !

HEX
' AND    alias forthAND
' ,      alias forth,

DEFER IMAGE                       \ Assembly Code Space
DEFER HERE-I                      \ current assembly counter
DEFER ,
DEFER W,

 fload main_thumb2.f



 fload eForth.f
\ fload eForth_test.f

chdir ../..



