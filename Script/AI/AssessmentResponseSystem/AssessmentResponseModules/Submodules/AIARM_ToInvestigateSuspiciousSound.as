class UAIARM_ToInvestigateSuspiciousSound : UAIAssessmentResponseModule
{
    default BlockIfHasAnyOwnedTags.AddTag(GameplayTag::AIState_Conflict_Combat);
    default BlockIfHasAnyOwnedTags.AddTag(GameplayTag::Debuff_Fear);
    default BlockIfHasAnyOwnedTags.AddTag(GameplayTag::AIState_DailyRoutine_WatchFight);
    default BlockIfHasAnyOwnedTags.AddTag(GameplayTag::AIState_Conflict_Flee);
    default BlockIfHasAnyOwnedTags.AddTag(GameplayTag::AIState_Conflict_GoGetGuard);
    default BlockIfHasAnyOwnedTags.AddTag(GameplayTag::AIState_Conflict_WatchFight);
    default BlockIfHasAnyOwnedTags.AddTag(GameplayTag::AIState_Conflict_WatchHostile);
    default BlockIfHasAnyOwnedTags.AddTag(GameplayTag::AIState_Conflict_Warning);
    default BlockIfHasAnyOwnedTags.AddTag(GameplayTag::AIState_Conflict_InvestigateSuspiciousSound);
    // default BlockIfHasAnyOwnedTags.AddTag(GameplayTag::State_CantBeDistracted);

    // Sound within restricted area
    default SubModules.Add(UAIARM_ToInvestigateSuspiciousSound_Trespassing);
    default SubModules.Add(UAIARM_ToInvestigateSuspiciousSound_Item);
    default SubModules.Add(UAIARM_ToInvestigateSuspiciousSound_Interaction);
}

//// ITEM
class UAIARM_ToInvestigateSuspiciousSound_Item : UAIAssessmentResponseModule
{
    default BlockIfHasAnyOwnedTags.AddTag(GameplayTag::State_CantBeDistracted);

    default Rules.Add(GameplayTag::AIEvent_Heard_Noise_Item)
        .Then(UAIEventResponse_VoiceReaction(GameplayTag::Sound_Voice_Reaction_Interjection_Suspect))
        .Then(UAIEventResponse_SwitchState(GameplayTag::AIState_Conflict_InvestigateSuspiciousSound_Item, EPerceptionCharacterType::None));
}

//// TRESPASSING
class UAIARM_ToInvestigateSuspiciousSound_Trespassing : UAIAssessmentResponseModule
{
    default SubModules.Add(UAIARM_ToInvestigateSuspiciousSound_Trespassing_Personal);
    default SubModules.Add(UAIARM_ToInvestigateSuspiciousSound_Trespassing_Guild);
}

class UAIARM_ToInvestigateSuspiciousSound_Trespassing_Personal : UAIAssessmentResponseModule
{
    default SubModules.Add(UAIARM_ToInvestigateSuspiciousSound_Trespassing_Personal_Self);
    default SubModules.Add(UAIARM_ToInvestigateSuspiciousSound_Trespassing_Personal_Friend);
}

class UAIARM_ToInvestigateSuspiciousSound_Trespassing_Personal_Self : UAIAssessmentResponseModule
{
    default Rules.Add(GameplayTag::AIEvent_Heard_Noise_RestrictedArea_SelfPersonal)
        .RequireFalse(
            Assessed::IsInPartyWithSensedCharacter
        )
        .Then(UAIEventResponse_VoiceReaction(GameplayTag::Sound_Voice_Reaction_Interjection_Suspect))
        .Then(UAIEventResponse_SwitchState(GameplayTag::AIState_Conflict_InvestigateSuspiciousSound_Trespassing, EPerceptionCharacterType::SensedCharacter));
}

