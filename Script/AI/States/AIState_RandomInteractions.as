

/**
 * Performs random interactions with the following priority:
 * 
 *  1. Try find normal Action with freepoint
 *  2. Try find normal Action without freepoint
 *  3. Try find backup Action with freepoint
 *  4. Try find backup Action without freepoint
 *  5. Wait
 */
class UAIState_RandomInteractions : UAIState_RandomInteractions_RandomSpots
{
    /** Allows blocking path while the character is stationary. */
    UPROPERTY()
    bool bAllowBlockingPathWhileStationary = false;

    /** When stationary blocking is allowed, controls whether the full escalation ladder (Wait -> Warning -> Combat) runs. False = animation/interjection only, no escalation. */
    UPROPERTY()
    bool bAllowBlockingPathEscalationWhileStationary = false;

    UPROPERTY()
    TOptional<float> OverrideBlockingPathPersonalSpaceRadius;

    UPROPERTY()
    FName BlockedPathWaitHoldMontageSection = NAME_None;

    default SpotReachRadius = 0.0f;
}

/** 
 * Performs random interactions on the given spots. Will visit the spot one after the other. 
 * When the spot does not support any of the given interactions, it will move to the next one
 * This is looping: When reaching the last spot in the list, it will target the first again
 */
class UAIState_RandomInteractions_OnChainedSpots : UAIState_RandomInteractions_ChainedSpots
{
    default SpotReachRadius = 0.0f;
    default ChanceToDoActionOnSpot = 1.f;   // 1.f => do an action on every spot that you reach

    // examples:
    // default SpotNames.Add(FName("FreepointActor_1"));
    // default SpotNames.Add(FName("FreepointActor_2"));

    // default Interactions.Add(FInteraction(GameplayTag::Action_Ambient_GuardWatch));
    // default Interactions.Add(FInteraction(GameplayTag::Action_Ambient_Pee));
}