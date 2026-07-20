class UAIARM_Crime_Human_Trespassing : UAIAssessmentResponseModule
{
    default SubModules.Add(UAIARM_Crime_Trespassing_OnGuild_Perception);
    default SubModules.Add(UAIARM_Crime_Trespassing_OnPerson_Perception);
    // default SubModules.Add(UAIARM_Crime_IgnoredWarning_Trespassing_Perception);
    default SubModules.Add(UAIARM_Crime_Trespassing_Responses);
    default SubModules.Add(UAIARM_Crime_Trespassing_Wait);
    default SubModules.Add(UAIARM_Crime_Trespassing_WaitEnd);
    default SubModules.Add(UAIARM_Crime_Trespassing_WaitReactivation_Perception);
    default SubModules.Add(UAIARM_Crime_Trespassing_WarningEnd);
}

///// PERCEPTION-CRIME BINDINGS
class UAIARM_Crime_Trespassing_OnGuild_Perception : UAIAssessmentResponseModule
{
    default BlockIfAssessedHasAnyOwnedTags.AddTag(GameplayTag::State_Defeated);
    default BlockIfHasAnyOwnedTags.AddTag(GameplayTag::AIState_Wait_DefeatedIntruder);
    default BlockIfHasAnyOwnedTags.AddTag(GameplayTag::AIState_Conflict_Warning_Trespassing);
    default BlockIfHasAnyOwnedTags.AddTag(GameplayTag::State_Conversation);

    default BlockIfAssessedHasAnyOwnedTags.AddTag(GameplayTag::State_Perceptions_GetIgnored);

    default RequirePursueCrimesOnAssessedCharacter.AddTag(GameplayTag::Crime_Trespassing_OnGuild);

    default Rules.Add(GameplayTag::AIEvent_Seen_Trespasser_OnGuild)
        .Then(UAIEventResponse_AssessCrime(
            GameplayTag::Crime_Trespassing_OnGuild,
            EPerceptionCharacterType::SensedCharacter, 
            EPerceptionCharacterType::None));
}

class UAIARM_Crime_Trespassing_OnPerson_Perception : UAIAssessmentResponseModule
{
    default BlockIfAssessedHasAnyOwnedTags.AddTag(GameplayTag::State_Defeated);
    default BlockIfHasAnyOwnedTags.AddTag(GameplayTag::AIState_Wait_DefeatedIntruder);
    default BlockIfHasAnyOwnedTags.AddTag(GameplayTag::AIState_Conflict_Warning_Trespassing);
    default BlockIfHasAnyOwnedTags.AddTag(GameplayTag::State_Conversation);

    default BlockIfAssessedHasAnyOwnedTags.AddTag(GameplayTag::State_Perceptions_GetIgnored);

    default RequirePursueCrimesOnAssessedCharacter.AddTag(GameplayTag::Crime_Trespassing_OnPerson);

    default Rules.Add(GameplayTag::AIEvent_Seen_Trespasser_OnPerson)
        .Then(UAIEventResponse_AssessCrime(
            GameplayTag::Crime_Trespassing_OnPerson,
            EPerceptionCharacterType::SensedCharacter, 
            EPerceptionCharacterType::None));
}

// class UAIARM_Crime_IgnoredWarning_Trespassing_Perception : UAIAssessmentResponseModule
// {
//     default RequiredOwnedTags.AddTag(GameplayTag::AIState_Conflict_Warning_Trespassing);

//     default BlockIfAssessedHasAnyOwnedTags.AddTag(GameplayTag::State_Perceptions_GetIgnored);

//     default RequirePursueCrimesOnAssessedCharacter.AddTag(GameplayTag::Crime_IgnoredWarning_Trespassing);

//     default Rules.Add(GameplayTag::AIEvent_Seen_Trespasser)
//         .RequireTrue(
//             Assessed::IsSelfStateGroupLeader
//         )
//         .Then(UAIEventResponse_RelayEventToOtherStateGroupMembers(
//             GameplayTag::AIEvent_Group_IgnoredWarning
//         ))
//         .Then(UAIEventResponse_AssessCrime(
//             GameplayTag::Crime_IgnoredWarning_Trespassing,
//             EPerceptionCharacterType::SensedCharacter,
//             EPerceptionCharacterType::Self));
        
