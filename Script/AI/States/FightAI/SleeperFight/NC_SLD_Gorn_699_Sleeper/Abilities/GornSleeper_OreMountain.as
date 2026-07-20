UCLASS()
class AGornSleeper_OreMountain : ACapsuleCollisionShapeVisual
{
    UPROPERTY(DefaultComponent, Attach=m_RootComp)
    UArrowComponent m_ArrowComponent;
    UPROPERTY(DefaultComponent, Attach=m_RootComp)
    UTextRenderComponent m_TextRender;

    UPROPERTY(DefaultComponent, Attach=m_RootComp)
    USceneComponent m_RayEndLocation;
    UPROPERTY(DefaultComponent, NotVisible, Attach=m_RayEndLocation)
    UArrowComponent m_OreMountainPeak;

    UPROPERTY()
    UElectrifiedArena_GornSleeper m_def;

    default m_CollisionComp.m_WeaponData = UElectrifiedArena_GornSleeper::StaticClass();

    default m_StackCountToRemove = 1;

    UPROPERTY()
    FGothicFXInstanceHandle m_SFXHandle;
    UPROPERTY()
    FGameplayTag m_SFXTag = GameplayTag::FX_Environment_SleeperDream_Gorn_Electrified_OreMountain_Loop;

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
        if(m_OreMountainPeak != nullptr)
        {
            m_OreMountainPeak.SetArrowLength(40.f);
            m_OreMountainPeak.SetWorldRotation(FRotator(-90, 0, 0));
            m_OreMountainPeak.SetRelativeLocation(FVector(0,0,m_OreMountainPeak.ArrowLength));
            m_OreMountainPeak.SetHiddenInGame(true);
            m_OreMountainPeak.SetArrowColor(FLinearColor::Black);
        }
    }


    UFUNCTION(BlueprintCallable)
    void ResetEffect()
    {
        Initialize();
    }

    UFUNCTION(BlueprintOverride, meta=(NoSuperCall))
    void BeginPlay()
    {
        // FVector floorLocation;
        // FVector normal;
        // MagicScript::FindFloorAtLocation(GetActorLocation(), floorLocation, normal, this, ECollisionChannel::IKTrace, m_MinFloorHeight, m_MaxFloorHeight);
        // SetActorLocation(floorLocation);
    }

    UFUNCTION(BlueprintOverride)
    void Initialize()
    {
        Super::Initialize();
        m_CollisionComp.AddCustomCollisionResponse(ECollisionChannel::ECC_WorldStatic, ECollisionResponse::ECR_Ignore);
        m_CollisionComp.AddCustomCollisionResponse(ECollisionChannel::ECC_WorldDynamic, ECollisionResponse::ECR_Ignore);
        m_CollisionComp.AddCustomCollisionResponse(ECollisionChannel::Hurt, ECollisionResponse::ECR_Ignore);
        //m_CollisionComp.AddCustomCollisionResponse(ECollisionChannel::mesh, ECollisionResponse::ECR_Overlap);
        //@DE - Need collide with the mesh not the hurt box
        m_CollisionComp.SetCollisionProfileName(n"OverlapAllDynamic");
        //ShowVisuals();
        PlaySFX();
    }

    void PlaySFX()
    {
        m_SFXHandle = FXComponent.PlayEffect(m_SFXTag, nullptr);
    }

    void StopSFX()
    {
        FXComponent.StopFXInstance(m_SFXHandle, true);
    }

    // UFUNCTION(BlueprintCallable)
    // void ShowVisuals()
    // {
    //     if(m_ElectrifiedAreaVisualManager != nullptr)
    //     {
    //         m_ElectrifiedAreaVisualManager.DeactivateActivateCellWarning(m_PlacementId);
    //         m_ElectrifiedAreaVisualManager.ActivateCell(m_PlacementId);
    //     }
            
    // }

    bool SetUpCollisionShape() override
    {
        m_def = Cast<UElectrifiedArena_GornSleeper>(GetWeaponDefinition());
        if(m_def != nullptr)
        {
            //SetActorLocation(FindFloorLocation(GetActorLocation()));
            m_CollisionComp.SetHiddenInGame(true);
            SetColliderState(EHitColliderState::Damage);
            //m_IsActive = true;
            //m_CollisionComp.SetHiddenInGame(false, true);
            return true;
        }
        return false;
    }

    void Deactivate()
    {
        SetColliderState(EHitColliderState::None);
        StopSFX();
    }

    FGameplayTag GetAttackType() override
    {
        return GameplayTag::Combat_HitType_Dot;
    }


    bool NeedCheckVisibility() override
    {
        return false;
    }

}