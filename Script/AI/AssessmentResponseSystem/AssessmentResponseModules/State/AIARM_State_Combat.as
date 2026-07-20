class UAIARM_State_Combat : UAIAssessmentResponseModule
{
    default RequiredOwnedTags.AddTag(GameplayTag::AIState_Conflict_Combat);

    default Rules.Add(GameplayTag::AIEvent_State_Done)
        .Then(UAIEventResponse_SwitchState(GameplayTag::AIState_Conflict_CombatEndActions, EPerceptionCharacterType::None));

    default Rules.Add(GameplayTag::AIEvent_TrainingFight_Defeat)
        .Then(UAIEventResponse_RemoveAllTrainingModifiers())
        .Then(UAIEventResponse_SwitchState(GameplayTag::AIState_Conflict_TrainingFightResult_Defeat, EPerceptionCharacterType::Instigator));

    default Rules.Add(GameplayTag::AIEvent_TrainingFight_Victory)
        .Then(UAIEventResponse_RemoveAllTrainingModifiers())
        .Then(UAIEventResponse_SwitchState(GameplayTag::AIState_Conflict_TrainingFightResult_Victory, EPerceptionCharacterType::Instigator));
}

class UAIARM_State_Combat_HumanOrc : UAIARM_State_Combat
{
    default SubModules.Add(UAIARM_State_Combat_ChaseHidingCharacter);
    default SubModules.Add(UAIARM_State_Combat_HumanOrc_ToDisengage);

    default Rules.Add(GameplayTag::AIEvent_Sensed_NoEnemiesNoHostiles)
        .Then(UAIEventResponse_SwitchState(GameplayTag::AIState_Conflict_CombatEndActions, EPerceptionCharacterType::None));
}

class UAIARM_State_Combat_HumanOrc_ToDisengage : UAIAssessmentResponseModule
{
    default BlockIfHasAnyOwnedTags.AddTag(GameplayTag::State_NeverDisengage);

    default Rules.Add(GameplayTag::AIEvent_Disengage_Sprinting)
        .Then(UAIEventResponse_SwitchState(GameplayTag::AIState_Conflict_Disengage, EPerceptionCharacterType::Instigator)
                .AddContextTag(GameplayTag::State_Movement_Sprinting));
            
    default Rules.Add(GameplayTag::AIEvent_Disengage_Running)
        .Then(UAIEventResponse_SwitchState(GameplayTag::AIState_Conflict_Disengage, EPerceptionCharacterType::Instigator)
                .AddContextTag(GameplayTag::State_Movement_Running));
}

class UAIARM_State_Combat_Creature : UAIARM_State_Combat
{
    default SubModules.Add(UAIARM_State_Combat_ChaseHidingCharacter);
    default SubModules.Add(UAIARM_State_Combat_Creature_ToDisengage);

    default Rules.Add(GameplayTag::AIEvent_Seen_Hostile)
        .Then(UAIEventResponse_AddEnemyModifier(EPerceptionCharacterType::SensedCharacter));
}

class UAIARM_State_Combat_Creature_ToDisengage : UAIAssessmentResponseModule
{
    default BlockIfHasAnyOwnedTags.AddTag(GameplayTag::State_NeverDisengage);

    default Rules.Add(GameplayTag::AIEvent_Disengage)
        .Then(UAIEventResponse_SwitchState(GameplayTag::AIState_Conflict_Disengage, EPerceptionCharacterType::Instigator));
}

class UAIARM_State_Combat_ChaseHidingCharacter : UAIAssessmentResponseModule
{
    default BlockIfAssessedHasAnyOwnedTags.AddTag(GameplayTag::State_Dead);
    default BlockIfAssessedHasAnyOwnedTags.AddTag(GameplayTag::State_Defeated);

    default Rules.Add(GameplayTag::AIEvent_LostSense)
        .RequireTrue(
            Assessed::SensedWasEnemy |
            Assessed::IsSensedInSameTerritoryAsCharacter
        )
        .RequireFalse(
            Assessed::AwareOfSensed
        )
        .Then(UAIEventResponse_SwitchState(GameplayTag::AIState_Conflict_ChaseAndLookForHidingCharacter, EPerceptionCharacterType::SensedCharacter));
}

class UAIARM_State_Combat_Simple : UAIARM_State_Combat
{
    default Rules.Add(GameplayTag::AIEvent_LostSense)
        .RequireTrue(
            Assessed::SensedWasEnemy
        )
        .RequireFalse(
            Assessed::AwareOfSensed
        )
        .Then(UAIEventResponse_SwitchState(GameplayTag::AIState_AssessGoToDailyRoutine, EPerceptionCharacterType::None));
}

class UAIARM_State_TrainingFightResult : UAIAssessmentResponseModule
{
    default RequiredOwnedTags.AddTag(GameplayTag::AIState_Conflict_TrainingFightResult);

    default Rules.Add(GameplayTag::AIEvent_State_Done)
        .Then(UAIEventResponse_SwitchState(GameplayTag::AIState_Conflict_CombatEndActions, EPerceptionCharacterType::None));
}