class UAIARM_FleeToGuardOnIncomingAttackOnSelf_StrongerEnemy : UAIAssessmentResponseModule
{    
    default Rules.Add(GameplayTag::AIEvent_Seen_IncomingAttack_OnSelf)
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