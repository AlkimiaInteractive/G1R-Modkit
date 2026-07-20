class UAIARM_State_Warning_Human : UAIAssessmentResponseModule
{    
    default Rules.Add(GameplayTag::AIEvent_LostSense)
        .RequireTrue(
            Assessed::SensedWasHostile
        )
        .RequireFalse(
            Assessed::AwareOfSensed
        )
        .Then(UAIEventResponse_SwitchState(GameplayTag::AIState_Conflict_ChaseAndLookForHidingCharacter, EPerceptionCharacterType::SensedCharacter));
}

class UAIARM_State_Warning_Creature : UAIAssessmentResponseModule
{
    default Rules.Add(GameplayTag::AIEvent_Threat_IsTooClose)
        .Then(UAIEventResponse_AddEnemyModifier(EPerceptionCharacterType::AllSensedNonTrainingHostiles))
        .Then(UAIEventResponse_LeavePartyOf(EPerceptionCharacterType::SensedCharacter))
        .Then(UAIEventResponse_SwitchState(GameplayTag::AIState_Conflict_Combat, EPerceptionCharacterType::SensedCharacter));

    default Rules.Add(GameplayTag::AIEvent_Threat_AllWarningsDone)
        .RequireFalse(
            Assessed::IsTrainingFight
        )
        .Then(UAIEventResponse_AddEnemyModifier(EPerceptionCharacterType::AllSensedNonTrainingHostiles))
        .Then(UAIEventResponse_LeavePartyOf(EPerceptionCharacterType::SensedCharacter))
        .Then(UAIEventResponse_SwitchState(GameplayTag::AIState_Conflict_Combat, EPerceptionCharacterType::SensedCharacter));
    
    default Rules.Add(GameplayTag::AIEvent_LostSense)
        .RequireTrue(
            Assessed::SensedWasHostile
        )
        .RequireFalse(
            Assessed::AwareOfSensed
        )
        .Then(UAIEventResponse_SwitchState(GameplayTag::AIState_Conflict_ChaseAndLookForHidingCharacter, EPerceptionCharacterType::SensedCharacter));

    default Rules.Add(GameplayTag::AIEvent_Sensed_NoEnemiesNoHostiles)
        .Then(UAIEventResponse_SwitchState(GameplayTag::AIState_AssessGoToDailyRoutine, EPerceptionCharacterType::None));
}