class UGA_EnvironmentAttack_SummonCreatureByHealth : UGameplayAbilityCreatureEnvironmentAttack
{

    TSubclassOf<UGenericSummonCreatureByHealth> m_spellConfigClass; //= USummonIceMiniGolem_IceGolem_SpellConfig::StaticClass();
    UGenericSummonCreatureByHealth m_Config;

    
	// "Current value" attribute.
	UPROPERTY(BlueprintReadWrite, VisibleAnywhere)
	FGameplayAttribute m_CurrentValueAttribute;

	// "Max value" attribute.
	UPROPERTY(BlueprintReadWrite, VisibleAnywhere)
	FGameplayAttribute m_MaxValueAttribute;

    UPROPERTY()
    float m_MaxHealth;

    UPROPERTY()
    TArray<AActor> m_SpawnerActors;

    UFUNCTION(BlueprintOverride)
    void OnActivateAbility_Scriptable(FGameplayAbilityActorInfo GAActorInfo,
                                      FGameplayEventData TriggerEventData)
    {
        m_Config = Cast<UGenericSummonCreatureByHealth>(m_spellConfigClass.Get().DefaultObject);

        if(m_Config == nullptr)
        {
            EndAbility();
            return;
        }

        auto gothicChar = Cast<AGothicCharacter>(GetAvatarActorFromActorInfo());
        auto npcState = Cast<AGothicNPCState>(gothicChar.GetCharacterState());
        npcState.OnCharacterSpawned.AddUFunction(this, n"OnCharacterSpawned");
        npcState.OnCharacterDestroyed.AddUFunction(this, n"OnCharacterDestroyed");
        
        m_CurrentValueAttribute = UAngelscriptAttributeSet::GetGameplayAttribute(UAttributeSet_Health::StaticClass(), n"Health");
        m_MaxValueAttribute = UAngelscriptAttributeSet::GetGameplayAttribute(UAttributeSet_Health::StaticClass(), n"MaxHealth");
        if(HasAuthority())
        {
            RegisterGameplayAttributeEvent(m_CurrentValueAttribute);
            RegisterGameplayAttributeEvent(m_MaxValueAttribute);
        }

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
    }

    bool AttributeEquals(FGameplayAttribute AttributeA, FGameplayAttribute AttributeB)
    {
        return AttributeA.AttributeSetClass == AttributeB.AttributeSetClass;
    }

    void OnCurrentAttributeValueChanged(FGameplayAttribute Attribute, float OldValue, float NewValue)
    {
        if(AreAllSpawnersActivated())
            return;
        TryActivateCreatures(NewValue);
    }

    bool AreAllSpawnersActivated()
    {
        GetAllSpawnerActors();
        for(AActor Actor : m_SpawnerActors)
        {
            auto spawnerActor = Cast<ACreatureSummonVisual>(Actor);
            if(spawnerActor != nullptr)
            {
                if(!spawnerActor.m_Activated)
                    return false;
            }
        }
        return true;
    }

    void TryActivateCreatures(float NewValue)
    {
        bool success = false;
        auto currentHealth = AbilitySystem::GetFloatAttributeFromAbilitySystemComponent(GetAbilitySystemComponentFromActorInfo(), m_CurrentValueAttribute, success);
        if(currentHealth <= m_MaxHealth * m_Config.m_ActivateCreatureHealthPercentageBelow)
        {
            ActivateAllCreatures();
        }
    }

    void ActivateAllCreatures()
    {
        GetAllSpawnerActors();
        if(AreAllSpawnersActivated())
            return;
        for(AActor Actor : m_SpawnerActors)
        {
            DoActivateCreature(Actor);
        }
    }

    void DoActivateCreature(AActor Actor)
    {
        // auto spawnerRock = Cast<AMiniGolemIceRockSpawnerVisual>(Actor);
        // if(spawnerRock != nullptr)
        // {
        //     spawnerRock.SetOwner(GetAvatarActorFromActorInfo());
        //     spawnerRock.DoActivate();
        // }
    }

    void GetAllSpawnerActors()
    {
        if(!m_SpawnerActors.IsEmpty())
            return;
        GetAllSpawnerActorsByClass();
        //GetAllActorsOfClass(AMiniGolemIceRockSpawnerVisual::StaticClass(), outActors);
    }

    void GetAllSpawnerActorsByClass()
    {
    }

    UFUNCTION()
    void OnCharacterSpawned(AGothicNPCState CharacterState, AGothicCharacter Character)
    {
        //Print(FString("OncharacterSpawned"));

        auto gothicChar = Cast<AGothicCharacter>(GetAvatarActorFromActorInfo());
        if(gothicChar.IsDead() || gothicChar.IsDefeated())
            return;

        RestartAllCreatures();    
    }
    
    UFUNCTION()
    void OnCharacterDestroyed(AGothicNPCState CharacterState)
    {
        auto gothicChar = Cast<AGothicCharacter>(GetAvatarActorFromActorInfo());
        if(gothicChar.IsDead() || gothicChar.IsDefeated())
            return;

    }

    

    void RestartAllCreatures()
    {
        GetAllSpawnerActors();
        for(AActor Actor : m_SpawnerActors)
        {
            DoRestartCreature(Actor);
        }
    }

    void DoRestartCreature(AActor Actor)
    {
        // auto spawnerRock = Cast<AMiniGolemIceRockSpawnerVisual>(Actor);
        // if(spawnerRock != nullptr)
        // {
        //     spawnerRock.Restart();
        // }
    }

    UFUNCTION(BlueprintOverride)
    void OnEndAbility_Scriptable(FGameplayAbilityActorInfo Info, bool WasCancelled)
    {
        UnregisterGameplayAttributeEvent(m_CurrentValueAttribute);
        UnregisterGameplayAttributeEvent(m_MaxValueAttribute);

        auto gothicChar = Cast<AGothicCharacter>(GetAvatarActorFromActorInfo());
        auto npcState = Cast<AGothicNPCState>(gothicChar.GetCharacterState());
        npcState.OnCharacterSpawned.Unbind(this, n"OnCharacterSpawned");
        npcState.OnCharacterDestroyed.Unbind(this, n"OnCharacterDestroyed");
    }
}