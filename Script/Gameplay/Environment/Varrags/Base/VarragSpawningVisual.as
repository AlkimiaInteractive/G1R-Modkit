UCLASS()
class AVarragSpawningVisual : ASummonCreatureVisualEffect
{
    UPROPERTY()
    FName m_VarragKey = n"";

    // UPROPERTY(DefaultComponent, RootComponent)
    // USceneComponent m_Root;

    UPROPERTY(DefaultComponent, Attach=m_RootComp)
    UArrowComponent m_ArrowComponent;
    UPROPERTY(DefaultComponent, Attach=m_RootComp)
    UTextRenderComponent m_TextRender;


    UPROPERTY(DefaultComponent, Attach=m_RootComp)
    USceneComponent m_GravestoneRoot;
    
    UPROPERTY(DefaultComponent, Replicated, Attach=m_GravestoneRoot)
    USkeletalMeshComponent m_GravestoneSkeletalMesh;

    default m_GravestoneSkeletalMesh.AnimationData.bSavedLooping = false;
    default m_GravestoneSkeletalMesh.AnimationData.bSavedPlaying = false;

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

    // default bNeverApplyTickOptimizations = true;

    // default bReplicates = true;
    // default bAlwaysRelevant = true;

    UPROPERTY(NotVisible)
    FName m_SaveGameKey = n"";

    UPROPERTY(Replicated, ReplicatedUsing = OnRep_ReplicatedActive)
    bool m_Active = false;

    
    UPROPERTY(Replicated, ReplicatedUsing = OnRep_ReplicatedFinalPose)
    bool m_FinalPose = false;

    

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
        bool bLoaded = AG1RGameState::GetWorldFloatData(World, m_SaveGameKey, savedState);
        if(bLoaded)
        {
            if(savedState > 0.9f)
            {
                m_FinalPose = true;
                SetFinalPose();
            }
               
        }
    }

    void PlayMontage() override
    {
        
        if(GetLocalRole() == ENetRole::ROLE_Authority)
            AG1RGameState::SaveWorldFloatData(GetWorld(), m_SaveGameKey, 1);
        m_Active = true;
        m_GravestoneSkeletalMesh.Play(false);

    }


    UFUNCTION()
    void SetFinalPose()
    {
        m_GravestoneSkeletalMesh.SetPosition(m_GravestoneSkeletalMesh.AnimationData.AnimToPlay.GetPlayLength(), false);
    }

    // UFUNCTION(BlueprintOverride)
    // void Tick(float DeltaSeconds)
    // {
    //     if(m_Active && GetLocalRole() != ENetRole::ROLE_Authority)
    //         Print("Active", DeltaSeconds);
    // }
}
