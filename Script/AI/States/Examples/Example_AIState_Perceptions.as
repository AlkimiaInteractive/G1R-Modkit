/**
 * This example shows how to get notified by a perception.
 */
UCLASS()
class UAIState_Example_Perceptions : UGothicCharacterAIState 
{
    /** Defines the sequence of actions this character should do during this state. */
    UFUNCTION(BlueprintOverride)
    void DoTask()
    {
        while(true)
        {
            AI.GoLeft(1000.0f);
            AI.GoRight(1000.0f);
        }
    }

    UFUNCTION(BlueprintOverride)
    void SetupPerceptions(UCharacterPerceptionComponent Perception)
    {
        Perception.SeePlayer().PerceptionGained.BindUFunction(this, n"PerceptionEvent_OnPlayerSeen");
    }

    UFUNCTION()
    private void PerceptionEvent_OnPlayerSeen(const FRememberedPerception&in Perception,
                                              const FPerceptionShortTermMemory&in Memory)
    {
        // This perception event will trigger when the player is seen by the ai
        // check PerceptionEventMixins.as for other event handlers
    }
}