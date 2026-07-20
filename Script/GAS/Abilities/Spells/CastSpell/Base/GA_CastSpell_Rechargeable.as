
class UGA_CastSpell_Rechargeable : UGameplayAbilityCastRechargeableSpell
{
    default m_GE_Mana = UGE_ManaBurn::StaticClass();

    default m_ExecutionValidator = UCastSpellExecutionValidatorRechargeable::StaticClass();

    UFUNCTION(BlueprintOverride)
    void PlayNextCastLevel_Scriptable()
    {    
        PlayCastMontage(GetAnimationTransitionName(), false, true);  
    }

    UFUNCTION(BlueprintOverride)
    void PlayLaunchSpell_Scriptable()
    {
        PlayCastMontage(n"Launch", false, true);
    }

    UFUNCTION(BlueprintOverride)
    float GetCastDuration_Scriptable() const
    {
        if(GetCurrentSpellLevel() <= 0)
        {
            return GetCastSectionDuration(FName("In")) + GetLevelCastingTime();
        }
        else
        {
            return GetCastSectionDuration(GetAnimationTransitionName()) + GetLevelCastingTime();
        }
    }

    FName GetAnimationTransitionName() const
    {
        FString base("Transition"); 
        return FName(base.Append(GetCurrentSpellLevel()));
    }

    //If the spell is not in the last level and the spell hasnt a EndLaunchAnimation, the spell should finish in the cast part
    UFUNCTION(BlueprintOverride)
    bool OnShouldFinishSpellAfterActivation_Scriptable() 
    {
        return GetCurrentSpellLevel() < GetSpellLevels()-1 && !HasEndLaunchAnimation();
    }

    UFUNCTION(BlueprintOverride)
    bool OnCanActivateAbilityServer_Scriptable(FGameplayAbilityActorInfo GameplayAbilityActorInfo) const
    {
      USpellExecutionValidatorDataDefault data = CreateSpellExecutionData();
      data.SourceActor = GameplayAbilityActorInfo.AvatarActor;
      return ExecuteValidator(data);
   }

    USpellExecutionValidatorDataDefault CreateSpellExecutionData() const
   {
      auto executor = Cast<UCastSpellExecutionValidatorDefault>(m_ExecutionValidator.Get().GetDefaultObject());
      return Cast<USpellExecutionValidatorDataDefault>(NewObject(nullptr, executor.GetExecutionValidatorDataClass()));
   }
}