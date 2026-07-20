struct FLightData
{
    UPROPERTY()
    bool IsLightActive;
    UPROPERTY()
    float LightRadius;
    UPROPERTY()
    float LightIntensity;
    UPROPERTY()
    FLinearColor LightColor;
    UPROPERTY()
    bool UseTemperature;
    UPROPERTY()
    float TemperatureIntensity;
    UPROPERTY()
    float VolumetricScatteringIntensity;
    UPROPERTY()
    bool CastShadows;
    UPROPERTY()
    float MaxDistanceFadeRange;

    FLightData(
        bool isLightActive, 
        float lightRadius, 
        float lightIntensity, 
        FLinearColor lightColor, 
        bool useTemperature, 
        float temperatureIntensity, 
        float volumetricScatteringIntensity,
        bool castShadows,
        float maxDistanceFadeRange)
    {
        this.IsLightActive = isLightActive;
        this.LightRadius = lightRadius;
        this.LightIntensity = lightIntensity;
        this.LightColor = lightColor;
        this.UseTemperature = useTemperature;
        this.TemperatureIntensity = temperatureIntensity;
        this.VolumetricScatteringIntensity = volumetricScatteringIntensity;
        this.CastShadows = castShadows;
        this.MaxDistanceFadeRange = maxDistanceFadeRange;
    }
}

class ACustomPointLight : AActor
{
    UPROPERTY(DefaultComponent, RootComponent)
    USceneComponent SceneRoot;

    UPROPERTY(DefaultComponent)
    USpotLightComponent Light1;
    UPROPERTY(DefaultComponent)
    USpotLightComponent Light2;

    UPROPERTY(BlueprintReadWrite, Category = "Light Data")
    FLightData LightData = FLightData(
        true, 
        1000, 
        100, 
        FLinearColor(1.00, 1.00, 1.00),
        true,
        2700,
        50,
        false,
        1800);

    UFUNCTION(BlueprintOverride)
    void ConstructionScript()
    {
        UpdateLights();
    }

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
        Light.SetLightFunctionFadeDistance(LightData.MaxDistanceFadeRange);
    }
}