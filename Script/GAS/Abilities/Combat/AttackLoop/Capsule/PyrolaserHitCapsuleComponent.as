UCLASS()
class UPyrolaserHitCapsuleComponent : UHitCapsuleCollisionComponent
{
    default m_WeaponData = UWeapon_Pyrolaser_Base::StaticClass();

    UPROPERTY()
    private FTimerHandle TaskTimer;

    UFUNCTION(BlueprintOverride)
    void BeginPlay()
    {
        
    }

    void ActivateDebugVisuals()
    {
        if(System::IsTimerActiveHandle(TaskTimer))
            System::ClearAndInvalidateTimerHandle(TaskTimer);

        //TaskTimer = System::SetTimerDelegate(FTimerDynamicDelegate(this, n"DrawDebugVisual"), .1f, true);
    }
    
    UFUNCTION()
    void DrawDebugVisual()
    {
        FVector origin = GetWorldLocation() - GetUpVector() * CapsuleHalfHeight;
        FVector end = GetWorldLocation() + GetUpVector() * CapsuleHalfHeight;
        System::DrawDebugArrow(origin, end, 10, FLinearColor::Red, .4, 5);
    }

    UFUNCTION(BlueprintOverride)
    void EndPlay(EEndPlayReason EndPlayReason)
    {
        if(System::IsTimerActiveHandle(TaskTimer))
            System::ClearAndInvalidateTimerHandle(TaskTimer);
    }

    void DeactivateDebugVisuals()
    {
        if(System::IsTimerActiveHandle(TaskTimer))
            System::ClearAndInvalidateTimerHandle(TaskTimer);
    }
}