//     default Rules.Add(GameplayTag::AIEvent_Group_IgnoredWarning)
//         .RequireFalse(
//             Assessed::IsSelfStateGroupLeader
//         )
//         .Then(UAIEventResponse_AssessCrime(
//             GameplayTag::Crime_IgnoredWarning_Trespassing,
//             EPerceptionCharacterType::SensedCharacter,
//             EPerceptionCharacterType::Self));
// }

class UAIARM_Crime_Trespassing_Responses : UAIAssessmentResponseModule
{
    default SubModules.Add(UAIARM_Crime_Trespassing_Responses_ToWarningOrCombat);
    default SubModules.Add(UAIARM_Crime_Trespassing_Responses_ToWatchStrongerHostile);
    default SubModules.Add(UAIARM_Crime_Trespassing_Responses_FromWatchStrongerHostile);
    default SubModules.Add(UAIARM_Crime_IgnoredWarning_Trespassing_Responses);
    default SubModules.Add(UAIARM_Crime_Trespassing_Responses_InCombat);
}

///// RESPONSE RULES CONFIGURATIONS
class UAIARM_Crime_Trespassing_Responses_ToWarningOrCombat : UAIAssessmentResponseModule
{
    default BlockIfHasAnyOwnedTags.AddTag(GameplayTag::Debuff_Fear);
    default BlockIfHasAnyOwnedTags.AddTag(GameplayTag::AIState_Conflict_Warning);
    default BlockIfHasAnyOwnedTags.AddTag(GameplayTag::AIState_Conflict_WatchHostile);
    default BlockIfHasAnyOwnedTags.AddTag(GameplayTag::AIState_Conflict_WatchHostileFight);
    default BlockIfHasAnyOwnedTags.AddTag(GameplayTag::AIState_Conflict_Combat);
    default BlockIfHasAnyOwnedTags.AddTag(GameplayTag::AIState_Conflict_Disengage);
    default BlockIfHasAnyOwnedTags.AddTag(GameplayTag::AIState_Conflict_Flee);
    default BlockIfHasAnyOwnedTags.AddTag(GameplayTag::AIState_Conflict_Paralyzed);
    default BlockIfHasAnyOwnedTags.AddTag(GameplayTag::AIState_Conflict_TurnToAttacker);
    default BlockIfHasAnyOwnedTags.AddTag(GameplayTag::AIState_Conflict_ChaseAndLookForHidingCharacter);

    default SubModules.Add(UAIARM_Crime_Trespassing_Responses_ToGetGuard);
    default SubModules.Add(UAIARM_Crime_Trespassing_Responses_ToWarning);
    default SubModules.Add(UAIARM_Crime_Trespassing_Responses_ToCombat);

    // default Rules.Add(GameplayTag::Crime_Trespassing)
    //     .RequireTrue(
    //         Assessed::IsCrimeSeverityMinimal
    //     )
    //     .Then(UAIEventResponse_ForgetLastCrimeOfType(EPerceptionCharacterType::Instigator, GameplayTag::Crime_Trespassing));
        // .Then(UAIEventResponse_VoiceReaction(GameplayTag::Sound_Voice_Reaction_Wea)); TODO Reaction
}

class UAIARM_Crime_Trespassing_Responses_ToWarning : UAIAssessmentResponseModule
{
    default BlockIfHasAnyOwnedTags.AddTag(GameplayTag::AIState_Conflict_Warning);
    default BlockIfHasAnyOwnedTags.AddTag(GameplayTag::AIState_Conflict_Combat);

    default SubModules.Add(UAIARM_Crime_Trespassing_Responses_ToWarning_Enforcer);

    default Rules.Add(GameplayTag::Crime_Trespassing)
        .RequireFalse(
            Assessed::IsCrimeSeverityMinimal |
            Assessed::IsCrimeSeverityCritical |
            Assessed::InstigatorIsStrongerThanSelf |
            Assessed::IsAnyFriendlyEnforcerOrLeaderInvolved
        )
        .Then(UAIEventResponse_AddHostileModifier(EPerceptionCharacterType::Instigator))
        .Then(UAIEventResponse_SwitchStateWithConflictType(GameplayTag::AIState_Conflict_Warning_Trespassing, EPerceptionCharacterType::Instigator, EConflictType::PettyFight, true));

