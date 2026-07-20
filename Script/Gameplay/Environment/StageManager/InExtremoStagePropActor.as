UCLASS()
class AStagePropVisual : AActor
{
    UPROPERTY(DefaultComponent, RootComponent)
	USceneComponent m_RootComp;
    UPROPERTY(DefaultComponent, Attach=m_RootComp)
    UArrowComponent m_ArrowComponent;
    UPROPERTY(DefaultComponent, Attach=m_RootComp)
    UTextRenderComponent m_TextRender;

    UPROPERTY(DefaultComponent, Attach=m_RootComp)
    UStaticMeshComponent m_Mesh;

    UPROPERTY(NotVisible, NotEditable)
    FName m_SaveGameKey_Concert_Completed = n"InExtremo_Concert_Completed";
    UPROPERTY(Replicated, ReplicatedUsing = OnRep_ReplicatedFinalPose)
    bool m_FinalPose = false;


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
    UFUNCTION()
    void OnRep_ReplicatedFinalPose()
    {
        if(m_FinalPose)
            SetFinalPose();
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
        bool bLoaded = AG1RGameState::GetWorldFloatData(World, m_SaveGameKey_Concert_Completed, savedState);
        if(bLoaded)
        {
            if(savedState > 0.9f)
            {
                m_FinalPose = true;
                SetFinalPose();
                return;
            } 
        }
    }

    
    UFUNCTION()
    void SetFinalPose()
    {
        SetActorHiddenInGame(true);
        SetActorEnableCollision(false);
    }

    UFUNCTION()
    void DoDestroy()
    {
        DestroyActor();
    }

}