UCLASS()
class UFireVisualComponentAS : UFireVisualComponent
{
    UPROPERTY(BlueprintReadOnly)
    float TransitionTime = 0.5f;
    UPROPERTY(BlueprintReadOnly)
    float AttenuatedToBaseTime = 6.f;
    UPROPERTY(BlueprintReadOnly)
    float OverflowToBaseTime = 3.f;
    UPROPERTY(BlueprintReadOnly)
    float TimeOverflowingBySpellInSeconds = 15.f;
    UPROPERTY(BlueprintReadOnly)
    float TimeAttenuatedByHitInSeconds = 60.f;
    UPROPERTY(BlueprintReadOnly)
    float TimeAttenuatedBySpellInSeconds = 60.f;

    UPROPERTY(BlueprintReadOnly)
    FFireAttenuationSettings AttenuatedOffSettings;
    default AttenuatedOffSettings.HasLightFunction = false;
    default AttenuatedOffSettings.TinkleOverallSpeed = 1.f;
    default AttenuatedOffSettings.TinklingOverallIntensity = 1.f;
    default AttenuatedOffSettings.TinkleIntensity = 1.f;
    default AttenuatedOffSettings.ParticlesSpawnFactor = 1.f;
    default AttenuatedOffSettings.TinklingMinIntensity = 1.f;
    default AttenuatedOffSettings.TinklingMaxIntensity = 1.f;
    default AttenuatedOffSettings.AdvanceEmissiveFactor = 1.f;
    default AttenuatedOffSettings.UseAttenuationWind = 0.f;
    default AttenuatedOffSettings.FlameSizeFactor = 1.f;

    UPROPERTY(BlueprintReadOnly)
    FFireAttenuationSettings AttenuatedLowSettings;
    default AttenuatedLowSettings.HasLightFunction = true;
    default AttenuatedLowSettings.TinkleOverallSpeed = 1.5f;
    default AttenuatedLowSettings.TinklingOverallIntensity = 0.8f;
    default AttenuatedLowSettings.TinkleIntensity = 0.8f;
    default AttenuatedLowSettings.ParticlesSpawnFactor = 0.7f;
    default AttenuatedLowSettings.TinklingMinIntensity = 0.4f;
    default AttenuatedLowSettings.TinklingMaxIntensity = 0.9f;
    default AttenuatedLowSettings.AdvanceEmissiveFactor = 0.6f;
    default AttenuatedLowSettings.UseAttenuationWind = 0.6f;
    default AttenuatedLowSettings.FlameSizeFactor = 0.7f;

    UPROPERTY(BlueprintReadOnly)
    FFireAttenuationSettings AttenuatedMidSettings;
    default AttenuatedMidSettings.HasLightFunction = true;
    default AttenuatedMidSettings.TinkleOverallSpeed = 1.9f;
    default AttenuatedMidSettings.TinklingOverallIntensity = 0.7f;
    default AttenuatedMidSettings.TinkleIntensity = 0.5f;
    default AttenuatedMidSettings.ParticlesSpawnFactor = 0.5f;
    default AttenuatedMidSettings.TinklingMinIntensity = 0.2f;
    default AttenuatedMidSettings.TinklingMaxIntensity = 0.8f;
    default AttenuatedMidSettings.AdvanceEmissiveFactor = 0.4f;
    default AttenuatedMidSettings.UseAttenuationWind = 0.8f;
    default AttenuatedMidSettings.FlameSizeFactor = 0.5f;

    UPROPERTY(BlueprintReadOnly)
    FFireAttenuationSettings AttenuatedHighSettings;
    default AttenuatedHighSettings.HasLightFunction = true;
    default AttenuatedHighSettings.TinkleOverallSpeed = 2.4f;
    default AttenuatedHighSettings.TinklingOverallIntensity = 0.4f;
    default AttenuatedHighSettings.TinkleIntensity = 0.25f;
    default AttenuatedHighSettings.ParticlesSpawnFactor = 0.2f;
    default AttenuatedHighSettings.TinklingMinIntensity = 0.1f;
    default AttenuatedHighSettings.TinklingMaxIntensity = 0.7f;
    default AttenuatedHighSettings.AdvanceEmissiveFactor = 0.2f;
    default AttenuatedHighSettings.UseAttenuationWind = 1.f;
    default AttenuatedHighSettings.FlameSizeFactor = 0.3f;

    UPROPERTY(BlueprintReadOnly)
    FFireAttenuationSettings AttenuatedByHitSettings;
    default AttenuatedByHitSettings.HasLightFunction = true;
    default AttenuatedByHitSettings.TinkleOverallSpeed = 5.0f;
    default AttenuatedByHitSettings.TinklingOverallIntensity = 0.0f;
    default AttenuatedByHitSettings.TinkleIntensity = 0.0f;
    default AttenuatedByHitSettings.ParticlesSpawnFactor = 0.f;
    default AttenuatedByHitSettings.TinklingMinIntensity = 0.1f;
    default AttenuatedByHitSettings.TinklingMaxIntensity = 0.3f;
    default AttenuatedByHitSettings.AdvanceEmissiveFactor = 0.f;
    default AttenuatedByHitSettings.UseAttenuationWind = 1.f;
    default AttenuatedByHitSettings.FlameSizeFactor = 0.f;

