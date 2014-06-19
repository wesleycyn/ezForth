HEX
                     


cr s" [RP]->TOS=>          "                type  [RP]->TOS                    u.                 
cr s" [RP]->TOS,RP+4->RP=> "       type  [RP]->TOS,RP+4->RP           u.
cr s" [SP]->TOS,SP+4->SP=> "       type  [SP]->TOS,SP+4->SP           u.
cr s" [SP]->WP=>           "                 type  [SP]->WP                     u.
cr s" [SP]->WP,SP+4->SP=>  "        type  [SP]->WP,SP+4->SP            u.
cr s" [IP]->IP=>           "                 type  [IP]->IP                     u.
cr s" [IP]->TOS,IP+4->IP=> "       type  [IP]->TOS,IP+4->IP           u.
cr s" [RP]->IP,RP+4->RP=>  "        type  [RP]->IP,RP+4->RP            u.
cr s" [SP]->TOS=>          "                type  [SP]->TOS                    u.
cr s" [IP]->IP=>           "                   type  [IP]->IP                       u.
cr s" [TOS]->TOS=>         "               type  [TOS]->TOS                   u.
cr s" [SP+4]->TOS=>        "              type  [SP+4]->TOS                  u.
cr s" byte[TOS]->TOS=>     "           type  byte[TOS]->TOS               u.
cr s" TOS->[SP],SP+4->SP=> "       type  TOS->[SP],SP+4->SP           u.
cr s" TOS->[SP+4]=>        "              type  TOS->[SP+4]                  u.
cr s" WP->[SP]=>           "                 type  WP->[SP]                     u.
cr s" WP->[TOS]=>          "                type  WP->[TOS]                    u.
cr s" TOS->[RP],RP+4->RP=> "       type  TOS->[RP],RP+4->RP           u.
cr s" TOS->[RP+4]=>        "              type  TOS->[RP+4]                  u.
cr s" TOS->[SP]=>          "                type  TOS->[SP]                    u.
cr s" IP->[RP],RP+4->RP=>  "        type  IP->[RP],RP+4->RP            u.
cr s" ?RP+4->IP=>          "                type  ?RP+4->IP                    u.
cr s" WP->byte[TOS]=>      "            type  WP->byte[TOS]                u.
cr s" 0->TOS=>             "                   type  0->TOS                       u.
cr s" 0->WP=>              "                    type  0->WP                        u.
cr s" RP->TOS=>            "                  type  RP->TOS                      u.
cr s" SP->TOS=>            "                  type  SP->TOS                      u.
cr s" TOS->RP=>            "                  type  TOS->RP                      u.
cr s" TOS->SP=>            "                  type  TOS->SP                      u.
cr s" TOS->WP=>            "                  type  TOS->WP                      u.
cr s" WP->TOS=>            "                  type  WP->TOS                      u.
cr s" TOS+Carry->TOS=>     "           type  TOS+Carry->TOS               u.
cr s" TOS+WP->WP=>         "               type  TOS+WP->WP                   u.
cr s" IP+4->IP=>           "                 type  IP+4->IP                     u.

cr s" TOS&WP->TOS=>        "              type  TOS&WP->TOS                  u.    

cr s" TOS^WP->TOS=>        "              type  TOS^WP->TOS                  u.

cr s" TOS|WP->TOS=>        "              type  TOS|WP->TOS                  u.

cr s" WP+TOS>>20->TOS=>    "          type  WP+TOS>>20->TOS              u.
\ cr s" [SP]->WP,SP+4->SP=>  "        type  [SP]->WP,SP+4->SP            u.
DECIMAL 

cr s" 1t is ok" type cr                                          