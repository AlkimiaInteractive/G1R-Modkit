
/** Lets the Character walk to random points within the given radius. */
UCLASS()
class UAIState_Pivoting : UGothicCharacterSimulateableAIState
{
    UAIState_Pivoting(float InDistance)
    {
        Distance = InDistance;
    }

    UPROPERTY()
    float Distance = 400.0f;

    UPROPERTY()
    bool Going = true;

    UFUNCTION(BlueprintOverride)
    void DoTask()
    {
        FVector StartLocation = Self.ActorLocation;
        
        WaitSeconds(2.0f);

        while (!bShouldExitState)
        {
            Perform180(StartLocation);
        }
    }

    UFUNCTION()
    void Perform180(FVector StartLocation)
    {
        FVector Destination = StartLocation;

        Destination.X += Distance;

        AI.GotoPosition(Destination);

        Destination.X -= Distance;

        //WaitSeconds(2.0);

        AI.GotoPosition(StartLocation);
        
        WaitSeconds(2.0);
    }

    UFUNCTION()
    void Perform135(FVector StartLocation)
    {
        FVector Destination = StartLocation;

        Destination.X += Distance;

        AI.GotoPosition(Destination);
        
        WaitSeconds(2.0);
        
        Destination.Y += Distance;
        Destination.X -= Distance;

        AI.GotoPosition(Destination);

        WaitSeconds(2.0);

        AI.GotoPosition(StartLocation);
        
        WaitSeconds(2.0);
    }

    UFUNCTION()
    void Perform90(FVector StartLocation)
    {
        FVector Destination = StartLocation;

        Destination.X += Distance;

        AI.GotoPosition(Destination);
        
        WaitSeconds(2.0);
        
        Destination.Y -= Distance;

        AI.GotoPosition(Destination);
        
        WaitSeconds(2.0);
        
        Destination.X -= Distance;
        
        AI.GotoPosition(Destination);
        
        WaitSeconds(2.0);

        AI.GotoPosition(StartLocation);
        
        WaitSeconds(2.0);
    }
}