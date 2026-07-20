class UInExtremoPropComponent : UGothicGenericMagicComponent
{
    UPROPERTY(BlueprintReadWrite, EditAnywhere)
    TMap<FName, ASkeletalMeshActor> m_SkeletalMeshPropMap;
    UPROPERTY(BlueprintReadWrite, EditAnywhere)
    TMap<FName, AStaticMeshActor> m_StaticMeshPropMap;

    UPROPERTY(NotVisible, NotEditable)
    FName m_SaveKeyPrefix = n"InExtremo_ActorPerformanceCompleted_";
    UPROPERTY(NotVisible, NotEditable)
    FName m_SaveGameKey_Concert_Completed = n"InExtremo_Concert_Completed";

    UPROPERTY(EditAnywhere, BlueprintReadWrite)
    FName m_GlobalEventName = NAME_None;


    UFUNCTION(BlueprintOverride)
    void BeginPlay()
    {
        GetOwner().SetActorTickEnabled(false);
        if(IsPerformaceCompleted())
        {
            OnPerformaceCompleted();
            return;
        }
        InitializeCharacterProps();
        //m_propMesh.AttachToActor(GetOwner(), n"InExtremoInstrumentSocket", EAttachmentRule::SnapToTarget);
    }

    UFUNCTION(BlueprintCallable)
    void HideProps()
    {
        for(auto tuple : m_SkeletalMeshPropMap)
        {
            tuple.Value.SetActorHiddenInGame(true);
        }
        for(auto tuple : m_StaticMeshPropMap)
        {
            tuple.Value.SetActorHiddenInGame(true);
        }
    }

    bool IsPerformaceCompleted()
    {
        
        if(GetOwner().GetLocalRole() != ENetRole::ROLE_Authority)
        {
            return false;
        }

        if(GetOwner().Tags.IsEmpty())
        {
            FString text = FString("Tags.IsEmpty() EMPTY on: ");
            text.Append(FString(GetOwner().GetActorNameOrLabel()));
            PrintError(text, 50.f);
            return false;
        }

        auto saveKey = m_SaveKeyPrefix.ToString().Append(GetOwner().Tags[0].ToString());
            
        float32 savedState = 0.0f;
        bool bLoaded = AG1RGameState::GetWorldFloatData(World, FName(saveKey), savedState);
        if(bLoaded)
        {
            if(savedState > 0.9f)
            {
                return true;
            } 
        }
        bLoaded = AG1RGameState::GetWorldFloatData(World, m_SaveGameKey_Concert_Completed, savedState);
        if(bLoaded)
        {
            if(savedState > 0.9f)
            {
                return true;
            } 
        }
        return false;
    }

    void InitializeCharacterProps()
    {
        //@DE - Deactivate tick in all.
        UBFGTickOptimizerSystem::SetTickOptimizationRuntime_Enabled(GetOwner(), false);
        auto sk = USkeletalMeshComponent::Get(GetOwner());
        for(auto tuple : m_SkeletalMeshPropMap)
        {
            UBFGTickOptimizerSystem::SetTickOptimizationRuntime_Enabled(tuple.Value, false);
            tuple.Value.AttachToComponent(sk, tuple.Key, EAttachmentRule::SnapToTarget);
            tuple.Value.SetActorTickEnabled(false);
        }
        for(auto tuple : m_StaticMeshPropMap)
        {
            UBFGTickOptimizerSystem::SetTickOptimizationRuntime_Enabled(tuple.Value, false);
            tuple.Value.AttachToComponent(sk, tuple.Key, EAttachmentRule::SnapToTarget);
            tuple.Value.SetActorTickEnabled(false);
        }
    }

    UFUNCTION(BlueprintCallable)
    void OnPerformaceCompleted()
    {
        auto saveKey = m_SaveKeyPrefix.ToString().Append(GetOwner().Tags[0].ToString());
        if(GetOwner().GetLocalRole() == ENetRole::ROLE_Authority)
        {
            AG1RGameState::SaveWorldFloatData(GetWorld(), FName(saveKey), 1);
            if(m_GlobalEventName != NAME_None)
                UWorldPointManager::Get().CallGlobalEvent(m_GlobalEventName);
            GetOwner().SetActorHiddenInGame(true);
            HideProps();
        }
    }

    UFUNCTION()
    void DoDestroy()
    {
        for(auto tuple : m_SkeletalMeshPropMap)
        {
            tuple.Value.DestroyActor();
        }
        for(auto tuple : m_StaticMeshPropMap)
        {
            tuple.Value.DestroyActor();
        }
        GetOwner().DestroyActor();
    }


    void ResetAll()
    {
        auto saveKey = m_SaveKeyPrefix.ToString().Append(GetOwner().Tags[0].ToString());
        if(GetOwner().GetLocalRole() == ENetRole::ROLE_Authority)
        {
            AG1RGameState::SaveWorldFloatData(GetWorld(), FName(saveKey), 0);
        }

        GetOwner().SetActorHiddenInGame(false);
        for(auto tuple : m_SkeletalMeshPropMap)
        {
            tuple.Value.SetActorHiddenInGame(false);
        }
        for(auto tuple : m_StaticMeshPropMap)
        {
            tuple.Value.SetActorHiddenInGame(false);
        }
    }
}