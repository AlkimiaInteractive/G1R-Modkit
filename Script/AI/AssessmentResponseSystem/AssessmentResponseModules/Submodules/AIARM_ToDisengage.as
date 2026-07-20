class UAIARM_ToDisengage : UAIAssessmentResponseModule
{
    default BlockIfHasAnyOwnedTags.AddTag(GameplayTag::AIState_Conflict_Fear);
    default BlockIfHasAnyOwnedTags.AddTag(GameplayTag::AIState_Conflict_Flee);
    default BlockIfHasAnyOwnedTags.AddTag(GameplayTag::AIState_Conflict_CombatEndActions);
    default BlockIfHasAnyOwnedTags.AddTag(GameplayTag::AIState_Wait);
    
    // default Rules.Add(GameplayTag::AIEvent_TooFarFromPreferredLocation)
    //     .Then(UAIEventResponse_SwitchState(GameplayTag::AIState_Conflict_Disengage, EPerceptionCharacterType::Instigator));
}