UCLASS()
class AKalomTranceCharge : AActor
{
    UPROPERTY(DefaultComponent, RootComponent)
    USceneComponent m_RootComp;

    UPROPERTY(DefaultComponent, Attach=m_RootComp)
    UArrowComponent m_ArrowComponent;
    UPROPERTY(DefaultComponent, Attach=m_RootComp)
    UTextRenderComponent m_TextRender;

    UPROPERTY(BlueprintReadWrite, EditAnywhere)
    AGothicCharacter m_MadCorKalomCharacter;
    UPROPERTY(BlueprintReadWrite, EditAnywhere)
    AGothicCharacter m_CorKalomDemonCharacter;

    UPROPERTY(BlueprintReadWrite, EditAnywhere)
    AMadCorKalomGroundCrack m_CenterCrack;
    UPROPERTY(BlueprintReadWrite, EditAnywhere)
    AMadCorKalomGroundCrack m_LeftCrack;
    UPROPERTY(BlueprintReadWrite, EditAnywhere)
    AMadCorKalomGroundCrack m_RightCrack;

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

    UFUNCTION(BlueprintEvent)
    void OnMadCorKalomStartFalling()
    {

    }

    UFUNCTION(BlueprintEvent)
    void OnCorKalomDemonSpawnRequest()
    {

    }

    UFUNCTION(BlueprintEvent)
    void OnCorKalomDemonSpawned()
    {

    }

    UFUNCTION(BlueprintEvent)
    void OnBreakFloor()
    {

    }
}
