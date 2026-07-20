
/** Lets the Character walk to random points within the given radius. */
UCLASS()
class UAIState_WanderAimlessly : UGothicCharacterSimulateableAIState
{
    UAIState_WanderAimlessly(float InRadius)
    {
        WanderInRadius = InRadius;
    }

    UPROPERTY()
    float WanderInRadius = 1000.0f;

    UFUNCTION(BlueprintOverride)
    void DoTask()
    {
        AI.GotoPreferredLocation();
 
        FVector StartLocation = CharacterState.CharacterLocation;

        while (!bShouldExitState)
        {
            if (IsInDailyRoutineSimulation())
            {
                ReportTimeSkipWhateverIsLeft();
            }

            FVector Random;
            if (!UNavigationSystemV1::TryGetRandomNavigablePointInRadius(CharacterState, StartLocation, WanderInRadius, Random))
            {
                WaitSeconds(1.0f);
                continue;
            }

            AI.GotoPosition(Random);

            WaitOneTick();
        }
    }
}