    // Guards nearby
    default Rules.Add(GameplayTag::Crime_Trespassing)
        .RequireTrue(
            Assessed::InstigatorIsStrongerThanSelf |
            Assessed::GuardsNearby
        )
        .RequireFalse(
            Assessed::IsCrimeSeverityMinimal |
            Assessed::IsCrimeSeverityCritical |
            Assessed::IsAnyFriendlyEnforcerOrLeaderInvolved
        )
        .Then(UAIEventResponse_AddHostileModifier(EPerceptionCharacterType::Instigator))
        .Then(UAIEventResponse_SwitchStateWithConflictType(GameplayTag::AIState_Conflict_Warning_Trespassing, EPerceptionCharacterType::Instigator, EConflictType::PettyFight, true));
}

class UAIARM_Crime_Trespassing_Responses_ToWarning_Enforcer : UAIARM_GuardOrLeaderRole
{
    default Rules.Add(GameplayTag::Crime_Trespassing)
        .RequireFalse(
            Assessed::IsCrimeSeverityMinimal |
            Assessed::IsCrimeSeverityCritical
        )
        .Then(UAIEventResponse_AddHostileModifier(EPerceptionCharacterType::Instigator))
        .Then(UAIEventResponse_SwitchStateWithConflictType(GameplayTag::AIState_Conflict_Warning_Trespassing, EPerceptionCharacterType::Instigator, EConflictType::PettyFight, true));
}

class UAIARM_Crime_Trespassing_Responses_ToCombat : UAIAssessmentResponseModule
{
    default BlockIfHasAnyOwnedTags.AddTag(GameplayTag::AIState_Conflict_Warning);
    default BlockIfHasAnyOwnedTags.AddTag(GameplayTag::AIState_Conflict_Combat);
    default BlockIfHasAnyOwnedTags.AddTag(GameplayTag::AIState_Conflict_WatchHostile);

    default SubModules.Add(UAIARM_Crime_Trespassing_Responses_ToCombat_Enforcer);

    default Rules.Add(GameplayTag::Crime_Trespassing)
        .RequireTrue(
            Assessed::IsCrimeSeverityCritical
        )
        .RequireFalse(
            Assessed::InstigatorIsStrongerThanSelf |
            Assessed::InstigatorWasCombatForgivenBefore |
            Assessed::IsAnyFriendlyEnforcerOrLeaderInvolved
        )
        .Then(UAIEventResponse_AddEnemyModifier(EPerceptionCharacterType::Instigator))
        .Then(UAIEventResponse_AddExecuteModifier(EPerceptionCharacterType::Instigator))
        .Then(UAIEventResponse_AddLootModifier(EPerceptionCharacterType::Instigator))
        .Then(UAIEventResponse_VoiceReaction(GameplayTag::Sound_Voice_Reaction_Combat_Start, EPerceptionCharacterType::Instigator)
            .AddContextTagToTarget(GameplayTag::VoicelineContext_Intruder))
        .Then(UAIEventResponse_SwitchState(GameplayTag::AIState_Conflict_Combat, EPerceptionCharacterType::Instigator, true));

    default Rules.Add(GameplayTag::Crime_Trespassing)
        .RequireTrue(
            Assessed::IsCrimeSeverityCritical |
            Assessed::InstigatorWasCombatForgivenBefore
        )
        .RequireFalse(
            Assessed::InstigatorIsStrongerThanSelf |
            Assessed::IsAnyFriendlyEnforcerOrLeaderInvolved
        )
        .Then(UAIEventResponse_AddEnemyModifier(EPerceptionCharacterType::Instigator))
        .Then(UAIEventResponse_AddExecuteModifier(EPerceptionCharacterType::Instigator))
        .Then(UAIEventResponse_AddLootModifier(EPerceptionCharacterType::Instigator))
        .Then(UAIEventResponse_VoiceReaction(GameplayTag::Sound_Voice_Reaction_Combat_Start, EPerceptionCharacterType::Instigator)
            .AddContextTagToTarget(GameplayTag::VoicelineContext_NotHadEnough))
        .Then(UAIEventResponse_SwitchState(GameplayTag::AIState_Conflict_Combat, EPerceptionCharacterType::Instigator, true));
}

