UCLASS(Abstract)
class UAIState_AlertCrime : UAIState_PerceptionResponse
{
    default SwitchAIStateMode = ESwitchAIStateMode::Interrupt;
    default EndInteractionMode = ESwitchAIStateEndInteractionMode::None;

    FGameplayTag AlertVoicelineTag;
    FGameplayTag AlertEventTag;
    FGameplayTag VictimDirectAssessmentEventTag;
     
    UFUNCTION(BlueprintOverride)
    void DoTask()
    {
        auto Victim = RememberedPerception.Affected.Character;
        auto Thief = RememberedPerception.Instigator.Character;

        if (!AlertVoicelineTag.IsValid() || 
            !AlertEventTag.IsValid() ||
            !RememberedPerception.EventTag.MatchesTag(GameplayTag::Crime) ||
            !AI.CharacterState.Voiceline.HasVoicelineFor(AlertVoicelineTag) ||
            !IsValid(Victim) || !IsValid(Thief))
        {
            EndTaskAsFailure();
            return;
        }

        Super::DoTask();

        AlertVictimOfCrime(Victim, Thief);
        AI.Say(AlertVoicelineTag, EPerceptionNoiseLoudness::VeryLoud, Victim);
    }

    void AlertVictimOfCrime(AGothicCharacter Victim, AGothicCharacter Thief)
    {
        /// Alert the victim with event only if they're AI 
        auto VictimAI = Victim.GetCharacterAI();

        if (!IsValid(VictimAI))
            return;

        VictimAI.ForceHearingPerception(AI.Self.CharacterState);

        WaitOneTick();

        if (VictimDirectAssessmentEventTag.IsValid())
        {
            FRememberedPerception FakePerception;
            FakePerception.EventTag = VictimDirectAssessmentEventTag;
            FakePerception.Origin.Character = AI.Self;
            FakePerception.Target.Character = Victim;
            FakePerception.Instigator.Character = Thief;
            FakePerception.Affected.Character = Victim;
            VictimAI.AssessEvent(VictimDirectAssessmentEventTag, FakePerception);
            return;
        }

        auto PerceptionSystem = UPerceptionSystem::Get();
        PerceptionSystem.BroadcastPerceptionEvent (
            AlertEventTag, 
            AI.Self.ActorLocation, 
            AI.Self,
            Victim, 
            Thief, 
            Victim, 
            nullptr, 
            FGameplayTagContainer());
    }
}