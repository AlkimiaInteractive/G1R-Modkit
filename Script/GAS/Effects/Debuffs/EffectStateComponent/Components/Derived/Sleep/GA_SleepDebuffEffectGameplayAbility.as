class UGA_SleepDebuffEffectGameplayAbility : UGA_DebuffEffectGameplayAbilityGASbase
{
    default AbilityTags.AddTag(GameplayTag::Ability_Effect_Debuff_Sleep);

    //add list of cancel / block abilities when the debuff is activated.
    //Example
    //default BlockAbilitiesWithTag.AddTag(GameplayTag::Ability_Movement_Aim);
    //default CancelAbilitiesWithTag.AddTag(GameplayTag::Ability_Movement_Aim);

    UPROPERTY()
    UDelegateHandleContainer m_handleDelegate;

    UPROPERTY(EditAnywhere)
    UCueVisualConfig_Sleep m_AnimConfig;

    UFUNCTION(BlueprintOverride)
    void OnActivateAbilityBeforeAssetPreload_Scriptable(FGameplayAbilityActorInfo GAActorInfo,
                                                        FGameplayEventData TriggerEventData)
    {
        auto gothicChar = Cast<AGothicCharacter>(GetAvatarActorFromActorInfo());
        if(gothicChar == nullptr)
            return; 

        m_AnimConfig = Cast<UCueVisualConfig_Sleep>(gothicChar.GetCharacterDefinition().GetVisualEffectConfig(GameplayTag::Debuff_Sleep));
    }

    UFUNCTION(BlueprintOverride)
    void OnActivateAbility_Scriptable(FGameplayAbilityActorInfo GAActorInfo,
                                      FGameplayEventData TriggerEventData)
    {
        Super::OnActivateAbility_Scriptable(GAActorInfo, TriggerEventData);
        //Print("UGA_ElectrifiedDebuffEffectGameplayAbility");

        DoActivation();
    }

    void DoActivation() override
    {
        Super::DoActivation();
        auto abComp = Cast<UGothicAbilitySystemComponent>(GetAbilitySystemComponentFromActorInfo());
        FGameplayTagContainer nonApplicableTags;
        //nonApplicableTags.AddTag(GameplayTag::State_LaunchingSpell_ChainLightning);
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
        auto sleepComp = USleepDebuffEffectComponent::Get(GetAvatarActorFromActorInfo());
        if(sleepComp == nullptr)
        {
            EndAbility();
            return;
        }
        //m_handleDelegate = MagicScript::AttachToEventTag(GetAvatarActorFromActorInfo(), GameplayTag::Ability_Effect_Debuff_Sleep_PlayOut, this, n"OnPlayOutMontage");
        if(sleepComp.m_IsLoadedFromFile)
            PlayMontage(m_AnimConfig.GetSleepInMontage(), FName("Loop"));
        else
            PlayMontage(m_AnimConfig.GetSleepInMontage(), FName("In"));
        
    }

    // UFUNCTION(BlueprintOverride)
    // void DoEndDebuffMontage_Scriptable()
    // {
    //     // Print("DoEndDebuffMontage_Scriptable");
    //     //JumpToSection(FName("Exit"));
    //     //@DE - Deactivated out montage, feels better. Javi confirm cut anim
    //     EndAbility();
    // }

    //  UFUNCTION()
    // void OnPlayOutMontage(FGameplayEventData GameplayEventData)
    // {
        
    //     auto target = Cast<AGothicCharacter>(GameplayEventData.Target);
    //     if(target != GetAvatarActorFromActorInfo())
    //         return;
    //     MagicScript::DetachFromEvent(target, m_handleDelegate);
    //     PlayMontage(m_AnimConfig.GetSleepOutMontage(), NAME_None, 1, false);
        
    // }

    UFUNCTION(BlueprintOverride)
    void OnEndAbility_Scriptable(FGameplayAbilityActorInfo Info, bool WasCancelled)
    {
        if(m_AnimConfig != nullptr)
            PlayMontage(m_AnimConfig.GetSleepOutMontage(), NAME_None, 1, false);
        MagicScript::DetachFromEvent(GetAvatarActorFromActorInfo(), m_handleDelegate);
        Super::OnEndAbility_Scriptable(Info, WasCancelled);
        //UCueVisualConfig_Electrified_Human config = Cast<UCueVisualConfig_Electrified_Human>(m_ConfigClass.Get().GetDefaultObject());
        //@DE - Deactivated out montage, feels better. Javi confirm cut anim
        //PlayMontage(config.GetElectrifiedOutMontage());
    }
}