// class UAIARM_Human_JoinFriendlyOrProtectedInCombat : UAIAssessmentResponseModule
// {
//     default BlockIfHasAnyOwnedTags.AddTag(GameplayTag::AIState_Conflict_Combat);
//     default BlockIfHasAnyOwnedTags.AddTag(GameplayTag::Debuff_Fear);
//     default BlockIfHasAnyOwnedTags.AddTag(GameplayTag::AIState_Conflict_Flee);
//     default BlockIfHasAnyOwnedTags.AddTag(GameplayTag::AIState_Conflict_Disengage);

//     default BlockIfHasAnyOwnedTags.AddTag(GameplayTag::State_Perceptions_Ignore_NPCs);

//     default BlockIfAssessedHasAnyOwnedTags.AddTag(GameplayTag::State_Perceptions_GetIgnored);

//     default Rules.Add(GameplayTag::AIEvent_Seen_Combat)
//         .Then(UAIEventResponse_SyncronizeMemorizedCrimes(EPerceptionCharacterType::SensedCharacter))
//         .Then(UAIEventResponse_ForceAwarenessOfCharacter(EPerceptionSense::See, EPerceptionCharacterType::SensedCharactersTarget));

//     // default Rules.Add(GameplayTag::AIEvent_Seen_Combat)
//     //     .RequireTrue(
//     //         Assessed::IsAnyFriendlyInvolved
//     //     )
//     //     .RequireFalse(
//     //         Assessed::IsEnemy
//     //     )        
//     //     .Then(UAIEventResponse_VoiceReaction(GameplayTag::Sound_Voice_Reaction_WatchFight_Initial_TheresAFight, EPerceptionCharacterType::Instigator))
//     //     .Then(UAIEventResponse_SwitchStateWithConflictType(GameplayTag::AIState_Conflict_WatchFight, EPerceptionCharacterType::None, EConflictType::None));
// }

class UAIARM_Creature_JoinFriendlyOrProtectedInCombat : UAIAssessmentResponseModule
{
    default BlockIfHasAnyOwnedTags.AddTag(GameplayTag::AIState_Conflict_Combat);
    default BlockIfHasAnyOwnedTags.AddTag(GameplayTag::Debuff_Fear);
    default BlockIfHasAnyOwnedTags.AddTag(GameplayTag::AIState_Conflict_Flee);
    default BlockIfHasAnyOwnedTags.AddTag(GameplayTag::AIState_Conflict_Disengage);
    default BlockIfHasAnyOwnedTags.AddTag(GameplayTag::State_Ambush);

    default BlockIfAssessedHasAnyOwnedTags.AddTag(GameplayTag::State_Perceptions_GetIgnored);

    default Rules.Add(GameplayTag::AIEvent_Seen_Combat)
        .RequireTrue(
            Assessed::IsAnyFriendlyInvolved
        )
        .RequireFalse(
            Assessed::IsPettyFight |
            Assessed::IsTrainingFight
        )
        .Then(UAIEventResponse_AddEnemyModifier(EPerceptionCharacterType::SensedCharactersTarget))
        .Then(UAIEventResponse_ForceAwarenessOfCharacter(EPerceptionSense::See, EPerceptionCharacterType::SensedCharactersTarget))
        .Then(UAIEventResponse_LeavePartyOf(EPerceptionCharacterType::SensedCharactersTarget))
        .Then(UAIEventResponse_SwitchState(GameplayTag::AIState_Conflict_Combat, EPerceptionCharacterType::SensedCharactersTarget));
    
    default Rules.Add(GameplayTag::AIEvent_Sensed_Combat)
        .RequireTrue(
            Assessed::SensedIsFriendly
        )
        .Then(UAIEventResponse_SynchronizeAwareness(EPerceptionCharacterType::SensedCharacter));
}