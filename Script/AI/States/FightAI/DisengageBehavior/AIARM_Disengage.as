class UAIARM_Disengage : UAIAssessmentResponseModule
{
    default BlockIfHasAnyOwnedTags.AddTag(GameplayTag::State_Conversation);
    default BlockIfHasAnyOwnedTags.AddTag(GameplayTag::State_Defeated);
    default BlockIfHasAnyOwnedTags.AddTag(GameplayTag::AIState_Conflict_Flee);
    default BlockIfHasAnyOwnedTags.AddTag(GameplayTag::AIState_Conflict_Fear);
    default BlockIfHasAnyOwnedTags.AddTag(GameplayTag::State_NeverDisengage);

    default BlockIfHasAnyOwnedTags.AddTag(GameplayTag::Debuff_Paralyzed);
    default BlockIfHasAnyOwnedTags.AddTag(GameplayTag::Debuff_Defeated);

    // default SubModules.Add(UAIARM_Disengage_FromDamagedSelf);

    default Rules.Add(GameplayTag::AIEvent_Disengage_Running)
        .Then(UAIEventResponse_SwitchState(GameplayTag::AIState_Conflict_Disengage, EPerceptionCharacterType::Instigator, b_TargetRequired = false)
                .AddContextTag(GameplayTag::State_Movement_Running));
    
    default Rules.Add(GameplayTag::AIEvent_Disengage_Sprinting)
        .Then(UAIEventResponse_SwitchState(GameplayTag::AIState_Conflict_Disengage, EPerceptionCharacterType::Instigator, b_TargetRequired = false)
                .AddContextTag(GameplayTag::State_Movement_Sprinting));
}

// class UAIARM_Disengage_FromDamagedSelf : UAIAssessmentResponseModule
// {
//     default RequireAnyOwnedTags.AddTag(GameplayTag::AIState_Conflict_ReactToTakingDamage);

//     // Instigator is not in the same Territory and outside of Conflict Radius
//     default Rules.Add(GameplayTag::AIEvent_Sensed_Hit)
//         .RequireFalse(   
//             Assessed::IsInstigatorInSameTerritoryAsCharacter
//         )
//         .Then(UAIEventResponse_SwitchState(GameplayTag::AIState_Conflict_Disengage, EPerceptionCharacterType::None));
    
//     default Rules.Add(GameplayTag::Crime_Assault)
//         .RequireFalse(   
//             Assessed::IsInstigatorInSameTerritoryAsCharacter
//         )
//         .Then(UAIEventResponse_SwitchState(GameplayTag::AIState_Conflict_Disengage, EPerceptionCharacterType::None));
// }