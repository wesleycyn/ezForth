: RCC_APB1PeriphResetCmd ( uint32_t RCC_APB1Periph FunctionalState NewState -- )
  over
  IS_RCC_APB1_RESET_PERIPH
  IS_FUNCTIONAL_STATE  
  case
   enable  of  RCC->APB1RSTR@  or  endof             
   diaable of  RCC->APB1RSTR@  and endof
  endcase
  RCC->APB1RSTR!
  ;


\s
void RCC_APB1PeriphResetCmd(uint32_t RCC_APB1Periph, FunctionalState NewState)
{
  /* Check the parameters */
  assert_param(IS_RCC_APB2_RESET_PERIPH(RCC_APB1Periph));
  assert_param(IS_FUNCTIONAL_STATE(NewState));
  if (NewState != DISABLE)
  {
    RCC->APB1RSTR |= RCC_APB1Periph;
  }
  else
  {
    RCC->APB1RSTR &= ~RCC_APB1Periph;
  }
}