class UAIARM_Crime_Trespassing_Responses_ToCombat_Enforcer : UAIARM_GuardOrLeaderRole
{
    default BlockIfHasAnyOwnedTags.AddTag(GameplayTag::AIState_Conflict_Warning);
    default BlockIfHasAnyOwnedTags.AddTag(GameplayTag::AIState_Conflict_Combat);
    default BlockIfHasAnyOwnedTags.AddTag(GameplayTag::AIState_Conflict_WatchHostile);

    default Rules.Add(GameplayTag::Crime_Trespassing)
        .RequireTrue(
            Assessed::IsCrimeSeverityCritical
        )
        .RequireFalse(
            Assessed::InstigatorWasCombatForgivenBefore
        )
        .Then(UAIEventResponse_AddEnemyModifier(EPerceptionCharacterType::Instigator))
        .Then(UAIEventResponse_AddExecuteModifier(EPerceptionCharacterType::Instigator))
        .Then(UAIEventResponse_AddLootModifier(EPerceptionCharacterType::Instigator))
        .Then(UAIEventResponse_VoiceReaction(GameplayTag::Sound_Voice_Reaction_Combat_Start, EPerceptionCharacterType::Instigator)
            .AddContextTagToTarget(GameplayTag::VoicelineContext_Intruder))
        .Then(UAIEventResponse_SwitchState(GameplayTag::AIState_Conflict_Combat, EPerceptionCharacterType::Instigator, true));

    default Rules.Add(GameplayTag::Crime_Trespassing)
        .RequireTrue(
            Assessed::IsCrimeSeverityCritical |
            Assessed::InstigatorWasCombatForgivenBefore
        )
        .Then(UAIEventResponse_AddEnemyModifier(EPerceptionCharacterType::Instigator))
        .Then(UAIEventResponse_AddExecuteModifier(EPerceptionCharacterType::Instigator))
        .Then(UAIEventResponse_AddLootModifier(EPerceptionCharacterType::Instigator))
        .Then(UAIEventResponse_VoiceReaction(GameplayTag::Sound_Voice_Reaction_Combat_Start, EPerceptionCharacterType::Instigator)
            .AddContextTagToTarget(GameplayTag::VoicelineContext_NotHadEnough))
        .Then(UAIEventResponse_SwitchState(GameplayTag::AIState_Conflict_Combat, EPerceptionCharacterType::Instigator, true));
}

class UAIARM_Crime_Trespassing_Responses_ToGetGuard : UAIAssessmentResponseModule
{
    default BlockIfHasAnyOwnedTags.AddTag(GameplayTag::AIState_Conflict_Combat);
    default BlockIfHasAnyOwnedTags.AddTag(GameplayTag::AIState_Conflict_WatchFight);

    default Rules.Add(GameplayTag::Crime_Trespassing)
        .RequireTrue(
            Assessed::IsCrimeSeverityCritical |
            Assessed::InstigatorIsStrongerThanSelf |
            Assessed::GuardsNearby
        )
        .RequireFalse(
            Assessed::IsAnyFriendlyEnforcerOrLeaderInvolved
        )
        .Then(UAIEventResponse_VoiceReaction(GameplayTag::Sound_Voice_Reaction_Alarm_CallGuards))
        .Then(UAIEventResponse_SwitchState(GameplayTag::AIState_Conflict_GoGetGuard, EPerceptionCharacterType::None));
}

class UAIARM_Crime_Trespassing_Responses_ToWatchStrongerHostile : UAIAssessmentResponseModule
{
    default BlockIfHasAnyOwnedTags.AddTag(GameplayTag::AIState_Conflict_WatchHostile);
    default BlockIfHasAnyOwnedTags.AddTag(GameplayTag::AIState_Conflict_Warning);
    default BlockIfHasAnyOwnedTags.AddTag(GameplayTag::AIState_Conflict_Combat);
    default BlockIfHasAnyOwnedTags.AddTag(GameplayTag::AIState_Conflict_TurnToAttacker);
    default BlockIfHasAnyOwnedTags.AddTag(GameplayTag::Debuff_Fear);
    default BlockIfHasAnyOwnedTags.AddTag(GameplayTag::AIState_Conflict_Flee);
    default BlockIfHasAnyOwnedTags.AddTag(GameplayTag::AIState_Conflict_Disengage);

