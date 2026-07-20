class UGA_Xardas_Sleeper_Invulnerable : UGameplayAbilityCreatureSpecialState
{
    default m_ActivateAbilityOnGranted = true;

    UPROPERTY(BlueprintReadWrite, VisibleAnywhere)
	TSubclassOf<UGameplayEffect> m_InvulnerableGE = UGE_State_Invulnerable_XardasSleeper::StaticClass();
    UPROPERTY()
    FActiveGameplayEffectHandle m_InvulnerableGEHandle;

    //default TriggerBeginOn(GameplayTag::Event_XardasSleeper_StartFight);


    UPROPERTY()
    UDelegateHandleContainer m_OnBecomeVulnerableHandle;
    UPROPERTY()
    UDelegateHandleContainer m_OnBecomeInvulnerableHandle;


    UFUNCTION(BlueprintOverride)
    void OnActivateAbility_Scriptable(FGameplayAbilityActorInfo GAActorInfo,
                                      FGameplayEventData TriggerEventData)
    {
        
        m_OnBecomeVulnerableHandle = MagicScript::AttachToEventTag(GetAvatarActorFromActorInfo(), GameplayTag::Event_XardasSleeper_OnBecomeVulnerable, this, n"OnBecomeVulnerable");
        m_OnBecomeInvulnerableHandle = MagicScript::AttachToEventTag(GetAvatarActorFromActorInfo(), GameplayTag::Event_XardasSleeper_OnBecomeInvulnerable, this, n"OnBecomeInvulnerable");

        ApplyInvulnerableGE();
    }

    UFUNCTION(BlueprintOverride)
    void OnEndAbility_Scriptable(FGameplayAbilityActorInfo GameplayAbilityActorInfo, bool WasCancelled)
    {
        RemoveInvulnerableGE();
    }

    UFUNCTION()
    void OnBecomeVulnerable(FGameplayEventData GameplayEventData)
    {
        RemoveInvulnerableGE();
    }

    UFUNCTION()
    void OnBecomeInvulnerable(FGameplayEventData GameplayEventData)
    {
        ApplyInvulnerableGE();
    }


    void ApplyInvulnerableGE()
    {
        ApplyGE(m_InvulnerableGEHandle, m_InvulnerableGE);
    }

    void RemoveInvulnerableGE()
    {
        RemoveGE(m_InvulnerableGEHandle, m_InvulnerableGE, GameplayTag::Debuff_Invulnerable_XardasSleeper);
    }

    void ApplyGE(FActiveGameplayEffectHandle& GEHandle, TSubclassOf<UGameplayEffect> GameplayEffect)
    {
        auto abComp = GetAbilitySystemComponentFromActorInfo();
        if(abComp.GetGameplayEffectCount(GameplayEffect, nullptr) > 0)
        {
            return;
        }
        GEHandle = abComp.ApplyGameplayEffectToSelf(GameplayEffect, 0, abComp.MakeEffectContext());
    }

    void RemoveGE(FActiveGameplayEffectHandle& GEHandle, TSubclassOf<UGameplayEffect> GameplayEffect, FGameplayTag GETag)
    {
        auto abComp = GetAbilitySystemComponentFromActorInfo();
        abComp.RemoveActiveGameplayEffect(GEHandle);
        GEHandle = FActiveGameplayEffectHandle();
        if(abComp.GetGameplayEffectCount(GameplayEffect, nullptr) > 0)
        {
            FGameplayTagContainer tags;
            tags.AddTag(GETag);
            abComp.RemoveActiveEffectsWithSourceTags(tags);
        }
    }
}
