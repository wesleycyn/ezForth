: RCC_APB2PeriphResetCmd ( uint32_t RCC_APB2Periph FunctionalState NewState -- )
  over
  IS_RCC_APB2_RESET_PERIPH
  IS_FUNCTIONAL_STATE
  
  case
   enable  of  RCC->APB2RSTR @  or  endof             
   diaable of  RCC->APB2RSTR @  and endof
  endcase
  RCC->APB2RSTR !
  ;


\s
void RCC_APB2PeriphResetCmd(uint32_t RCC_APB2Periph, FunctionalState NewState)
{
  /* Check the parameters */
  assert_param(IS_RCC_APB2_RESET_PERIPH(RCC_APB2Periph));
  assert_param(IS_FUNCTIONAL_STATE(NewState));
  if (NewState != DISABLE)
  {
    RCC->APB2RSTR |= RCC_APB2Periph;
  }
  else
  {
    RCC->APB2RSTR &= ~RCC_APB2Periph;
  }
}