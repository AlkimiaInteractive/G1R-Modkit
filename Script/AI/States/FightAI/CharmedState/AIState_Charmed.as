UCLASS()
class UAIState_Charmed : UAIState_PerceptionResponse
{
    default OwnedGameplayTags.AddTag(GameplayTag::AIState_Charmed);
    default AIStateTag = GameplayTag::AIState_Charmed;
    default SwitchAIStateMode = ESwitchAIStateMode::Interrupt;
    default EndInteractionMode = ESwitchAIStateEndInteractionMode::None;

    UPROPERTY()
    float WaitTime = 4.0f;

    // default AssessmentModuleClass = UAIARM_State_WatchFight;

    UFUNCTION(BlueprintOverride)
    void DoTask()
    {
        Super::DoTask();
        
        auto CharmSpellCaster = RememberedPerception.Instigator.CharacterState;
        
        if (!IsValid(CharmSpellCaster) || !IsValid(CharmSpellCaster) || !CharacterState.Character.Perception.CanSense(CharmSpellCaster.Character) ||
            (Self.IsSitting() && !CharacterState.Character.Perception.CanSee(CharmSpellCaster.Character)))
        {
            if (AI.CharacterState.Voiceline.HasVoicelineFor(GameplayTag::Sound_Voice_Reaction_Interjection_Surprise))
            {
                AI.Say(GameplayTag::Sound_Voice_Reaction_Interjection_Surprise);
            }

            WaitTime = 2.5f;

            if (!Self.IsSitting())
            {
                RememberedPerception.EffectCauserTags.AddTag(GameplayTag::Action_Ambient_Dismiss);
            }

            WaitAndEndCharmedState();
            return;
        }

        if (IsValid(CharmSpellCaster) && !CharacterState.Character.Perception.CanSee(CharmSpellCaster.Character))
        {
            if (AI.CharacterState.Voiceline.HasVoicelineFor(GameplayTag::Sound_Voice_Address_Greeting))
            {
                WaitForLastTaskToEnd(
                    AI.TurnToCharacter(CharmSpellCaster.Character),
                    AI.Say(GameplayTag::Sound_Voice_Address_Greeting, EPerceptionNoiseLoudness::Moderate, CharmSpellCaster.Character)
                );
            }
            else
            {
                AI.TurnToCharacter(CharmSpellCaster.Character);
            }


            WaitAndEndCharmedState();
            return;
        }

        if (IsValid(CharmSpellCaster) && AI.CharacterState.Voiceline.HasVoicelineFor(GameplayTag::Sound_Voice_Address_Greeting))
        {
            AI.Say(GameplayTag::Sound_Voice_Address_Greeting, EPerceptionNoiseLoudness::Moderate, CharmSpellCaster.Character);
        }
        WaitAndEndCharmedState();        
    }

    void WaitAndEndCharmedState()
    {
        AI.WaitSeconds(WaitTime);
        AI.AssessEvent(GameplayTag::AIEvent_State_Done, RememberedPerception);

        WaitSeconds(0.3f);
        EndTaskAsSuccess();
    }

    FString GetDisplayName() const override
    {
        return "Charmed State";
    }
}