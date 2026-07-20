UCLASS()
class AStageWallDoor : AActor
{
    UPROPERTY(DefaultComponent, RootComponent)
    USceneComponent m_RootComp;

    UPROPERTY(DefaultComponent, Attach=m_RootComp)
    USkeletalMeshComponent m_StageWallDoor;

    UPROPERTY(DefaultComponent, Attach=m_RootComp)
    UArrowComponent m_ArrowComponent;
    UPROPERTY(DefaultComponent, Attach=m_RootComp)
    UTextRenderComponent m_TextRender;

    UPROPERTY(NotVisible, NotEditable)
    FName m_SaveKey = n"StageWallDoorClosed";
    UPROPERTY(BlueprintReadOnly, VisibleAnywhere)
    FName m_MessagePayloadKey = n"OnCloseStageDoor";

    UPROPERTY(NotVisible, NotEditable)
    FName m_SaveGameKey_Concert_Completed = n"InExtremo_Concert_Completed";

    UPROPERTY(Replicated, ReplicatedUsing = OnRep_ReplicatedFinalPose)
    bool m_FinalPose = false;
    UPROPERTY(Replicated, ReplicatedUsing = OnRep_ReplicatedActive)
    bool m_Active = false;

    default bNeverApplyTickOptimizations = true;

    UFUNCTION(BlueprintOverride)
    void ConstructionScript()
    {
        if(m_TextRender != nullptr)
        {
            m_TextRender.SetWorldLocation(GetActorLocation()+ FVector(0,0,100));       
            m_TextRender.SetText(FText::AsCultureInvariant(FString(GetName())));
            m_TextRender.SetTextRenderColor(FColor::Red);
            m_TextRender.SetHorizontalAlignment(EHorizTextAligment::EHTA_Center);
            m_TextRender.SetVerticalAlignment(EVerticalTextAligment::EVRTA_TextCenter);
            m_TextRender.SetHiddenInGame(true);
            m_TextRender.SetWorldScale3D(FVector(1,1,1));
        }
        if(m_ArrowComponent != nullptr)
        {
            m_ArrowComponent.SetWorldRotation(FRotator(90, 0, 0));
            m_ArrowComponent.SetHiddenInGame(true);
            m_ArrowComponent.SetWorldScale3D(FVector(1,1,1));
        }            
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

        bLoaded = AG1RGameState::GetWorldFloatData(World, m_SaveGameKey_Concert_Completed, savedState);
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


    UFUNCTION(BlueprintEvent)
    void RegisterToGlobalEventSystem()
    {

    }

    UFUNCTION(BlueprintCallable)
    void PlayMontage() 
    {
        
        if(GetLocalRole() == ENetRole::ROLE_Authority)
            AG1RGameState::SaveWorldFloatData(GetWorld(), m_SaveKey, 1);
        m_Active = true;
        m_StageWallDoor.Play(false);
    }

    UFUNCTION()
    void SetFinalPose()
    {
        m_StageWallDoor.SetPosition(m_StageWallDoor.AnimationData.AnimToPlay.GetPlayLength(), false);
    }

    void InExtremoEnd()
    {
        if(GetLocalRole() == ENetRole::ROLE_Authority)
            AG1RGameState::SaveWorldFloatData(GetWorld(), m_SaveKey, 1);
        SetFinalPose();
    }

    void ResetAll()
    {
        if(GetLocalRole() == ENetRole::ROLE_Authority)
            AG1RGameState::SaveWorldFloatData(GetWorld(), m_SaveKey, 0);
        m_StageWallDoor.SetPosition(0, false);
    }
}