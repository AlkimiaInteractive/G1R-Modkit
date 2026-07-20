class UGA_MadCorKalom_CombatTrigger : UGameplayAbilityCreatureSpecialState
{
    default m_ActivateAbilityOnGranted = true;
    
    //default AbilityTags.AddTag(GameplayTag::Ability_Action_Teleport_XardasSleeper);
    //default	BlockAbilitiesWithTag.AddTag(GameplayTag::Ability_Action_Teleport_XardasSleeper);

    UPROPERTY()
    UDelegateHandleContainer m_DelegateHandleContainer;
    UPROPERTY(NotVisible, NotEditable)
    FName m_SaveGameKey = n"MadCorKalom_Speech_Completed";

    UFUNCTION(BlueprintOverride)
    void OnActivateAbility_Scriptable(FGameplayAbilityActorInfo GAActorInfo,
                                      FGameplayEventData TriggerEventData)
    {
        if(!HasAuthority())
        {
            return;
        }
            
        float32 savedState = 0.0f;
        bool bLoaded = AG1RGameState::GetWorldFloatData(World, m_SaveGameKey, savedState);
        if(bLoaded)
        {
            if(savedState > 0.9f)
            {
                DoTeleport();
                return;
            }
        }
        m_DelegateHandleContainer = MagicScript::RegisterGameplayTagEvent(GetAbilitySystemComponentFromActorInfo(), GameplayTag::AIState_Conflict_Combat, EGameplayTagEventType::NewOrRemoved, this, n"OnCombatStart");
    }

    UFUNCTION()
    void OnCombatStart(const FGameplayTag CallbackTag, int32 NewCount)
    {
        
        MagicScript::UnregisterGameplayTagEvent(GetAbilitySystemComponentFromActorInfo(), m_DelegateHandleContainer);
        if(HasAuthority())
            AG1RGameState::SaveWorldFloatData(GetWorld(), m_SaveGameKey, 1);
        DoTeleport();
        
    }

    void DoTeleport()
    {
        auto abComp = Cast<UGothicAbilitySystemComponent>(GetAbilitySystemComponentFromActorInfo());
        abComp.GiveAbility(UGA_MadCorKalom_Teleport::StaticClass(), 1, -1, nullptr);
        ClearAbility();
    }
}
