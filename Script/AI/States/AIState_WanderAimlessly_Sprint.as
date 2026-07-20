/** Lets the Character walk to random points within the given radius. */
UCLASS()
class UAIState_WanderAimlessly_Sprint : UGothicCharacterSimulateableAIState
{
    UAIState_WanderAimlessly_Sprint(float InRadius)
    {
        WanderInRadius = InRadius;
    }

    UPROPERTY()
    float WanderInRadius = 8000.0f;

    UFUNCTION(BlueprintOverride)
    void DoTask()
    {
        SetWalkSpeed(EWalkSpeed::Sprinting);

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