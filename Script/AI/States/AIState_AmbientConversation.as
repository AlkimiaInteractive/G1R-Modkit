class UAIState_AmbientConversation : UGothicCharacterSimulateableAIState
{
    UAIState_AmbientConversation(FName InTopicName, 
                                 TSubclassOf<UCharacterAIState> InDoAfterConversation = UAIState_StandAround::StaticClass(),
                                 TSubclassOf<UCharacterAIState> InDoWhileWaitingForPlayer = nullptr)
    {
        TopicName = InTopicName;
        DoAfterConversation = InDoAfterConversation;
        DoWhileWaitingForPlayer = InDoWhileWaitingForPlayer;
    }

    UPROPERTY()
    FName TopicName;

    protected AGothicCharacterState WithCharacter;

    UPROPERTY()
    bool bPlayerMustHear = false;

    UPROPERTY()
    bool bPlayerMustSee = true;

    UPROPERTY()
    float MustBeSeenByPlayerForSeconds = 3.0f;

    UPROPERTY()
    EPerceptionNoiseLoudness HearingRangeCheckLoudness = EPerceptionNoiseLoudness::Moderate;

    UPROPERTY()
    TSubclassOf<UCharacterAIState> DoAfterConversation;
    
    UPROPERTY()
    TSubclassOf<UCharacterAIState> DoWhileWaitingForPlayer;

    private UConversationTopicSet TopicSet;    

    UFUNCTION(BlueprintOverride)
    void Activate()
    {
        auto TopicToActClass = UConversationTopic::FindTopicClassByName(TopicName);

        if (TopicToActClass == nullptr)
        {
            Throw(f"Topic {TopicName.ToString()} does not exist");
            EndTaskAsFailure();
            return;
        }

        TopicSet = UConversationTopicSet::NewTopicSet(this);
        TopicSet.AddTopic(TopicToActClass);

        WithCharacter = AGothicCharacterState::FindByUniqueName(Cast<UConversationTopic>(TopicToActClass.Get().GetDefaultObject()).WithCharacter);
    }

    UFUNCTION(BlueprintOverride)
    void DoTask()
    {
        AI.GotoPreferredLocation();

        while (true)
        {
            if (IsInDailyRoutineSimulation())
            {
                ReportTimeSkipWhateverIsLeft();
                WaitSeconds(5.0f);
                continue;
            }

            if (!HasTalkedAtLeastOnce())
            {
                if (DoWhileWaitingForPlayer.IsValid() && ShouldWaitForPlayer())
                {
                    DoSubstate(DoWhileWaitingForPlayer).While(n"ShouldWaitForPlayer");
                }

                if (ShouldWaitForPlayer())
                {
                    WaitOneTick();
                    continue;
                }
            }

            DoConversation();
        }
    }

    UFUNCTION()
    bool ShouldWaitForPlayer() const
    {
        if (bPlayerMustHear && !Self.Perception.IsInHearingRangeOfAnyPlayer(HearingRangeCheckLoudness))
            return true;

        if (bPlayerMustSee && !Self.Perception.CanBeSeenByAnyPlayer(MustBeSeenByPlayerForSeconds))
            return true;

        return false;
    }

    void DoConversation()
    {
        AI.GotoPosition(AI.PreferredLocation.CenterPoint);
        AI.TurnToCharacter(WithCharacter);

        if (WithCharacter.Character == nullptr)
            return;

        if (TopicSet.GetAvailableRootTopics(WithCharacter.Character).Num() > 0)
        {
            AI.DoAmbientConversationWith(
                WithCharacter, 
                UConversationTopic::FindTopicClassByName(TopicName));
            
            DoSubstate(DoAfterConversation);
        }
    }

    bool HasTalkedAtLeastOnce() const
    {
        auto TopicToActClass = UConversationTopic::FindTopicClassByName(TopicName);

        return CharacterState.HasKnowledgeOf(TopicToActClass);
    }

    UFUNCTION(BlueprintOverride)
    void HandleAvatarChanged()
    {
        if (IsInDailyRoutineSimulation())
        {
            RestartState();
        }
    }

#if WITH_IMGUI
    UFUNCTION(BlueprintOverride)
    void DisplayImGui()
    {
        ImGui::Value("Player can hear", Self.Perception.IsInHearingRangeOfAnyPlayer(HearingRangeCheckLoudness));
        ImGui::Value("Player can see", Self.Perception.CanBeSeenByAnyPlayer(MustBeSeenByPlayerForSeconds));
    }
#endif
}

UCLASS()
class UDailyRoutine_Test_Conversation_RatfordDrax : UAIState_DailyRoutine_Human
{
    default Schedule(0, 0, UAIState_AmbientConversation(n"ChoiceDrax5567"), NAME_None);
}


UCLASS()
class UDailyRoutine_Test_Conversation_DiegoWhistler : UAIState_DailyRoutine_Human
{
    default Schedule(0, 0, UAIState_AmbientConversation(n"TalkAboutEZDelivery"), n"FP_Diego_TalkingSpot");
}