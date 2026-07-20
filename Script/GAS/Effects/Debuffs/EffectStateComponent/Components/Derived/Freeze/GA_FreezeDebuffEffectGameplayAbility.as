class UGA_FreezeDebuffEffectGameplayAbility : UGA_DebuffEffectGameplayAbilityGASbase
{
    default AbilityTags.AddTag(GameplayTag::Ability_Effect_Debuff_Freeze);

    default CancelAbilitiesWithTag.AddTag(GameplayTag::Ability_Combat_Stance_Block);
    default BlockAbilitiesWithTag.AddTag(GameplayTag::Ability_Combat_Stance_Block);

    //add list of cancel / block abilities when the debuff is activated.
    //Example
    //default BlockAbilitiesWithTag.AddTag(GameplayTag::Ability_Movement_Aim);
    //default CancelAbilitiesWithTag.AddTag(GameplayTag::Ability_Movement_Aim);

    UPROPERTY()
    FGameplayAbilitySpecHandle m_AbilityHandle;

    UFUNCTION(BlueprintOverride)
    void OnActivateAbility_Scriptable(FGameplayAbilityActorInfo GAActorInfo,
                                      FGameplayEventData TriggerEventData)
    {
        Super::OnActivateAbility_Scriptable(GAActorInfo, TriggerEventData);
        GiveBlockBreakArmorHitAbility();
    }

    void GiveBlockBreakArmorHitAbility()
    {
        auto abComp = Cast<UGothicAbilitySystemComponent>(GetAbilitySystemComponentFromActorInfo());
        m_AbilityHandle = abComp.GiveAbility(UGA_FreezeDebuffEffectBlockBreakArmorHitGameplayAbility::StaticClass(), 1, -1, nullptr);
    }

    UFUNCTION(BlueprintOverride)
    void OnEndAbility_Scriptable(FGameplayAbilityActorInfo Info, bool WasCancelled)
    {
        RemoveBlockBreakArmorHitAbility();
        Super::OnEndAbility_Scriptable(Info, WasCancelled);

    }
    
    void RemoveBlockBreakArmorHitAbility()
    {
        auto abComp = Cast<UGothicAbilitySystemComponent>(GetAbilitySystemComponentFromActorInfo());
        if(MagicScript::IsValidGameplaySpecHandle(m_AbilityHandle))
        {
            abComp.ClearAbility(m_AbilityHandle);
            m_AbilityHandle = FGameplayAbilitySpecHandle();
        }
        else
        {
            if(abComp.HasAbility(UGA_FreezeDebuffEffectBlockBreakArmorHitGameplayAbility::StaticClass()))
            {
                FGameplayAbilitySpec OutSpec; 
                abComp.FindAbilitySpecFromClass(UGA_FreezeDebuffEffectBlockBreakArmorHitGameplayAbility::StaticClass(), OutSpec);
                abComp.ClearAbility(OutSpec.Handle);
            }
        }
    }
}

class UGA_FreezeDebuffEffectBlockBreakArmorHitGameplayAbility : UGA_DebuffEffectGameplayAbilityGASbase
{
    default AbilityTags.AddTag(GameplayTag::Ability_Effect_Debuff_Freeze_BlockBreakArmorHit);

    default CancelAbilitiesWithTag.AddTag(GameplayTag::Ability_Hit_BreakArmorHit);
    default BlockAbilitiesWithTag.AddTag(GameplayTag::Ability_Hit_BreakArmorHit);

    default m_ActivateAbilityOnGranted = true;

    UFUNCTION(BlueprintOverride)
    void OnActivateAbility_Scriptable(FGameplayAbilityActorInfo GAActorInfo,
                                      FGameplayEventData TriggerEventData)
    {
        Super::OnActivateAbility_Scriptable(GAActorInfo, TriggerEventData);
        System::SetTimerDelegate(FTimerDynamicDelegate(this, n"DoEndAbility"), 1.f, false);
    }

    UFUNCTION()
    void DoEndAbility()
    {
        EndAbility();
    }
}