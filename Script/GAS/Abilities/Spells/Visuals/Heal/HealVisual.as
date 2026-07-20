UCLASS()
class AHealVisual : AActor
{
    default bNeverApplyTickOptimizations = true;
    
    UFUNCTION(BlueprintCallable, BlueprintEvent)
    void InitializeActors(AGothicCharacter target, AGothicCharacter instigator)
    {

    }

    UFUNCTION(BlueprintCallable, BlueprintEvent, NetMulticast)
    void ExecuteVFX()
    {

    }

    UFUNCTION(BlueprintCallable, BlueprintEvent, NetMulticast)
    void RemoveVFX()
    {

    }
}