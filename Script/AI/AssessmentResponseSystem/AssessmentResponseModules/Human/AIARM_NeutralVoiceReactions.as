class UAIARM_Human_NeutralVoiceReactions : UAIAssessmentResponseModule
{
    default RequireAnyOwnedTags.AddTag(GameplayTag::AIState_DailyRoutine);
    default BlockIfHasAnyOwnedTags.AddTag(GameplayTag::Action_Ambient_Shout);
    default BlockIfHasAnyOwnedTags.AddTag(GameplayTag::Action_Ambient_InExtremoConcert);

    default Rules.Add(GameplayTag::AIEvent_Seen_PreachingCharacter)
        .Then(UAIEventResponse_VoiceReaction(GameplayTag::Sound_Voice_Reaction_SwampPropaganda, EPerceptionCharacterType::SensedCharacter, false));

    default SubModules.Add(UAIARM_Human_NeutralVoiceReactions_Greeting);
    default SubModules.Add(UAIARM_Human_NeutralVoiceReactions_Chatter);
}

class UAIARM_Orc_NeutralVoiceReactions : UAIAssessmentResponseModule
{
    default RequireAnyOwnedTags.AddTag(GameplayTag::AIState_DailyRoutine);

    default SubModules.Add(UAIARM_Human_NeutralVoiceReactions_Greeting);
}

class UAIARM_Human_NeutralVoiceReactions_Chatter : UAIAssessmentResponseModule
{
    default BlockIfHasAnyOwnedTags.AddTag(GameplayTag::AIState_Guide);
    default BlockIfHasAnyOwnedTags.AddTag(GameplayTag::AIState_Follow);  

    default Rules.Add(GameplayTag::AIEvent_Seen_CharacterWithinCheeringDistance)
        .Then(UAIEventResponse_VoiceReaction(GameplayTag::Sound_Voice_Reaction_Chatter, EPerceptionCharacterType::SensedCharacter, false));
}

class UAIARM_Human_NeutralVoiceReactions_Greeting : UAIAssessmentResponseModule
{
    default BlockIfHasAnyOwnedTags.AddTag(GameplayTag::AIState_Guide);
    default BlockIfHasAnyOwnedTags.AddTag(GameplayTag::AIState_Follow);

    default Rules.Add(GameplayTag::AIEvent_Seen_CharacterWithinCheeringDistance_FriendlyOrProtected)
        .RequireTrue(
            Assessed::SensedIsPlayer
        )
        .Then(UAIEventResponse_VoiceReaction(GameplayTag::Sound_Voice_Address_Greeting, EPerceptionCharacterType::SensedCharacter, false));
    
    default Rules.Add(GameplayTag::AIEvent_Seen_CharacterWithinCheeringDistance_FriendlyOrProtected)
        .RequireFalse(
            Assessed::SensedIsPlayer
        )
        .Then(UAIEventResponse_VoiceReaction(GameplayTag::Sound_Voice_Conversation_PassBy, EPerceptionCharacterType::SensedCharacter, false));
}
