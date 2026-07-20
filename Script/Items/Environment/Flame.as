class AFlame : AActor
{
    UPROPERTY(DefaultComponent, RootComponent)
    USceneComponent SceneRoot;

    UPROPERTY(DefaultComponent)
    UStaticMeshComponent Flame;
    UPROPERTY(DefaultComponent)
    USpotLightComponent Light1;
    UPROPERTY(DefaultComponent)
    USpotLightComponent Light2;

    UPROPERTY(BlueprintReadWrite, Category = "Light Data")
    FLightData LightData;

    UFUNCTION(BlueprintOverride)
    void ConstructionScript()
    {
        //UpdateLights();
    }

    UFUNCTION(CallInEditor, BlueprintEvent, BlueprintCallable, Category = "Light Data")
    void MigrateData(){}

    void UpdateLights()
    {
        UpdateLightInternal(Light1);
        UpdateLightInternal(Light2);
    }

    private void UpdateLightInternal(USpotLightComponent Light)
    {
        Light.SetVisibility(LightData.IsLightActive);
        Light.SetAttenuationRadius(LightData.LightRadius);
        Light.SetIntensity(LightData.LightIntensity);
        Light.SetLightColor(LightData.LightColor);
        Light.SetUseTemperature(LightData.UseTemperature);
        Light.SetTemperature(LightData.TemperatureIntensity);
        Light.SetVolumetricScatteringIntensity(LightData.VolumetricScatteringIntensity);
        Light.SetCastShadows(LightData.CastShadows);
    }
}