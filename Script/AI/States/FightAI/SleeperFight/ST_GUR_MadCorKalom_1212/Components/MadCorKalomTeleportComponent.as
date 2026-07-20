
class UMadCorKalomTeleportComponent : UCreatureTeleportComponent
{
    // UPROPERTY()
    // FGameplayTeleportDelegate OnMovementCompletedDelegate;
    
    // UPROPERTY()
    // private FTimerHandle TaskTimer;

    UPROPERTY()
    UClass m_TeleportSpotFilterClass = AMadCorKalomTeleportSpotVisual::StaticClass();


    UClass GetTeleportSpotFilterClass()
    {
        return m_TeleportSpotFilterClass;
    }


    // void DoTeleport()
    // {
    //     auto TeleportSpot = Cast<ATeleportSpotVisual>(GetTargetTeleportSpot());
    //     if(TeleportSpot != nullptr)
    //     {   
    //         auto currentCharacter =  Cast<AGothicCharacter>(GetOwner());
    //         if(TeleportSpot.ShouldRotateCharacter())
    //         {
    //             currentCharacter.SetActorRotation(TeleportSpot.GetSpotRotation());
    //         }

    //         currentCharacter.SetActorEnableCollision(false);

    //         FVector TeleportLocation = TeleportSpot.GetTeleportLocation();
    //         auto capsuleComp = currentCharacter.CapsuleComponent.GetScaledCapsuleHalfHeight();
    //         TeleportLocation.Z += capsuleComp;
    //         FHitResult hitResult;
    //         currentCharacter.SetActorLocation(TeleportLocation, false, hitResult, true);
    //         currentCharacter.Controller.SetControlRotation(currentCharacter.GetActorRotation());
    //     }
       
    //     if(System::IsTimerActiveHandle(TaskTimer))
    //         System::ClearAndInvalidateTimerHandle(TaskTimer);
    //     TaskTimer = System::SetTimerDelegate(FTimerDynamicDelegate(this, n"OnMovementCompleted"), .15f, false);
    // }

    // UFUNCTION()
    // void OnMovementCompleted()
    // {
    //     //Print("OnMovementCompleted", 5.f, FLinearColor::Purple);
    //     auto currentCharacter =  Cast<AGothicCharacter>(GetOwner());
    //     currentCharacter.SetActorEnableCollision(true);
    //     OnMovementCompletedDelegate.ExecuteIfBound();
    // }

    // void OnTeleportCompleted()
    // {
    //     Cast<AXardasSleeperTeleportSpotVisual>(GetTargetTeleportSpot()).OnTeleportCompleted();
    // }


}
