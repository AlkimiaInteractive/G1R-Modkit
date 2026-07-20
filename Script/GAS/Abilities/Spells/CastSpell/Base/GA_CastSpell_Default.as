
class UGA_CastSpell_Default : UGameplayAbilityCastSpell
{
   default m_GE_Mana = UGE_ManaBurn::StaticClass();

   default m_ExecutionValidator = UCastSpellExecutionValidatorDefault::StaticClass();

   UFUNCTION(BlueprintOverride)
   void PlayLaunchSpell_Scriptable()
   {
      PlayCastMontage(n"Launch", false);
   }
   
   UFUNCTION(BlueprintOverride)
   void PlayNextCastLevel_Scriptable()
   {
   }

   UFUNCTION(BlueprintOverride)
   float GetCastDuration_Scriptable() const
   {
      return GetCastSectionDuration(FName("In")) + GetLevelCastingTime();
   }

   UFUNCTION(BlueprintOverride)
   void OnInputReleased_Scriptable()
   {
   }

   UFUNCTION(BlueprintOverride)
   bool OnShouldFinishSpellAfterActivation_Scriptable()
   {
      return !IsSpellManaUsageContinuous() && !IsSpellManaUsageNormalContinuous();
   }

   UFUNCTION(BlueprintOverride)
   bool OnCanActivateAbilityServer_Scriptable(FGameplayAbilityActorInfo GameplayAbilityActorInfo) const
   {
      USpellExecutionValidatorDataDefault data = CreateSpellValidatorExecutionData();
      return DoExecutionValidation(data, GameplayAbilityActorInfo.AvatarActor);
   }
  
   bool DoExecutionValidation(USpellExecutionValidatorDataDefault data, AActor SourceActor) const
   {
      InitializeValidatorData(data, SourceActor);
      return ExecuteValidator(data);
   }

   void InitializeValidatorData(USpellExecutionValidatorDataDefault Data, AActor SourceActor) const
   {
        USpellExecutionValidatorDataDefault data = Cast<USpellExecutionValidatorDataDefault>(Data);
        data.SourceActor = SourceActor;
   }


   USpellExecutionValidatorDataDefault CreateSpellValidatorExecutionData() const
   {
      auto executor = Cast<UCastSpellExecutionValidatorDefault>(m_ExecutionValidator.Get().GetDefaultObject());
      return Cast<USpellExecutionValidatorDataDefault>(NewObject(nullptr, executor.GetExecutionValidatorDataClass()));
   }

   

}
  