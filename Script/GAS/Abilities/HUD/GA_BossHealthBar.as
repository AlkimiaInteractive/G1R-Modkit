class UGA_BossHealthBar : UGameplayAbilityCreatureSpecialState
{
    default AbilityTags.AddTag(GameplayTag::Ability_HUD_BossHealthBar);
    default AbilityTags.AddTag(GameplayTag::AbilitySpec_Continuous);

    default	BlockAbilitiesWithTag.AddTag(GameplayTag::Ability_HUD_BossHealthBar);
    default CancelAbilitiesWithTag.AddTag(GameplayTag::Ability_HUD_BossHealthBar);

    
    default m_ActivateAbilityOnGranted = true;
    UPROPERTY()
    UDelegateHandleContainer m_ConflictCombatDelegateHandleContainer;
    UPROPERTY()
    UDelegateHandleContainer m_ConflictWarningDelegateHandleContainer;
    UPROPERTY()
    UDelegateHandleContainer m_OnDeathDelegateHandleContainer;



    UPROPERTY()
    bool m_Activated = false;

    UFUNCTION(BlueprintOverride)
    void OnActivateAbility_Scriptable(FGameplayAbilityActorInfo GAActorInfo,
                                      FGameplayEventData TriggerEventData)
    {
        auto gothicChar = Cast<AGothicCharacter>(GetAvatarActorFromActorInfo());
        if(gothicChar.IsDead() || gothicChar.IsDefeated())
        {
            EndAbility();
            return;
        }

        m_ConflictCombatDelegateHandleContainer = MagicScript::RegisterGameplayTagEvent(GetAbilitySystemComponentFromActorInfo(), GameplayTag::AIState_Conflict_Combat, EGameplayTagEventType::NewOrRemoved, this, n"OnStateChange");
        m_ConflictWarningDelegateHandleContainer = MagicScript::RegisterGameplayTagEvent(GetAbilitySystemComponentFromActorInfo(), GameplayTag::AIState_Conflict_Warning, EGameplayTagEventType::NewOrRemoved, this, n"OnStateChange");
        m_OnDeathDelegateHandleContainer = MagicScript::RegisterGameplayTagEvent(GetAbilitySystemComponentFromActorInfo(), GameplayTag::State_Dead, EGameplayTagEventType::NewOrRemoved, this, n"OnAvatarDead");
    }

    UFUNCTION()
    void OnAvatarDead(const FGameplayTag CallbackTag, int32 NewCount)
    {
        if(NewCount > 0)
        {
            EndAbility();
        }
    }
    

    UFUNCTION()
    void OnStateChange(const FGameplayTag CallbackTag, int32 NewCount)
    {
        if(NewCount > 0)
        {
            NotifyActivateHealthBar();
            return;
        }
        NotifyDeactivateHealthBar();
    }
    
    void NotifyActivateHealthBar()
    {
        if(m_Activated)
            return;
        //Print(FString("Send Notify Activate Health Bar"));
        if(UHUDDisplayBossHealthBarController::Get() != nullptr)
        {
            if(NeedOverrideMaxHealth())
                OverrideMaxHealth();
            UHUDDisplayBossHealthBarController::Get().ShowWidget(Cast<AGothicCharacter>(GetAvatarActorFromActorInfo()));
            m_Activated = true;
        }

    }

    void OverrideMaxHealth()
    {
    }

    bool NeedOverrideMaxHealth()
    {
        return false;
    }

    bool HasAnyCombatTag(UGothicAbilitySystemComponent GothicAbComp)
    {
        FGameplayTagContainer tags =FGameplayTagContainer();
        tags.AddTag(GameplayTag::AIState_Conflict_Combat);
        tags.AddTag(GameplayTag::AIState_Conflict_Warning);
        
        return GothicAbComp.HasAnyGameplayTags(tags);
    }

    void NotifyDeactivateHealthBar()
    {
        //He probado de matar al Ice Golem y no parece que me llegue el evento de morirse
        if(!m_Activated)
            return;
        if(HasAnyCombatTag(Cast<UGothicAbilitySystemComponent>(GetAbilitySystemComponentFromActorInfo())))
            return;
        //Print(FString("Send Notify Dectivate Health Bar"));
        if(UHUDDisplayBossHealthBarController::Get() != nullptr)
            UHUDDisplayBossHealthBarController::Get().HideWidget();
        m_Activated = false;
    }

    UFUNCTION(BlueprintOverride)
    void OnEndAbility_Scriptable(FGameplayAbilityActorInfo GameplayAbilityActorInfo, bool WasCancelled)
    {
        if(UHUDDisplayBossHealthBarController::Get() != nullptr)
            UHUDDisplayBossHealthBarController::Get().HideWidget();
        m_Activated = false;

        MagicScript::UnregisterGameplayTagEvent(GetAbilitySystemComponentFromActorInfo(), m_ConflictCombatDelegateHandleContainer);
        MagicScript::UnregisterGameplayTagEvent(GetAbilitySystemComponentFromActorInfo(), m_ConflictWarningDelegateHandleContainer);
        MagicScript::UnregisterGameplayTagEvent(GetAbilitySystemComponentFromActorInfo(), m_OnDeathDelegateHandleContainer);
    }
}



class UGA_BossHealthBar_MCQueen_PH2 : UGA_BossHealthBar
{
    bool NeedOverrideMaxHealth() override
    {
        return true;
    }

    //@DE - Fake max health to show half health bar.
    void OverrideMaxHealth() override
    {
        float32 CharacterMaxHealth = Cast<AGothicCharacter>(GetAvatarActorFromActorInfo()).GetMaxHealthAttribute();
        UHUDDisplayBossHealthBarController::Get().SetOverrideMaxHealthValue(CharacterMaxHealth*2);
    }
}
