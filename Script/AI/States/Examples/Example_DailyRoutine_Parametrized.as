/**
 * This example AI-State shows how to create daily routine states that can take
 * parameters when they're added to the schedule.
 * 
 * This state lets the NPC just go left and right, with a distance that you can configure from outside.
 */
UCLASS()
class UAIState_Example_Parametrized : UGothicCharacterSimulateableAIState
{
    /** Constructor allowing us to configure this object while creating it from outside */
    UAIState_Example_Parametrized(float InWalkDistance)
    {
        WalkDistance = InWalkDistance;
    }

    UPROPERTY()
    float WalkDistance = 1000.0f;

    UFUNCTION(BlueprintOverride)
    void DoTask()
    {
        while(true)
        {
            AI.GoLeft(WalkDistance);
            AI.GoRight(WalkDistance);
        }
    }
}

/**
 * Here is a daily-routine definition that shows how to use the AIState above:
 */
UCLASS()
class UDailyRoutine_Example_Parametrized : UAIState_DailyRoutine_Human
{
    // Add the state two times, but with different distances
    default Schedule(1, 0, UAIState_Example_Parametrized(500.0f), n"FMC_HUT01_OUT");
    default Schedule(13, 0, UAIState_Example_Parametrized(3000.0f), n"FMC_HUT01_OUT");

    // You can optionally use named and default parameters, just like anywhere within Angelscript
    default Schedule(20, 0, UAIState_Example_Parametrized(InWalkDistance = 2000.0f), n"FMC_HUT01_OUT");
}