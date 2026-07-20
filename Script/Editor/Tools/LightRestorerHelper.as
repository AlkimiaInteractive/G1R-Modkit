UCLASS()
class ULightRestorerSubsystem : UScriptEditorSubsystem
{
    UFUNCTION(BlueprintCallable, Category="Editor Light Helper")
    void UpdateLightRadius(TMap<FString, FLightRestoreData>& Dictionary, float LightRadius)
    {
        for(auto& Current: Dictionary)
        {
            Current.Value.LightData.LightRadius = LightRadius;
        }
    }
}

struct FLightRestoreData
{
    UPROPERTY()
    FTransform Transform;
    UPROPERTY()
    FLightData LightData;
}