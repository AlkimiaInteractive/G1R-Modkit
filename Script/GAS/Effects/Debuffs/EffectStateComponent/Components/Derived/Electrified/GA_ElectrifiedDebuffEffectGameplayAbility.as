class UGA_ElectrifiedDebuffEffectGameplayAbility : UGA_DebuffEffectGameplayAbilityGASbase
{
    default AbilityTags.AddTag(GameplayTag::Ability_Effect_Debuff_Electrified);

    default BlockAbilitiesWithTag.AddTag(GameplayTag::Ability_Effect_Debuff_Electrified);

    default CancelAbilitiesWithTag.AddTag(GameplayTag::Ability_Effect_Debuff_Sleep);

    //add list of cancel / block abilities when the debuff is activated.
    //Example
    //default BlockAbilitiesWithTag.AddTag(GameplayTag::Ability_Movement_Aim);
    //default CancelAbilitiesWithTag.AddTag(GameplayTag::Ability_Movement_Aim);

    UPROPERTY(EditAnywhere)
    UCueVisualConfig_Electrified m_AnimConfig;

    UFUNCTION(BlueprintOverride)
    bool OnCanActivateAbility_Scriptable(FGameplayAbilityActorInfo GAActorInfo) const
    {
        auto abComp = Cast<UGothicAbilitySystemComponent>(GAActorInfo.AbilitySystemComponent);
        FGameplayTagContainer nonApplicableTags;
        nonApplicableTags.AddTag(GameplayTag::State_LaunchingSpell_ChainLightning);
        nonApplicableTags.AddTag(GameplayTag::Debuff_Montage_NoPlayMontage);
        return !abComp.HasAnyGameplayTags(nonApplicableTags);
    }

    UFUNCTION(BlueprintOverride)
    void OnActivateAbilityBeforeAssetPreload_Scriptable(FGameplayAbilityActorInfo GAActorInfo,
                                                        FGameplayEventData TriggerEventData)
    {
        auto gothicChar = Cast<AGothicCharacter>(GetAvatarActorFromActorInfo());
        if(gothicChar == nullptr)
            return; 

        m_AnimConfig = Cast<UCueVisualConfig_Electrified>(gothicChar.GetCharacterDefinition().GetVisualEffectConfig(GameplayTag::Debuff_Electrified));
    }

    UFUNCTION(BlueprintOverride)
    void OnActivateAbility_Scriptable(FGameplayAbilityActorInfo GAActorInfo,
                                      FGameplayEventData TriggerEventData)
    {
        Super::OnActivateAbility_Scriptable(GAActorInfo, TriggerEventData);
        DoActivation();
    }

    void DoActivation() override
    {
        Super::DoActivation();

        //Print("UGA_ElectrifiedDebuffEffectGameplayAbility");

        auto abComp = Cast<UGothicAbilitySystemComponent>(GetAbilitySystemComponentFromActorInfo());
        FGameplayTagContainer nonApplicableTags;
        nonApplicableTags.AddTag(GameplayTag::State_LaunchingSpell_ChainLightning);
        nonApplicableTags.AddTag(GameplayTag::Debuff_Montage_NoPlayMontage);
        if(abComp.HasAnyGameplayTags(nonApplicableTags))
        {
            EndAbility();
            return;
        }
        if(m_AnimConfig == nullptr)
        {
    
            EndAbility();
            return;
        }
        PlayMontage(m_AnimConfig.GetElectrifiedInMontage(), FName("In"));
    }

    // UFUNCTION(BlueprintOverride)
    // void DoEndDebuffMontage_Scriptable()
    // {
    //     // Print("DoEndDebuffMontage_Scriptable");
    //     //JumpToSection(FName("Exit"));
    //     //@DE - Deactivated out montage, feels better. Javi confirm cut anim
    //     EndAbility();
    // }

    UFUNCTION(BlueprintOverride)
    void OnEndAbility_Scriptable(FGameplayAbilityActorInfo Info, bool WasCancelled)
    {
        Super::OnEndAbility_Scriptable(Info, WasCancelled);
        //UCueVisualConfig_Electrified_Human config = Cast<UCueVisualConfig_Electrified_Human>(m_ConfigClass.Get().GetDefaultObject());
        //@DE - Deactivated out montage, feels better. Javi confirm cut anim
        //PlayMontage(config.GetElectrifiedOutMontage());
    }
}