class UGA_FireGolem_EnvironmentAttack_ArenaLavaStreams : UGameplayAbilityCreatureEnvironmentAttack
{
    //Set the avatar actor as owner of the lava streams. Instead that, there isnt damage

    UPROPERTY()
    TArray<A_FireGolem_EnvironmentAttack_ArenaLavaStream> m_ArenaLavaStreams;

	// "Current value" attribute.
	UPROPERTY(BlueprintReadWrite, VisibleAnywhere)
	FGameplayAttribute m_CurrentValueAttribute;

	// "Max value" attribute.
	UPROPERTY(BlueprintReadWrite, VisibleAnywhere)
	FGameplayAttribute m_MaxValueAttribute;

    UPROPERTY()
    float m_MaxHealth;

    UPROPERTY()
    TSubclassOf<UGothicBaseConfig> m_ArenaDefClass = UArenaLavaStreamDefinition_FireGolem::StaticClass();

    UPROPERTY()
    UArenaLavaStreamDefinition_FireGolem m_ArenaDef;

    UPROPERTY()
    TArray<float> m_CurrentLavaStreamHealthPercentage;

    UPROPERTY()
    private FTimerHandle TaskTimer;

    UPROPERTY()
    UDelegateHandleContainer m_OnDieMeBeforeHandle;


    UFUNCTION(BlueprintOverride)
    void OnActivateAbility_Scriptable(FGameplayAbilityActorInfo GAActorInfo,
                                      FGameplayEventData TriggerEventData)
    {
        m_ArenaDef = Cast<UArenaLavaStreamDefinition_FireGolem>(m_ArenaDefClass.Get().DefaultObject);

        if(m_ArenaDef == nullptr)
        {
            EndAbility();
            return;
        }
        m_ArenaLavaStreams.Empty();
        FindAreaActor();
    }

    UFUNCTION()
    void FindAreaActor()
    {
        auto avatarActor = GetAvatarActorFromActorInfo();
        //UNearbyActorsSubsystem::Get().TrackActorsOfClass(A_FireGolem_EnvironmentAttack_ArenaLavaStream::StaticClass());
        //auto outActors = UNearbyActorsSubsystem::Get().FindActorsOfClassInRadius(A_FireGolem_EnvironmentAttack_ArenaLavaStream::StaticClass(), avatarActor.GetActorLocation(), m_ArenaDef.m_SearchRadius);
        TArray<AActor> outActors;
        GetAllActorsOfClass(A_FireGolem_EnvironmentAttack_ArenaLavaStream::StaticClass(), outActors);
        if(outActors.Num() == 0)
        {
            ActivateDetectionTimer();
            return;
        }
        for(auto actor : outActors)
        {
            actor.SetOwner(avatarActor);
            m_ArenaLavaStreams.Add(Cast<A_FireGolem_EnvironmentAttack_ArenaLavaStream>(actor));
        }
        if(System::IsTimerActiveHandle(TaskTimer))
            System::ClearAndInvalidateTimerHandle(TaskTimer);
        RegisterArea();
    }

    void ActivateDetectionTimer()
    {
        if(System::IsTimerActiveHandle(TaskTimer))
            System::ClearAndInvalidateTimerHandle(TaskTimer);
        TaskTimer = System::SetTimerDelegate(FTimerDynamicDelegate(this, n"FindAreaActor"), .5f, true);
    }

    void RegisterArea()
    {
        m_CurrentLavaStreamHealthPercentage = m_ArenaDef.m_LavaStreamHealthPercentage;

        m_ArenaLavaStreams.Shuffle();

        m_CurrentValueAttribute = UAngelscriptAttributeSet::GetGameplayAttribute(UAttributeSet_Health::StaticClass(), n"Health");
        m_MaxValueAttribute = UAngelscriptAttributeSet::GetGameplayAttribute(UAttributeSet_Health::StaticClass(), n"MaxHealth");

        
        auto gothicChar = Cast<AGothicCharacter>(GetAvatarActorFromActorInfo());
        auto npcState = Cast<AGothicNPCState>(gothicChar.GetCharacterState());
        npcState.OnCharacterSpawned.AddUFunction(this, n"OnCharacterSpawned");

        RegisterGameplayAttributeEvent(m_CurrentValueAttribute);
        RegisterGameplayAttributeEvent(m_MaxValueAttribute);
        m_OnDieMeBeforeHandle = MagicScript::AttachToEventTag(GetAvatarActorFromActorInfo(), GameplayTag::Event_Die_Me_Before, this, n"OnDieMeBefore");


        bool success = false;
        m_MaxHealth = AbilitySystem::GetFloatAttributeFromAbilitySystemComponent(GetAbilitySystemComponentFromActorInfo(), m_MaxValueAttribute, success);
    }

    UFUNCTION()
    void OnDieMeBefore(FGameplayEventData GameplayEventData)
    {
        auto abComp = Cast<UGothicAbilitySystemComponent>(GetAbilitySystemComponentFromActorInfo());
        MagicScript::DetachFromEvent(GetAvatarActorFromActorInfo(), m_OnDieMeBeforeHandle);
        DeactivateLavaStreams();
    }

    void DeactivateLavaStreams()
    {
        for(auto lavaStream : m_ArenaLavaStreams)
        {
            if(lavaStream != nullptr)
                lavaStream.DeactivateStream();
        }
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
        TryActivateLavaStream(NewValue);
    }

    
    void TryActivateLavaStream(float HealthValue)
    {
        if(m_CurrentLavaStreamHealthPercentage.Num() == 0)
            return;
        auto healthThreshold = m_CurrentLavaStreamHealthPercentage[0];
        if(HealthValue < m_MaxHealth * healthThreshold)
        {
            m_CurrentLavaStreamHealthPercentage.RemoveAt(0);
            ActivateLavaStream();
            //Check if it need activate another lava stream.
            TryActivateLavaStream(HealthValue);
        }
        
    }

    void ActivateLavaStream()
    {
        for(auto lavaStream : m_ArenaLavaStreams)
        {
            if(lavaStream != nullptr)
            {
                if(!lavaStream.IsActivated())
                {
                   lavaStream.ResetEffect();
                   return;
                }
            }
            
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
        auto abComp = Cast<UGothicAbilitySystemComponent>(GetAbilitySystemComponentFromActorInfo());
        MagicScript::DetachFromEvent(GetAvatarActorFromActorInfo(), m_OnDieMeBeforeHandle);

        DeactivateLavaStreams();
    }

    UFUNCTION()
    void OnCharacterSpawned(AGothicNPCState CharacterState, AGothicCharacter Character)
    {
        //Print(FString("OncharacterSpawned"));

        auto gothicChar = Cast<AGothicCharacter>(GetAvatarActorFromActorInfo());
        if(gothicChar.IsDead() || gothicChar.IsDefeated())
            return;

        for(auto lavaStream : m_ArenaLavaStreams)
        {
            if(lavaStream != nullptr)
                lavaStream.ResetActor();            
        }
    
    }
}

class UGE_Damage_FireGolem_Test : UGE_Damage
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