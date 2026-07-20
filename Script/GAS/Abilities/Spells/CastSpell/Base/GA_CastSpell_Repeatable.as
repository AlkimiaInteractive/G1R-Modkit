
class UGA_CastSpell_Repeatable : UGA_CastSpell_Default
{
   default m_GE_Mana = UGE_ManaBurn::StaticClass();

   default m_ExecutionValidator = UCastSpellExecutionValidatorRepeatable::StaticClass();

   UFUNCTION(BlueprintOverride)
   void OnActivateCastSpellServer_Scriptable(const UAnimMontage castMontage)
   {
      m_TickEnabled = true;
   }

   // UFUNCTION(BlueprintOverride)
   // bool ShouldRestoreCameraBehaviour_Scriptable()
   // {
   //    return true;
   // }

   UFUNCTION(BlueprintOverride)
   void OnEndCastSpellServer_Scriptable(bool WasCancelled)
   {
      m_TickEnabled = false;
   }
}