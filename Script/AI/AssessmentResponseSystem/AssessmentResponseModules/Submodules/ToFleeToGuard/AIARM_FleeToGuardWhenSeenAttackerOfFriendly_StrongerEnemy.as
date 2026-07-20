class UAIARM_FleeToGuardWhenSeenAttackerOfFriendly_StrongerEnemy : UAIAssessmentResponseModule
{    
    // Start fight with weapon
    default Rules.Add(GameplayTag::AIEvent_Seen_Attacker)
        .RequireTrue(
            Assessed::AffectedWasFriendly |
            Assessed::IsIntentionalAttack |
            Assessed::InstigatorIsStrongerThanSelf
        )
        .RequireFalse(
            Assessed::AffectedIsSelf |
            Assessed::AffectedIsTrainingWithInstigator |
            Assessed::IsPettyFight |
            Assessed::IsTrainingFight
        )
        .Then(UAIEventResponse_AddEnemyModifier(EPerceptionCharacterType::Instigator))
        .Then(UAIEventResponse_LeavePartyOf(EPerceptionCharacterType::Instigator))
        .Then(UAIEventResponse_SwitchState(GameplayTag::AIState_Conflict_Combat, EPerceptionCharacterType::Instigator));

    // Start fight with weapon if hit unintentionally too many times
    default Rules.Add(GameplayTag::AIEvent_Seen_Attacker)
        .RequireTrue(
            Assessed::AffectedWasFriendly |
            Assessed::IsTooManyUnintentionalHits |
            Assessed::InstigatorIsStrongerThanSelf
        )
        .RequireFalse(
            Assessed::AffectedIsSelf |
            Assessed::IsIntentionalAttack |
            Assessed::AffectedIsTrainingWithInstigator |
            Assessed::IsPettyFight |
            Assessed::IsTrainingFight
        )
        .Then(UAIEventResponse_AddEnemyModifier(EPerceptionCharacterType::Instigator))
        .Then(UAIEventResponse_LeavePartyOf(EPerceptionCharacterType::Instigator))
        .Then(UAIEventResponse_SwitchState(GameplayTag::AIState_Conflict_Combat, EPerceptionCharacterType::Instigator));
}