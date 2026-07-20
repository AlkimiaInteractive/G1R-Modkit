UCLASS()
class UAIState_ReactToTakingDamage : UAIState_PerceptionResponse
{
    default OwnedGameplayTags.AddTag(GameplayTag::AIState_Conflict_ReactToTakingDamage);
    default AIStateTag = GameplayTag::AIState_Conflict_ReactToTakingDamage;
    default SwitchAIStateMode = ESwitchAIStateMode::EndState_Cancel;
    default EndInteractionMode = ESwitchAIStateEndInteractionMode::EndAnyOngoingInteraction_Instant;
    default bStopTalking = true;
    default AssessmentModuleClass = UAIARM_ReactToTakingDamage;

    UPROPERTY()
    bool bIsDone = false;

    UFUNCTION(BlueprintOverride)
    void DoTask()
    {
        Super::DoTask();

        if (!StartingAssessmentTag.IsValid())
        {
            StartingAssessmentTag = RememberedPerception.EventTag;
        }
        
        while(!bShouldExitState)
        {
            if (!bIsDone)
            {
                bIsDone = true;
                AI.AssessEvent(StartingAssessmentTag, RememberedPerception);
                WaitSeconds(1.0f);
            }

            WaitOneTick();

            if (TimeTaskActivated.AgeInRealtimeSeconds > 3.0f)
                break;
        }

        if (!bIsDone)
        {
            AI.AssessEvent(GameplayTag::AIEvent_State_Done, RememberedPerception);
            WaitSeconds(1.0f);
        }
    }

    FString GetDisplayName() const override
    {
        return "ReactToTakingDamage State";
    }
}