class UAIARM_State_WatchFight : UAIAssessmentResponseModule
{
    default Rules.Add(GameplayTag::AIEvent_State_Done)
        .Then(UAIEventResponse_SwitchState(GameplayTag::AIState_AssessGoToDailyRoutine, EPerceptionCharacterType::None)
                .AddContextTag(GameplayTag::Action_Ambient_Dismiss));

    ///////////////////
    // GENERIC
    ///////////////////

    default Rules.Add(GameplayTag::AIEvent_WatchFight_Cheer_Generic)
        .Then(UAIEventResponse_VoiceReaction(GameplayTag::Sound_Voice_Reaction_WatchFight_Cheer_HeyHeyHey, EPerceptionCharacterType::SensedCharacter));

    
    ///////////////////
    // HIT
    ///////////////////
    // Hit - Neither friendly
    default Rules.Add(GameplayTag::AIEvent_WatchFight_Cheer_Hit)
        .RequireFalse(
            Assessed::InstigatorWasFriendly | 
            Assessed::AffectedWasFriendly
        )
        .Then(UAIEventResponse_VoiceReaction(GameplayTag::Sound_Voice_Reaction_WatchFight_Cheer_CheerFight, EPerceptionCharacterType::Instigator));

    // Hit - Both friendly
    default Rules.Add(GameplayTag::AIEvent_WatchFight_Cheer_Hit)
        .RequireTrue(
            Assessed::InstigatorWasFriendly |
            Assessed::AffectedWasFriendly
        )
        .Then(UAIEventResponse_VoiceReaction(GameplayTag::Sound_Voice_Reaction_WatchFight_Cheer_CheerFight, EPerceptionCharacterType::Instigator));

    // Hit - Nonfriendly hit friendly
    default Rules.Add(GameplayTag::AIEvent_WatchFight_Cheer_Hit)
        .RequireTrue(
            Assessed::AffectedWasFriendly
        )
        .RequireFalse(
            Assessed::InstigatorWasFriendly
        )
        .Then(UAIEventResponse_VoiceReaction(GameplayTag::Sound_Voice_Reaction_WatchFight_Cheer_Ooh, EPerceptionCharacterType::Instigator));

    // Hit - Friendly hit nonfriendly
    default Rules.Add(GameplayTag::AIEvent_WatchFight_Cheer_Hit)
        .RequireTrue(
            Assessed::InstigatorWasFriendly
        )
        .RequireFalse(
            Assessed::AffectedWasFriendly
        )
        .Then(UAIEventResponse_VoiceReaction(GameplayTag::Sound_Voice_Reaction_WatchFight_Cheer_CheerFriend, EPerceptionCharacterType::SensedCharacter));

    ///////////////////
    // DEFEAT
    ///////////////////
    default Rules.Add(GameplayTag::AIEvent_WatchFight_Cheer_Defeat)
        .RequireTrue(
            Assessed::InstigatorWasFriendly
        )
        .RequireFalse(
            Assessed::AffectedWasFriendly
        )
        .Then(UAIEventResponse_VoiceReaction(GameplayTag::Sound_Voice_Reaction_WatchFight_Cheer_YeahWellDone, EPerceptionCharacterType::SensedCharacter));
    
    default Rules.Add(GameplayTag::AIEvent_WatchFight_Cheer_Defeat)
        .RequireFalse(
            Assessed::AffectedWasFriendly |
            Assessed::InstigatorWasEnemy |
            Assessed::InstigatorWasFriendly
        )
        .Then(UAIEventResponse_VoiceReaction(GameplayTag::Sound_Voice_Reaction_WatchFight_Cheer_YeahWellDone, EPerceptionCharacterType::SensedCharacter));

    ///////////////////
    // KILL
    ///////////////////
    // Kill - Non friendly killed
    default Rules.Add(GameplayTag::AIEvent_WatchFight_Cheer_Kill)
        .RequireFalse(
            Assessed::AffectedWasFriendly
        )
        .Then(UAIEventResponse_VoiceReaction(GameplayTag::Sound_Voice_Reaction_WatchFight_Cheer_Death_Good, EPerceptionCharacterType::AffectedCharacter));

    // Kill - Friendly killed
    default Rules.Add(GameplayTag::AIEvent_WatchFight_Cheer_Kill)
        .RequireTrue(
            Assessed::AffectedWasFriendly
        )
        .Then(UAIEventResponse_VoiceReaction(GameplayTag::Sound_Voice_Reaction_WatchFight_Cheer_Death_Bad, EPerceptionCharacterType::AffectedCharacter));

    ///////////////////
    // FIGHT END
    ///////////////////

    /**
     * 
                AI.AssessEvent(GameplayTag::AIEvent_WatchFight_End_Killed_Bad, Perception);
            }
            else if (bWorseOffCharacterIsDead && !bWorseOffCharacterIsFriendly)
            {
                AI.AssessEvent(GameplayTag::AIEvent_WatchFight_End_Killed_Good, Perception);
            }
            else if (bWorseOffCharacterIsDefeated && bWorseOffCharacterIsFriendly)
            {
                AI.AssessEvent(GameplayTag::AIEvent_WatchFight_End_Defeated_Bad, Perception);
            }
            else if (bWorseOffCharacterIsDefeated && !bWorseOffCharacterIsFriendly)
            {
                AI.AssessEvent(GameplayTag::AIEvent_WatchFight_End_Defeated_Good, Perception);
            }
            else
            {
                AI.AssessEvent(GameplayTag::AIEvent_WatchFight_End_Run, Perception);
     */

    default Rules.Add(GameplayTag::AIEvent_WatchFight_End_Killed_Bad)
        .Then(UAIEventResponse_VoiceReaction(GameplayTag::Sound_Voice_Reaction_WatchFight_End_Killed_Bad));

    default Rules.Add(GameplayTag::AIEvent_WatchFight_End_Killed_Good)
        .Then(UAIEventResponse_VoiceReaction(GameplayTag::Sound_Voice_Reaction_WatchFight_End_Killed_Good));
    
    default Rules.Add(GameplayTag::AIEvent_WatchFight_End_Defeated_Bad)
        .Then(UAIEventResponse_VoiceReaction(GameplayTag::Sound_Voice_Reaction_WatchFight_End_Defeated_Mercy));
    
    default Rules.Add(GameplayTag::AIEvent_WatchFight_End_Defeated_Good)
        .Then(UAIEventResponse_VoiceReaction(GameplayTag::Sound_Voice_Reaction_WatchFight_End_Defeated_Victory));
    
    default Rules.Add(GameplayTag::AIEvent_WatchFight_End_Defeated_Neutral)
        .Then(UAIEventResponse_VoiceReaction(GameplayTag::Sound_Voice_Reaction_WatchFight_End_GoodFight));
    
    default Rules.Add(GameplayTag::AIEvent_WatchFight_End_Run)
        .Then(UAIEventResponse_VoiceReaction(GameplayTag::Sound_Voice_Reaction_WatchFight_End_RunCoward));

    ///////////////////
    // OTHER
    ///////////////////
    // Suicide
    // default Rules.Add(GameplayTag::AIEvent_WatchFight_Cheer_Kill) // TODO change tag
    //     .Then(UAIEventResponse_VoiceReaction(GameplayTag::Sound_Voice_Reaction_WatchFight_Suicide, EPerceptionCharacterType::AffectedCharacter));
}