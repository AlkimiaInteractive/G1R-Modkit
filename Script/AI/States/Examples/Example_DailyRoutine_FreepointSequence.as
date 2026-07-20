

// ---------------------------------------------------------------------------------------
// --- Example 1
// ---------------------------------------------------------------------------------------

/**
 * Daily routine that has a custom state to let the Cook go get some ingredients and then cook them.
 * 
 * This example uses a custom state to define what to do.
 */
UCLASS()
class UDailyRoutine_FreepointSequence_Example1 : UAIState_DailyRoutine_Human
{
    // Now this looks like a regular daily routine schedule statement. The task sequence has been put into it's own AIState below.
    default Schedule(0, 0, UAIState_Example_GoGetIngredientsAndCook(), NAME_None);
}

/** AIState that defines the cooking behavior. */
UCLASS()
class UAIState_Example_GoGetIngredientsAndCook : UGothicCharacterSimulateableAIState
{
    UFUNCTION(BlueprintOverride)
    void DoTask()
    {
        AI.TryUseFreepoint(GameplayTag::Action_Ambient_Chest_Open, TimeLimitSeconds = 30.0f);

        while (true)
        {
            AI.TryUseFreepoint(GameplayTag::Action_Crafting_Cook, FreepointSearchRadius = 5000.0f);

            // If we got a freepoint, we should not reach here since we're
            // looping that cooking action. However, we may be unlucky and no
            // freepoint is available, so wait for a bit and try again
            WaitSeconds(2.0f);
        }
    }
}



// ---------------------------------------------------------------------------------------
// --- Example 2
// ---------------------------------------------------------------------------------------

/**
 * Another way to define a sequence is using the UAIState_UseFreepointsInSequence-State. It can be subclassed to define the
 * actions that should be done during the task.
 * 
 * Creating a custom state like in Example 1 is the preferred approach though, as it's easier to read and gives more control,
 * while being equally as efficient.
 */
UCLASS()
class UDailyRoutine_FreepointSequence_Example2 : UAIState_DailyRoutine_Human
{
    // Now this looks like a regular daily routine schedule statement. The task sequence has been put into it's own AIState below.
    default Schedule(0, 0, UAIState_Example_GoGetIngredientsAndCook_SequenceSubclass(), NAME_None);
}

/** AIState that lets the NPC go get some ingedients and then lets them use the cooking stove. */
UCLASS()
class UAIState_Example_GoGetIngredientsAndCook_SequenceSubclass : UAIState_UseFreepointsInSequence
{
    default Sequence.Add(UAIState_UseFreepoint(GameplayTag::Action_Ambient_Chest_Open, InLoopCount = 1, InTimeLimit = 30.0f));
    default Sequence.Add(UAIState_UseFreepoint(GameplayTag::Action_Crafting_Cook));
}



// ---------------------------------------------------------------------------------------
// --- Example 3
// ---------------------------------------------------------------------------------------

/**
 * If you don't want to make a custom state, you could use the UAIState_UseFreepointsInSequence directly inside the
 * daily routine schedule.
 * 
 * It works by using the UAIState_UseFreepointsInSequence-State, which takes each task to do as a parameter like so:
 * 
 *     UAIState_UseFreepointsInSequence(UAIState_UseFreepoint(GameplayTag::Action_Ambient_DoThis, InLoopCount = 1),
 *                                      UAIState_UseFreepoint(GameplayTag::Action_Ambient_DoThat, InLoopCount = 1),
 *                                      UAIState_UseFreepoint(GameplayTag::Action_Ambient_DoSomethingElse),
 * 
 * This example is using a utility function (which could be put into a base-class for all Cooks) to make the code more readable.
 */
UCLASS()
class UDailyRoutine_FreepointSequence_Example3 : UAIState_DailyRoutine_Human
{
    /** Utility function to define cooking. Maybe this can be put into a base-class for all daily routines used by cooks? */
    UAIState_UseFreepointsInSequence GoGetIngredientsAndCook()
    {
        return UAIState_UseFreepointsInSequence(UAIState_UseFreepoint(GameplayTag::Action_Ambient_Chest_Open, InLoopCount = 1, InTimeLimit = 30.0f), 
                                                UAIState_UseFreepoint(GameplayTag::Action_Crafting_Cook));
    }

    default Schedule(0, 0, GoGetIngredientsAndCook(), NAME_None);
}



// ---------------------------------------------------------------------------------------
// --- Example 4
// ---------------------------------------------------------------------------------------

/**
 * This example shows the same as Example 3, but without utility function, and with a very looong line.

 * Sadly, the `default`-statements can only go on one line, which is why we cannot actually break it up nicely.
 * One of the other approaches should be preffered to this. It's only listed here for completeness.
 */
UCLASS()
class UDailyRoutine_Example_FreepointSequence_LongLine : UAIState_DailyRoutine_Human
{
    // This is a looong line. It will first make the NPC open a chest, and then go to cook.
    default Schedule(0, 0, UAIState_UseFreepointsInSequence(UAIState_UseFreepoint(GameplayTag::Action_Ambient_Chest_Open, InLoopCount = 1, InTimeLimit = 30.0f), UAIState_UseFreepoint(GameplayTag::Action_Crafting_Cook)), NAME_None);
}
