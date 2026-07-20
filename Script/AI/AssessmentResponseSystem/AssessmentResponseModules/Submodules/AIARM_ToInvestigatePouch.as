class UAIARM_Human_ToInvestigatePouch : UAIAssessmentResponseModule
{
    default BlockIfHasAnyOwnedTags.AddTag(GameplayTag::AIState_Conflict_InvestigatePouch);
    default BlockIfHasAnyOwnedTags.AddTag(GameplayTag::AIState_Conflict_Combat);
    default BlockIfHasAnyOwnedTags.AddTag(GameplayTag::Debuff_Fear);
    default BlockIfHasAnyOwnedTags.AddTag(GameplayTag::AIState_Conflict_Flee);

    default Rules.Add(GameplayTag::AIEvent_Heard_Pouch)
        .Then(UAIEventResponse_VoiceReaction(GameplayTag::Sound_Voice_Reaction_Interjection_Suspect, EPerceptionCharacterType::None))
        .Then(UAIEventResponse_SwitchState(GameplayTag::AIState_Conflict_InvestigatePouch_Heard, EPerceptionCharacterType::None));
}
