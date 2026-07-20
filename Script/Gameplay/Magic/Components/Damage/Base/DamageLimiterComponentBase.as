class UDamageLimiterComponentBase : UCreatureGenericMagicComponent
{
    UPROPERTY()
    protected bool m_EnableLimiter = false;

	// "Current value" attribute.
	UPROPERTY(BlueprintReadWrite, VisibleAnywhere)
	protected FGameplayAttribute m_CurrentValueAttribute;

	// "Max value" attribute.
	UPROPERTY(BlueprintReadWrite, VisibleAnywhere)
	protected FGameplayAttribute m_MaxValueAttribute;

    UPROPERTY()
    UGothicAbilitySystemComponent m_AbComp;

    UPROPERTY()
    protected float m_MaxHealth;

    UFUNCTION(BlueprintOverride)
    void BeginPlay()
    {
        GetAbComponent();
        m_MaxValueAttribute = UAngelscriptAttributeSet::GetGameplayAttribute(UAttributeSet_Health::StaticClass(), n"MaxHealth");
        m_CurrentValueAttribute = UAngelscriptAttributeSet::GetGameplayAttribute(UAttributeSet_Health::StaticClass(), n"Health");
        
        // if(m_HealthConfigDefClass == nullptr)
        // {
        //     m_EnableLimiter = false;
        //     return;
        // }

        // m_HealthConfig = Cast<UGenericHealthMonitorConfig>(m_HealthConfigDefClass.Get().GetDefaultObject());
        // if(m_HealthConfig == nullptr  || Math::IsNearlyZero(m_HealthConfig.m_MaxDamageOnPercentage))
        // {
        //     m_EnableLimiter = false;
        //     return;
        // }
        // m_MaxDamageOnPercentage = m_HealthConfig.m_MaxDamageOnPercentage;


        // 
        // bool success = false;
        // m_MaxHealth = AbilitySystem::GetFloatAttributeFromAbilitySystemComponent(m_AbComp, m_MaxValueAttribute, success);
        // m_HealthPercentageThresholds = m_HealthConfig.m_HealthPercentageThresholds;
    
        // m_EnableLimiter = true; 
    }

    UGothicAbilitySystemComponent GetAbComponent()
    {
        if(m_AbComp == nullptr)
            m_AbComp = Cast<UGothicAbilitySystemComponent>(Cast<AGothicCharacter>(GetOwner()).GetAbilitySystemComponent());
        return m_AbComp;
    }

    void DeactivateLimiter()
    {
        m_EnableLimiter = false;
    }

    void ActivateLimiter()
    {
        m_EnableLimiter = true;
    }

    bool IsEnableDamageLimiter()
    {
        return m_EnableLimiter;
    }

    float GetMaxDamage(float CurrentDamage)
    {
        return CurrentDamage;
        
        // auto maxDamage = m_MaxHealth * m_MaxDamageOnPercentage;
        // auto calculatedDamage = Math::Min(maxDamage, CurrentDamage);
        // if(m_HealthPercentageThresholds.Num() == 0)
        // {
        //     return calculatedDamage;
        // }
        // auto healthThreshold = m_HealthPercentageThresholds[0];
        // bool success = false;
        // auto currentHealthValue = AbilitySystem::GetFloatAttributeFromAbilitySystemComponent(m_AbComp, m_CurrentValueAttribute, success);
        
        // if(!success)
        //     return calculatedDamage;

        // if(currentHealthValue - calculatedDamage <= m_MaxHealth * healthThreshold)
        // {
        //     m_HealthPercentageThresholds.RemoveAt(0);
        //     return currentHealthValue - m_MaxHealth * healthThreshold;
        // }

        // return calculatedDamage;
    }

    
}