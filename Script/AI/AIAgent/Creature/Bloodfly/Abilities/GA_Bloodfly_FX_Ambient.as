class UGA_Bloodfly_FX_Ambient : UGA_Creature_FX_Sound
{

    default AbilityTags.AddTag(GameplayTag::Ability_Creature_FX_Bloodfly_Ambient_Loop);
    
    default	BlockAbilitiesWithTag.AddTag(GameplayTag::Ability_Creature_FX_Bloodfly_Ambient_Loop);
	default CancelAbilitiesWithTag.AddTag(GameplayTag::Ability_Creature_FX_Bloodfly_Ambient_Loop);

    default m_FxTag = GameplayTag::FX_Creature_Bloodfly_Ambient_Loop;
    UPROPERTY()
    FGameplayTag m_FxTagLay = GameplayTag::FX_Creature_Bloodfly_Ambient_Loop_Lay;

    UPROPERTY()
    UDelegateHandleContainer m_LayingDelegateHandleContainer;
    UPROPERTY()
    UDelegateHandleContainer m_SleepingDelegateHandleContainer;

    UPROPERTY()
    FGameplayTag m_LayStateTag = GameplayTag::Action_Ambient_Lay;
    UPROPERTY()
    FGameplayTag m_SleepStateTag = GameplayTag::Action_Ambient_Sleep;

    UPROPERTY()
    bool m_IsPlayingDefaultLoop = false;

    FGameplayTag GetFxTag() override
    {
        if(IsLaying())
            return m_FxTagLay;
        return m_FxTag;
    }

    bool IsLaying()
    {
        auto abComp = Cast<UGothicAbilitySystemComponent>(GetAbilitySystemComponentFromActorInfo());
        FGameplayTagContainer tags;
        tags.AddTag(m_LayStateTag);
        tags.AddTag(m_SleepStateTag);
        if(abComp.HasAnyGameplayTags(tags))
            return true;

        return false;
    }

    UFUNCTION(BlueprintOverride)
    void OnActivateAbility_Scriptable(FGameplayAbilityActorInfo GAActorInfo,
                                      FGameplayEventData TriggerEventData)
    {
        Super::OnActivateAbility_Scriptable(GAActorInfo, TriggerEventData);
        m_LayingDelegateHandleContainer = MagicScript::RegisterGameplayTagEvent(GetAbilitySystemComponentFromActorInfo(), m_LayStateTag, EGameplayTagEventType::NewOrRemoved, this, n"OnLaying");
        m_SleepingDelegateHandleContainer = MagicScript::RegisterGameplayTagEvent(GetAbilitySystemComponentFromActorInfo(), m_SleepStateTag, EGameplayTagEventType::NewOrRemoved, this, n"OnLaying");

        m_IsPlayingDefaultLoop = !IsLaying();
    }

    UFUNCTION()
    void OnLaying(const FGameplayTag CallbackTag, int32 NewCount)
    {
        auto gothicChar = Cast<AGothicCharacter>(GetAvatarActorFromActorInfo());
        auto fxComponent = gothicChar.GetFXComponent();
        if(fxComponent == nullptr)
            return;
        if(NewCount > 0)
        {
            if(!m_IsPlayingDefaultLoop)
                return;
            fxComponent.StopFXInstance(m_HoldSFXHandle, false); 
            m_HoldSFXHandle = fxComponent.PlayEffect(GetFxTag(), nullptr);
            m_IsPlayingDefaultLoop = false;
        }
        else
        {
            if(m_IsPlayingDefaultLoop)
                return;
            fxComponent.StopFXInstance(m_HoldSFXHandle, false); 
            m_HoldSFXHandle = fxComponent.PlayEffect(GetFxTag(), nullptr);
            m_IsPlayingDefaultLoop = true;
        }
    }

    UFUNCTION(BlueprintOverride)
    void OnEndAbility_Scriptable(FGameplayAbilityActorInfo GameplayAbilityActorInfo, bool WasCancelled)
    {
        Super::OnEndAbility_Scriptable(GameplayAbilityActorInfo, WasCancelled);
        MagicScript::UnregisterGameplayTagEvent(GetAbilitySystemComponentFromActorInfo(), m_LayingDelegateHandleContainer);
        MagicScript::UnregisterGameplayTagEvent(GetAbilitySystemComponentFromActorInfo(), m_SleepingDelegateHandleContainer);
    }
}
