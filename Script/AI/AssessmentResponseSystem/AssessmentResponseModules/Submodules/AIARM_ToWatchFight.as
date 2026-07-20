// class UAIARM_ToWatchFight : UAIAssessmentResponseModule
// {
//     default BlockIfHasAnyOwnedTags.AddTag(GameplayTag::AIState_DailyRoutine_WatchFight);
//     default BlockIfHasAnyOwnedTags.AddTag(GameplayTag::AIState_Conflict_Combat);
//     default BlockIfHasAnyOwnedTags.AddTag(GameplayTag::AIState_Conflict_WatchFight);
//     default BlockIfHasAnyOwnedTags.AddTag(GameplayTag::Debuff_Fear);
//     default BlockIfHasAnyOwnedTags.AddTag(GameplayTag::AIState_Conflict_Flee);
//     default BlockIfHasAnyOwnedTags.AddTag(GameplayTag::AIState_Conflict_Defeated);

//     default SubModules.Add(UAIARM_ToWatchFight_OnSeenCharacterInCombat_NoGuardRole);
//     default SubModules.Add(UAIARM_ToWatchFight_OnSeenCharacterInCombat_GuardRole);
// }

// class UAIARM_ToWatchFight_OnSeenCharacterInCombat_NoGuardRole : UAIARM_NoGuardNorLeaderRole
// {
//     default Rules.Add(GameplayTag::AIEvent_Seen_Combat)
//         .RequireFalse(
//             Assessed::IsAnyFriendlyInvolved |
//             Assessed::IsTrainingFight
//         )
//         .Then(UAIEventResponse_VoiceReaction(GameplayTag::Sound_Voice_Reaction_WatchFight_Initial_TheresAFight, EPerceptionCharacterType::SensedCharacter))
//         .Then(UAIEventResponse_SwitchState(GameplayTag::AIState_Conflict_WatchFight, EPerceptionCharacterType::SensedCharacter));
    
//     // default Rules.Add(GameplayTag::AIEvent_Seen_Combat) // TODO: Check ConflictType == TrueFight
//     //     .RequireTrue(
//     //         Assessed::IsAnyFriendlyInvolved
//     //     )
//     //     .RequireFalse(
//     //         Assessed::IsAnyEnemyInvolved
//     //     )
//     //     .Then(UAIEventResponse_VoiceReaction(GameplayTag::Sound_Voice_Reaction_WatchFight_Initial_TheresAFight, EPerceptionCharacterType::SensedCharacter))
//     //     .Then(UAIEventResponse_SwitchState(GameplayTag::AIState_Conflict_WatchFight, EPerceptionCharacterType::SensedCharacter));
    
//     default Rules.Add(GameplayTag::AIEvent_Seen_Combat)
//         .RequireTrue(
//             Assessed::IsAnyEnemyInvolved |
//             Assessed::IsAnyFriendlyEnforcerOrLeaderInvolved
//         )
//         .RequireFalse(
//             Assessed::IsTrainingFight
//         )
//         .Then(UAIEventResponse_VoiceReaction(GameplayTag::Sound_Voice_Reaction_WatchFight_Initial_TheresAFight, EPerceptionCharacterType::SensedCharacter))
//         .Then(UAIEventResponse_SwitchState(GameplayTag::AIState_Conflict_WatchFight, EPerceptionCharacterType::SensedCharacter));
// }

// class UAIARM_ToWatchFight_OnSeenCharacterInCombat_GuardRole : UAIARM_GuardOrLeaderRole
// {
//     default Rules.Add(GameplayTag::AIEvent_Seen_Combat)
//         .RequireFalse(
//             Assessed::IsAnyFriendlyInvolved |
//             Assessed::IsTrainingFight
//         )
//         .Then(UAIEventResponse_VoiceReaction(GameplayTag::Sound_Voice_Reaction_WatchFight_Initial_TheresAFight, EPerceptionCharacterType::SensedCharacter))
//         .Then(UAIEventResponse_SwitchState(GameplayTag::AIState_Conflict_WatchFight, EPerceptionCharacterType::SensedCharacter));
    
//     default Rules.Add(GameplayTag::AIEvent_Seen_Combat)
//         .RequireTrue(
//             Assessed::IsAnyFriendlyInvolved |
//             Assessed::IsPettyFight
//         )
//         .RequireFalse(
//             Assessed::IsAnyEnemyInvolved
//         )
//         .Then(UAIEventResponse_VoiceReaction(GameplayTag::Sound_Voice_Reaction_WatchFight_Initial_TheresAFight, EPerceptionCharacterType::SensedCharacter))
//         .Then(UAIEventResponse_SwitchState(GameplayTag::AIState_Conflict_WatchFight, EPerceptionCharacterType::SensedCharacter));
    
//     default Rules.Add(GameplayTag::AIEvent_Seen_Combat)
//         .RequireTrue(
//             Assessed::IsEnemyStrongerCharacterInvolved |
//             Assessed::IsAnyFriendlyEnforcerOrLeaderInvolved
//         )
//         .RequireFalse(
//             Assessed::IsTrainingFight
//         )
//         .Then(UAIEventResponse_VoiceReaction(GameplayTag::Sound_Voice_Reaction_WatchFight_Initial_TheresAFight, EPerceptionCharacterType::SensedCharacter))
//         .Then(UAIEventResponse_SwitchState(GameplayTag::AIState_Conflict_WatchFight, EPerceptionCharacterType::SensedCharacter));
// }