class UAIARM_ToInvestigateSuspiciousSound_Trespassing_Personal_Friend : UAIAssessmentResponseModule
{
    default RequireAnyOwnedTags.AddTag(GameplayTag::CampRole_Guard);
    default RequireAnyOwnedTags.AddTag(GameplayTag::CampRole_Leadership);
    default RequireAnyOwnedTags.AddTag(GameplayTag::Role_Guard);
    default RequireAnyOwnedTags.AddTag(GameplayTag::Role_BodyGuard);
    default RequireAnyOwnedTags.AddTag(GameplayTag::Role_PersonalGuard);

    default Rules.Add(GameplayTag::AIEvent_Heard_Noise_RestrictedArea_FriendlyPersonal)
        .RequireFalse(
            Assessed::IsInPartyWithSensedCharacter
        )
        .Then(UAIEventResponse_VoiceReaction(GameplayTag::Sound_Voice_Reaction_Interjection_Suspect))
        .Then(UAIEventResponse_SwitchState(GameplayTag::AIState_Conflict_InvestigateSuspiciousSound_Trespassing, EPerceptionCharacterType::SensedCharacter));
}

class UAIARM_ToInvestigateSuspiciousSound_Trespassing_Guild : UAIAssessmentResponseModule
{
    default SubModules.Add(UAIARM_ToInvestigateSuspiciousSound_Trespassing_Guild_OwnGuild);
    default SubModules.Add(UAIARM_ToInvestigateSuspiciousSound_Trespassing_Guild_FriendlyGuild);
}

class UAIARM_ToInvestigateSuspiciousSound_Trespassing_Guild_OwnGuild : UAIAssessmentResponseModule
{
    default Rules.Add(GameplayTag::AIEvent_Heard_Noise_RestrictedArea_OwnGuild)
        .RequireFalse(
            Assessed::IsInPartyWithSensedCharacter
        )
        .Then(UAIEventResponse_VoiceReaction(GameplayTag::Sound_Voice_Reaction_Interjection_Suspect))
        .Then(UAIEventResponse_SwitchState(GameplayTag::AIState_Conflict_InvestigateSuspiciousSound_Trespassing, EPerceptionCharacterType::SensedCharacter));
}

class UAIARM_ToInvestigateSuspiciousSound_Trespassing_Guild_FriendlyGuild : UAIAssessmentResponseModule
{
    default RequireAnyOwnedTags.AddTag(GameplayTag::CampRole_Guard);
    default RequireAnyOwnedTags.AddTag(GameplayTag::Role_Guard);
    default RequireAnyOwnedTags.AddTag(GameplayTag::Role_BodyGuard);
    default RequireAnyOwnedTags.AddTag(GameplayTag::Role_PersonalGuard);

    default Rules.Add(GameplayTag::AIEvent_Heard_Noise_RestrictedArea_FriendlyGuild)
        .RequireFalse(
            Assessed::IsInPartyWithSensedCharacter
        )
        .Then(UAIEventResponse_VoiceReaction(GameplayTag::Sound_Voice_Reaction_Interjection_Suspect))
        .Then(UAIEventResponse_SwitchState(GameplayTag::AIState_Conflict_InvestigateSuspiciousSound_Trespassing, EPerceptionCharacterType::SensedCharacter));
}


//// INTERACTION
class UAIARM_ToInvestigateSuspiciousSound_Interaction : UAIAssessmentResponseModule
{
    default SubModules.Add(UAIARM_ToInvestigateSuspiciousSound_Interaction_Personal);
    default SubModules.Add(UAIARM_ToInvestigateSuspiciousSound_Interaction_Guild);
}

class UAIARM_ToInvestigateSuspiciousSound_Interaction_Personal : UAIAssessmentResponseModule
{
    default SubModules.Add(UAIARM_ToInvestigateSuspiciousSound_Interaction_Personal_Self);
    default SubModules.Add(UAIARM_ToInvestigateSuspiciousSound_Interaction_Personal_Friend);
}