    // No guards nearby
    default Rules.Add(GameplayTag::Crime_Trespassing)
        .RequireTrue(
            Assessed::InstigatorIsStrongerThanSelf
        )
        .RequireFalse(
            Assessed::IsCrimeSeverityMinimal |
            Assessed::IsCrimeSeverityCritical |
            Assessed::GuardsNearby |
            Assessed::IsAnyFriendlyEnforcerOrLeaderInvolved
        )
        .Then(UAIEventResponse_SuppressLastCrimeOfType(EPerceptionCharacterType::Instigator, GameplayTag::Crime_Trespassing))
        .Then(UAIEventResponse_AddHostileModifier(EPerceptionCharacterType::Instigator))
        .Then(UAIEventResponse_VoiceReaction(GameplayTag::Sound_Voice_Reaction_Crime_Intruder_WhatDoYouWant))
        .Then(UAIEventResponse_SwitchState(GameplayTag::AIState_Conflict_WatchHostile, EPerceptionCharacterType::Instigator, true));
    
    default Rules.Add(GameplayTag::Crime_Trespassing)
        .RequireTrue(
            Assessed::IsCrimeSeverityCritical |
            Assessed::InstigatorIsStrongerThanSelf
        )
        .RequireFalse(
            Assessed::GuardsNearby |
            Assessed::IsAnyFriendlyEnforcerOrLeaderInvolved
        )
        .Then(UAIEventResponse_SuppressLastCrimeOfType(EPerceptionCharacterType::Instigator, GameplayTag::Crime_Trespassing))
        .Then(UAIEventResponse_AddHostileModifier(EPerceptionCharacterType::Instigator))
        .Then(UAIEventResponse_VoiceReaction(GameplayTag::Sound_Voice_Reaction_Crime_Intruder_WhatDoYouWant))
        .Then(UAIEventResponse_SwitchState(GameplayTag::AIState_Conflict_WatchHostile, EPerceptionCharacterType::SensedCharacter));

    // Guard already involved
    default Rules.Add(GameplayTag::Crime_Trespassing)
        .RequireTrue(
            Assessed::InstigatorIsStrongerThanSelf |
            Assessed::IsAnyFriendlyEnforcerOrLeaderInvolved
        )
        .RequireFalse(
            Assessed::IsCrimeSeverityMinimal |
            Assessed::IsCrimeSeverityCritical
        )
        .Then(UAIEventResponse_SuppressLastCrimeOfType(EPerceptionCharacterType::Instigator, GameplayTag::Crime_Trespassing))
        .Then(UAIEventResponse_AddHostileModifier(EPerceptionCharacterType::Instigator))
        .Then(UAIEventResponse_SwitchState(GameplayTag::AIState_Conflict_WatchHostile, EPerceptionCharacterType::Instigator, true));
    
    default Rules.Add(GameplayTag::Crime_Trespassing)
        .RequireTrue(
            Assessed::IsCrimeSeverityCritical |
            Assessed::InstigatorIsStrongerThanSelf |
            Assessed::IsAnyFriendlyEnforcerOrLeaderInvolved
        )
        .Then(UAIEventResponse_SuppressLastCrimeOfType(EPerceptionCharacterType::Instigator, GameplayTag::Crime_Trespassing))
        .Then(UAIEventResponse_AddHostileModifier(EPerceptionCharacterType::Instigator))
        .Then(UAIEventResponse_SwitchState(GameplayTag::AIState_Conflict_WatchHostile, EPerceptionCharacterType::SensedCharacter));
}

class UAIARM_Crime_Trespassing_Responses_FromWatchStrongerHostile : UAIAssessmentResponseModule
{
    default RequireAnyOwnedTags.AddTag(GameplayTag::AIState_Conflict_WatchHostile);

