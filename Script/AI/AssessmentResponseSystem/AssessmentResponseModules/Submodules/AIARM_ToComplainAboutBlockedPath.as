class UAIARM_ToComplainAboutBlockedPath_Brave : UAIAssessmentResponseModule
{
    default BlockIfHasAnyOwnedTags.AddLeafTag(GameplayTag::AIState_Conflict);
    default RequireAnyOwnedTags.AddTag(GameplayTag::CampRole_Boss);

    default Rules.Add(GameplayTag::AIEvent_Seen_InferiorCharacterBlockingPath)
        .Then(UAIEventResponse_SwitchState(GameplayTag::AIState_Conflict_Warning_BlockedPath, EPerceptionCharacterType::SensedCharacter));
}

class UAIARM_ToComplainAboutBlockedPath_Coward : UAIAssessmentResponseModule
{
    default BlockIfHasAnyOwnedTags.AddLeafTag(GameplayTag::AIState_Conflict);
    default BlockIfHasAnyOwnedTags.AddTag(GameplayTag::CampRole_Boss);

    default Rules.Add(GameplayTag::AIEvent_Seen_InferiorCharacterBlockingPath)
        .RequireFalse(
            Assessed::SensedIsStrongerThanSelf
        )
        .Then(UAIEventResponse_SwitchState(GameplayTag::AIState_Conflict_Warning_BlockedPath, EPerceptionCharacterType::SensedCharacter));
}