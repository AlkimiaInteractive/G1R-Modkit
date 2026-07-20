class UAIARM_ToFollowCharacter : UAIAssessmentResponseModule
{
    default BlockIfHasAnyOwnedTags.AddTag(GameplayTag::AIState_Conflict);
    default BlockIfHasAnyOwnedTags.AddTag(GameplayTag::Debuff_Fear);
    default BlockIfHasAnyOwnedTags.AddTag(GameplayTag::AIState_Follow);
    default BlockIfHasAnyOwnedTags.AddTag(GameplayTag::Debuff_Defeated);
    default BlockIfHasAnyOwnedTags.AddTag(GameplayTag::State_Defeated);

    default Rules.Add(GameplayTag::AIEvent_Seen_FollowCharacter)
        .Then(UAIEventResponse_VoiceReaction(GameplayTag::Sound_Voice_Conversation_DailyRoutine_Follow_Wait, EPerceptionCharacterType::SensedCharacter))
        .Then(UAIEventResponse_ForceAwarenessOfCharacter(EPerceptionSense::See, EPerceptionCharacterType::SensedCharacter))
        .Then(UAIEventResponse_ForceAwarenessOfCharacter(EPerceptionSense::Smell, EPerceptionCharacterType::SensedCharacter))
        .Then(UAIEventResponse_ForceAwarenessOfCharacter(EPerceptionSense::Hear, EPerceptionCharacterType::SensedCharacter))
        .Then(UAIEventResponse_SwitchState(GameplayTag::AIState_Follow, EPerceptionCharacterType::SensedCharacter));
    
    default Rules.Add(GameplayTag::AIEvent_StartFollowing)
        .Then(UAIEventResponse_ForceAwarenessOfCharacter(EPerceptionSense::See, EPerceptionCharacterType::SensedCharacter))
        .Then(UAIEventResponse_ForceAwarenessOfCharacter(EPerceptionSense::Smell, EPerceptionCharacterType::SensedCharacter))
        .Then(UAIEventResponse_ForceAwarenessOfCharacter(EPerceptionSense::Hear, EPerceptionCharacterType::SensedCharacter))
        .Then(UAIEventResponse_SwitchState(GameplayTag::AIState_Follow, EPerceptionCharacterType::SensedCharacter));
}

class UAIARM_FollowCharacter_ToDailyRoutine : UAIAssessmentResponseModule
{
    default RequireAnyOwnedTags.AddTag(GameplayTag::AIState_Follow);

    default Rules.Add(GameplayTag::AIEvent_State_Done)
        .Then(UAIEventResponse_SwitchState(GameplayTag::AIState_AssessGoToDailyRoutine, EPerceptionCharacterType::None)
            .AddContextTag(GameplayTag::Action_Ambient_SearchAround)
            .AddContextTag(GameplayTag::Action_Ambient_Dismiss));
}