class UGA_Creature_FX_Sound : UGameplayAbilityCreatureSpecialState
{
    default m_ActivateAbilityOnGranted = true;
    default AbilityTags.AddTag(GameplayTag::AbilitySpec_Continuous);
    default AbilityTags.AddTag(GameplayTag::Ability_Creature_FX);

    UPROPERTY()
    FGothicFXInstanceHandle m_HoldSFXHandle;
    UPROPERTY()
    FGameplayTag m_FxTag;
    
    UPROPERTY()
    UDelegateHandleContainer m_DelegateHandleContainer;
        UPROPERTY()
    UDelegateHandleContainer m_OnDieMeBeforeHandle;


    UFUNCTION(BlueprintOverride)
    void OnActivateAbility_Scriptable(FGameplayAbilityActorInfo GAActorInfo,
                                      FGameplayEventData TriggerEventData)
    {

        auto gothicChar = Cast<AGothicCharacter>(GetAvatarActorFromActorInfo());
        auto gothicAbComp = Cast<UGothicAbilitySystemComponent>(GetAbilitySystemComponentFromActorInfo());
        m_OnDieMeBeforeHandle = MagicScript::AttachToEventTag(GetAvatarActorFromActorInfo(), GameplayTag::Event_Die_Me_Before, this, n"OnDieMeBefore");
        auto fxComponent = gothicChar.GetFXComponent();
        if(fxComponent == nullptr)
            return;
        m_HoldSFXHandle = fxComponent.PlayEffect(GetFxTag(), nullptr);    
        //@DE - Stop ambient sound in cinamatics/conversations.
        m_DelegateHandleContainer = MagicScript::RegisterGameplayTagEvent(GetAbilitySystemComponentFromActorInfo(), GameplayTag::State_PartOfCinematic, EGameplayTagEventType::NewOrRemoved, this, n"OnCinematicStarts");

    }

    UFUNCTION()
    void OnCinematicStarts(const FGameplayTag CallbackTag, int32 NewCount)
    {
        auto gothicChar = Cast<AGothicCharacter>(GetAvatarActorFromActorInfo());
        auto fxComponent = gothicChar.GetFXComponent();
        if(fxComponent == nullptr)
            return;
        if(NewCount > 0)
        {
            fxComponent.StopFXInstance(m_HoldSFXHandle, false); 
        }
        else
        {
            if(!fxComponent.IsHandleValid(m_HoldSFXHandle))
                m_HoldSFXHandle = fxComponent.PlayEffect(GetFxTag(), nullptr);
        }
    }

    

    FGameplayTag GetFxTag()
    {
        return m_FxTag;
    }


    UFUNCTION()
    void OnDieMeBefore(FGameplayEventData GameplayEventData)
    {
        MagicScript::DetachFromEvent(GetAvatarActorFromActorInfo(), m_OnDieMeBeforeHandle);
        //send event die / or spawn egg.
        
        EndAbility();
    }

    UFUNCTION(BlueprintOverride)
    void OnEndAbility_Scriptable(FGameplayAbilityActorInfo GameplayAbilityActorInfo, bool WasCancelled)
    {
        MagicScript::UnregisterGameplayTagEvent(GetAbilitySystemComponentFromActorInfo(), m_DelegateHandleContainer);
        auto gothicChar = Cast<AGothicCharacter>(GetAvatarActorFromActorInfo());
        auto fxComponent = gothicChar.GetFXComponent();
        if(fxComponent == nullptr)
            return;
        fxComponent.StopFXInstance(m_HoldSFXHandle, false);   
    }
}
