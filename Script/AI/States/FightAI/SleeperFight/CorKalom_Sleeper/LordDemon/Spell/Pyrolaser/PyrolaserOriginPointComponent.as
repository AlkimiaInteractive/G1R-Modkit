UCLASS()
class UPyrolaserOriginPointComponent : UCapsuleLoopOriginPointComponent
{

    UPROPERTY()
    FRotator m_OriginalLocalRotation;

    UFUNCTION(BlueprintOverride)
    void BeginPlay()
    {
        m_OriginalLocalRotation = GetRelativeRotation();
    }

    FVector GetDisplacementPoint(float CapsuleHalfHeight) override
    {
        if(Math::IsNearlyZero(CapsuleHalfHeight))
            return GetWorldLocation();
        FVector displacementPoint =  GetWorldLocation() + GetUpVector() * CapsuleHalfHeight;
        //System::DrawDebugSphere( displacementPoint, 10, 16, FLinearColor::Red, 1, 5);
        return displacementPoint;
    }

    void ResetRotation()
    {
        SetRelativeRotation(m_OriginalLocalRotation);
    }
}