class UAIARM_ToInvestigateSuspiciousSound_Interaction_Personal_Self : UAIAssessmentResponseModule
{
    default Rules.Add(GameplayTag::AIEvent_Heard_Noise_OwnedInteractable_SelfPersonal)
        .RequireFalse(
            Assessed::IsInPartyWithSensedCharacter
        )
        .Then(UAIEventResponse_VoiceReaction(GameplayTag::Sound_Voice_Reaction_Interjection_Suspect))
        .Then(UAIEventResponse_SwitchState(GameplayTag::AIState_Conflict_InvestigateSuspiciousSound_Trespassing, EPerceptionCharacterType::SensedCharacter));
}

class UAIARM_ToInvestigateSuspiciousSound_Interaction_Personal_Friend : UAIAssessmentResponseModule
{
    default RequireAnyOwnedTags.AddTag(GameplayTag::CampRole_Guard);
    default RequireAnyOwnedTags.AddTag(GameplayTag::Role_Guard);
    default RequireAnyOwnedTags.AddTag(GameplayTag::Role_BodyGuard);
    default RequireAnyOwnedTags.AddTag(GameplayTag::Role_PersonalGuard);

    default Rules.Add(GameplayTag::AIEvent_Heard_Noise_OwnedInteractable_FriendlyPersonal)
        .RequireFalse(
            Assessed::IsInPartyWithSensedCharacter
        )
        .Then(UAIEventResponse_VoiceReaction(GameplayTag::Sound_Voice_Reaction_Interjection_Suspect))
        .Then(UAIEventResponse_SwitchState(GameplayTag::AIState_Conflict_InvestigateSuspiciousSound_Trespassing, EPerceptionCharacterType::SensedCharacter));
}

class UAIARM_ToInvestigateSuspiciousSound_Interaction_Guild : UAIAssessmentResponseModule
{
    default SubModules.Add(UAIARM_ToInvestigateSuspiciousSound_Interaction_Guild_OwnGuild);
    default SubModules.Add(UAIARM_ToInvestigateSuspiciousSound_Interaction_Guild_FriendlyGuild);
}

class UAIARM_ToInvestigateSuspiciousSound_Interaction_Guild_OwnGuild : UAIAssessmentResponseModule
{
    default RequireAnyOwnedTags.AddTag(GameplayTag::CampRole_Guard);
    default RequireAnyOwnedTags.AddTag(GameplayTag::Role_Guard);
    default RequireAnyOwnedTags.AddTag(GameplayTag::Role_BodyGuard);
    default RequireAnyOwnedTags.AddTag(GameplayTag::Role_PersonalGuard);

    default Rules.Add(GameplayTag::AIEvent_Heard_Noise_OwnedInteractable_OwnGuild)
        .RequireFalse(
            Assessed::IsInPartyWithSensedCharacter
        )
        .Then(UAIEventResponse_VoiceReaction(GameplayTag::Sound_Voice_Reaction_Interjection_Suspect))
        .Then(UAIEventResponse_SwitchState(GameplayTag::AIState_Conflict_InvestigateSuspiciousSound_Trespassing, EPerceptionCharacterType::SensedCharacter));
}

class UAIARM_ToInvestigateSuspiciousSound_Interaction_Guild_FriendlyGuild : UAIAssessmentResponseModule
{
    default RequireAnyOwnedTags.AddTag(GameplayTag::CampRole_Guard);
    default RequireAnyOwnedTags.AddTag(GameplayTag::Role_Guard);
    default RequireAnyOwnedTags.AddTag(GameplayTag::Role_BodyGuard);
    default RequireAnyOwnedTags.AddTag(GameplayTag::Role_PersonalGuard);

    default Rules.Add(GameplayTag::AIEvent_Heard_Noise_OwnedInteractable_FriendlyGuild)
        .RequireFalse(
            Assessed::IsInPartyWithSensedCharacter
        )
        .Then(UAIEventResponse_VoiceReaction(GameplayTag::Sound_Voice_Reaction_Interjection_Suspect))
        .Then(UAIEventResponse_SwitchState(GameplayTag::AIState_Conflict_InvestigateSuspiciousSound_Trespassing, EPerceptionCharacterType::SensedCharacter));
}