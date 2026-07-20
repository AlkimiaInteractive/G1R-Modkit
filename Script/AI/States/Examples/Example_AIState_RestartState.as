/**
 * This example shows how to restart the DoTask-function.
 */
UCLASS()
class UAIState_Example_RestartState : UGothicCharacterAIState 
{
    /** Defines the sequence of actions this character should do during this state. */
    UFUNCTION(BlueprintOverride)
    void DoTask()
    {
        Print(f"We're at start of state {this}!");

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
        Print(f"Player spotted! Restarting now!");

        // Calling this method will cause DoTask() to be restarted, 
        // as soon as the tasks that were running have exited.
        RestartState();
    }
}