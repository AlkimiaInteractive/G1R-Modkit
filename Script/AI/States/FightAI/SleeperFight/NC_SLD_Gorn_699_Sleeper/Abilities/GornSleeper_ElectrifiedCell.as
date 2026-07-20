UCLASS()
class AGornSleeper_ElectrifiedCell : ABoxCollisionShapeVisual
{
    UPROPERTY(DefaultComponent, Attach=m_RootComp)
    UArrowComponent m_ArrowComponent;
    UPROPERTY(DefaultComponent, Attach=m_RootComp)
    UTextRenderComponent m_TextRender;

    UPROPERTY(DefaultComponent, Attach =m_RootComp, EditAnywhere, VisibleAnywhere)
	UNiagaraComponent m_RayToOreMountain;

    UPROPERTY(EditAnywhere, BlueprintReadWrite)
	float m_MinFloorHeight = -200.f;
	UPROPERTY(EditAnywhere, BlueprintReadWrite)
	float m_MaxFloorHeight = 50.f;

    UPROPERTY()
    bool m_IsActive = false;

    UPROPERTY()
    int m_PlacementId = 0;

    default m_StackCountToRemove = 1;

    UPROPERTY()
    AGornSleeper_ElectrifiedAreaVisualManager m_ElectrifiedAreaVisualManager;

    UPROPERTY()
    AGornSleeper_ElectrifiedArea m_ElectrifiedArea;

    UPROPERTY(BlueprintReadWrite, EditAnywhere)
    AGornSleeper_OreMountain m_OreMountain;

    UPROPERTY(EditAnywhere, BlueprintReadWrite)
    ARegionVolume m_DetectionRegionVolume;

    UPROPERTY(NotVisible)
    URegionTrait_GornSleeperElectrifiedCell m_RegionTrait;

    UPROPERTY()
    FGothicFXInstanceHandle m_SFXHandle;
    UPROPERTY()
    FGameplayTag m_SFXTag = GameplayTag::FX_Environment_SleeperDream_Gorn_Electrified_Cell_Loop;

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

    UPROPERTY()
    UElectrifiedArena_GornSleeper m_def;

    default m_CollisionComp.m_WeaponData = UElectrifiedArena_GornSleeper::StaticClass();


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
        m_RegionTrait= GetRegionTrait();
        if(m_RegionTrait == nullptr)
        {
            FString text = FString("regionTrait is EMPTY on: ");
            text.Append(FString(GetOwner().GetName()));
            PrintError(text, 50.f);
            return;
        }

        Super::Initialize();
        // m_CollisionComp.AddCustomCollisionResponse(ECollisionChannel::ECC_WorldStatic, ECollisionResponse::ECR_Ignore);
        // m_CollisionComp.AddCustomCollisionResponse(ECollisionChannel::ECC_WorldDynamic, ECollisionResponse::ECR_Ignore);
        // m_CollisionComp.AddCustomCollisionResponse(ECollisionChannel::Hurt, ECollisionResponse::ECR_Ignore);
        // //m_CollisionComp.AddCustomCollisionResponse(ECollisionChannel::mesh, ECollisionResponse::ECR_Overlap);
        // //@DE - Need collide with the mesh not the hurt box
        // m_CollisionComp.SetCollisionProfileName(n"OverlapAllDynamic");
        
        m_RegionTrait.OnCharacterEnteringRegionDelegate.BindUFunction(this, n"OnCharacterEnteringRegionDelegate");
        m_RegionTrait.OnCharacterLeavingRegionDelegate.BindUFunction(this, n"OnCharacterLeavingRegionDelegate");

        m_OreMountain.Initialize();
        ShowVisuals();
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

    UFUNCTION(BlueprintCallable)
    void ShowVisuals()
    {
        if(m_ElectrifiedAreaVisualManager != nullptr)
        {
            m_ElectrifiedAreaVisualManager.DeactivateActivateCellWarning(m_PlacementId);
            m_ElectrifiedAreaVisualManager.ActivateCell(m_PlacementId);
        }
            
    }

    bool SetUpCollisionShape() override
    {
        m_def = Cast<UElectrifiedArena_GornSleeper>(GetWeaponDefinition());
        if(m_def != nullptr)
        {
            //SetActorLocation(FindFloorLocation(GetActorLocation()));
            //m_CollisionComp.SetHiddenInGame(true);
            //SetColliderState(EHitColliderState::Damage);
            m_RegionTrait.m_ShouldHandleCharacter = true;
            m_IsActive = true;
            return true;
        }
        return false;
    }