    default Rules.Add(GameplayTag::Crime_Trespassing)
        .RequireTrue(
            Assessed::InstigatorIsStrongerThanSelf
        )
        .RequireFalse(
            Assessed::IsCrimeSeverityMinimal |
            Assessed::IsCrimeSeverityCritical |
            Assessed::GuardsNearby
        )
        .Then(UAIEventResponse_SuppressLastCrimeOfType(EPerceptionCharacterType::Instigator, GameplayTag::Crime_Trespassing))
        .Then(UAIEventResponse_AddHostileModifier(EPerceptionCharacterType::Instigator))
        .Then(UAIEventResponse_VoiceReaction(GameplayTag::Sound_Voice_Reaction_Crime_Intruder_InsistWhatDoYouWant));
    
    default Rules.Add(GameplayTag::Crime_Trespassing)
        .RequireTrue(
            Assessed::IsCrimeSeverityCritical |
            Assessed::InstigatorIsStrongerThanSelf
        )
        .RequireFalse(
           Assessed::GuardsNearby
        )
        .Then(UAIEventResponse_SuppressLastCrimeOfType(EPerceptionCharacterType::Instigator, GameplayTag::Crime_Trespassing))
        .Then(UAIEventResponse_AddHostileModifier(EPerceptionCharacterType::Instigator));
}

class UAIARM_Crime_Trespassing_Responses_InCombat : UAIAssessmentResponseModule
{
    default RequiredOwnedTags.AddTag(GameplayTag::AIState_Conflict_Combat);

    default Rules.Add(GameplayTag::Crime_Trespassing)
        .RequireFalse(
            Assessed::IsCrimeSeverityMinimal |
            Assessed::IsCrimeSeverityCritical
        )
        .Then(UAIEventResponse_AddHostileModifier(EPerceptionCharacterType::Instigator));
    
    default Rules.Add(GameplayTag::Crime_Trespassing)
        .RequireTrue(
            Assessed::IsCrimeSeverityCritical
        )
        .Then(UAIEventResponse_AddEnemyModifier(EPerceptionCharacterType::Instigator));
}

class UAIARM_Crime_IgnoredWarning_Trespassing_Responses : UAIAssessmentResponseModule
{
    default RequiredOwnedTags.AddTag(GameplayTag::AIState_Conflict_Warning_Trespassing);
    
    default SubModules.Add(UAIARM_Crime_IgnoredWarning_Trespassing_Responses_NonEnforcer);
    default SubModules.Add(UAIARM_Crime_IgnoredWarning_Trespassing_Responses_Enforcer);
    
    default Rules.Add(GameplayTag::AIEvent_Threat_AllWarningsDone)
        .RequireTrue(
            Assessed::IsSelfStateGroupLeader
        )
        .RequireFalse(
            Assessed::IsTrainingFight
        )
        .Then(UAIEventResponse_VoiceReaction(GameplayTag::Sound_Voice_Reaction_Combat_Start, EPerceptionCharacterType::Instigator)
            .AddContextTagToTarget(GameplayTag::VoicelineContext_Intruder));
}

class UAIARM_Crime_IgnoredWarning_Trespassing_Responses_NonEnforcer : UAIARM_NoGuardNorLeaderRole
{
    default Rules.Add(GameplayTag::AIEvent_Threat_AllWarningsDone)
        .RequireFalse(
            Assessed::InstigatorWasCombatForgivenBefore |
            Assessed::InstigatorIsStrongerThanSelf |
            Assessed::IsAnyFriendlyEnforcerOrLeaderInvolved |
            Assessed::IsTrainingFight
        )
        .Then(UAIEventResponse_AddEnemyModifier(EPerceptionCharacterType::Instigator))
        .Then(UAIEventResponse_AddLootModifier(EPerceptionCharacterType::Instigator))
        .Then(UAIEventResponse_SwitchStateWithConflictType(GameplayTag::AIState_Conflict_Combat, EPerceptionCharacterType::Instigator, EConflictType::TrueFight));
    
