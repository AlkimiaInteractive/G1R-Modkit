class UAIARM_FleeToGuardOnHitOnSelf_StrongerEnemy : UAIAssessmentResponseModule
{   
    // Unintentional attack but too many unintentional hits
    default Rules.Add(GameplayTag::AIEvent_Sensed_Hit_OnSelf)
        .RequireTrue(
            Assessed::IsTooManyUnintentionalHits |
            Assessed::InstigatorIsStrongerThanSelf
        )
        .RequireFalse(
            Assessed::IsIntentionalAttack |
            Assessed::SelfIsTrainingWithInstigator |
            Assessed::IsPettyFight |
            Assessed::IsTrainingFight
        )
        .Then(UAIEventResponse_AddEnemyModifier(EPerceptionCharacterType::Instigator))
        .Then(UAIEventResponse_LeavePartyOf(EPerceptionCharacterType::Instigator))
        .Then(UAIEventResponse_SwitchState(GameplayTag::AIState_Conflict_Flee_GetGuardHelp, EPerceptionCharacterType::Instigator));

    // Intentional attack
    default Rules.Add(GameplayTag::AIEvent_Sensed_Hit_OnSelf)
        .RequireTrue(
            Assessed::IsIntentionalAttack |
            Assessed::InstigatorIsStrongerThanSelf
        )
        .RequireFalse(
            Assessed::SelfIsTrainingWithInstigator |
            Assessed::IsPettyFight |
            Assessed::IsTrainingFight
        )
        .Then(UAIEventResponse_AddEnemyModifier(EPerceptionCharacterType::Instigator))
        .Then(UAIEventResponse_LeavePartyOf(EPerceptionCharacterType::Instigator))
        .Then(UAIEventResponse_SwitchState(GameplayTag::AIState_Conflict_Flee_GetGuardHelp, EPerceptionCharacterType::Instigator));
}