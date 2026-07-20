class UGA_EnvironmentAttack_SummonCreatureByTime : UGameplayAbilityCreatureEnvironmentAttack
{
    default AbilityTags.AddTag(GameplayTag::Ability_EnvironmentAttack_SummonCreatureByTime);
    default BlockAbilitiesWithTag.AddTag(GameplayTag::Ability_EnvironmentAttack_SummonCreatureByTime);
    default CancelAbilitiesWithTag.AddTag(GameplayTag::Ability_EnvironmentAttack_SummonCreatureByTime);

    TSubclassOf<UGenericSummonCreatureByTime> m_spellConfigClass; //= USummonIceMiniGolem_IceGolem_SpellConfig::StaticClass();
    UGenericSummonCreatureByTime m_Config;

    UPROPERTY()
    private FTimerHandle TaskTimer;

    UPROPERTY()
    TArray<ACreatureSummonVisual> m_Spawners;

    UPROPERTY()
    ACreatureSummonVisual m_LastSpawnerActor;

    UPROPERTY()
    UGothicAbilitySystemComponent m_AbComp;

    UPROPERTY()
    TMap<AGothicCharacterState, ACreatureSummonVisual> m_CreaturesSpawned;

    UPROPERTY()
    UClass m_SpawnerActorFilterClass;
    UPROPERTY()
    UClass m_PlayerDetectionActorFilterClass;

    UPROPERTY()
    ASummonCreatureByTime_PlayerDetectionActor m_PlayerDetectionActor;
            UPROPERTY()
    UDelegateHandleContainer m_OnDieMeBeforeOwnerHandle;
     UPROPERTY()
    TMap<AGothicCharacterState, UDelegateHandleContainer> m_SpawnedCreatureDieHandles;

    UFUNCTION(BlueprintOverride)
    void OnActivateAbility_Scriptable(FGameplayAbilityActorInfo GAActorInfo,
                                      FGameplayEventData TriggerEventData)
    {
        if(!HasAuthority())
            return;

        m_Config = Cast<UGenericSummonCreatureByTime>(m_spellConfigClass.Get().DefaultObject);

        if(m_Config == nullptr)
        {
            EndAbility();
            return;
        }

        auto gothicChar = Cast<AGothicCharacter>(GetAvatarActorFromActorInfo());
        auto npcState = Cast<AGothicNPCState>(gothicChar.GetCharacterState());
        npcState.OnCharacterSpawned.AddUFunction(this, n"OnCharacterSpawned");
        npcState.OnCharacterDestroyed.AddUFunction(this, n"OnCharacterDestroyed");
        m_OnDieMeBeforeOwnerHandle = MagicScript::AttachToEventTag(GetAvatarActorFromActorInfo(), GameplayTag::Event_Die_Me_Before, this, n"OnDieMeBefore");

        FindSpawnVisualActors();
        FindPlayerDetectionActor();
        ActivateSpawningTimer();

        m_AbComp = Cast<UGothicAbilitySystemComponent>(GetAbilitySystemComponentFromActorInfo());
        for(auto spawner : m_Spawners)
        {
            spawner.OnCreatureCharacterStateSpawned.AddUFunction(this, n"OnCreatureCharacterStateSpawned");
            spawner.OnCreatureSpawned.AddUFunction(this, n"OnCreatureSpawned");
        }
        
    }

    UFUNCTION()
    void OnCreatureCharacterStateSpawned(AGothicCharacterState CharacterState, ACreatureSummonVisual SpawnerVisual)
    {
        m_CreaturesSpawned.Add(CharacterState, SpawnerVisual);
    }

    UFUNCTION()
    void OnCreatureSpawned(AGothicCharacter Character)
    {
        auto spawnedCreatureDie = MagicScript::AttachToEventTag(Character, GameplayTag::Event_Die_Me_Before, this, n"OnCreatureDie");
        m_SpawnedCreatureDieHandles.Add(Character.CharacterState, spawnedCreatureDie);
        auto players = MagicScript::GetAllPlayersNearCurrentLocation(Character.GetWorld(), Character, 25000);
        if(players.IsEmpty())
            return;
        players.Shuffle();
        Character.AI.StartAttackingImmediately(players[0]);
    }


    UFUNCTION()
    void OnDieMeBefore(FGameplayEventData GameplayEventData)
    {
        MagicScript::DetachFromEvent(GetAvatarActorFromActorInfo(), m_OnDieMeBeforeOwnerHandle);
        ClearDieDelegates();
        DeactivateSpawningTimer();
        ClearCreatureBindings();
    }

    void ClearDieDelegates()
    {
        MagicScript::DetachFromEvent(GetAvatarActorFromActorInfo(), m_OnDieMeBeforeOwnerHandle);
    }


    void ActivateSpawningTimer()
    {
        DeactivateSpawningTimer();
        TaskTimer = System::SetTimerDelegate(FTimerDynamicDelegate(this, n"DoSpawnCreature"), m_Config.m_SpawnPeriodTime, true);
    }

    UFUNCTION()
    void DoSpawnCreature()
    {
        if(CanSpawnCreature())
            SpawnCreature();
    }


    bool CanSpawnCreature()
    {
        if(!IsCombatState())
            return false;
        if(!IsPlayerOnDetectionArea())
            return false;
        if(IsDiedOrDefeated())
            return false;
        if(ReachedMaxCreatureAmount())
            return false;
        return true;
    }

    
    bool IsPlayerOnDetectionArea()
    {
        return m_PlayerDetectionActor.IsPlayerInside();
    }

    bool IsCombatState()
    {
        return m_AbComp.HasGameplayTag(GameplayTag::State_Combat);
    }

    bool IsDiedOrDefeated()
    {
        auto gothicChar = Cast<AGothicCharacter>(GetAvatarActorFromActorInfo());
        return gothicChar.IsDead() || gothicChar.IsDefeated();
    }

    bool ReachedMaxCreatureAmount()
    {
        return m_CreaturesSpawned.Num() >= GetMaxCreatureAmount();
    }

    int GetMaxCreatureAmount()
    {
        return m_Config.m_MaxSpawnCount;
    }

    void SpawnCreature()
    {
        m_LastSpawnerActor = GetSpawner();
        m_LastSpawnerActor.DoActivate();
    }

    ACreatureSummonVisual GetSpawner()
    {
        if(m_LastSpawnerActor == nullptr)
        {
            return GetRandomSpawner(m_Spawners);
        }
        auto copySpawners = m_Spawners;
        copySpawners.Remove(m_LastSpawnerActor);
        return GetRandomSpawner(copySpawners);
    }

    ACreatureSummonVisual GetRandomSpawner(TArray<ACreatureSummonVisual>& Spawners)
    {
        Spawners.Shuffle();
        return Spawners[0];
    }

    void FindSpawnVisualActors() 
    {
        TArray<AActor> outActors;
        GetAllActorsOfClass(m_SpawnerActorFilterClass, outActors);
        FString ErrorMsg = FString();
        if(ValidateSpawners(outActors, ErrorMsg))
        {
            PrintError(ErrorMsg, 50.f);
            EndAbility();
            return;
        }
        for(auto actor : outActors)
        {
            auto spawner = Cast<ACreatureSummonVisual>(actor);
            spawner.SetOwner(GetAvatarActorFromActorInfo());
            m_Spawners.Add(spawner);
        }
    }

    void FindPlayerDetectionActor()
    {
        TArray<AActor> outActors;
        GetAllActorsOfClass(m_PlayerDetectionActorFilterClass, outActors);
        FString ErrorMsg = FString();
        if(!ValidatePlayerDetectionActor(outActors, ErrorMsg))
        {
            PrintError(ErrorMsg, 50.f);
            EndAbility();
            return;
        }
        m_PlayerDetectionActor = Cast<ASummonCreatureByTime_PlayerDetectionActor>(outActors[0]);
        m_PlayerDetectionActor.m_CollisionComp.SetCollisionEnabled(ECollisionEnabled::NoCollision);
        m_PlayerDetectionActor.m_CollisionComp.SetCollisionEnabled(ECollisionEnabled::QueryAndPhysics);
    }

    bool ValidateSpawners(TArray<AActor> Spawners, FString& ErrorMsg)
    {
        return false;
    }

    bool ValidatePlayerDetectionActor(TArray<AActor> Spawners, FString& ErrorMsg)
    {
        return false;
    }

  
    UFUNCTION()
    void OnCharacterSpawned(AGothicNPCState CharacterState, AGothicCharacter Character)
    {
        ActivateSpawningTimer();
    }
    
    UFUNCTION()
    void OnCharacterDestroyed(AGothicNPCState CharacterState)
    {
        DeactivateSpawningTimer();
    }
    


    void DeactivateSpawningTimer()
    {
        if(System::IsTimerActiveHandle(TaskTimer))
            System::ClearAndInvalidateTimerHandle(TaskTimer);
    }

    UFUNCTION(BlueprintOverride)
    void OnEndAbility_Scriptable(FGameplayAbilityActorInfo Info, bool WasCancelled)
    {
        DeactivateSpawningTimer();

        ClearDieDelegates();

        auto gothicChar = Cast<AGothicCharacter>(GetAvatarActorFromActorInfo());
        auto npcState = Cast<AGothicNPCState>(gothicChar.GetCharacterState());
        npcState.OnCharacterSpawned.Unbind(this, n"OnCharacterSpawned");
        npcState.OnCharacterDestroyed.Unbind(this, n"OnCharacterDestroyed");

        ClearCreatureBindings();
        for(auto spawner : m_Spawners)
        {
            if(IsValid(spawner))
                spawner.OnCreatureSpawned.Unbind(this, n"OnCreatureSpawned");
        }
    }

        UFUNCTION()
    void OnCreatureDie(FGameplayEventData GameplayEventData)
    {
        auto creature = Cast<AGothicCharacter>(GameplayEventData.Target);
        auto characterState = creature.CharacterState;
        if(m_SpawnedCreatureDieHandles.Contains(characterState))
        {
            MagicScript::DetachFromEvent(creature, m_SpawnedCreatureDieHandles[characterState]);
            m_SpawnedCreatureDieHandles.Remove(characterState);
        }
        if(m_CreaturesSpawned.Contains(creature.GetCharacterState()))
        {
                if(m_CreaturesSpawned[creature.GetCharacterState()] != nullptr)
                    m_CreaturesSpawned[creature.GetCharacterState()].DoRestart();
        }
        m_CreaturesSpawned.Remove(creature.GetCharacterState());
    }


    
    void ClearCreatureBindings()
    {
        for(auto creatureSpawner : m_CreaturesSpawned)
        {
            if(m_SpawnedCreatureDieHandles.Contains(creatureSpawner.Key))
            {
                MagicScript::DetachFromEvent(creatureSpawner.Key, m_SpawnedCreatureDieHandles[creatureSpawner.Key]);
                m_SpawnedCreatureDieHandles.Remove(creatureSpawner.Key);
                if(creatureSpawner.Value != nullptr)
                    creatureSpawner.Value.DoRestart();
            }
        }
    }



}