    default Rules.Add(GameplayTag::AIEvent_Threat_AllWarningsDone)
        .RequireTrue(
            Assessed::InstigatorWasCombatForgivenBefore
        )
        .RequireFalse(
            Assessed::InstigatorIsStrongerThanSelf |
            Assessed::IsAnyFriendlyEnforcerOrLeaderInvolved |
            Assessed::IsTrainingFight
        )
        .Then(UAIEventResponse_AddEnemyModifier(EPerceptionCharacterType::Instigator))
        .Then(UAIEventResponse_AddExecuteModifier(EPerceptionCharacterType::Instigator))
        .Then(UAIEventResponse_SwitchStateWithConflictType(GameplayTag::AIState_Conflict_Combat, EPerceptionCharacterType::Instigator, EConflictType::TrueFight));
}

class UAIARM_Crime_IgnoredWarning_Trespassing_Responses_Enforcer : UAIARM_GuardOrLeaderRole
{
    default Rules.Add(GameplayTag::AIEvent_Threat_AllWarningsDone)
        .RequireFalse(
            Assessed::InstigatorWasCombatForgivenBefore |
            Assessed::IsTrainingFight
        )
        .Then(UAIEventResponse_AddEnemyModifier(EPerceptionCharacterType::Instigator))
        .Then(UAIEventResponse_AddLootModifier(EPerceptionCharacterType::Instigator))
        .Then(UAIEventResponse_SwitchStateWithConflictType(GameplayTag::AIState_Conflict_Combat, EPerceptionCharacterType::Instigator, EConflictType::TrueFight));
    
    default Rules.Add(GameplayTag::AIEvent_Threat_AllWarningsDone)
        .RequireTrue(
            Assessed::InstigatorWasCombatForgivenBefore |
            Assessed::IsTrainingFight
        )
        .Then(UAIEventResponse_AddEnemyModifier(EPerceptionCharacterType::Instigator))
        .Then(UAIEventResponse_AddExecuteModifier(EPerceptionCharacterType::Instigator))
        .Then(UAIEventResponse_SwitchStateWithConflictType(GameplayTag::AIState_Conflict_Combat, EPerceptionCharacterType::Instigator, EConflictType::TrueFight));
}

class UAIARM_Crime_Trespassing_Wait : UAIAssessmentResponseModule
{
    default RequiredOwnedTags.AddTag(GameplayTag::AIState_Conflict_CombatEndActions);

    default Rules.Add(GameplayTag::AIEvent_WaitForDefeatedIntruder)
        .Then(UAIEventResponse_SwitchState(GameplayTag::AIState_Wait_DefeatedIntruder, EPerceptionCharacterType::None));
}

class UAIARM_Crime_Trespassing_WaitEnd : UAIAssessmentResponseModule
{
    default RequiredOwnedTags.AddTag(GameplayTag::AIState_Wait_DefeatedIntruder);

    default Rules.Add(GameplayTag::AIEvent_LastDefeatedIntruderGotUp)
        .Then(UAIEventResponse_VoiceReaction(GameplayTag::Sound_Voice_Reaction_Warning_Intruder)
            .AddContextTagToTarget(GameplayTag::VoicelineContext_Intruder));

    default Rules.Add(GameplayTag::AIEvent_State_Done)
        .Then(UAIEventResponse_SwitchState(GameplayTag::AIState_AssessGoToDailyRoutine, EPerceptionCharacterType::None));
}

class UAIARM_Crime_Trespassing_WaitReactivation_Perception : UAIAssessmentResponseModule
{
    default RequiredOwnedTags.AddTag(GameplayTag::AIState_Wait_DefeatedIntruder);

    default Rules.Add(GameplayTag::AIEvent_TrespassIntruder_StillPresentAfterDefeat)
        .Then(UAIEventResponse_AssessStillPresentTrespassCrime(EPerceptionCharacterType::Instigator));
}

class UAIARM_Crime_Trespassing_WarningEnd : UAIAssessmentResponseModule
{
    default RequiredOwnedTags.AddTag(GameplayTag::AIState_Conflict_Warning_Trespassing);

    default Rules.Add(GameplayTag::AIEvent_Sensed_NoEnemiesNoHostiles)
        .Then(UAIEventResponse_VoiceReaction(GameplayTag::Sound_Voice_Reaction_Crime_WiseMove, EPerceptionCharacterType::None))
        .Then(UAIEventResponse_SwitchState(GameplayTag::AIState_AssessGoToDailyRoutine, EPerceptionCharacterType::None));
}