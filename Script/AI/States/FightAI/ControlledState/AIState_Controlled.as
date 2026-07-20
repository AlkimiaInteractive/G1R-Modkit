UCLASS()
class UAIState_Controlled : UAIState_PerceptionResponse
{
    default OwnedGameplayTags.AddTag(GameplayTag::AIState_Controlled);
    default OwnedGameplayTags.AddTag(GameplayTag::Debuff_Blind);
    default OwnedGameplayTags.AddTag(GameplayTag::Debuff_Deaf);
    default OwnedGameplayTags.AddTag(GameplayTag::Debuff_Anosmic);
    
    default AIStateTag = GameplayTag::AIState_Controlled;
    default SwitchAIStateMode = ESwitchAIStateMode::EndState_Cancel;
    default EndInteractionMode = ESwitchAIStateEndInteractionMode::EndAnyOngoingInteraction_Instant;
    default bStopTalking = true;

    default bStopTargetingOnStart = true;
    default bTargetCharacterOfInterest = false;

    UPROPERTY()
    bool bEndControlledInteraction = false;

    UFUNCTION(BlueprintOverride)
    void SetupPerceptions(UCharacterPerceptionComponent Perception)
    {
        Perception.SpellEffectEndedOnSelf_Control().PerceptionGained.BindUFunction(this, n"PerceptionEvent_ControlEffectEnded");
    }

    UFUNCTION()
    private void PerceptionEvent_ControlEffectEnded(const FRememberedPerception&in Perception,
                                                    const FPerceptionShortTermMemory&in Memory)
    {
        bEndControlledInteraction = true;
    }

    UFUNCTION()
    bool ShouldContinueInteraction() const
    {
        return !bEndControlledInteraction;
    }

    UFUNCTION(BlueprintOverride)
    void DoTask()
    {
        bool bIsClimbing = CharacterState.Character.IsClimbingLadderOrWall();

        Super::DoTask();
        
        if (!bIsClimbing)
        {
            // Print("Starting Controlled interaction");
            AI.ControlledHere().While(n"ShouldContinueInteraction");
        }
        else
        {
            AI.EndAnyOngoingInteractionInstant();
        }

        while (Self.HasGameplayTag(GameplayTag::Debuff_Controlled))
        {            
            WaitOneTick();
        }

        // Print("Reached end of controlled state");

        while (!bShouldExitState)
        {            
            WaitOneTick();
        }
    }

    FString GetDisplayName() const override
    {
        return "Controlled State";
    }

    UFUNCTION(BlueprintOverride)
    void OnExternalCancel()
    {
        
    }
}