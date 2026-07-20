UCLASS()
class ADrugsDebuffEffectActor : ADebuffEffectActorByTag
{

    UFUNCTION(BlueprintEvent)
    void OnApplyThresholdEffect(int ThresholdLevel)
    {

    }

    UFUNCTION(BlueprintCallable, BlueprintPure)
    int GetCurrentDrugDebuffEffectLevel()
    {
        return GetDrugsComponent().GetCurrentDrugDebuffEffectLevel();
        
    }

    UFUNCTION(BlueprintCallable, BlueprintPure)
    int GetMaxLevel()
    {
        return GetDrugsComponent().GetMaxLevel();
    }

    UDrugDebuffEffectComponentBase GetDrugsComponent()
    {
        return Cast<UDrugDebuffEffectComponentBase>(GetOwnerComponent());
    }

} 
