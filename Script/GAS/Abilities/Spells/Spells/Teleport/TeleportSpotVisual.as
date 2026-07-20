class ATeleportSpotVisual : AActor
{
	UPROPERTY(EditAnywhere, BlueprintReadWrite)
	float m_MinFloorHeight = -200.f;
	UPROPERTY(EditAnywhere, BlueprintReadWrite)
	float m_MaxFloorHeight = 50.f;

    UPROPERTY(DefaultComponent, RootComponent)
	USceneComponent m_RootComp;
    UPROPERTY(DefaultComponent, Attach=m_RootComp)
    UArrowComponent m_ArrowComponent;
    UPROPERTY(DefaultComponent, Attach=m_RootComp)
    UTextRenderComponent m_TextRender;

    UPROPERTY()
    bool m_Grounded = true;

    UPROPERTY()
    TSubclassOf<UGothicBaseConfig> m_SpotConfigClass;
    
    UPROPERTY()
    UGameplayTeleportSpotConfigBase m_SpotConfig;  

    default m_RootComp.Mobility = EComponentMobility::Static;


    UFUNCTION(BlueprintOverride)
    void ConstructionScript()
    {
        m_TextRender.SetRelativeLocation(FVector(0,0,100));       
        m_TextRender.SetText(FText::AsCultureInvariant(FString(GetName())));
        m_TextRender.SetTextRenderColor(FColor::Red);
        m_TextRender.SetHorizontalAlignment(EHorizTextAligment::EHTA_Center);
        m_TextRender.SetVerticalAlignment(EVerticalTextAligment::EVRTA_TextCenter);
        m_TextRender.SetHiddenInGame(true);
        m_ArrowComponent.SetHiddenInGame(true);
    }

    FVector GetTeleportLocation()
    {
        return GetActorLocation();
    }

    UFUNCTION(BlueprintOverride)
    void BeginPlay()
    {
        if(m_Grounded)
        {
            FHitResult hit;
            FVector floorLocation;
            MagicScript::FindFloorAtLocation(GetActorLocation(), hit, this, ECollisionChannel::IKTrace, m_MinFloorHeight, m_MaxFloorHeight);
            floorLocation = hit.ImpactPoint;
            //@DE - Offset to avoid stay inside other object.
            floorLocation.Z += 10.f;
            SetActorLocation(floorLocation);
        }

    }

    void OnTeleportCompleted()
    {

    }

    void OnMovementCompleted()
    {

    }

    void SetupSpot(UCreatureTeleportComponent TeleportComponent)
    {
        SetOwner(Cast<AGothicCharacter>(TeleportComponent.GetOwner()));
    }

    
    TSoftObjectPtr<UAnimMontage> GetMontage(FGameplayTag MontageTag)
    {
        return GetConfig().GetMontageForTag(MontageTag);
    }

    UGameplayTeleportSpotConfigBase GetConfig()
    {
        if(m_SpotConfig == nullptr)
        {
            m_SpotConfig = Cast<UGameplayTeleportSpotConfigBase>(m_SpotConfigClass.GetDefaultObject());
        }
        return m_SpotConfig;
    }

        bool IsTargetVisible()
    {
        return false;
    }

    bool ShouldRotateCharacter()
    {
        return false;
    }

    FRotator GetSpotRotation()
    {
        return FRotator::ZeroRotator;
    }

}
