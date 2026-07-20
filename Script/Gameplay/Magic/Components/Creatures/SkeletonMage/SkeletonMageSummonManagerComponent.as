class USkeletonMageSummonManagerComponent : USummonManagerComponent
{
    UPROPERTY()
    TMap<AGothicCharacter, UDelegateHandleContainer> m_SummonedSkeletons;
    UPROPERTY()
    TArray<AGothicNPCState> m_SkeletonSpawningRequests;

    UPROPERTY()
    TArray<ASoulHarvestCharacter_Visual> m_SummonedHarvestSouls;
    

    bool CanSummonSkeletons()
    {
        return m_SummonedSkeletons.IsEmpty() && m_SkeletonSpawningRequests.IsEmpty();
    }

    bool CanSummonSouls()
    {
        return m_SummonedHarvestSouls.IsEmpty();
    }

    void RegisterSummonedSkeleton(AGothicNPCState CharacterState)
    {
        //@DE - We wait until character spawn to bind the die delegate.
        CharacterState.OnCharacterSpawned.AddUFunction(this, n"OnSkeletonSpawned");
        m_SkeletonSpawningRequests.Add(CharacterState);
    }

    UFUNCTION()
    void OnSkeletonSpawned(AGothicNPCState CharacterState, AGothicCharacter CharacterSpawned)
    {
        m_SkeletonSpawningRequests.Remove(CharacterState);
        auto ownerChar = Cast<ASkeletonMage>(GetOwner());
        if(ownerChar == nullptr)
            return;
        auto handleDelegate = MagicScript::AttachToEventTag(CharacterSpawned, GameplayTag::Event_Die_Me_Before, this, n"OnSummonedSkeletonDie");//ownerChar.AttachToEventTag(CharacterSpawned, GameplayTag::Event_Die_Me_Before, ownerChar, FName("OnSummonedSkeletonDie"));//MagicScript::AttachToEventTag(CharacterSpawned, GameplayTag::Event_Die_Me_Before, ownerChar, FName("OnSummonedSkeletonDie"));
        if(handleDelegate == nullptr)
             return;
        m_SummonedSkeletons.Add(CharacterSpawned, handleDelegate);
    }

    UFUNCTION()
    void OnSummonedSkeletonDie(FGameplayEventData GameplayEventData)
    {
        auto target = Cast<AGothicCharacter>(GameplayEventData.Target);
        if(!m_SummonedSkeletons.Contains(target))
            return;

        MagicScript::DetachFromEvent(target, m_SummonedSkeletons[target]);
        m_SummonedSkeletons.Remove(target);        
    }

    void RegisterHarvestSoul(ASoulHarvestCharacter_Visual SoulHarvestVisual)
    {
        m_SummonedHarvestSouls.Add(SoulHarvestVisual);
        SoulHarvestVisual.OnSoulHarvestVisualDieDelegate.BindUFunction(this, n"OnSoulHarvestVisualDie");
    }

    UFUNCTION()
    void OnSoulHarvestVisualDie(ASoulHarvestCharacter_Visual SoulHarvestVisual)
    {
        m_SummonedHarvestSouls.Remove(SoulHarvestVisual);
    }


    UFUNCTION(BlueprintOverride)
    AGothicNPCState DoDelayedSpawn_Scriptable(AActor SummonerActor,
                                              TSubclassOf<UGameplayEffect> SummonedEffect,
                                              TSubclassOf<USpawnAIAgentDefinition> SpawnAIAgentDefinition,
                                              FVector Position,
                                              TSubclassOf<UAIState_DailyRoutine> DailyRoutine,
                                              AActor SummonCreatureVisualEffect)
    {
        auto npcState = Super::DoDelayedSpawn_Scriptable(SummonerActor, SummonedEffect, SpawnAIAgentDefinition, Position, DailyRoutine, SummonCreatureVisualEffect);
        if(npcState == nullptr)
            return npcState;
        if(npcState.IsOfSpecies(GameplayTag::Species_Creature_Undead_Skeleton))
        {
            RegisterSummonedSkeleton(npcState);
            ApplyNoPersistentGE(npcState);
        }
        return npcState;
    }
}