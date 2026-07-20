/**
 * This example shows how to define a simple custom state that uses a freepoint.
 */
UCLASS()
class UAIState_Example_UseFreepoint : UGothicCharacterAIState 
{
    /** Defines the sequence of actions this character should do during this state. */
    UFUNCTION(BlueprintOverride)
    void DoTask()
    {
        while (true)
        {
            AI.TryUseFreepoint(GameplayTag::Action_Interact_Sit_Chair, TimeLimitSeconds = 20.0f, FreepointSearchRadius = 2500.0f);
            
            WaitSeconds(1.0f);
        }
    }
}

/** Shows how to use freepoints at other places (same as using regular TryUseFreepoint, but with included "goto location" task) */
UCLASS()
class UAIState_Example_UseFreepointSomewhereElse : UGothicCharacterAIState 
{
    /** Defines the sequence of actions this character should do during this state. */
    UFUNCTION(BlueprintOverride)
    void DoTask()
    {
        while (true)
        {
            AI.TryUseFreepointAt(GameplayTag::Action_Interact_Sit_Chair, n"WP_SOMEWHERE_ELSE", TimeLimitSeconds = 20.0f, FreepointSearchRadius = 2500.0f);
            
            WaitSeconds(1.0f);
            
            AI.TryUseFreepointAt(GameplayTag::Action_Interact_Sit_Chair, n"WP_ANOTHER_PLACE", TimeLimitSeconds = 20.0f, FreepointSearchRadius = 2500.0f);
        }
    }
}

/** Shows how to search for Freepoints, without actually using them. */
UCLASS()
class UAIState_Example_UseFreepoint_Query : UGothicCharacterAIState 
{
    /** Defines the sequence of actions this character should do during this state. */
    UFUNCTION(BlueprintOverride)
    void DoTask()
    {
        // Example 1: Find any freepoint that can do the given action at a waypoint
        if (AI.DoesFreepointExistAt(n"WP_SOMEWHERE", 5000, GameplayTag::Action_Interact_Sit_Chair))
        {
            Print ("Freepoint exists!");
        }


        // Example 2: Same as 1, but the freepoint must also be currently available!
        if (AI.IsFreepointAvailableAt(n"WP_SOMEWHERE", 5000, GameplayTag::Action_Interact_Sit_Chair))
        {
            Print ("Freepoint (that is also available) exists!");
        }


        // Example 3: Find a freepoint and get a reference to it, so we can do stuff with it!
        FInteractionSpotHandle FoundFreepoint;
        if (AI.FindFreepointAtWaypointInRadius(n"WP_SOMEWHERE", 2000.0f, GameplayTag::Action_Interact_Sit_Chair, FoundFreepoint))
        {
            Print("We found a freepoint! Reserve it an go towards!");

            FInteractionSpotClaimToken ClaimToken = FoundFreepoint.Claim(AI.CharacterState, GameplayTag::Action_Interact_Sit_Chair);
            if (ClaimToken.IsValid())
            {
                AI.GotoFreepoint(FoundFreepoint);
            }
        }
    }
}