    UPROPERTY(BlueprintReadOnly)
    FFireAttenuationSettings AttenuatedBySpellSettings;
    default AttenuatedBySpellSettings.HasLightFunction = true;
    default AttenuatedBySpellSettings.TinkleOverallSpeed = 5.0f;
    default AttenuatedBySpellSettings.TinklingOverallIntensity = 0.0f;
    default AttenuatedBySpellSettings.TinkleIntensity = 0.0f;
    default AttenuatedBySpellSettings.ParticlesSpawnFactor = 0.0f;
    default AttenuatedBySpellSettings.TinklingMinIntensity = 0.1f;
    default AttenuatedBySpellSettings.TinklingMaxIntensity = 0.3f;
    default AttenuatedBySpellSettings.AdvanceEmissiveFactor = 0.f;
    default AttenuatedBySpellSettings.UseAttenuationWind = 1.f;
    default AttenuatedBySpellSettings.FlameSizeFactor = 0.f;

    UPROPERTY(BlueprintReadOnly)
    FFireAttenuationSettings OverflowingBySpellSettings;
    default OverflowingBySpellSettings.HasLightFunction = true;
    default OverflowingBySpellSettings.TinkleOverallSpeed = 3.0f;
    default OverflowingBySpellSettings.TinklingOverallIntensity = 1.5f;
    default OverflowingBySpellSettings.TinkleIntensity = 1.5f;
    default OverflowingBySpellSettings.ParticlesSpawnFactor = 1.5f;
    default OverflowingBySpellSettings.TinklingMinIntensity = 0.8f;
    default OverflowingBySpellSettings.TinklingMaxIntensity = 1.2f;
    default OverflowingBySpellSettings.AdvanceEmissiveFactor = 1.5f;
    default OverflowingBySpellSettings.UseAttenuationWind = 0.f;
    default OverflowingBySpellSettings.FlameSizeFactor = 1.2f;
}

FFireAttenuationSettings GetOffAttenuationTemplate()
{
    FFireAttenuationSettings Settings;
    return Settings;
}

UFUNCTION(BlueprintCallable, BlueprintPure)
FFireAttenuationSettings InterpolateSettings(FFireAttenuationSettings a, FFireAttenuationSettings b, float lerp)
{
    FFireAttenuationSettings finalSettings;
    //It only disables light if it is exactly at a settings with disabled light, otherwise it is active
    finalSettings.HasLightFunction = !(lerp == 0 && !a.HasLightFunction) && !(lerp == 1 && !b.HasLightFunction) && (a.HasLightFunction||b.HasLightFunction);
    finalSettings.TinklingOverallIntensity = b.TinklingOverallIntensity <= 0.05f ? 0 : Math::Lerp(a.TinklingOverallIntensity, b.TinklingOverallIntensity, lerp);
    finalSettings.TinkleOverallSpeed = Math::Lerp(a.TinkleOverallSpeed, b.TinkleOverallSpeed, lerp);
    finalSettings.TinkleIntensity = Math::Lerp(a.TinkleIntensity, b.TinkleIntensity, lerp);
    finalSettings.ParticlesSpawnFactor = Math::Lerp(a.ParticlesSpawnFactor, b.ParticlesSpawnFactor, lerp);
    finalSettings.TinklingMinIntensity = Math::Lerp(a.TinklingMinIntensity, b.TinklingMinIntensity, lerp);
    finalSettings.TinklingMaxIntensity = Math::Lerp(a.TinklingMaxIntensity, b.TinklingMaxIntensity, lerp);
    finalSettings.AdvanceEmissiveFactor = Math::Lerp(a.AdvanceEmissiveFactor, b.AdvanceEmissiveFactor, lerp);
    finalSettings.UseAttenuationWind = Math::Lerp(a.UseAttenuationWind, b.UseAttenuationWind, lerp);
    finalSettings.FlameSizeFactor = Math::Lerp(a.FlameSizeFactor, b.FlameSizeFactor, lerp);
    return finalSettings;
}

USTRUCT()
struct FFireAttenuationSettings
{
    UPROPERTY(BlueprintReadWrite)
    bool HasLightFunction;
    UPROPERTY(BlueprintReadWrite)
    float TinkleOverallSpeed;
    UPROPERTY(BlueprintReadWrite)
    float TinklingOverallIntensity;
    UPROPERTY(EditAnywhere)
    float TinkleIntensity;
    UPROPERTY(EditAnywhere)
    float ParticlesSpawnFactor;
    UPROPERTY(BlueprintReadWrite)
    float TinklingMinIntensity;
    UPROPERTY(BlueprintReadWrite)
    float TinklingMaxIntensity;
    UPROPERTY(BlueprintReadWrite)
    float AdvanceEmissiveFactor;
    UPROPERTY(BlueprintReadWrite)
    float UseAttenuationWind;
    UPROPERTY(BlueprintReadWrite)
    float FlameSizeFactor;
}
