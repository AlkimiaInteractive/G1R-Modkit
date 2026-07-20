class UAIARM_StartTraining : UAIAssessmentResponseModule
{
    default BlockIfHasAnyOwnedTags.AddTag(GameplayTag::Debuff_Fear);
    default BlockIfHasAnyOwnedTags.AddTag(GameplayTag::AIState_Conflict_Flee);
    
    default SubModules.Add(UAIARM_StopTrainingFight);

    default SubModules.Add(UAIARM_NotConflictToTraining);
    default SubModules.Add(UAIARM_WarningThreatToTraining);
    default SubModules.Add(UAIARM_TrainingStartedWhileInCombat);

}

class UAIARM_StopTrainingFight : UAIAssessmentResponseModule
{
    default Rules.Add(GameplayTag::AIEvent_StopTrainingFight)
        .Then(UAIEventResponse_EndTrainingFight())
        .Then(UAIEventResponse_RemoveAllTrainingModifiers())
        .Then(UAIEventResponse_SwitchState(GameplayTag::AIState_AssessGoToDailyRoutine, EPerceptionCharacterType::None));
}

class UAIARM_NotConflictToTraining : UAIAssessmentResponseModule
{
    default BlockIfHasAnyOwnedTags.AddTag(GameplayTag::Debuff_Fear);
    default BlockIfHasAnyOwnedTags.AddTag(GameplayTag::AIState_Conflict_Flee);
    default BlockIfHasAnyOwnedTags.AddTag(GameplayTag::AIState_Conflict);

    default Rules.Add(GameplayTag::AIEvent_StartTrainingFight_Fists)
        .Then(UAIEventResponse_JoinTrainingFight(EPerceptionCharacterType::Instigator))
        .Then(UAIEventResponse_AddEnemyModifierTraining(EPerceptionCharacterType::Instigator))
        .Then(UAIEventResponse_AddUseFistsModifier(EPerceptionCharacterType::Instigator))
        .Then(UAIEventResponse_SwitchStateWithConflictType(GameplayTag::AIState_Conflict_Combat, EPerceptionCharacterType::Instigator, EConflictType::TrainingFight, b_TargetRequired = true, b_TargetIsPriority = true));

    default Rules.Add(GameplayTag::AIEvent_StartTrainingFight_Weapon)
        .Then(UAIEventResponse_JoinTrainingFight(EPerceptionCharacterType::Instigator))
        .Then(UAIEventResponse_AddEnemyModifierTraining(EPerceptionCharacterType::Instigator))
        .Then(UAIEventResponse_SwitchStateWithConflictType(GameplayTag::AIState_Conflict_Combat, EPerceptionCharacterType::Instigator, EConflictType::TrainingFight, b_TargetRequired = true, b_TargetIsPriority = true));
}

class UAIARM_WarningThreatToTraining : UAIAssessmentResponseModule
{
    default RequiredOwnedTags.AddTag(GameplayTag::AIState_Conflict_Warning_Threat);

    default Rules.Add(GameplayTag::AIEvent_StartTrainingFight_Fists)
        .Then(UAIEventResponse_JoinTrainingFight(EPerceptionCharacterType::Instigator))
        .Then(UAIEventResponse_AddEnemyModifierTraining(EPerceptionCharacterType::Instigator))
        .Then(UAIEventResponse_AddUseFistsModifier(EPerceptionCharacterType::Instigator))
        .Then(UAIEventResponse_AssessEnemiesAndHostilesAround());

    default Rules.Add(GameplayTag::AIEvent_StartTrainingFight_Weapon)
        .Then(UAIEventResponse_JoinTrainingFight(EPerceptionCharacterType::Instigator))
        .Then(UAIEventResponse_AddEnemyModifierTraining(EPerceptionCharacterType::Instigator))
        .Then(UAIEventResponse_AssessEnemiesAndHostilesAround());
}

class UAIARM_TrainingStartedWhileInCombat : UAIAssessmentResponseModule
{
    default RequiredOwnedTags.AddTag(GameplayTag::AIState_Conflict_Combat);

    default Rules.Add(GameplayTag::AIEvent_StartTrainingFight_Fists)
        .Then(UAIEventResponse_JoinTrainingFight(EPerceptionCharacterType::Instigator))
        .Then(UAIEventResponse_AddEnemyModifierTraining(EPerceptionCharacterType::Instigator))
        .Then(UAIEventResponse_AddUseFistsModifier(EPerceptionCharacterType::Instigator));

    default Rules.Add(GameplayTag::AIEvent_StartTrainingFight_Weapon)
        .Then(UAIEventResponse_JoinTrainingFight(EPerceptionCharacterType::Instigator))
        .Then(UAIEventResponse_AddEnemyModifierTraining(EPerceptionCharacterType::Instigator));
}