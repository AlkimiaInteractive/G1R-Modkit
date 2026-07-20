bool DD(bool b, uint64 DebugId)
{
    return b;
}

FText LocText(FString TextId)
{
    return FText(TextId.ToLower());
}


/** Lets the given character remember the given conversation topic. */
UFUNCTION(BlueprintCallable)
mixin void RememberTopic(AGothicCharacterState CharacterState, TSubclassOf<UConversationTopic> Topic)
{
    CharacterState.Remember(Topic.Get().Name);
}

/** Returns true if the character has knowledge of the given conversation topic. */
UFUNCTION(BlueprintCallable)
mixin bool RemembersTopic(const AGothicCharacterState CharacterState, TSubclassOf<UConversationTopic> Topic)
{
    return CharacterState.Remembers(Topic.Get().Name);
}

/** Temporary overload while we don't have all guilds as tag */
UFUNCTION(BlueprintCallable)
mixin bool HasKnowledgeOfId(const AGothicCharacterState CharacterState, FName Topic) { Warning("Unimplemented AGothicCharacterState::HasKnowledgeOfId"); return false; }

UFUNCTION(BlueprintCallable)
mixin bool HasKnowledgeOf(const AGothicCharacterState CharacterState, TSubclassOf<UConversationTopic> Topic) 
{ 
    return CharacterState.RemembersTopic(Topic);
}


UCLASS()
class UDialogTopic
{
    FName ForCharacter;
    int Priority;
    FText Caption;

}

event void FStoryChapterChangedEvent(UStory Story, int32 NewChapter);

UCLASS(Abstract)
class UStory : UGameStory
{
    default ChapterNotificationWidgetClass = TSoftClassPtr<UHUDNotificationWidgetBase>(FSoftObjectPath("/Game/UI/Notifications/HighNotifications/W_Notification_NewChapter_2.W_Notification_NewChapter_2_C"));

    /** Broadcast whenever the chapter changes via story progression. */
    UPROPERTY()
    FStoryChapterChangedEvent OnChapterChanged;



   

    int32 GetCalendar_Today() const property
    {
        return GameTime.CurrentGameTime.Day;
    }

    int32 GetCalendar_TodayWithTolerance() const property
    {
        // From B_SetDayTolerance
        if (GameTime.CurrentClockTime.Hour >= 22)
        {
            return Calendar_Today + 1;
        }
        else
        {
            return Calendar_Today;
        }
    }

    int32 GetCalendar_Yesterday() const property
    {
        return GameTime.CurrentGameTime.Day - 1;
    }

    int32 GetCalendar_TwoDaysAgo() const property
    {
        return GameTime.CurrentGameTime.Day - 2;
    }

    int32 GetCalendar_ThreeDaysAgo() const property
    {
        return GameTime.CurrentGameTime.Day - 3;
    }

    int32 GetCalendar_ThreeDaysFromNow() const property
    {
        return GameTime.CurrentGameTime.Day + 3;
    }

    int32 GetCalendar_Tomorrow() const property
    {
        return GameTime.CurrentGameTime.Day + 1;
    }

    int32 GetCalendar_TwoDaysFromNow() const property
    {
        return GameTime.CurrentGameTime.Day + 2;
    }

    UFUNCTION(BlueprintCallable)
    void WorldEvent(FName EventName)
    {
        bool bEventExists = World.LevelScriptActor.RaiseLevelScriptEvent(EventName);
        check(bEventExists);
    }

    UFUNCTION(BlueprintOverride)
    void HandleChapterChanged(int32 NewChapter)
    {
        UWorldPointManager::Get().CallGlobalEvent(FName(f"{Class.Name}_EnteredChapter_{NewChapter}"));
        UWorldPointManager::Get().CallNewChapter(NewChapter);

        RequestChapterHUDNotification(NewChapter);
        OnChapterChanged.Broadcast(this, NewChapter);
    }
}

