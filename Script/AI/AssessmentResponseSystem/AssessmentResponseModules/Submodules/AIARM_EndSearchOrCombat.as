class UAIARM_EndSearchOrCombat_Brave : UAIAssessmentResponseModule
{
    default BlockIfHasAnyOwnedTags.AddTag(GameplayTag::Debuff_Sleep);
    default BlockIfHasAnyOwnedTags.AddTag(GameplayTag::Debuff_Blind);

    default Rules.Add(GameplayTag::AIEvent_Sensed_NoEnemiesNoHostiles)
        .Then(UAIEventResponse_SwitchState(GameplayTag::AIState_Conflict_CombatEndActions, EPerceptionCharacterType::None));
}

class UAIARM_EndSearchOrCombat_Coward : UAIAssessmentResponseModule
{
    default BlockIfHasAnyOwnedTags.AddTag(GameplayTag::Debuff_Sleep);
    default BlockIfHasAnyOwnedTags.AddTag(GameplayTag::Debuff_Blind);

    default Rules.Add(GameplayTag::AIEvent_Sensed_NoEnemiesNoHostiles)
        .Then(UAIEventResponse_SwitchState(GameplayTag::AIState_Conflict_CombatEndActions, EPerceptionCharacterType::None));

    default Rules.Add(GameplayTag::AIEvent_Sensed_NoEnemiesSomeHostile)
        .RequireFalse(
            Assessed::SelfIsTrainingWithAllHostiles
        )
        .RequireTrue(
            Assessed::SensedIsStrongerThanSelf
        )
        .Then(UAIEventResponse_SwitchState(GameplayTag::AIState_Conflict_WatchHostile, EPerceptionCharacterType::None));
}


