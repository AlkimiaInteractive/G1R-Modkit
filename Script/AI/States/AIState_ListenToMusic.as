
UCLASS(Abstract)
class UAIState_Human_ReactToAreaEvent : UGothicCharacterAIState
{

    /** Area event tag we're reacting to. */
    UPROPERTY(EditDefaultsOnly)
    FGameplayTag AreaEventTag;

    UPROPERTY(EditDefaultsOnly)
    float ReactionDelaySecondsMin = 1.0f;
    
    UPROPERTY(EditDefaultsOnly)
    float ReactionDelaySecondsVariance = 1.0f;

    /** 
     * How long do we have to be in this state to allow doing the DoWhenEventStopped() action? 
     * If we were in here less time than this, we skip it.
     */
    UPROPERTY(EditDefaultsOnly)
    float MinTimeInStateForEndReaction = 3.0f;

    /** Override to specify what should happen when the event started. (Called once in the beginning of the state) */
    void DoWhenEventStarted()
    {

    }

    /** Override to specify what should happen when the event stopped. */
    void DoWhenEventStopped()
    {

    }

    UFUNCTION(BlueprintOverride)
    void DoTask() final
    {
        DoWhenEventStarted();

        if (RuntimeSeconds > MinTimeInStateForEndReaction)
        {
            DoWhenEventStopped();
        }
    }

    UFUNCTION(BlueprintOverride)
    void OnGracefulExitRequested()
    {
        bShouldExitState = true;
        StopWaitingAndContinueTask();
    }
}

class UAIState_ReactToAreaEvent_ListenToMusic : UAIState_Human_ReactToAreaEvent
{
    default AreaEventTag = GameplayTag::Sound_Music;

    void DoWhenEventStarted() override
    {
        while (!bShouldExitState)
        {
            AI.Dance();
        }
    }

    void DoWhenEventStopped() override
    {
        AI.Pee(Duration = 1.0f);
    }
}