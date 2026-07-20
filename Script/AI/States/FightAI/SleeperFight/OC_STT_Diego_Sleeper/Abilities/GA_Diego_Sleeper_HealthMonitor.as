class UGA_Diego_Sleeper_HealthMonitor : UGameplayAbilityCreatureSpecialState
{
	// "Current value" attribute.
	UPROPERTY(BlueprintReadWrite, VisibleAnywhere)
	FGameplayAttribute m_CurrentValueAttribute;

	// "Max value" attribute.
	UPROPERTY(BlueprintReadWrite, VisibleAnywhere)
	FGameplayAttribute m_MaxValueAttribute;

    UPROPERTY()
    float m_MaxHealth;

    default m_ActivateAbilityOnGranted = true;

    UPROPERTY()
    TSubclassOf<UScriptGameplayEffect> m_InvulnerableGE = UGE_State_Invulnerable_DiegoSleeper::StaticClass();

    UPROPERTY()
    TArray<float> m_HealthPercentageThresholds;
    
    UPROPERTY()
    TSubclassOf<UGenericHealthMonitorConfig> m_DiegoSleeperHealthDefClass = UDiegoSleeperHealthMonitorConfig::StaticClass();

    UPROPERTY()
    UDiegoSleeperHealthMonitorConfig m_DiegoSleeperHealthDef;

    
    UPROPERTY()
    UDiegoSleeperDamageLimiterComponent m_DamageLimiterComp;


    UFUNCTION(BlueprintOverride)
    void OnActivateAbility_Scriptable(FGameplayAbilityActorInfo GAActorInfo,
                                      FGameplayEventData TriggerEventData)
    {

        m_DamageLimiterComp = UDiegoSleeperDamageLimiterComponent::GetOrCreate(GetAvatarActorFromActorInfo());
        m_DiegoSleeperHealthDef = Cast<UDiegoSleeperHealthMonitorConfig>(m_DiegoSleeperHealthDefClass.Get().DefaultObject);
        m_HealthPercentageThresholds = m_DiegoSleeperHealthDef.m_HealthPercentageThresholds;

        m_CurrentValueAttribute = UAngelscriptAttributeSet::GetGameplayAttribute(UAttributeSet_Health::StaticClass(), n"Health");
        m_MaxValueAttribute = UAngelscriptAttributeSet::GetGameplayAttribute(UAttributeSet_Health::StaticClass(), n"MaxHealth");

        RegisterGameplayAttributeEvent(m_CurrentValueAttribute);
        RegisterGameplayAttributeEvent(m_MaxValueAttribute);

        bool success = false;
        m_MaxHealth = AbilitySystem::GetFloatAttributeFromAbilitySystemComponent(GetAbilitySystemComponentFromActorInfo(), m_MaxValueAttribute, success);
    }

    UFUNCTION(BlueprintOverride)
    void OnAttributeValueChanged_Scriptable(FGameplayAttribute Attribute, float OldValue,
                                            float NewValue)
    {
        if(AttributeEquals(Attribute, m_CurrentValueAttribute))
        {
            OnCurrentAttributeValueChanged(Attribute, OldValue, NewValue);
            return;
        }
            
        if(AttributeEquals(Attribute, m_MaxValueAttribute))
        {
            OnMaxAttributeValueChanged(Attribute, OldValue, NewValue);
            return;
        }
    }

    bool AttributeEquals(FGameplayAttribute AttributeA, FGameplayAttribute AttributeB)
    {
        return AttributeA.AttributeSetClass == AttributeB.AttributeSetClass;
    }

    void OnCurrentAttributeValueChanged(FGameplayAttribute Attribute, float OldValue, float NewValue)
    {
        CheckDoPhaseChange(NewValue);
    }

    
    void CheckDoPhaseChange(float HealthValue)
    {
        if(m_HealthPercentageThresholds.Num() == 0)
        {
            //Notify with something
            return;

        }
        auto healthThreshold = m_HealthPercentageThresholds[0];

        if(Math::TruncToFloat(HealthValue) <= Math::TruncToFloat(m_MaxHealth * healthThreshold))
        {
            m_HealthPercentageThresholds.RemoveAt(0);
            ApplyCoolDownGE();
            //FGameplayEventData payload;
            //GothicGAS::SendGameplayEvent(GetAvatarActorFromActorInfo(), GameplayTag::Action_CastSpell, payload);
            Cast<UGothicAbilitySystemComponent>(GetAbilitySystemComponentFromActorInfo()).AddTag(GameplayTag::State_CanDoTeleport);
            
            FGameplayAbilitySpec outHandle;
            GetAbilitySystemComponentFromActorInfo().FindAbilitySpecFromClass(UGA_Diego_Sleeper_HealthMonitor::StaticClass(), outHandle);
            if(MagicScript::IsValidGameplaySpecHandle(outHandle.Handle))
                GetAbilitySystemComponentFromActorInfo().ClearAbility(outHandle.Handle);

            if(m_HealthPercentageThresholds.Num() == 0)
                m_DamageLimiterComp.DeactivateLimiter();
        }
    }
    

    void OnMaxAttributeValueChanged(FGameplayAttribute Attribute, float OldValue, float NewValue)
    {
    }

    UFUNCTION(BlueprintOverride)
    void OnEndAbility_Scriptable(FGameplayAbilityActorInfo Info, bool WasCancelled)
    {
        UnregisterGameplayAttributeEvent(m_CurrentValueAttribute);
        UnregisterGameplayAttributeEvent(m_MaxValueAttribute);
    }
    
         
    void ApplyCoolDownGE()
    {
        auto abComp = Cast<UGothicAbilitySystemComponent>(GetAbilitySystemComponentFromActorInfo());
        FGameplayEffectContextHandle context = abComp.MakeEffectContext();
        FGameplayEffectSpecHandle effect = abComp.MakeOutgoingSpec(m_InvulnerableGE, 1.0f, context);
        abComp.ApplyGameplayEffectSpecToSelf(effect);
    }
    
}

