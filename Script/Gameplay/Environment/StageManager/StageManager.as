UCLASS()
class AStageManager : AConcertStageManager
{

    UPROPERTY(DefaultComponent, RootComponent)
	USceneComponent m_RootComp;
    UPROPERTY(DefaultComponent, Attach=m_RootComp)
    UArrowComponent m_ArrowComponent;
    UPROPERTY(DefaultComponent, Attach=m_RootComp)
    UTextRenderComponent m_TextRender;

    UPROPERTY(BlueprintReadOnly, VisibleAnywhere)
    FName m_MessagePayloadKey = n"OnGomezInExtremoSpeechEnd";

    // UPROPERTY(BlueprintReadWrite, EditAnywhere)
    // TArray<AStageBarrierVisual> m_StageBarriers;

    UPROPERTY(BlueprintReadWrite, EditAnywhere)
    TArray<TSoftObjectPtr<AStageBarrierVisual>> m_StageBarriers;

    UPROPERTY(BlueprintReadWrite, EditAnywhere)
    TArray<TSoftObjectPtr<ACinematicCharacter>> m_CinematicCharacters;

    UPROPERTY(BlueprintReadWrite, EditAnywhere)
    TSoftObjectPtr<AInExtremoBanner> m_InExtremoBanner;

    default m_MaxUnsyncFrames = 10;
    default m_IsAudioTrackSyncEnabled = true;

    default m_SFXTag = GameplayTag::FX_Environment_InExtremo_Concert;

    UPROPERTY()
    TArray<TSoftObjectPtr<AStagePropVisual>> m_FenceActors;

    default bNeverApplyTickOptimizations = true;


    UFUNCTION(BlueprintOverride)
    void ConstructionScript()
    {
        if(m_TextRender != nullptr)
        {
            m_TextRender.SetRelativeLocation(FVector(0,0,100));       
            m_TextRender.SetText(FText::AsCultureInvariant(FString(GetName())));
            m_TextRender.SetTextRenderColor(FColor::Red);
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
        RegisterToGlobalEventSystem();
    }

    UFUNCTION(BlueprintEvent)
    void RegisterToGlobalEventSystem()
    {

    }

    
    UFUNCTION(BlueprintOverride)
    void OnSequenceFinished_Scriptable()
    {
        HideFenceActors();
        DeactivateAllStageBarriers();
        TArray<AActor> outActors;
        GetAllActorsOfClass(AStageWallDoor::StaticClass(), outActors);
        for(auto actor : outActors)
        {
            auto stageWallDoor = Cast<AStageWallDoor>(actor);
            if(stageWallDoor != nullptr)
                stageWallDoor.InExtremoEnd();
        }

        for(auto cinematicChar : m_CinematicCharacters)
        {
            auto character = cinematicChar.Get();
            if(IsValid(character))
            {
                auto propComp = UInExtremoPropComponent::Get(character);
                if(propComp != nullptr)
                    propComp.OnPerformaceCompleted();
            }
        }
        EnsureSpawnIEActors();
        auto bannerActor = m_InExtremoBanner.Get();
        if(IsValid(bannerActor))
            bannerActor.SetFinalPose();

        ForceSaveSequenceFinished();

        SetActorTickEnabled(false);

        
        System::SetTimerDelegate(FTimerDynamicDelegate(this, n"DoDestroy"), 5.f, false);
    }

    void EnsureSpawnIEActors()
    {
        UWorldPointManager::Get().CallGlobalEvent(n"OnIE_VanLangeSpawn");
        UWorldPointManager::Get().CallGlobalEvent(n"OnIE_UnicornSpawn");
        UWorldPointManager::Get().CallGlobalEvent(n"OnIE_SpeckiSpawn");
        UWorldPointManager::Get().CallGlobalEvent(n"OnIE_LutterSpawn");
        UWorldPointManager::Get().CallGlobalEvent(n"OnIE_FlexSpawn");
        UWorldPointManager::Get().CallGlobalEvent(n"OnIE_DRPymonteSpawn");

    }

    UFUNCTION()
    void DoDestroy()
    {
        for(auto actorPtr : m_FenceActors)
        {
            auto fenceActor = actorPtr.Get();
            if(IsValid(fenceActor))
            {
                fenceActor.DoDestroy();
            }
        }
        for(auto stageBarrier : m_StageBarriers)
        {   
            auto barrier = stageBarrier.Get();
            if(IsValid(barrier))
                barrier.DoDestroy();
        }

        for(auto cinematicChar : m_CinematicCharacters)
        {
            auto character = cinematicChar.Get();
            if(IsValid(character))
            {
                auto propComp = UInExtremoPropComponent::Get(character);
                if(propComp != nullptr)
                    propComp.DoDestroy();
            }
        }
    }


    void HideFenceActors()
    {
        for(auto actorPtr : m_FenceActors)
        {
            auto fenceActor = actorPtr.Get();
            if(IsValid(fenceActor))
            {
                fenceActor.SetActorHiddenInGame(true);
                fenceActor.SetActorEnableCollision(false);
            }
        }
    }

    UFUNCTION(BlueprintCallable)
    void UnfoldBanner()
    {
        auto bannerActor = m_InExtremoBanner.Get();
        if(IsValid(bannerActor))
            bannerActor.PlayMontage();
    }

    UFUNCTION(BlueprintCallable)
    void ActivateCrowd()
    {
#ifdef WITH_STORY_G1R
    G1R::UStoryG1R::Get().InExtremoConcertBegin();
#endif
    }

        
    UFUNCTION(BlueprintCallable)
    void DeactivateCrowd()
    {
#ifdef WITH_STORY_G1R
        G1R::UStoryG1R::Get().InExtremoConcertEnd();
#endif
    }
    

    void DeactivateAllStageBarriers()
    {
        for(auto stageBarrier : m_StageBarriers)
        {   
            auto barrier = stageBarrier.Get();
            if(IsValid(barrier))
                barrier.DeactivateBarrier();
        }
    }

    UFUNCTION(BlueprintCallable)
    void StartConcert()
    {
        Play();
    }


    //@DE - Story function called when changes between chapters. Player can skip the concert, so we can set the logic properly.
    UFUNCTION(BlueprintCallable)
    void InExtremoEnd()
    {
        OnSequenceFinished();
    }

    UFUNCTION(BlueprintOverride)
    void ResetAll_Scriptable()
    {
        for(auto stageBarrier : m_StageBarriers)
        {
            auto barrier = stageBarrier.Get();
            if(IsValid(barrier))
                barrier.ResetAll();
        }
        TArray<AActor> outActors;
        GetAllActorsOfClass(AStageWallDoor::StaticClass(), outActors);
        for(auto actor : outActors)
        {
            auto stageWallDoor = Cast<AStageWallDoor>(actor);
            if(stageWallDoor != nullptr)
                stageWallDoor.ResetAll();
        }

        for(auto cinematicChar : m_CinematicCharacters)
        {
            auto character = cinematicChar.Get();
            if(IsValid(character))
            {
                auto propComp = UInExtremoPropComponent::Get(character);
                if(propComp != nullptr)
                    propComp.OnPerformaceCompleted();
            }
        }

        auto bannerActor = m_InExtremoBanner.Get();
        if(IsValid(bannerActor))
            bannerActor.ResetAll();
    }

}