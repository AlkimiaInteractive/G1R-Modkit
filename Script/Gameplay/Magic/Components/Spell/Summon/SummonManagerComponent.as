class USummonManagerComponent : UGothicSummonManagerComponent
{
    // EXAMPLE INVOKER
    UPROPERTY(EditAnywhere, BlueprintReadWrite)
    AGothicInvokerActor m_SpawnInvoker;

    UPROPERTY(EditAnywhere, BlueprintReadWrite)
    float m_MinFloorHeight = -200.f;
	UPROPERTY(EditAnywhere, BlueprintReadWrite)
	float m_MaxFloorHeight = 50.f;

    UPROPERTY()
    TArray<AGothicCharacter> m_SpawnedCreatures;

    UPROPERTY()
    TSubclassOf<UScriptGameplayEffect> m_GE_NoPersistent = UGE_CharacterNoPersistent::StaticClass();

    UPROPERTY()
    TMap<AGothicCharacterState, UDelegateHandleContainer> m_SummonedDieHandles;


    void SummonAI(AActor SummonerActor, TSubclassOf<UGameplayEffect> SummonedEffect, 
        TSubclassOf<USpawnAIAgentDefinition> spawnAIAgentDefinition, FVector Position, 
        TSubclassOf<UAIState_DailyRoutine> DailyRoutine, ASummonCreatureVisualEffect SummonCreatureVisualEffect, float Delay)
    {
        
        // auto CharacterState = MagicScript::SpawnAIAgentDefinition(SummonedEffect, spawnAIAgentDefinition, Position, SummonerActor.GetActorRotation(), DailyRoutine, SummonerActor);
        // if(SummonCreatureVisualEffect != nullptr)
        //         SummonCreatureVisualEffect.SpawnVisualAtLocation(Position);
        SetDelayedSpawn(SummonerActor, SummonedEffect, spawnAIAgentDefinition, Position, DailyRoutine, SummonCreatureVisualEffect, Delay);
    }

    UFUNCTION(BlueprintOverride)
    AGothicNPCState DoDelayedSpawn_Scriptable(AActor SummonerActor, TSubclassOf<UGameplayEffect> SummonedEffect,
                                   TSubclassOf<USpawnAIAgentDefinition> SpawnAIAgentDefinition,
                                   FVector Position, TSubclassOf<UAIState_DailyRoutine> DailyRoutine,
                                   AActor SummonCreatureVisualEffect)
    {
        auto CharacterState = MagicScript::SpawnAIAgentDefinition(SummonedEffect, SpawnAIAgentDefinition, Position, SummonerActor.GetActorRotation(), DailyRoutine, SummonerActor);
        if(CharacterState != nullptr)
        {
            CharacterState.OnCharacterSpawned.AddUFunction(this, n"OnCharacterSpawned");
            ApplyNoPersistentGE(CharacterState);
            auto visualEffect = Cast<ASummonCreatureVisualEffect>(SummonCreatureVisualEffect);
            auto spawnPosition = Position;
            if(visualEffect != nullptr)
            {
                FHitResult hit;
                auto result = MagicScript::FindFloorAtLocation(spawnPosition, hit, nullptr, ECollisionChannel::IKTrace, m_MinFloorHeight, m_MaxFloorHeight);
                if(result)
                {
                    //floorLocation.Z += 15.f;
                    spawnPosition = hit.ImpactPoint;
                }
                else
                {
                    //We will never get this situation.
                    spawnPosition.Z -= Cast<AGothicCharacter>(SummonerActor).CapsuleComponent.CapsuleHalfHeight + 15.f;
                }                    
                visualEffect.SpawnVisualAtLocation(spawnPosition);
            }
                
        }

        return CharacterState;
    }

    void ApplyNoPersistentGE(AGothicNPCState CharacterState)
    {
        auto abComp = CharacterState.AbilitySystemComponent;
        FGameplayEffectContextHandle contextHandle = abComp.MakeEffectContext();
        FGameplayEffectSpecHandle geSpecHandle = abComp.MakeOutgoingSpec(m_GE_NoPersistent, 1, contextHandle);
        abComp.ApplyGameplayEffectSpecToSelf(geSpecHandle);
    }

    void InitializeNavMeshInvokerActor(TArray<FAISpawnData> m_CharactersToSpawn, FVector Location,float Radius)
    {
        if (m_CharactersToSpawn.IsEmpty())
            return;
        m_SpawnInvoker = AGothicInvokerActor::CreateInvokerActor(this, Location, m_CharactersToSpawn[0].m_SpawnAIAgentDefinition.DefaultObject, Radius);        
        m_SpawnInvoker.SetLifeSpan(10.f);

    }

    void ClearNavMeshInvokerActor()
    {
        if(m_SpawnInvoker != nullptr)
            m_SpawnInvoker.DestroyActor();
    }


    UFUNCTION()
    void OnCharacterSpawned(AGothicNPCState CharacterState, AGothicCharacter Character)
    {
        CharacterState.OnCharacterSpawned.Unbind(this, n"OnCharacterSpawned");
        m_SpawnedCreatures.Add(Character);
        auto summonedCreatureDie = MagicScript::AttachToEventTag(CharacterState, GameplayTag::Event_Die_Me_Before, this, n"OnDieMeBefore");
        m_SummonedDieHandles.Add(CharacterState, summonedCreatureDie);
    }

    UFUNCTION()
    void OnDieMeBefore(FGameplayEventData GameplayEventData)
    {
        auto creature = Cast<AGothicCharacter>(GameplayEventData.Target);
        auto characterState = creature.CharacterState;
        if(m_SummonedDieHandles.Contains(characterState))
        {
            MagicScript::DetachFromEvent(creature, m_SummonedDieHandles[characterState]);
            m_SummonedDieHandles.Remove(characterState);
        }
        m_SpawnedCreatures.Remove(creature);
    }
}