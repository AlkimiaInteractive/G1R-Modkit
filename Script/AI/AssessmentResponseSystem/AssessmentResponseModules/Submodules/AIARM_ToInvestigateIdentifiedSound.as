class UAIARM_ToInvestigateIdentifiedSound : UAIAssessmentResponseModule
{
    default BlockIfHasAnyOwnedTags.AddTag(GameplayTag::AIState_Conflict_Combat);
    default BlockIfHasAnyOwnedTags.AddTag(GameplayTag::AIState_Conflict_Warning);
    default BlockIfHasAnyOwnedTags.AddTag(GameplayTag::Debuff_Fear);
    default BlockIfHasAnyOwnedTags.AddTag(GameplayTag::AIState_Conflict_Flee);
    default BlockIfHasAnyOwnedTags.AddTag(GameplayTag::AIState_Conflict_Disengage);
    default BlockIfHasAnyOwnedTags.AddTag(GameplayTag::AIState_Conflict_Search);
    default BlockIfHasAnyOwnedTags.AddTag(GameplayTag::State_Ambush);

    default Rules.Add(GameplayTag::AIEvent_Heard_Enemy)
        .RequireTrue(
            Assessed::IsSensedInSameTerritoryAsCharacter
        )
        .Then(UAIEventResponse_SwitchStateWithConflictType(GameplayTag::AIState_Conflict_InvestigateIdentifiedSound, EPerceptionCharacterType::SensedCharacter, EConflictType::None));

    default Rules.Add(GameplayTag::AIEvent_Heard_Hostile)
        .RequireTrue(
            Assessed::IsSensedInSameTerritoryAsCharacter
        )
        .Then(UAIEventResponse_SwitchStateWithConflictType(GameplayTag::AIState_Conflict_InvestigateIdentifiedSound, EPerceptionCharacterType::SensedCharacter, EConflictType::None));
}