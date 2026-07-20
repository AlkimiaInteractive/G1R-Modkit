class UPercentageDamageLimiterComponent : UDamageLimiterComponentBase
{
    //@DE - Max damage that the character can receive relative to their max health
    UPROPERTY()
    private float m_MaxDamageOnPercentage;

    UPROPERTY()
    TSubclassOf<UGenericHealthMonitorConfig> m_HealthConfigDefClass = UGenericHealthMonitorConfig::StaticClass();

    UPROPERTY()
    UGenericHealthMonitorConfig m_HealthConfig;

    UPROPERTY()
    TArray<float> m_HealthPercentageThresholds;


    UFUNCTION(BlueprintOverride)
    void BeginPlay()
    {
        Super::BeginPlay();

        if(m_HealthConfigDefClass == nullptr)
        {
            m_EnableLimiter = false;
            return;
        }

        m_HealthConfig = Cast<UGenericHealthMonitorConfig>(m_HealthConfigDefClass.Get().GetDefaultObject());
        if(m_HealthConfig == nullptr  || Math::IsNearlyZero(m_HealthConfig.m_MaxDamageOnPercentage))
        {
            m_EnableLimiter = false;
            return;
        }
        m_MaxDamageOnPercentage = m_HealthConfig.m_MaxDamageOnPercentage;

        //m_MaxValueAttribute = UAngelscriptAttributeSet::GetGameplayAttribute(UAttributeSet_Health::StaticClass(), n"MaxHealth");
        //m_CurrentValueAttribute = UAngelscriptAttributeSet::GetGameplayAttribute(UAttributeSet_Health::StaticClass(), n"Health");
        //m_AbComp = Cast<UGothicAbilitySystemComponent>(Cast<AGothicCharacter>(GetOwner()).GetAbilitySystemComponent());
        bool success = false;
        m_MaxHealth = AbilitySystem::GetFloatAttributeFromAbilitySystemComponent(m_AbComp, m_MaxValueAttribute, success);
        m_HealthPercentageThresholds = m_HealthConfig.m_HealthPercentageThresholds;
    
        m_EnableLimiter = true; 
    }


    float GetMaxDamage(float CurrentDamage) override
    {
        if(!m_EnableLimiter)
            return CurrentDamage;
        auto maxDamage = m_MaxHealth * m_MaxDamageOnPercentage;
        auto calculatedDamage = Math::Min(maxDamage, CurrentDamage);
        if(m_HealthPercentageThresholds.Num() == 0)
        {
            return calculatedDamage;
        }
        auto healthThreshold = m_HealthPercentageThresholds[0];
        bool success = false;
        auto currentHealthValue = AbilitySystem::GetFloatAttributeFromAbilitySystemComponent(m_AbComp, m_CurrentValueAttribute, success);
        
        if(!success)
            return calculatedDamage;

        if(currentHealthValue - calculatedDamage <= m_MaxHealth * healthThreshold)
        {
            m_HealthPercentageThresholds.RemoveAt(0);
            return currentHealthValue - m_MaxHealth * healthThreshold;
        }

        return calculatedDamage;
    }

    
}