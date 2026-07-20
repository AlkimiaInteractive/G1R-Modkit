UCLASS()
class UDepthOfFieldComponent : UActorComponent
{
    TOptional<APostProcessVolume> PostProcessVolume;
    
    UPROPERTY()
    bool IsEnable = false;
    UPROPERTY()
    float MinSensorWidth = 0.5f;
    UPROPERTY()
    float MaxSensorWidth = 21.0f;
    UPROPERTY()
    float ClosestCameraDistance = 50.0f;
    UPROPERTY()
    float FurthestCameraDistance = 300.0f;

    UFUNCTION(BlueprintOverride)
    void BeginPlay()
    {
        TArray<APostProcessVolume> DepthOfFieldPostProcessVolumes;
        GetAllActorsOfClassWithTag(FName("DepthOfFieldPP"), DepthOfFieldPostProcessVolumes);

        if (DepthOfFieldPostProcessVolumes.Num() >= 1)
            PostProcessVolume.Set(DepthOfFieldPostProcessVolumes[0]);
    }

    UFUNCTION(BlueprintOverride)
    void Tick(float DeltaSeconds)
    {
        if (!IsEnable || !PostProcessVolume.IsSet())
            return;

        auto GothicCharacter = Cast<AGothicPlayerCharacter>(GetOwner());
        float CameraLength = (GothicCharacter.m_FollowCamera.WorldLocation - GothicCharacter.m_CameraBoom.WorldLocation).Size();

        auto& settings = PostProcessVolume.Value.Settings;

        float CameraLerp = Math::Clamp(Math::NormalizeToRange(CameraLength, ClosestCameraDistance, FurthestCameraDistance), 0, 1);
        settings.DepthOfFieldSensorWidth = Math::Lerp(MinSensorWidth, MaxSensorWidth, CameraLerp);
    }
}