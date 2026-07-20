class UWaterDamageLimiterComponent : UDamageLimiterComponentBase
{

    UFUNCTION(BlueprintOverride)
    void BeginPlay()
    {
        Super::BeginPlay();
        
    }

    void DeactivateLimiter() override
    {
        //Super::DeactivateLimiter();
    }

    bool IsEnableDamageLimiter() override
    {
        auto abComp = GetAbComponent();
        if(abComp.HasGameplayTag(GameplayTag::State_UnKillable))
            return true;
        if(abComp.HasGameplayTag(GameplayTag::State_Controlled))
            return true;
        return false;
    }
    float GetMaxDamage(float CurrentDamage) override
    {
        if(!IsEnableDamageLimiter())
            return CurrentDamage;

        if(CurrentDamage <= 0.f)
            return 0.f;

        bool success = false;
        auto currentHealthValue = AbilitySystem::GetFloatAttributeFromAbilitySystemComponent(m_AbComp, m_CurrentValueAttribute, success);
        if(!success)
            return CurrentDamage;

        if(Math::IsNearlyEqual(currentHealthValue, 1))
            return 0.f;

        if(currentHealthValue - CurrentDamage > 1.f)
            return CurrentDamage;
        else
            return currentHealthValue - 1;
    }
    
}