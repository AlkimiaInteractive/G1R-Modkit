class UAIARM_State_TrainingFightWaitForStart : UAIAssessmentResponseModule
{
    default Rules.Add(GameplayTag::AIEvent_Threat_AllWarningsDone)
        .RequireTrue(
            Assessed::SensedIsWithFists |
            Assessed::IsTrainingFight
        )
        .Then(UAIEventResponse_AddEnemyModifierTraining(EPerceptionCharacterType::AllSensedHostiles))
        .Then(UAIEventResponse_AddUseFistsModifier(EPerceptionCharacterType::Instigator))
        .Then(UAIEventResponse_LeavePartyOf(EPerceptionCharacterType::Instigator))
        .Then(UAIEventResponse_SwitchStateWithConflictType(GameplayTag::AIState_Conflict_Combat, EPerceptionCharacterType::Instigator, EConflictType::TrainingFight));

    default Rules.Add(GameplayTag::AIEvent_Threat_AllWarningsDone)
        .RequireTrue(
            Assessed::IsTrainingFight
        )
        .RequireFalse(
            Assessed::SensedIsWithFists
        )
        .Then(UAIEventResponse_AddEnemyModifierTraining(EPerceptionCharacterType::AllSensedHostiles))
        .Then(UAIEventResponse_LeavePartyOf(EPerceptionCharacterType::Instigator))
        .Then(UAIEventResponse_SwitchStateWithConflictType(GameplayTag::AIState_Conflict_Combat, EPerceptionCharacterType::Instigator, EConflictType::TrainingFight));

    default Rules.Add(GameplayTag::AIEvent_Threat_IsTooClose)
        .RequireTrue(
            Assessed::SensedIsWithFists |
            Assessed::IsTrainingFight
        )
        .Then(UAIEventResponse_AddEnemyModifierTraining(EPerceptionCharacterType::AllSensedHostiles))
        .Then(UAIEventResponse_AddUseFistsModifier(EPerceptionCharacterType::SensedCharacter))
        .Then(UAIEventResponse_LeavePartyOf(EPerceptionCharacterType::SensedCharacter))
        .Then(UAIEventResponse_SwitchStateWithConflictType(GameplayTag::AIState_Conflict_Combat, EPerceptionCharacterType::SensedCharacter, EConflictType::TrainingFight));

    default Rules.Add(GameplayTag::AIEvent_Threat_IsTooClose)
        .RequireTrue(
            Assessed::IsTrainingFight
        )
        .RequireFalse(
            Assessed::SensedIsWithFists
        )
        .Then(UAIEventResponse_AddEnemyModifierTraining(EPerceptionCharacterType::AllSensedHostiles))
        .Then(UAIEventResponse_LeavePartyOf(EPerceptionCharacterType::SensedCharacter))
        .Then(UAIEventResponse_SwitchStateWithConflictType(GameplayTag::AIState_Conflict_Combat, EPerceptionCharacterType::SensedCharacter, EConflictType::TrainingFight));
}