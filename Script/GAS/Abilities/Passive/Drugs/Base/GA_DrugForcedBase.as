class UGA_DrugForcedBase : UGameplayAbilityCreatureBasic
{
    default m_ActivateAbilityOnGranted = true;
	default m_TickEnabled = false;

	default NetExecutionPolicy = EGameplayAbilityNetExecutionPolicy::LocalPredicted;
	default InstancingPolicy = EGameplayAbilityInstancingPolicy::InstancedPerActor;
	default ReplicationPolicy = EGameplayAbilityReplicationPolicy::ReplicateYes; //this is necessary because if not the rpc we have not work.

	default AbilityTags.AddTag(GameplayTag::AbilitySpec_ActiveWhile_Defeated);

    UPROPERTY()
    FGameplayTag m_ForceDrugLowTag;
    UPROPERTY()
    FGameplayTag m_ForceDrugMidTag;
    UPROPERTY()
    FGameplayTag m_ForceDrugHighTag;
    

    UPROPERTY()
    UDelegateHandleContainer m_OnForceDrugLow;
    UPROPERTY()
    UDelegateHandleContainer m_OnForcedDrugMid;
    UPROPERTY()
    UDelegateHandleContainer m_OnForcedDrugHigh;
    UPROPERTY()
    TSubclassOf<UGameplayEffectBase> m_ForcedDrugLowGE;
    UPROPERTY()
    TSubclassOf<UGameplayEffectBase> m_ForcedDrugMidGE;
    UPROPERTY()
    TSubclassOf<UGameplayEffectBase> m_ForcedDrugHighGE;
    UPROPERTY()
    TSubclassOf<UGameplayEffectBase> m_ResetForcedDrugGE;

    UPROPERTY()
    private TSubclassOf<UGameplayEffectBase> m_ActiveForcedDrugGE;

     
    UFUNCTION(BlueprintOverride)
    void OnActivateAbility_Scriptable(FGameplayAbilityActorInfo GAActorInfo,
                                      FGameplayEventData TriggerEventData)
    {
        m_OnForceDrugLow = MagicScript::RegisterGameplayTagEvent(GetAbilitySystemComponentFromActorInfo(), m_ForceDrugLowTag, EGameplayTagEventType::NewOrRemoved, this, n"OnForceDrugLow");
        m_OnForcedDrugMid = MagicScript::RegisterGameplayTagEvent(GetAbilitySystemComponentFromActorInfo(), m_ForceDrugMidTag, EGameplayTagEventType::NewOrRemoved, this, n"OnForceDrugMid");
        m_OnForcedDrugHigh = MagicScript::RegisterGameplayTagEvent(GetAbilitySystemComponentFromActorInfo(), m_ForceDrugHighTag, EGameplayTagEventType::NewOrRemoved, this, n"OnForceDrugHigh");
    }

    UFUNCTION()
    void OnForceDrugLow(const FGameplayTag CallbackTag, int32 NewCount)
    {
        auto currentGE = m_ForcedDrugLowGE;
        if(NewCount > 0)
            ApplyForcedDrugGameplayEffect(currentGE);
        else
            RemoveForcedDrugGameplayEffect(currentGE);
    }

    UFUNCTION()
    void OnForceDrugMid(const FGameplayTag CallbackTag, int32 NewCount)
    {
        auto currentGE = m_ForcedDrugMidGE;
        if(NewCount > 0)
            ApplyForcedDrugGameplayEffect(currentGE);
        else
            RemoveForcedDrugGameplayEffect(currentGE);
    }

    UFUNCTION()
    void OnForceDrugHigh(const FGameplayTag CallbackTag, int32 NewCount)
    {
        auto currentGE = m_ForcedDrugHighGE;
        if(NewCount > 0)
            ApplyForcedDrugGameplayEffect(currentGE);
        else
            RemoveForcedDrugGameplayEffect(currentGE);
    }

    void ApplyForcedDrugGameplayEffect(TSubclassOf<UGameplayEffectBase> ForcedDrugGE)
    {
        if(m_ActiveForcedDrugGE != nullptr)
            return;

        auto sourceAbComp = Cast<UGothicAbilitySystemComponent>(GetAbilitySystemComponentFromActorInfo());
        FGameplayEffectContextHandle contextHandle = sourceAbComp.MakeEffectContext();
        FGameplayEffectSpecHandle geSpecHandle = sourceAbComp.MakeOutgoingSpec(ForcedDrugGE, 1, contextHandle);
        sourceAbComp.ApplyGameplayEffectSpecToSelf(geSpecHandle);
        m_ActiveForcedDrugGE = ForcedDrugGE;
    }

    void RemoveForcedDrugGameplayEffect(TSubclassOf<UGameplayEffectBase> ForcedDrugGE)
    {
        if(m_ActiveForcedDrugGE == nullptr)
            return;

        if(ForcedDrugGE != m_ActiveForcedDrugGE)
            return;
        ResetDrugAttribute();
        m_ActiveForcedDrugGE = nullptr; 
    }

    void ResetDrugAttribute()
    {
        auto sourceAbComp = Cast<UGothicAbilitySystemComponent>(GetAbilitySystemComponentFromActorInfo());
        FGameplayEffectContextHandle contextHandle = sourceAbComp.MakeEffectContext();
        FGameplayEffectSpecHandle geSpecHandle = sourceAbComp.MakeOutgoingSpec(m_ResetForcedDrugGE, 1, contextHandle);
        sourceAbComp.ApplyGameplayEffectSpecToSelf(geSpecHandle);
    }

    UFUNCTION(BlueprintOverride)
    void OnEndAbility_Scriptable(FGameplayAbilityActorInfo GameplayAbilityActorInfo, bool WasCancelled)
    {
        ResetDrugAttribute();
        MagicScript::UnregisterGameplayTagEvent(GetAbilitySystemComponentFromActorInfo(), m_OnForceDrugLow);
        MagicScript::UnregisterGameplayTagEvent(GetAbilitySystemComponentFromActorInfo(), m_OnForcedDrugMid);
        MagicScript::UnregisterGameplayTagEvent(GetAbilitySystemComponentFromActorInfo(), m_OnForcedDrugHigh);
    }
}