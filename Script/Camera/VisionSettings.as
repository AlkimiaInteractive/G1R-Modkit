
UCLASS()
class UVisionSettings : UObject
{
    UPROPERTY(EditAnywhere)
    TSoftObjectPtr<UMaterialInterface> LensDistortion = n"/Script/Engine.MaterialInstanceConstant'/Game/LensAndFilmPostProcess/Materials/LensDistortion_NightVision.LensDistortion_NightVision'";

    UPROPERTY(EditAnywhere)
    FPostProcessSettings PostProcessSettings;
}

UCLASS()
class UDefaultVisionSettings : UVisionSettings
{
    default PostProcessSettings.bOverride_BloomIntensity = true;
    default PostProcessSettings.BloomIntensity = 0.0f;

    default PostProcessSettings.bOverride_SceneFringeIntensity = true;
    default PostProcessSettings.SceneFringeIntensity = 0.0f;

    default PostProcessSettings.bOverride_ChromaticAberrationStartOffset = true;
    default PostProcessSettings.ChromaticAberrationStartOffset = 0.0f;

    default PostProcessSettings.bOverride_VignetteIntensity = true;
    default PostProcessSettings.VignetteIntensity = 0.0f;

    default PostProcessSettings.bOverride_ColorSaturation = true;
    default PostProcessSettings.ColorSaturation = FVector4(1.0f, 1.0f, 1.0f, 1.0f);

    default PostProcessSettings.bOverride_ColorContrast = true; 
    default PostProcessSettings.ColorContrast = FVector4(1.0f, 1.0f, 1.0f, 1.0f);

    default PostProcessSettings.bOverride_ColorGain = true;
    default PostProcessSettings.ColorGain = FVector4(1.0f, 1.0f, 1.0f, 1.0f);
}

UCLASS()
class UNightVisionSettings : UVisionSettings
{
    default PostProcessSettings.bOverride_BloomIntensity = true;
    default PostProcessSettings.BloomIntensity = 2.0f;

    default PostProcessSettings.bOverride_SceneFringeIntensity = true;
    default PostProcessSettings.SceneFringeIntensity = 3.5f;

    default PostProcessSettings.bOverride_ChromaticAberrationStartOffset = true;
    default PostProcessSettings.ChromaticAberrationStartOffset = 0.2f;

    default PostProcessSettings.bOverride_VignetteIntensity = true;
    default PostProcessSettings.VignetteIntensity = 2.5f;

    default PostProcessSettings.bOverride_ColorSaturation = true;
    default PostProcessSettings.ColorSaturation = FVector4(0.0f, 0.0f, 0.0f, 1.0f);

    default PostProcessSettings.bOverride_ColorContrast = true; 
    default PostProcessSettings.ColorContrast = FVector4(1.0f, 1.0f, 1.0f, 0.7f);

    default PostProcessSettings.bOverride_ColorGain = true;
    default PostProcessSettings.ColorGain = FVector4(1.5f, 3.0f, 3.0f, 1.5f);

    FWeightedBlendable DistortionLense;
    default DistortionLense.Weight = 1.0f;
    default DistortionLense.Object = LensDistortion.Get();

    default PostProcessSettings.WeightedBlendables.Array.Add(DistortionLense);
}