class UAIARM_FleeToGuardWhenHeardAttackHitOnFriendly_StrongerEnemy : UAIAssessmentResponseModule
{    
    // Start fight with weapon
    default Rules.Add(GameplayTag::AIEvent_Heard_AttackHit_OnOther)
        .RequireTrue(
            Assessed::AwareOfInstigator |
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
        .Then(UAIEventResponse_SwitchState(GameplayTag::AIState_Conflict_Flee_GetGuardHelp, EPerceptionCharacterType::Instigator));

    // Start fight with weapon if hit unintentionally too many times
    default Rules.Add(GameplayTag::AIEvent_Heard_AttackHit_OnOther)
        .RequireTrue(
            Assessed::AwareOfInstigator |
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
        .Then(UAIEventResponse_SwitchState(GameplayTag::AIState_Conflict_Flee_GetGuardHelp, EPerceptionCharacterType::Instigator));
}