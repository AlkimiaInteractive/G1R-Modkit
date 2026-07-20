UCLASS()
class AInExtremoBanner : AActor
{
    UPROPERTY(DefaultComponent, RootComponent)
	USceneComponent m_RootComp;
    UPROPERTY(DefaultComponent, Attach=m_RootComp)
    UArrowComponent m_ArrowComponent;
    UPROPERTY(DefaultComponent, Attach=m_RootComp)
    UTextRenderComponent m_TextRender;

    UPROPERTY(DefaultComponent, Attach=m_RootComp)
    UStaticMeshComponent m_BannerMesh;

    UPROPERTY(NotVisible, NotEditable)
    FName m_SaveKey = n"StageBannerOpen";

    UPROPERTY(BlueprintReadWrite, EditAnywhere)
    UMaterialInstanceDynamic m_MID;

    UPROPERTY(DefaultComponent, Attach=m_RootComp)
    UGothicFXComponent m_FXComp;

    UPROPERTY(Replicated, ReplicatedUsing = OnRep_ReplicatedFinalPose)
    bool m_FinalPose = false;
    UPROPERTY(Replicated, ReplicatedUsing = OnRep_ReplicatedActive)
    bool m_Active = false;

    UPROPERTY()
    FName m_ScalarParameterKey = n"Banner Frame";

    UPROPERTY()
    float m_AccumulatedTime = 0.f;

    UPROPERTY(BlueprintReadWrite, EditAnywhere)
    float m_MaxSpeed = 0.8f;

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
        SetActorTickEnabled(false);

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
        CreateMID();
        SetInitialPosition();
    }

    void CreateMID()
    {
        m_MID = m_BannerMesh.CreateDynamicMaterialInstance(0, m_BannerMesh.GetMaterial(0));
    }

    void SetInitialPosition()
    {
        m_AccumulatedTime = 0.f;
        m_MID.SetScalarParameterValue(m_ScalarParameterKey, m_AccumulatedTime);
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


    // UFUNCTION(BlueprintEvent)
    // void RegisterToGlobalEventSystem()
    // {

    // }

    UFUNCTION(BlueprintOverride)
    void Tick(float DeltaSeconds)
    {
        UpdateBannerPosition(DeltaSeconds);
    }

    void UpdateBannerPosition(float DeltaSeconds)
    {
        if(m_MID == nullptr)
            return;
        m_AccumulatedTime = m_AccumulatedTime + DeltaSeconds * m_MaxSpeed;
        float progression = Math::Lerp(0, 1, m_AccumulatedTime);
        m_MID.SetScalarParameterValue(m_ScalarParameterKey, progression);
        if(progression >= 1)
        {
            SetActorTickEnabled(false);
            m_MID.SetScalarParameterValue(m_ScalarParameterKey, 1.f);
        }
    }

    UFUNCTION(BlueprintCallable)
    void PlayMontage() 
    {
        
        if(GetLocalRole() == ENetRole::ROLE_Authority)
            AG1RGameState::SaveWorldFloatData(GetWorld(), m_SaveKey, 1);
        m_Active = true;
        m_FXComp.PlayEffect(GameplayTag::FX_Environment_OBJ_InExtremo_Banner_Unfold, nullptr);
        SetActorTickEnabled(true);
        ActivateDust();
    }

    UFUNCTION(BlueprintEvent)
    void ActivateDust()
    {

    }


    UFUNCTION()
    void SetFinalPose()
    {
        //m_StageWallDoor.SetPosition(m_StageWallDoor.AnimationData.AnimToPlay.GetPlayLength(), false);
    }

    void InExtremoEnd()
    {
        if(GetLocalRole() == ENetRole::ROLE_Authority)
            AG1RGameState::SaveWorldFloatData(GetWorld(), m_SaveKey, 1);
        SetFinalPose();
    }

    UFUNCTION()
    void ResetAll()
    {
        if(GetLocalRole() == ENetRole::ROLE_Authority)
            AG1RGameState::SaveWorldFloatData(GetWorld(), m_SaveKey, 0);
        SetInitialPosition();
    }
}