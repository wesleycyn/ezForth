
\ LDR
cr

\ "LDR<c> <Rt>, [<Rn>, #<imm5>]"
s" LDR<c> <Rt>, [<Rn>, #<imm5>] : " type 
   LDR R1,[R2,#31]


\ "LDR<c> <Rt>,[<Rn>,#+/-<imm8>]"
s" LDR<c> <Rt>,[<Rn>,#+/-<imm8>] : " type 
   LDR R1,[R2,#-123]





\ "LDR<c> <Rt>,[<Rn>],#+/-<imm8>"
s" LDR<c> <Rt>,[<Rn>],#+/-<imm8> : " type 
   LDR R1,[R2],#123


\ "LDR<c> <Rt>,[SP,#<imm8>]"
s" LDR<c> <Rt>,[SP,#<imm8>] : " type 
   LDR R1,[SP,#123]


\ "LDR<c> <Rt>,[PC,#<imm>]"
cr
s" LDR<c> <Rt>,[PC,#<imm>] : " type 
   LDR R1,[PC,#123]


\ LDR (register)
\ "LDR<c> <Rt>,[<Rn>,<Rm>]"
s" LDR Rt,[Rn,Rm] : " type 
   LDR R1,[R2,R3]

   \ "LDR<c> <Rt>,[<Rn>,#+/-<imm8>]!"
s" LDR<c> <Rt>,[<Rn>,#+/-<imm8>]! : " type 
   LDR R1,[R3,#123]!


\ LDR.W

\ "LDR<c>.W <Rt>,[<Rn>,#<imm12>]"
\ "LDR<c>.W <Rt>,[PC,#+/-<imm12>]"
\ "LDR<c>.W <Rt>,[<Rn>,<Rm>{,LSL #<shift>}]"

