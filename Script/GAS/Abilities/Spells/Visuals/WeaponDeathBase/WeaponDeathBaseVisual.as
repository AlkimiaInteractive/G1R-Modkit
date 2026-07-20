UCLASS()
class AWeaponDeathVisualBase : AActor
{
    UPROPERTY(DefaultComponent, RootComponent)
	USceneComponent m_RootComp;

    UPROPERTY(BlueprintReadWrite)
    TSubclassOf<USpellConfig> m_SpellConfigClass;

    UPROPERTY(BlueprintReadWrite)
	AGothicCharacter m_Character;

    default bNeverApplyTickOptimizations = true;

    UFUNCTION(BlueprintOverride)
    void BeginPlay()
    {
        if(m_SpellConfigClass == nullptr)
            DestroyActor();

        SetLifeSpanInternal();
    }

    void SetLifeSpanInternal()
    {
    }

    UFUNCTION(BlueprintCallable, BlueprintEvent)
    void ActivateEffect(AGothicCharacter Character)
    {
        m_Character = Character;
    }

     UFUNCTION(BlueprintCallable, BlueprintEvent)
    void DeactivateEffect(AGothicCharacter Character)
    {

    }
}