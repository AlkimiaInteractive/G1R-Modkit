
class UMCQueenEggWorldConfig : UGothicBaseConfig
{
    UPROPERTY()
    FGameplayTag m_DetectionTag = FGameplayTag();
}

class UMCQueenMeleeEggWorldConfig_Right : UMCQueenEggWorldConfig
{
    default m_DetectionTag = GameplayTag::State_CloseTo_MCQueenEgg_Melee_Right;
}

class UMCQueenMeleeEggWorldConfig_Left : UMCQueenEggWorldConfig
{
    default m_DetectionTag = GameplayTag::State_CloseTo_MCQueenEgg_Melee_Left;
}


UCLASS()
class AMCQueenCombatZoneBox : AActor//AItemVisualWorld
{
    // default m_SetupCollisions = true;
    // default m_ItemDefinition = UDefaultInteract::StaticClass();
    // default m_WorldItemDefinition = UItAt_Crawlerqueen::StaticClass();

    // //@DE - There is a bug with the material and if overlap, then doesnt move.
    // default m_MeshComponent.SetRelativeLocation(FVector(0,0,7));
    // default m_CollisionComp.SetBoxExtent(FVector(6));

    UPROPERTY(DefaultComponent, RootComponent)
    USceneComponent m_RootComp;

    UPROPERTY(DefaultComponent, Attach=m_RootComp)
    UHitBoxCollisionComponent m_DetectionBox;

    UPROPERTY(DefaultComponent, Attach=m_RootComp)
    UArrowComponent m_ArrowComponent;
    UPROPERTY(DefaultComponent, Attach=m_RootComp)
    UTextRenderComponent m_TextRender;


    UPROPERTY(EditAnywhere)
    FVector m_BoxExtent = FVector(100.f, 100.f, 100.f);

    UPROPERTY()
    TSubclassOf<UGothicBaseConfig> m_EggConfigClass = UMCQueenEggWorldConfig::StaticClass();
    UPROPERTY(NotVisible)
    UMCQueenEggWorldConfig m_EggConfig;
    UPROPERTY(NotVisible)
    TArray<AGothicCharacter> m_Targets;

    default m_DetectionBox.OnComponentBeginOverlap.AddUFunction(this, n"OnComponentBeginOverlap");
    default m_DetectionBox.OnComponentEndOverlap.AddUFunction(this, n"OnComponentEndOverlap");


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

        m_DetectionBox.SetBoxExtent(m_BoxExtent);

    }

    UFUNCTION(BlueprintOverride)
    void BeginPlay()
    {
        m_EggConfig = Cast<UMCQueenEggWorldConfig>(m_EggConfigClass.GetDefaultObject());
        m_DetectionBox.AddCustomCollisionResponse(ECollisionChannel::ECC_WorldStatic, ECollisionResponse::ECR_Ignore);
        m_DetectionBox.SetBoxExtent(m_BoxExtent);
        m_DetectionBox.SetState(EHitColliderState::Damage);
        m_DetectionBox.SetHiddenInGame(true);
        m_TextRender.SetHiddenInGame(true);
    }


    UFUNCTION()
    void OnComponentBeginOverlap(UPrimitiveComponent OverlappedComponent, AActor OtherActor, UPrimitiveComponent OtherComp, int OtherBodyIndex, bool bFromSweep, const FHitResult&in SweepResult)
    {
        //Print("OnComponentBeginOverlap", 5.f, FLinearColor::Blue);

        if(OtherActor.IsA(AMCQueenCombatZoneBox::StaticClass()))
            return;
        if(OtherActor.IsA(AMinecrawler_Queen::StaticClass()))
            return;

        auto gothicChar = Cast<AGothicCharacter>(OtherActor);
        if(gothicChar == nullptr)
        {
            return;
        }

        if(!m_Targets.Contains(gothicChar))
        {
            m_Targets.Add(gothicChar);
            gothicChar.GetGothicAbilitySystemComponent().AddLooseTag(m_EggConfig.m_DetectionTag);
        }
        
        
    }

    //Detection shape overlap end
    UFUNCTION()
    void OnComponentEndOverlap(UPrimitiveComponent OverlappedComponent, AActor OtherActor,
                             UPrimitiveComponent OtherComp, int OtherBodyIndex)
    {
        //Print("OnComponentEndOverlap", 5.f, FLinearColor::Red);
        if(OtherActor == nullptr)
            return;
        
        if(OtherActor.IsA(AMCQueenCombatZoneBox::StaticClass()))
            return;
        if(OtherActor.IsA(AMinecrawler_Queen::StaticClass()))
            return;

        auto gothicChar = Cast<AGothicCharacter>(OtherActor);
        if(gothicChar == nullptr)
        {
            return;
        }

        if(m_Targets.Contains(gothicChar))
        {
            TArray<AActor> overlappingActors;
            m_DetectionBox.GetOverlappingActorsCustom(overlappingActors, AGothicPlayerCharacter::StaticClass());
            if(overlappingActors.Contains(gothicChar))
                return;
            m_Targets.Remove(gothicChar);
            gothicChar.GetGothicAbilitySystemComponent().RemoveLooseTag(m_EggConfig.m_DetectionTag);
        }
    }

    UFUNCTION(BlueprintOverride)
    void EndPlay(EEndPlayReason EndPlayReason)
    {
        for(auto gothicChar : m_Targets)
        {
            gothicChar.GetGothicAbilitySystemComponent().RemoveLooseTag(m_EggConfig.m_DetectionTag);
        }
        m_Targets.Empty();
    }
}


UCLASS()
class AMCQueenCombatZoneBox_Right : AMCQueenCombatZoneBox//AItemVisualWorld
{
    default m_EggConfigClass = UMCQueenMeleeEggWorldConfig_Right::StaticClass();
}

UCLASS()
class AMCQueenCombatZoneBox_Left : AMCQueenCombatZoneBox//AItemVisualWorld
{
    default m_EggConfigClass = UMCQueenMeleeEggWorldConfig_Left::StaticClass();
}