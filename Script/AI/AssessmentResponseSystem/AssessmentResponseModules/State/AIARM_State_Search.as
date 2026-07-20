class UAIARM_State_TurnToAttacker : UAIAssessmentResponseModule
{
    default BlockIfHasAnyOwnedTags.AddTag(GameplayTag::AIState_Conflict_Disengage);
    default RequireAnyOwnedTags.AddTag(GameplayTag::AIState_Conflict_TurnToAttacker);

    default Rules.Add(GameplayTag::AIEvent_State_Done)
        .Then(UAIEventResponse_SwitchState(GameplayTag::AIState_Conflict_ChaseAndLookForHidingCharacter, EPerceptionCharacterType::SensedCharacter));
    
    default Rules.Add(GameplayTag::AIEvent_Sensed_NoEnemiesNoHostiles)
        .Then(UAIEventResponse_SwitchState(GameplayTag::AIState_Conflict_CombatEndActions, EPerceptionCharacterType::None));
}

class UAIARM_State_ChaseAndLookForHidingCharacter : UAIAssessmentResponseModule
{
    default BlockIfHasAnyOwnedTags.AddTag(GameplayTag::Debuff_Fear);
    default BlockIfHasAnyOwnedTags.AddTag(GameplayTag::AIState_Conflict_Flee);
    default RequireAnyOwnedTags.AddTag(GameplayTag::AIState_Conflict_ChaseAndLookForHidingCharacter);
    
    default Rules.Add(GameplayTag::AIEvent_State_Done)
        .Then(UAIEventResponse_SwitchState(GameplayTag::AIState_Conflict_CombatEndActions, EPerceptionCharacterType::None));
}

class UAIARM_State_Investigate : UAIAssessmentResponseModule
{
    default BlockIfHasAnyOwnedTags.AddTag(GameplayTag::Debuff_Fear);
    default BlockIfHasAnyOwnedTags.AddTag(GameplayTag::AIState_Conflict_Flee);
    default RequireAnyOwnedTags.AddTag(GameplayTag::AIState_Conflict_InvestigateAlarm);
    default RequireAnyOwnedTags.AddTag(GameplayTag::AIState_Conflict_InvestigateCombatSound);
    default RequireAnyOwnedTags.AddTag(GameplayTag::AIState_Conflict_InvestigateIdentifiedSound);
    default RequireAnyOwnedTags.AddTag(GameplayTag::AIState_Conflict_InvestigatePickpocket);
    default RequireAnyOwnedTags.AddTag(GameplayTag::AIState_Conflict_InvestigatePouch);
    default RequireAnyOwnedTags.AddTag(GameplayTag::AIState_Conflict_InvestigateSuspiciousSound);

    default Rules.Add(GameplayTag::AIEvent_State_Done)
        .Then(UAIEventResponse_SwitchState(GameplayTag::AIState_AssessGoToDailyRoutine, EPerceptionCharacterType::None)
            .AddContextTag(GameplayTag::Action_Ambient_SearchAround)
            .AddContextTag(GameplayTag::Action_Ambient_Dismiss));
}