    void SetExtent(FVector Extent)
    {
        m_CollisionComp.SetBoxExtent(Extent);
        SetUpVisuals();
    }

    UFUNCTION(BlueprintEvent)
    void SetUpVisuals()
    {

    }

    bool IsActive()
    {
        return m_IsActive;
    }

    UFUNCTION(BlueprintCallable)
    void EnableVisualWarning()
    {
        if(m_ElectrifiedAreaVisualManager != nullptr)
            m_ElectrifiedAreaVisualManager.ActivateCellWarning(m_PlacementId);
    }


    UFUNCTION(BlueprintEvent)
    void DoDestroy()
    {
        
    }

    FGameplayTag GetAttackType() override
    {
        return GameplayTag::Combat_HitType_Dot;
    }

    FVector FindFloorLocation(FVector Location, ECollisionChannel CollisionChannel, float FloorMinHeight, float FloorMaxHeight)
    {
        FHitResult hit;
        MagicScript::FindFloorAtLocation(Location, hit, this, CollisionChannel, FloorMinHeight, FloorMaxHeight);
        return hit.ImpactPoint;
    }

    bool NeedCheckVisibility() override
    {
        return false;
    }

    void DeactivateCell()
    {
        SetColliderState(EHitColliderState::None);
        if(m_RegionTrait != nullptr)
        {
            m_RegionTrait.m_ShouldHandleCharacter = false;
            ForceRemoveDamage(m_RegionTrait.m_CharactersInRegionTrait);
        }
        m_IsActive = false;
        if(m_OreMountain != nullptr)
            m_OreMountain.Deactivate();
        if(m_ElectrifiedAreaVisualManager != nullptr)
            m_ElectrifiedAreaVisualManager.DeactivateActivateCellWarning(m_PlacementId);
        StopSFX();
    }


    void ForceRemoveDamage(TArray<AGothicCharacterState> CharactersInRegionTrait)
    {
        for(auto characterState : CharactersInRegionTrait)
        {
            if(IsValid(characterState))
            {
                OnCharacterLeavingRegionDelegate(characterState);
                characterState.AbilitySystemComponent.RemoveActiveGameplayEffectBySourceEffect(UElectrifiedArena_GornSleeper.GetDefaultObject().m_HitEffect, nullptr);
            }
        }
    }

    void SpawnRayOnCell(FVector OriginPosition)
    {
        auto endLocation =m_OreMountain.m_OreMountainPeak.GetWorldLocation();
        SpawnRayOnCellMulticast(OriginPosition, endLocation);
    }

    UFUNCTION(BlueprintEvent, NetMulticast)
    void SpawnRayOnCellMulticast(FVector OriginPosition, FVector endLocation)
    {
    }

    //OVerride to match with the region volume 
    // bool CheckIsOverlappingActor(AActor OtherActor)
    // {
    //     return false;
    // }

    URegionTrait_GornSleeperElectrifiedCell GetRegionTrait()
    {
        if(m_RegionTrait != nullptr)
            return m_RegionTrait;
        if(m_DetectionRegionVolume == nullptr)
            return nullptr;
        return Cast<URegionTrait_GornSleeperElectrifiedCell>(m_DetectionRegionVolume.FindTraitByClass(URegionTrait_GornSleeperElectrifiedCell::StaticClass()));
    }

    UFUNCTION()
    void OnCharacterEnteringRegionDelegate(AGothicCharacterState GothicCharacterState)
    {
        auto gothicChar = GothicCharacterState.Character;
        if(gothicChar != nullptr)
           m_CollisionComp.OnComponentBeginOverlap.Broadcast(m_CollisionComp, gothicChar, gothicChar.CapsuleComponent, 0, true, FHitResult());
    }

    UFUNCTION()
    void OnCharacterLeavingRegionDelegate(AGothicCharacterState GothicCharacterState)
    {
        auto gothicChar = GothicCharacterState.Character;
        if(gothicChar != nullptr)
            m_CollisionComp.OnComponentEndOverlap.Broadcast(m_CollisionComp, gothicChar, gothicChar.CapsuleComponent, 0);
    }

    bool CheckIsOverlappingActor(AActor OtherActor) override
    {
        //@DE - Managed by the region trait
        return false;
    }

}


