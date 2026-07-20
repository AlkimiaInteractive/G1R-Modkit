UCLASS()
class UAIState_Paralyzed : UAIState_Conflict
{
    default OwnedGameplayTags.AddTag(GameplayTag::AIState_Conflict_Paralyzed);
    default AIStateTag = GameplayTag::AIState_Conflict_Paralyzed;
    default SwitchAIStateMode = ESwitchAIStateMode::EndState_Cancel;
    default EndInteractionMode = ESwitchAIStateEndInteractionMode::EndAnyOngoingInteraction_Instant;
    default bStopTalking = true;

    UFUNCTION(BlueprintOverride)
    void DoTask()
    {
        Super::DoTask();
        
        while(!bShouldExitState)
        {
            if (!Self.HasGameplayTag(GameplayTag::Debuff_Paralyzed))
            {
                FRememberedPerception FakePerception;
                AI.AssessEvent(GameplayTag::AIEvent_State_Done, FakePerception);
                WaitSeconds(1.0f);
                EndTaskAsSuccess();
                return;
            }

            WaitOneTick();
        }
    }

    FString GetDisplayName() const override
    {
        return "Paralyzed State";
    }
}