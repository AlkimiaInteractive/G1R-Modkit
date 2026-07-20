class UAIARM_ForgiveTrainingEnemies : UAIAssessmentResponseModule
{
    default SubModules.Add(UAIARM_ForgiveDefeatedTrainingEnemy);
    default SubModules.Add(UAIARM_ForgiveTrainingEnemiesWhenDefeated);
}

class UAIARM_ForgiveTrainingEnemiesWhenDefeated : UAIAssessmentResponseModule
{
    default Rules.Add(GameplayTag::AIEvent_Sensed_Defeated_Self)
        .RequireTrue(
            Assessed::SelfIsTrainingWithInstigator)
        .Then(UAIEventResponse_RemoveAllTrainingModifiers());
}

class UAIARM_ForgiveDefeatedTrainingEnemy : UAIAssessmentResponseModule
{
    default Rules.Add(GameplayTag::AIEvent_Sensed_Defeated_Other)
        .RequireTrue(
            Assessed::SelfIsTrainingWithAffected)
        .Then(UAIEventResponse_RemoveTrainingModifier(EPerceptionCharacterType::AffectedCharacter));

    default Rules.Add(GameplayTag::AIEvent_Sensed_Defeated_Other)
        .RequireTrue(
            Assessed::SelfIsTrainingWithAffected
        )
        .RequireFalse(
            Assessed::LivingStandingEnemiesPerceived
        )
        .Then(UAIEventResponse_SwitchState(GameplayTag::AIState_Conflict_CombatEndActions, EPerceptionCharacterType::None));
}