class UGE_State_Invulnerable_DiegoSleeper : UGE_State_Invulnerable
{
    default DurationPolicy = EGameplayEffectDurationType::Infinite;
	default DurationMagnitude.MagnitudeCalculationType = EGameplayEffectMagnitudeCalculation::ScalableFloat;

	//Tags of the gameplay effect (This help to get the effect from the ability system)
	default AssetTagsComponent.InheritableAssetTags.AddTag(GameplayTag::Debuff_Invulnerable_DiegoSleeper);

	default TagsToRemoveOther.AddTag(GameplayTag::Debuff_Burn);
	default TagsToRemoveOther.AddTag(GameplayTag::Debuff_Stack_Fire);
	default TagsToRemoveOther.AddTag(GameplayTag::Debuff_Freeze);
	default TagsToRemoveOther.AddTag(GameplayTag::Debuff_Stack_Ice);
	//default TagsToRemoveOther.AddTag(GameplayTag::Debuff_Paralyzed);
	default TagsToRemoveOther.AddTag(GameplayTag::Debuff_Fear);
	default TagsToRemoveOther.AddTag(GameplayTag::Debuff_Electrified);
	default TagsToRemoveOther.AddTag(GameplayTag::Debuff_Sleep);
	default TagsToRemoveOther.AddTag(GameplayTag::Debuff_Charm);
	default TagsToRemoveOther.AddTag(GameplayTag::Debuff_Shrink);
	default TagsToRemoveOther.AddTag(GameplayTag::State_Knockback);
	default TagsToRemoveOther.AddTag(GameplayTag::Debuff_Wind);
	default TagsToRemoveOther.AddTag(GameplayTag::State_Controlling);
	default TagsToRemoveOther.AddTag(GameplayTag::State_Controlled);
    default TagsToRemoveOther.AddTag(GameplayTag::State_Controlled);
    default TagsToRemoveOther.AddTag(GameplayTag::Debuff_Stack_Freeze_Hits);
    default RemoveOtherTags();

    FGameplayEffectCue cue;
	default cue.GameplayCueTags.AddTag(GameplayTag::Gameplaycue_Debuff_Invulnerable_DiegoSleeper);
	default GameplayCues.Add(cue);
}