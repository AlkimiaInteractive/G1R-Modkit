/**
 * This example shows how to define a simple custom state that can be used during DailyRoutines (or as part of any other state).
 */
UCLASS()
class UAIState_Example_Simple : UGothicCharacterAIState 
{
    /** Defines the sequence of actions this character should do during this state. */
    UFUNCTION(BlueprintOverride)
    void DoTask()
    {
        while (true)
        {
            AI.GoLeft(1000.0f);
            AI.GoRight(1000.0f);
            
            WaitSeconds(1.0f);
        }
    }
}