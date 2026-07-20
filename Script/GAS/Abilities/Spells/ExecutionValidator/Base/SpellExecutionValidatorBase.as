UCLASS()
class USpellExecutionValidatorBase : USpellExecutionValidator
{
   default m_ExecutionValidatorData = USpellExecutionValidatorDataBase::StaticClass();

   UPROPERTY()
   bool m_PrintDebugMsgs = false;

   // USpellExecutionValidatorDataBase DoDataCast(USpellExecutionValidatorDataBase Data)
   // {
   //      return Cast<USpellExecutionValidatorDataBase>(Data);
   // }

   bool ValidateData()
   {
      return false;
   }

   void PrintDebugOnScreen(FName Text, float Duration, FColor Color) const
   {
      if(m_PrintDebugMsgs)
         MagicScript::DebugOnScreen(Text, Duration, Color);
   }

}