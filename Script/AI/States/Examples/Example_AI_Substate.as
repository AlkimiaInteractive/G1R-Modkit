/**
 * This example shows how to execute an AI state as part of another task. See UAIState_Example_UsingSubstate.
 * 
 * It allows you to break complex actions down into multiple simpler AIStates, which can then be combined lateron.
 */

/** 
 * Random example that lets the character go up and down until the player is nearby.
 * 
 * This is really just a random substate, that we need as part of the example. See
 * the state below on how to use this one as a substate.
 */
UCLASS()
class UAIState_Example_WalkUpAndDownUntilPlayerIsHere : UGothicCharacterAIState
{
    UFUNCTION(BlueprintOverride)
    void DoTask()
    {
        while (true)
        {
            AI.GoLeft(100.0f);
            AI.GoRight(100.0f);
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
        EndTaskAsSuccess();
    }
}

/** 
 * This function can be used in any other state or task, from any file by calling 
 *     
 *     AI.Example_WalkUpAndDownUntilPlayerIsHere(); 
 * 
 * It will make the calling function wait until the AIState that it contains has ended.
 */
mixin FAbilityTaskExecutor Example_WalkUpAndDownUntilPlayerIsHere(UGameplayAbility_CharacterAI AI, float TimeLimitSeconds = -1.0f)
{
    return FAbilityTaskExecutor(UAIState_Example_WalkUpAndDownUntilPlayerIsHere(), TimeLimitSeconds);
}

/***********************************************************************************
 * The mixin-function that was defined above can now be used in any AIState like so:
 ***********************************************************************************/

UCLASS()
class UAIState_Example_UsingSubstate : UGothicCharacterAIState 
{
    /** Defines the sequence of actions this character should do during this state. */
    UFUNCTION(BlueprintOverride)
    void DoTask()
    {
        AI.Example_WalkUpAndDownUntilPlayerIsHere(); // <- using the mixin we've defined above
        
        WaitForTask(UAIState_Example_WalkUpAndDownUntilPlayerIsHere()); // <- Without the mixin, doesn't look as nice but also works

        // Do some other stuff
        AI.DrawMeleeWeapon();
        AI.AttackLeft();
        AI.AttackRight();
    }
}