/** Opens UI for the player to select something. Executes the selected sub-choice and continues afterwards. */
mixin void Subdialog(UConversationTopic Topic, 
                TSubclassOf<UConversationTopic> T1, 
                TSubclassOf<UConversationTopic> T2 = nullptr, 
                TSubclassOf<UConversationTopic> T3 = nullptr, 
                TSubclassOf<UConversationTopic> T4 = nullptr, 
                TSubclassOf<UConversationTopic> T5 = nullptr, 
                TSubclassOf<UConversationTopic> T6 = nullptr, 
                TSubclassOf<UConversationTopic> T7 = nullptr, 
                TSubclassOf<UConversationTopic> T8 = nullptr,
                TSubclassOf<UConversationTopic> T9 = nullptr,
                TSubclassOf<UConversationTopic> T10 = nullptr,
                TSubclassOf<UConversationTopic> T11 = nullptr,
                TSubclassOf<UConversationTopic> T12 = nullptr,
                TSubclassOf<UConversationTopic> T13 = nullptr,
                TSubclassOf<UConversationTopic> T14 = nullptr,
                TSubclassOf<UConversationTopic> T15 = nullptr,
                TSubclassOf<UConversationTopic> T16 = nullptr,
                TSubclassOf<UConversationTopic> T17 = nullptr,
                TSubclassOf<UConversationTopic> T18 = nullptr,
                TSubclassOf<UConversationTopic> T19 = nullptr,
                TSubclassOf<UConversationTopic> T20 = nullptr
                )
{

    if (!IsValid(Topic))
        return;

    TArray<TSubclassOf<UConversationTopic>> Topics;

    if (T1 != nullptr) { Topics.Add(T1); }
    if (T2 != nullptr) { Topics.Add(T2); }
    if (T3 != nullptr) { Topics.Add(T3); }
    if (T4 != nullptr) { Topics.Add(T4); }
    if (T5 != nullptr) { Topics.Add(T5); }
    if (T6 != nullptr) { Topics.Add(T6); }
    if (T7 != nullptr) { Topics.Add(T7); }
    if (T8 != nullptr) { Topics.Add(T8); }
    if (T9 != nullptr) { Topics.Add(T9); }
    if (T10 != nullptr) { Topics.Add(T10); }
    if (T11 != nullptr) { Topics.Add(T11); }
    if (T12 != nullptr) { Topics.Add(T12); }
    if (T13 != nullptr) { Topics.Add(T13); }
    if (T14 != nullptr) { Topics.Add(T14); }
    if (T15 != nullptr) { Topics.Add(T15); }
    if (T16 != nullptr) { Topics.Add(T16); }
    if (T17 != nullptr) { Topics.Add(T17); }
    if (T18 != nullptr) { Topics.Add(T18); }
    if (T19 != nullptr) { Topics.Add(T19); }
    if (T20 != nullptr) { Topics.Add(T20); }


    while (true)
    {
        auto Task = TaskHandleSubdialog(Topic.Other.AI, Topics, Topic);
        
        auto Result = FAbilityTaskExecutor(Task).Result;

        if (Task.bReturnToThis)
            continue;

        // If there was an exception during the selected subtopic, just show the selection again. Since we cannot really roll-back what happened
        // and we cannot know what actions the subtopic did, we'll just revert the knowledge and try again. If that soft-locks the player because
        // it happens again and again there is not much more we can do other than having the player exit the game or we would risk inconsistent 
        // story state, which could break story progression at some point. Since script exceptions should never happen if everything goes right,
        // hopefully not too many players will encounter this, or it will work on the next attempt, or they can just choose another topic and 
        // continue as normal.
        if (Result != EGenericTaskResult::Success)
            continue;

        break;
    }
}

mixin void SayViaGlobalVoice(UConversationTopic Topic, FText Speaker, FText Text, float SubtitleExtraSeconds = 1.0f)
{

#ifdef WITH_STORY_G1R
    float32 AudioDurationSeconds = 0.0f;
    const UGothicAudioSettings Settings = UGothicAudioSettings::GetAudioSettings();

    FText Sleeper = LocText("ST_GOD_SLEEPER");

    if (Speaker.ToString() == Sleeper.ToString())
    {
        UFMODEvent ConversationEvent = FAssetPreload::BlockingLoad(Settings.FMODEvent_Possessed_2D);
        auto AudioComponent = Conversation::PlayLocalizedVoiceline2D(ConversationEvent, Text, AudioDurationSeconds);

        if (!IsValid(AudioComponent))
            return;

        AudioComponent.SetParameter(Settings.PossessedIntensityParameter, Settings.PossessedIntensityValue2D);

        Conversation::ShowTopSubtitle(Speaker, Text, AudioDurationSeconds + SubtitleExtraSeconds);
        Topic.Self.RememberVoiceline(Text);

        if (IsValid(Topic.Other))
        {
            Topic.Other.RememberVoiceline(Text);
        }

        while (AudioComponent.IsPlaying())
        {
            FAbilityTaskExecutor(TaskWaitSeconds(Topic.Self.AI, 0.1f));
        }
    }
    else
    {
        UFMODEvent ConversationEvent = FAssetPreload::BlockingLoad(Settings.FMODEvent_Possessed_3D);
        auto AudioComponent = Conversation::PlayLocalizedVoiceline2D(ConversationEvent, Text, AudioDurationSeconds);

        if (!IsValid(AudioComponent))
            return;
        
        AudioComponent.SetParameter(Settings.PossessedIntensityParameter, Settings.PossessedIntensityValue3D);

        Conversation::ShowTopSubtitle(Speaker, Text, AudioDurationSeconds + SubtitleExtraSeconds);
        Topic.Self.RememberVoiceline(Text);

        if (IsValid(Topic.Other))
        {
            Topic.Other.RememberVoiceline(Text);
        }

        while (AudioComponent.IsPlaying())
        {
            FAbilityTaskExecutor(TaskWaitSeconds(Topic.Self.AI, 0.1f));
        }
    }

    return;

#endif
}