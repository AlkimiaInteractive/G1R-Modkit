UCLASS()
class AMinionSpotManager : AActor//AGothicGASActor
{
    TArray<AGothicNPCState> m_MinionsNpcStateSpawned;

    UPROPERTY(DefaultComponent, RootComponent)
    USceneComponent m_RootComp;

    UPROPERTY(DefaultComponent, Attach=m_RootComp)
    UArrowComponent m_ArrowComponent;
    UPROPERTY(DefaultComponent, Attach=m_RootComp)
    UTextRenderComponent m_TextRender;

    UPROPERTY(EditAnywhere, BlueprintReadWrite)
    AMinionSpot_XardasSleeper m_MinionSpot0;
    UPROPERTY(EditAnywhere, BlueprintReadWrite)
    AMinionSpot_XardasSleeper m_MinionSpot1;
    UPROPERTY(EditAnywhere, BlueprintReadWrite)
    AMinionSpot_XardasSleeper m_MinionSpot2;
    UPROPERTY(EditAnywhere, BlueprintReadWrite)
    AMinionSpot_XardasSleeper m_MinionSpot3;
    UPROPERTY(EditAnywhere, BlueprintReadWrite)
    AMinionSpot_XardasSleeper m_MinionSpot4;

    UPROPERTY()
    TArray<TSubclassOf<UXardasSleeperSkeletonSpawningConfig>> m_SkeletonSpawningConfigs;
    default m_SkeletonSpawningConfigs.Add(UXardasSleeperSkeletonSpawningConfig_00::StaticClass());
    default m_SkeletonSpawningConfigs.Add(UXardasSleeperSkeletonSpawningConfig_01::StaticClass());
    default m_SkeletonSpawningConfigs.Add(UXardasSleeperSkeletonSpawningConfig_02::StaticClass());
    default m_SkeletonSpawningConfigs.Add(UXardasSleeperSkeletonSpawningConfig_03::StaticClass());
    default m_SkeletonSpawningConfigs.Add(UXardasSleeperSkeletonSpawningConfig_04::StaticClass());

    UPROPERTY()
    TArray<TSubclassOf<UXardasSleeperSkeletonSpawningConfig>> m_CurrentSkeletonSpawningConfigs;

    TArray<TSubclassOf<USpawnAIAgentDefinition>> m_DefaultSpawningConfig;
    default m_DefaultSpawningConfig.Add(USpawnAIAgentDefinition_Skeleton_Xardas_Sleeper::StaticClass());
    default m_DefaultSpawningConfig.Add(USpawnAIAgentDefinition_Scout_Skeleton_Xardas_Sleeper::StaticClass());
    default m_DefaultSpawningConfig.Add(USpawnAIAgentDefinition_Warrior_Skeleton_Xardas_Sleeper::StaticClass());


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
        if(m_ArrowComponent != nullptr)
        {
            m_ArrowComponent.SetWorldRotation(FRotator(90, 0, 0));
            m_ArrowComponent.SetHiddenInGame(true);
        }      
    }

    UFUNCTION(BlueprintOverride)
    void BeginPlay()
    {
        m_MinionsNpcStateSpawned.Empty();
        CheckErrors();
        m_CurrentSkeletonSpawningConfigs = m_SkeletonSpawningConfigs;

        m_MinionSpot0.InitializeMinionSpot(GetSpawningConfig());
        m_MinionSpot1.InitializeMinionSpot(GetSpawningConfig());
        m_MinionSpot2.InitializeMinionSpot(GetSpawningConfig());
        m_MinionSpot3.InitializeMinionSpot(GetSpawningConfig());
        m_MinionSpot4.InitializeMinionSpot(GetSpawningConfig());
    }

    FMinionSpotSpawningConfigData GetSpawningConfig()
    {
        if(m_CurrentSkeletonSpawningConfigs.IsEmpty())
        {
            return RandomSpawningConfig();
        }
        m_CurrentSkeletonSpawningConfigs.Shuffle();
        auto selectedConfig = m_CurrentSkeletonSpawningConfigs[0].GetDefaultObject();
        FMinionSpotSpawningConfigData config = FMinionSpotSpawningConfigData();
        config.m_CenterMinionClass = selectedConfig.m_CenterMinionClass;
        config.m_LeftMinionClass = selectedConfig.m_LeftMinionClass;
        config.m_RightMinionClass = selectedConfig.m_RightMinionClass;

        m_CurrentSkeletonSpawningConfigs.RemoveAt(0);
        if(!IsValidConfig(config))
            return RandomSpawningConfig();
        return config;
    }


    bool IsValidConfig(FMinionSpotSpawningConfigData SpawningConfig)
    {
        return SpawningConfig.m_CenterMinionClass != nullptr && SpawningConfig.m_LeftMinionClass != nullptr && SpawningConfig.m_RightMinionClass != nullptr;
    }

    FMinionSpotSpawningConfigData RandomSpawningConfig()
    {
        FMinionSpotSpawningConfigData config = FMinionSpotSpawningConfigData();
        m_DefaultSpawningConfig.Shuffle();
        config.m_CenterMinionClass = m_DefaultSpawningConfig[0];
        config.m_LeftMinionClass = m_DefaultSpawningConfig[1];
        config.m_RightMinionClass = m_DefaultSpawningConfig[2];
        return config;
    }

    void CheckErrors()
    {
        CheckSpot(m_MinionSpot0, n"m_MinionSpot0");
        CheckSpot(m_MinionSpot1, n"m_MinionSpot1");
        CheckSpot(m_MinionSpot2, n"m_MinionSpot2");
        CheckSpot(m_MinionSpot3, n"m_MinionSpot3");
        CheckSpot(m_MinionSpot4, n"m_MinionSpot4");
    }

    void CheckSpot(AMinionSpot_XardasSleeper m_MinionSpot, FName ErrorText)
    {
        if(m_MinionSpot == nullptr)
        {
            FString text = FString(ErrorText);
            text.Append(FString(" is empty AMinionSpotManager"));
            text.Append(FString(GetName()));
            PrintError(text, 50.f);
        }
    }

    void AddSpawnedMinion(AGothicNPCState MinionNpcState)
    {
        m_MinionsNpcStateSpawned.Add(MinionNpcState);
    }

    int GetSpawnPoseIndex(AGothicNPCState MinionNpcState)
    {
        if(m_MinionsNpcStateSpawned.Contains(MinionNpcState))
            return m_MinionsNpcStateSpawned.FindIndex(MinionNpcState);
        return 0;
    }
}

