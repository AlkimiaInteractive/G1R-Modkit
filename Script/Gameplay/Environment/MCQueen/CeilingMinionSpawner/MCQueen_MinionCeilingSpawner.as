UCLASS()
class AMCQueen_MinionCeilingSpawner : AActor
{
    UPROPERTY(DefaultComponent, RootComponent)
	USceneComponent m_RootComp;

    UPROPERTY(DefaultComponent, Attach=m_RootComp)
	USceneComponent m_LeftSpawner;

    UPROPERTY(DefaultComponent, Attach=m_RootComp)
	USceneComponent m_RightSpawner;
    UPROPERTY(DefaultComponent, Attach=m_RootComp)
    UTextRenderComponent m_TextRender;

    UPROPERTY()
    TSubclassOf<USpawnAIAgentDefinition> m_MinionClass;
    UPROPERTY()
    private FTimerHandle TaskTimer;

    UPROPERTY()
    float m_MinTime;
    UPROPERTY()
    float m_MaxTime;

    UPROPERTY()
    TSubclassOf<UGothicBaseConfig> m_ConfigClass = UMCQueen_MinionCeilingSpawnerConfig::StaticClass();
    UPROPERTY()
    UDelegateHandleContainer m_OnOwnerDieHandle;

    UPROPERTY()
    TMap<AGothicCharacterState, UDelegateHandleContainer> m_MinionsDieHandles;

    UFUNCTION(BlueprintOverride)
    void ConstructionScript()
    {
        if(m_TextRender != nullptr)
        {
            m_TextRender.SetRelativeLocation(FVector(0,0,100));       
            m_TextRender.SetText(FText::AsCultureInvariant(FString(GetName())));
            m_TextRender.SetTextRenderColor(FColor::Green);
            m_TextRender.SetHorizontalAlignment(EHorizTextAligment::EHTA_Center);
            m_TextRender.SetVerticalAlignment(EVerticalTextAligment::EVRTA_TextCenter);
            m_TextRender.SetHiddenInGame(true);
        }
    }

    UFUNCTION(BlueprintOverride)
    void BeginPlay()
    {
        auto config = Cast<UMCQueen_MinionCeilingSpawnerConfig>(m_ConfigClass.Get().GetDefaultObject());
        m_MinTime = config.m_MinTime;
        m_MaxTime = config.m_MaxTime;
        m_MinionClass = config.m_MinionClass;
    }
    UFUNCTION(BlueprintCallable)
    void ActivateSpawner()
    {
        m_OnOwnerDieHandle = MagicScript::AttachToEventTag(GetOwner(), GameplayTag::Event_Die_Me_Before, this, n"OnOwnerDie");

        SpawnCreature();
    }

    UFUNCTION()
    void SpawnCreature()
    {
        ClearTimer();
        FTransform spawnTransform = GetSpawnTransform(); 
        auto CharacterState = MagicScript::SpawnAIAgentDefinition(nullptr, m_MinionClass, spawnTransform.GetLocation(), spawnTransform.GetRotation().Rotator(), UDailyRoutine_Empty::StaticClass(), GetOwner());
        if(CharacterState != nullptr)
        {
            auto minionHandle = MagicScript::AttachToEventTag(CharacterState, GameplayTag::Event_Die_Me_Before, this, n"OnMinionDie");
            m_MinionsDieHandles.Add(CharacterState, minionHandle);
        }
    }

    FTransform GetSpawnTransform()
    {
        return Math::RandBool() == false ? m_LeftSpawner.GetWorldTransform() : m_RightSpawner.GetWorldTransform(); 
    }

    UFUNCTION()
    void OnMinionDie(FGameplayEventData EventData)
    {
        auto characterState = Cast<AGothicCharacter>(EventData.Target).CharacterState;
        if(m_MinionsDieHandles.Contains(characterState))
        {
            MagicScript::DetachFromEvent(Cast<AGothicCharacter>(EventData.Target), m_MinionsDieHandles[characterState]);
            m_MinionsDieHandles.Remove(characterState);
        }
        StartSpawnTimer();
    }

    void StartSpawnTimer()
    {
        ClearTimer();
        TaskTimer = System::SetTimerDelegate(FTimerDynamicDelegate(this, n"SpawnCreature"), Math::RandRange(m_MinTime, m_MaxTime), false);
    }

    UFUNCTION()
    void OnOwnerDie(FGameplayEventData EventData)
    {
        MagicScript::DetachFromEvent(GetOwner(), m_OnOwnerDieHandle);
        DestroyActor();
    }

    UFUNCTION(BlueprintOverride)
    void EndPlay(EEndPlayReason EndPlayReason)
    {
        DeactivateSpawner();
    }

    void DeactivateSpawner()
    {
        ClearTimer();
    }

    void ClearTimer()
    {
        if(System::IsTimerActiveHandle(TaskTimer))
            System::ClearAndInvalidateTimerHandle(TaskTimer);
    }


}