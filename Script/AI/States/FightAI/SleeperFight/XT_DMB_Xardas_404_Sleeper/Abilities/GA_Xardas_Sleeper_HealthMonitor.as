class UGA_Xardas_Sleeper_HealthMonitor : UGameplayAbilityCreatureSpecialState
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
    TArray<float> m_TeleportToMinionSpotHealthPercentage;

    UPROPERTY()
    TSubclassOf<UGenericHealthMonitorConfig> m_XardasSleeperHealthDefClass = UXardasSleeperHealthMonitorConfig::StaticClass();

    UPROPERTY()
    UXardasSleeperHealthMonitorConfig m_XardasSleeperHealthDef;

    UPROPERTY()
    UXardasSleeperDamageLimiterComponent m_DamageLimiterComp;



    UFUNCTION(BlueprintOverride)
    void OnActivateAbility_Scriptable(FGameplayAbilityActorInfo GAActorInfo,
                                      FGameplayEventData TriggerEventData)
    {
        m_DamageLimiterComp = UXardasSleeperDamageLimiterComponent::GetOrCreate(GetAvatarActorFromActorInfo());
        m_XardasSleeperHealthDef = Cast<UXardasSleeperHealthMonitorConfig>(m_XardasSleeperHealthDefClass.Get().DefaultObject);

        m_TeleportToMinionSpotHealthPercentage = m_XardasSleeperHealthDef.m_HealthPercentageThresholds;

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
        if(m_TeleportToMinionSpotHealthPercentage.Num() == 0)
        {
            //Notify with something
            return;

        }
        auto healthThreshold = m_TeleportToMinionSpotHealthPercentage[0];
        if(Math::TruncToFloat(HealthValue) <= Math::TruncToFloat(m_MaxHealth * healthThreshold))
        {
            m_TeleportToMinionSpotHealthPercentage.RemoveAt(0);
            FGameplayEventData Payload;
            GetAbilitySystemComponentFromActorInfo().SendGameplayEvent(GameplayTag::Event_XardasSleeper_OnHealThresholdReached, Payload);
            if(m_TeleportToMinionSpotHealthPercentage.Num() == 0)
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
    
    
}