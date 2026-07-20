UCLASS()
class APlayerDetectionActorBase : AActor
{
    UPROPERTY(DefaultComponent, RootComponent)
	USceneComponent m_RootComp;
    UPROPERTY(DefaultComponent, Attach=m_RootComp)
    UArrowComponent m_ArrowComponent;
    UPROPERTY(DefaultComponent, Attach=m_RootComp)
    UTextRenderComponent m_TextRender;

    UPROPERTY(DefaultComponent, Attach=m_RootComp)
    UBoxComponent m_CollisionComp;
    default m_CollisionComp.OnComponentBeginOverlap.AddUFunction(this, n"OnComponentBeginOverlap");
    default m_CollisionComp.OnComponentEndOverlap.AddUFunction(this, n"OnComponentEndOverlap");

    UPROPERTY()
    TArray<AGothicCharacterState> m_ActiveCharacters;

    UFUNCTION(BlueprintOverride)
    void BeginPlay()
    {
        m_CollisionComp.SetCollisionProfileName(n"Custom");
        m_CollisionComp.SetCollisionResponseToAllChannels(ECollisionResponse::ECR_Ignore);
        m_CollisionComp.SetCollisionResponseToChannel(ECollisionChannel::ECC_Pawn, ECollisionResponse::ECR_Overlap);
        m_CollisionComp.GenerateOverlapEvents = true;
    }
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
    void OnComponentBeginOverlap(UPrimitiveComponent OverlappedComponent, AActor OtherActor, UPrimitiveComponent OtherComp, int OtherBodyIndex, bool bFromSweep, const FHitResult&in SweepResult)
    {
        auto character = Cast<AGothicCharacter>(OtherActor);
        if(character == nullptr)
            return;
        if(m_ActiveCharacters.Contains(character.CharacterState))
            return;
        if(character.CharacterState.IsPlayerControlled() && character.CharacterState.IsPlayerCharacter())
            m_ActiveCharacters.Add(character.CharacterState);

        OnCharacterEnter(character);
    }
        
    void OnCharacterEnter(AGothicCharacter character)
    {
    }

    UFUNCTION()
    void OnComponentEndOverlap(UPrimitiveComponent OverlappedComp, AActor OtherActor, UPrimitiveComponent OtherComp, int32 OtherBodyIndex)
    {
        auto character = Cast<AGothicCharacter>(OtherActor);
        if(character == nullptr)
            return;
        if(!m_ActiveCharacters.Contains(character.CharacterState))
            return;
        if(m_CollisionComp.IsOverlappingActor(character))
            return;
        m_ActiveCharacters.Remove(character.CharacterState);
        OnCharacterExit(character);

    }

    void OnCharacterExit(AGothicCharacter character)
    {
    }

    UFUNCTION()
    void OnCharacterEnteringRegionDelegate(AGothicCharacterState GothicCharacterState)
    {
        if(m_ActiveCharacters.Contains(GothicCharacterState))
            return;

        m_ActiveCharacters.Add(GothicCharacterState);
    }

    UFUNCTION()
    void OnCharacterLeavingRegionDelegate(AGothicCharacterState GothicCharacterState)
    {
        if(m_ActiveCharacters.Contains(GothicCharacterState))
            m_ActiveCharacters.Remove(GothicCharacterState);
    }

    bool IsPlayerInside()
    {
        return !m_ActiveCharacters.IsEmpty();
    }

}