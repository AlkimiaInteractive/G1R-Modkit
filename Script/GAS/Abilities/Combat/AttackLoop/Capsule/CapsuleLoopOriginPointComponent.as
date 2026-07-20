UCLASS()
class UCapsuleLoopOriginPointComponent : USceneComponent
{
    FVector GetDisplacementPoint(float CapsuleHalfHeight)
    {
        FVector displacementPoint = GetWorldLocation() + GetForwardVector() * CapsuleHalfHeight;

        //System::DrawDebugArrow(GetWorldLocation(), displacementPoint, 10, FLinearColor::Red, 1, 5);
        return displacementPoint;
    }

}