USTRUCT()
struct FMinionSpotSpawningConfigData
{
	UPROPERTY()
    TSubclassOf<USpawnAIAgentDefinition> m_LeftMinionClass;
    UPROPERTY()
    TSubclassOf<USpawnAIAgentDefinition> m_CenterMinionClass;
    UPROPERTY()
    TSubclassOf<USpawnAIAgentDefinition> m_RightMinionClass;
}

class UXardasSleeperSkeletonSpawningConfig : UGothicBaseConfig
{
    UPROPERTY()
    TSubclassOf<USpawnAIAgentDefinition> m_LeftMinionClass;
    UPROPERTY()
    TSubclassOf<USpawnAIAgentDefinition> m_CenterMinionClass;
    UPROPERTY()
    TSubclassOf<USpawnAIAgentDefinition> m_RightMinionClass;
}

class UXardasSleeperSkeletonSpawningConfig_00 : UXardasSleeperSkeletonSpawningConfig
{
    default m_LeftMinionClass =  USpawnAIAgentDefinition_Skeleton_Xardas_Sleeper::StaticClass();
    default m_CenterMinionClass =  USpawnAIAgentDefinition_Scout_Skeleton_Xardas_Sleeper::StaticClass();
    default m_RightMinionClass =  USpawnAIAgentDefinition_Warrior_Skeleton_Xardas_Sleeper::StaticClass();
}

class UXardasSleeperSkeletonSpawningConfig_01 : UXardasSleeperSkeletonSpawningConfig
{
    default m_LeftMinionClass =  USpawnAIAgentDefinition_Scout_Skeleton_Xardas_Sleeper::StaticClass();
    default m_CenterMinionClass =  USpawnAIAgentDefinition_Warrior_Skeleton_Xardas_Sleeper::StaticClass();
    default m_RightMinionClass =  USpawnAIAgentDefinition_Scout_Skeleton_Xardas_Sleeper::StaticClass();
}
class UXardasSleeperSkeletonSpawningConfig_02 : UXardasSleeperSkeletonSpawningConfig
{
    default m_LeftMinionClass =  USpawnAIAgentDefinition_Skeleton_Xardas_Sleeper::StaticClass();
    default m_CenterMinionClass =  USpawnAIAgentDefinition_Warrior_Skeleton_Xardas_Sleeper::StaticClass();
    default m_RightMinionClass =  USpawnAIAgentDefinition_Skeleton_Xardas_Sleeper::StaticClass();
}

class UXardasSleeperSkeletonSpawningConfig_03 : UXardasSleeperSkeletonSpawningConfig
{
    default m_LeftMinionClass =  USpawnAIAgentDefinition_Warrior_Skeleton_Xardas_Sleeper::StaticClass();
    default m_CenterMinionClass =  USpawnAIAgentDefinition_Scout_Skeleton_Xardas_Sleeper::StaticClass();
    default m_RightMinionClass =  USpawnAIAgentDefinition_Warrior_Skeleton_Xardas_Sleeper::StaticClass();
}

class UXardasSleeperSkeletonSpawningConfig_04 : UXardasSleeperSkeletonSpawningConfig
{
    default m_LeftMinionClass =  USpawnAIAgentDefinition_Skeleton_Xardas_Sleeper::StaticClass();
    default m_CenterMinionClass =  USpawnAIAgentDefinition_Scout_Skeleton_Xardas_Sleeper::StaticClass();
    default m_RightMinionClass =  USpawnAIAgentDefinition_Skeleton_Xardas_Sleeper::StaticClass();
}


