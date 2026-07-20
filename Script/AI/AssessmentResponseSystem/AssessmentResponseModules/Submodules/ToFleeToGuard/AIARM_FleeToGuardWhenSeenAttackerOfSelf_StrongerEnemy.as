class UAIARM_FleeToGuardWhenSeenAttackerOfSelf_StrongerEnemy : UAIAssessmentResponseModule
{    
    // Unintentional attack but too many unintentional hits
    default Rules.Add(GameplayTag::AIEvent_Seen_Attacker)
        .RequireTrue(
            Assessed::AffectedIsSelf |
            Assessed::IsTooManyUnintentionalHits |
            Assessed::InstigatorIsStrongerThanSelf
        )
        .RequireFalse(
            Assessed::IsIntentionalAttack |
            Assessed::SelfIsTrainingWithInstigator
        )
        .Then(UAIEventResponse_AddEnemyModifier(EPerceptionCharacterType::Instigator))
        .Then(UAIEventResponse_LeavePartyOf(EPerceptionCharacterType::Instigator))
        .Then(UAIEventResponse_SwitchState(GameplayTag::AIState_Conflict_Flee_GetGuardHelp, EPerceptionCharacterType::Instigator));

    // Intentional attack
    default Rules.Add(GameplayTag::AIEvent_Seen_Attacker)
        .RequireTrue(
            Assessed::AffectedIsSelf |
            Assessed::IsIntentionalAttack |
            Assessed::InstigatorIsStrongerThanSelf
        )
        .RequireFalse(
            Assessed::SelfIsTrainingWithInstigator
        )
        .Then(UAIEventResponse_AddEnemyModifier(EPerceptionCharacterType::Instigator))
        .Then(UAIEventResponse_LeavePartyOf(EPerceptionCharacterType::Instigator))
        .Then(UAIEventResponse_SwitchState(GameplayTag::AIState_Conflict_Flee_GetGuardHelp, EPerceptionCharacterType::Instigator));
}