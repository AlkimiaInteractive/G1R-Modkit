class UGA_Minecrawler_Queen_HealthMonitor : UGameplayAbilityCreatureSpecialState
{
     //Set the avatar actor as owner of the lava streams. Instead that, there isnt damage

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
    TArray<float> m_HealthPercentageThresholds;
    
    UPROPERTY()
    TSubclassOf<UGenericHealthMonitorConfig> m_MCQueenHealthDefClass = UMCQueenHealthMonitorConfig::StaticClass();

    UPROPERTY()
    UMCQueenHealthMonitorConfig m_MCQueenHealthDef;
    UPROPERTY()
    UMCQueenDamageLimiterComponent m_DamageLimiterComp;

    UPROPERTY(NotVisible, NotEditable)
    FName m_SaveGameKey = n"MCQueen_Phase1_Completed";


    UFUNCTION(BlueprintOverride)
    void OnActivateAbility_Scriptable(FGameplayAbilityActorInfo GAActorInfo,
                                      FGameplayEventData TriggerEventData)
    {
        //@DE - If someone saves the game while the queen is doing the phase change, we avoid on load get two queens.
        float32 savedState = 0.0f;
        bool bLoaded = AG1RGameState::GetWorldFloatData(World, m_SaveGameKey, savedState);
        if(bLoaded)
        {
            if(savedState > 0.9f)
            {
                Cast<UGothicAbilitySystemComponent>(GetAbilitySystemComponentFromActorInfo()).AddTag(GameplayTag::State_Invisible);
                Cast<UGothicAbilitySystemComponent>(GetAbilitySystemComponentFromActorInfo()).RemoveTag(GameplayTag::State_Combat_PhaseChange);
                Cast<UGothicAbilitySystemComponent>(GetAbilitySystemComponentFromActorInfo()).AddTag(GameplayTag::State_Combat_Ended);
                Cast<UGothicAbilitySystemComponent>(GetAbilitySystemComponentFromActorInfo()).AddTag(GameplayTag::State_Dead);
                Cast<AGothicCharacter>(GetAvatarActorFromActorInfo()).GetCharacterState().NPCState.RemoveFromWorld();
                EndAbility();
                return;
            }
        }

        m_DamageLimiterComp = UMCQueenDamageLimiterComponent::GetOrCreate(GetAvatarActorFromActorInfo());
        m_MCQueenHealthDef = Cast<UMCQueenHealthMonitorConfig>(m_MCQueenHealthDefClass.Get().DefaultObject);
        m_HealthPercentageThresholds = m_MCQueenHealthDef.m_HealthPercentageThresholds;

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
        float value = (HealthValue / m_MaxHealth ) * 100;
        //FString text = FString("Health value: ").Append(FString::ApplyFormat(value, FString()));
        //Print(text);

        auto abComp = Cast<UGothicAbilitySystemComponent>(GetAbilitySystemComponentFromActorInfo());
        if(abComp.HasGameplayTag(GameplayTag::State_Combat_PhaseChange))
            return;

        auto mcQueenCharacter = Cast<AMinecrawler_Queen>(GetAvatarActorFromActorInfo());
        if(mcQueenCharacter.IsInSecondPhase || mcQueenCharacter.DetachEggSac)
            return;

        if(m_HealthPercentageThresholds.Num() == 0)
        {
            //Notify with something
            return;

        }
        auto healthThreshold = m_HealthPercentageThresholds[0];

        if(Math::TruncToFloat(HealthValue) <= Math::TruncToFloat(m_MaxHealth * healthThreshold))
        {
            m_HealthPercentageThresholds.RemoveAt(0);
            FGameplayEventData payload;
            GothicGAS::SendGameplayEvent(GetAvatarActorFromActorInfo(), GameplayTag::Action_Hit_PhaseChange, payload);
            if(m_HealthPercentageThresholds.Num() == 0)
                m_DamageLimiterComp.DeactivateLimiter();

            if(GetAvatarActorFromActorInfo().GetLocalRole() == ENetRole::ROLE_Authority)
                AG1RGameState::SaveWorldFloatData(GetWorld(), m_SaveGameKey, 1);
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

class UGE_Damage_Minecrawler_Queen_Test : UGE_Damage
{
	default DurationPolicy = EGameplayEffectDurationType::Infinite;

    // Attribute to modify
	FGameplayModifierInfo modifier;
	default modifier.ModifierMagnitude.MagnitudeCalculationType = EGameplayEffectMagnitudeCalculation::ScalableFloat;
	default modifier.ModifierMagnitude.ScalableFloatMagnitude.Value = -5.0f; // How much damage applies to the attribute
	default modifier.ModifierOp = EGameplayModOp::Additive;
	default modifier.Attribute = GetAttribute(UAttributeSet_Health::StaticClass(), n"Health"); // attribute class and name
	default Modifiers.Add(modifier);

	default DurationMagnitude.MagnitudeCalculationType = EGameplayEffectMagnitudeCalculation::ScalableFloat;
	default Period.Value = 0.5f; // Applied each seconds
}



///TEST
class UGA_Boss_HealthMonitor : UGameplayAbilityCreatureSpecialState
{
     //Set the avatar actor as owner of the lava streams. Instead that, there isnt damage

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
    UMCBossDamageLimiterComponent m_DamageLimiterComp;



    UFUNCTION(BlueprintOverride)
    void OnActivateAbility_Scriptable(FGameplayAbilityActorInfo GAActorInfo,
                                      FGameplayEventData TriggerEventData)
    {
        m_DamageLimiterComp = UMCBossDamageLimiterComponent::GetOrCreate(GetAvatarActorFromActorInfo());

    }
}

class UGA_Boss_HealthMonitor_ELementalGolems : UGameplayAbilityCreatureSpecialState
{
     //Set the avatar actor as owner of the lava streams. Instead that, there isnt damage

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
    UMCBossDamageLimiterComponentEGolems m_DamageLimiterComp;



    UFUNCTION(BlueprintOverride)
    void OnActivateAbility_Scriptable(FGameplayAbilityActorInfo GAActorInfo,
                                      FGameplayEventData TriggerEventData)
    {
        m_DamageLimiterComp = UMCBossDamageLimiterComponentEGolems::GetOrCreate(GetAvatarActorFromActorInfo());

    }
}