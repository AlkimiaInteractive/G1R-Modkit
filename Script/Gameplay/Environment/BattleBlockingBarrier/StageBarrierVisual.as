UCLASS()
class AStageBarrierVisual : AActor
{
    UPROPERTY(DefaultComponent, RootComponent)
    USceneComponent m_RootComp;

    UPROPERTY(DefaultComponent, Attach=m_RootComp)
    UStaticMeshComponent m_BlockOnlyPawn;
    UPROPERTY(DefaultComponent, Attach=m_RootComp)
    UStaticMeshComponent m_BlockBarrier;

    UPROPERTY(DefaultComponent, Attach=m_RootComp)
    UArrowComponent m_ArrowComponent;
    UPROPERTY(DefaultComponent, Attach=m_RootComp)
    UTextRenderComponent m_TextRender;

    UPROPERTY(NotEditable, NotVisible)
    FName m_GomezUniqueName = n"OC_EBR_Gomez_100";

    UPROPERTY(NotVisible, NotEditable)
    FName m_SaveGameKey_Concert_Completed = n"InExtremo_Concert_Completed";

    default bNeverApplyTickOptimizations = true;

    UPROPERTY(Replicated, ReplicatedUsing = OnRep_ReplicatedFinalPose)
    bool m_FinalPose = false;

    UPROPERTY()
    private FTimerHandle TaskTimer;

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
        InitializeGomez();
    }

    UFUNCTION()
    void InitializeGomez()
    {
        
        if(System::IsTimerActiveHandle(TaskTimer))
            System::ClearAndInvalidateTimerHandle(TaskTimer);
        if(FCharacterUniqueName(m_GomezUniqueName).NPCState == nullptr)
        {
            TaskTimer = System::SetTimerDelegate(FTimerDynamicDelegate(this, n"InitializeGomez"), 0.5f, false);
            return;
        }        
        auto character = FCharacterUniqueName(m_GomezUniqueName).NPCState.Character;
        if(character == nullptr)
        {
            TaskTimer = System::SetTimerDelegate(FTimerDynamicDelegate(this, n"InitializeGomez"), 0.5f, false);
            return;
        } 

        character.CapsuleComponent.IgnoreComponentWhenMoving(m_BlockBarrier, true);
        m_BlockBarrier.IgnoreComponentWhenMoving(character.CapsuleComponent, true);
        character.CapsuleComponent.IgnoreComponentWhenMoving(m_BlockOnlyPawn, true);
        m_BlockOnlyPawn.IgnoreComponentWhenMoving(character.CapsuleComponent, true);
    }

    UFUNCTION()
    void SetFinalPose()
    {
        DeactivateBarrier();
    }

    void DeactivateBarrier()
    {
        m_BlockBarrier.SetCollisionEnabled(ECollisionEnabled::NoCollision);
        m_BlockOnlyPawn.SetCollisionEnabled(ECollisionEnabled::NoCollision);
        m_BlockBarrier.SetHiddenInGame(true);
        m_BlockOnlyPawn.SetHiddenInGame(true);
    }

    UFUNCTION()
    void DoDestroy()
    {
        DestroyActor();
    }

    void ResetAll()
    {
        m_BlockBarrier.SetCollisionEnabled(ECollisionEnabled::QueryAndPhysics);
        m_BlockOnlyPawn.SetCollisionEnabled(ECollisionEnabled::QueryAndPhysics);
        m_BlockBarrier.SetHiddenInGame(false);
        m_BlockOnlyPawn.SetHiddenInGame(false);
    }
}