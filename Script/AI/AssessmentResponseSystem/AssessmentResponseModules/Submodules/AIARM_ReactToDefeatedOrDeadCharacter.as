class UAIARM_ReactToDefeatedCharacter_NotConflict : UAIAssessmentResponseModule
{
    default BlockIfHasAnyOwnedTags.AddTag(GameplayTag::AIState_Conflict);

    // default Rules.Add(GameplayTag::AIEvent_Seen_Defeated)
    //     .Then(UAIEventResponse_SwitchState(GameplayTag::AIState_Conflict_CombatEndActions, EPerceptionCharacterType::None));
}

class UAIARM_Creature_ReactToCarcass_NotConflict : UAIAssessmentResponseModule
{
    default BlockIfHasAnyOwnedTags.AddTag(GameplayTag::AIState_Conflict);
    default BlockIfHasAnyOwnedTags.AddTag(GameplayTag::State_Ambush);

    default Rules.Add(GameplayTag::AIEvent_Seen_Carcass)
        .Then(UAIEventResponse_SwitchState(GameplayTag::AIState_Conflict_CombatEndActions, EPerceptionCharacterType::None));
}

class UAIARM_ReactToDefeatedCharacter_Search : UAIAssessmentResponseModule
{
    default RequiredOwnedTags.AddTag(GameplayTag::AIState_Conflict_Search);

    default Rules.Add(GameplayTag::AIEvent_Seen_Defeated)
        .Then(UAIEventResponse_SwitchState(GameplayTag::AIState_Conflict_CombatEndActions, EPerceptionCharacterType::None));
}

class UAIARM_Creature_ReactToCarcass_Search : UAIAssessmentResponseModule
{
    default RequiredOwnedTags.AddTag(GameplayTag::AIState_Conflict_Search);

    default Rules.Add(GameplayTag::AIEvent_Seen_Carcass)
        .Then(UAIEventResponse_SwitchState(GameplayTag::AIState_Conflict_CombatEndActions, EPerceptionCharacterType::None));
}