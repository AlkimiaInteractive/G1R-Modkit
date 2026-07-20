class UAIARM_State_Disengage : UAIAssessmentResponseModule
{
    default RequiredOwnedTags.AddTag(GameplayTag::AIState_Conflict_Disengage);
    default BlockIfHasAnyOwnedTags.AddTag(GameplayTag::State_NeverDisengage);

    default Rules.Add(GameplayTag::AIEvent_State_Done)
        .Then(UAIEventResponse_SwitchState(GameplayTag::AIState_AssessGoToDailyRoutine, EPerceptionCharacterType::None));

    default Rules.Add(GameplayTag::AIEvent_Disengage_Fail)
        .RequireFalse(
            Assessed::GroupCombatIsFavorableForAllies
        )
        .Then(UAIEventResponse_SwitchState(GameplayTag::AIState_Conflict_Flee, EPerceptionCharacterType::SensedCharacter));

    default Rules.Add(GameplayTag::AIEvent_Disengage_Fail)
        .RequireFalse(
             Assessed::SensedIsReachable
        )
        .Then(UAIEventResponse_SwitchState(GameplayTag::AIState_Conflict_Flee, EPerceptionCharacterType::SensedCharacter));
    
    default Rules.Add(GameplayTag::AIEvent_Disengage_Fail)
        .RequireTrue(
            Assessed::GroupCombatIsFavorableForAllies |
            Assessed::SensedIsReachable
        )
        .Then(UAIEventResponse_SwitchState(GameplayTag::AIState_Conflict_Combat, EPerceptionCharacterType::SensedCharacter));
}