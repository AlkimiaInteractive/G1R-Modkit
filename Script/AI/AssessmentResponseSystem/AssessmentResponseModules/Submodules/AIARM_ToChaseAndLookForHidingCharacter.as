class UAIARM_ToChaseAndLookForHidingCharacter : UAIAssessmentResponseModule
{
    default BlockIfHasAnyOwnedTags.AddTag(GameplayTag::Debuff_Fear);
    default BlockIfHasAnyOwnedTags.AddTag(GameplayTag::AIState_Conflict_Flee);
    default BlockIfHasAnyOwnedTags.AddTag(GameplayTag::AIState_Conflict_WatchFight);
    default BlockIfHasAnyOwnedTags.AddTag(GameplayTag::AIState_Conflict_GoGetGuard);
    default BlockIfHasAnyOwnedTags.AddTag(GameplayTag::AIState_Conflict_Warning);

    default Rules.Add(GameplayTag::AIEvent_LostSense)
        .RequireTrue(
            Assessed::SensedWasHostile
        )
        .RequireFalse(
            Assessed::AwareOfSensed
        )
        .Then(UAIEventResponse_SwitchState(GameplayTag::AIState_Conflict_ChaseAndLookForHidingCharacter, EPerceptionCharacterType::SensedCharacter));
}