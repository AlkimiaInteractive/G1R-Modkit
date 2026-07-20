class ASleeperDreamMineDestroyableWall : AGothicGASActor
{
    default bReplicates = true;

    default bNeverApplyTickOptimizations = true;

    default bAlwaysRelevant = true;

    UPROPERTY(DefaultComponent, RootComponent)
	USceneComponent m_RootComp;

    UPROPERTY(NotVisible, NotEditable)
    FName m_SaveKey = n"SleeperDream_Mine_DestroyableWall_Destroyed";

    UPROPERTY(DefaultComponent, Attach=m_RootComp)
    UArrowComponent m_ArrowComponent;
    UPROPERTY(DefaultComponent, Attach=m_RootComp)
    UTextRenderComponent m_TextRender;


    UPROPERTY(DefaultComponent, Attach=m_RootComp)
    USceneComponent m_WallRoot;
    
    UPROPERTY(DefaultComponent, Replicated, Attach=m_WallRoot)
    USkeletalMeshComponent m_WallSkeletalMesh;

    default m_WallSkeletalMesh.AnimationData.bSavedLooping = false;
    default m_WallSkeletalMesh.AnimationData.bSavedPlaying = false;

    UPROPERTY(Replicated, ReplicatedUsing = OnRep_ReplicatedActive)
    bool m_Active = false;

    
    UPROPERTY(Replicated, ReplicatedUsing = OnRep_ReplicatedFinalPose)
    bool m_FinalPose = false;

    UPROPERTY(BlueprintReadOnly, VisibleAnywhere)
    FName m_MessagePayloadKey = n"OnMudSleeperDeath";


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



    UFUNCTION()
    void OnRep_ReplicatedActive()
    {
        if(m_Active)
            PlayMontage();
    }

    UFUNCTION()
    void OnRep_ReplicatedFinalPose()
    {
        if(m_FinalPose)
            SetFinalPose();
    }


    UFUNCTION(BlueprintOverride)
    void BeginPlay()
    {
        if(GetLocalRole() != ENetRole::ROLE_Authority)
        {
            if(m_FinalPose)
                SetFinalPose();
            return;
        }
            
        float32 savedState = 0.0f;
        bool bLoaded = AG1RGameState::GetWorldFloatData(World, m_SaveKey, savedState);
        if(bLoaded)
        {
            if(savedState > 0.9f)
            {
                m_FinalPose = true;
                SetFinalPose();
                return;
            } 
        }

        RegisterToGlobalEventSystem();
    }

    UFUNCTION(BlueprintEvent)
    void RegisterToGlobalEventSystem()
    {

    }

    UFUNCTION(BlueprintEvent, NetMulticast)
    void DeactivateCollisions()
    {

    }

    UFUNCTION(BlueprintCallable)
    void PlayMontage() 
    {
        
        if(GetLocalRole() == ENetRole::ROLE_Authority)
            AG1RGameState::SaveWorldFloatData(GetWorld(), m_SaveKey, 1);
        m_Active = true;
        m_WallSkeletalMesh.Play(false);
        
        DeactivateCollisions();
    }


    UFUNCTION()
    void SetFinalPose()
    {
        m_WallSkeletalMesh.SetPosition(m_WallSkeletalMesh.AnimationData.AnimToPlay.GetPlayLength(), false);
        DeactivateCollisions();
    }

    // UFUNCTION(BlueprintOverride)
    // void Tick(float DeltaSeconds)
    // {
    //     if(m_Active && GetLocalRole() != ENetRole::ROLE_Authority)
    //         Print("Active", DeltaSeconds);
    // }

    UFUNCTION(BlueprintCallable, CallInEditor, meta = (DisplayName = "Play"))
	void PLAYFORDEBUG()
    {
        auto world = GetWorld();
        if(world == nullptr)
            return;
        if(!world.IsGameWorld())
            return;
        m_WallSkeletalMesh.SetPosition(0, false);
        PlayMontage();

    }

	UFUNCTION(BlueprintCallable, CallInEditor, meta = (DisplayName = "Restart"))
	void RESTARTFORDEBUG()
    {
        auto world = GetWorld();
        if(world == nullptr)
            return;
        if(!world.IsGameWorld())
            return;

        m_WallSkeletalMesh.SetPosition(0, false);
    }
}
