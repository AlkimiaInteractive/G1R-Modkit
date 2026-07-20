
/**
 * State that tries to use all the freepoints in the given sequence.
 * 
 * Does not care if one freepoint failed to be used, continues with the next one.
 */
UCLASS()
class UAIState_UseFreepointsInSequence : UGothicCharacterSimulateableAIState
{
    /** Construct sequence via parameters. */
    UAIState_UseFreepointsInSequence(UAIState_UseFreepoint Entry1, 
                                     UAIState_UseFreepoint Entry2 = nullptr, 
                                     UAIState_UseFreepoint Entry3 = nullptr, 
                                     UAIState_UseFreepoint Entry4 = nullptr, 
                                     UAIState_UseFreepoint Entry5 = nullptr, 
                                     UAIState_UseFreepoint Entry6 = nullptr)
    {
        if (Entry1 != nullptr) { Sequence.Add(Entry1); }
        if (Entry2 != nullptr) { Sequence.Add(Entry2); }
        if (Entry3 != nullptr) { Sequence.Add(Entry3); }
        if (Entry4 != nullptr) { Sequence.Add(Entry4); }
        if (Entry5 != nullptr) { Sequence.Add(Entry5); }
        if (Entry6 != nullptr) { Sequence.Add(Entry6); }
    }

    /** Construct sequence via Array. */
    UAIState_UseFreepointsInSequence(TArray<UAIState_UseFreepoint> InSequence)
    {
        Sequence = InSequence;
    }

    /** Sequence of freepoint tasks to execute */
    UPROPERTY()
    TArray<UAIState_UseFreepoint> Sequence;


    UFUNCTION(BlueprintOverride)
    void DoTask()
    {
        for (auto Task : Sequence)
        {
            Log(f"Doing Task {Task}");
            WaitForTask(FAbilityTaskExecutor(Task));
            Log(f"Done!");
        }
    }
}