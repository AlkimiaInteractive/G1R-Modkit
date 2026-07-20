class UGA_MCQueenLockMovementAbility : UGameplayAbilityCreatureSpecialState
{
    UPROPERTY()
    UDelegateHandleContainer m_DelegateHandleContainer;
    default m_ActivateAbilityOnGranted = true;

    UFUNCTION(BlueprintOverride)
    void OnActivateAbility_Scriptable(FGameplayAbilityActorInfo GAActorInfo,
                                      FGameplayEventData TriggerEventData)
    {
        m_DelegateHandleContainer = MagicScript::RegisterGameplayTagEvent(GetAbilitySystemComponentFromActorInfo(), GameplayTag::State_LockMovement, EGameplayTagEventType::NewOrRemoved, this, n"CheckLockTag");
        auto abComp = Cast<UGothicAbilitySystemComponent>(GetAbilitySystemComponentFromActorInfo());
        if(!abComp.HasTagExact(GameplayTag::State_LockMovement))
            abComp.AddTag(GameplayTag::State_LockMovement);
    }

    UFUNCTION()
    void CheckLockTag(const FGameplayTag CallbackTag, int32 NewCount)
    {
        if(NewCount <= 0)
        {
            Cast<UGothicAbilitySystemComponent>(GetAbilitySystemComponentFromActorInfo()).AddTag(GameplayTag::State_LockMovement);
        }
    }

    UFUNCTION(BlueprintOverride)
    void OnEndAbility_Scriptable(FGameplayAbilityActorInfo GameplayAbilityActorInfo, bool WasCancelled)
    {
        MagicScript::UnregisterGameplayTagEvent(GetAbilitySystemComponentFromActorInfo(), m_DelegateHandleContainer);
    }
}