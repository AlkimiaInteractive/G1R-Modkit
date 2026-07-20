
class UGA_CastSpell_ChargeByDuration : UGA_CastSpell_Default
{
   default m_ExecutionValidator = UCastSpellExecutionValidatorChargeByDuration::StaticClass();

   UFUNCTION(BlueprintOverride, meta=(NoSuperCall))
    void PlayLaunchSpell_Scriptable()
   {
      //Do nothing. No play launch animation because it will be played after charge normally.
   }

}