class UAIARM_Crime_Human_Interaction : UAIAssessmentResponseModule
{
    default SubModules.Add(UAIARM_Crime_Interaction_Perception);
    default SubModules.Add(UAIARM_Crime_Interaction_Responses);
    default SubModules.Add(UAIARM_Crime_IgnoredWarning_Interaction_Responses);
    default SubModules.Add(UAIARM_Crime_Interaction_WarningEnd);
}

///// PERCEPTION-CRIME BINDINGS
class UAIARM_Crime_Interaction_Perception : UAIAssessmentResponseModule
{
    default BlockIfAssessedHasAnyOwnedTags.AddTag(GameplayTag::State_Perceptions_GetIgnored);

    default SubModules.Add(UAIARM_Crime_OwnedInteractableUse_Perception);
    default SubModules.Add(UAIARM_Crime_Lockpicking_Perception);
}

class UAIARM_Crime_OwnedInteractableUse_Perception : UAIAssessmentResponseModule
{
    default BlockIfAssessedHasAnyOwnedTags.AddTag(GameplayTag::State_Perceptions_GetIgnored);
    default RequirePursueCrimesOnAssessedCharacter.AddTag(GameplayTag::Crime_Interaction);

    default Rules.Add(GameplayTag::AIEvent_Seen_Interaction_OwnedInteractableUse)
        .RequireFalse(
            Assessed::SensedOrInstigatorIsBeingWarned
        )
        .Then(UAIEventResponse_AssessCrime(
            GameplayTag::Crime_Interaction,
            EPerceptionCharacterType::SensedCharacter,
            EPerceptionCharacterType::None));
}

class UAIARM_Crime_Lockpicking_Perception : UAIAssessmentResponseModule
{
    
    default RequirePursueCrimesOnAssessedCharacter.AddTag(GameplayTag::Crime_Lockpicking);

    default Rules.Add(GameplayTag::AIEvent_Seen_Interaction_Lockpicking)
        .RequireFalse(
            Assessed::SensedOrInstigatorIsBeingWarned
        )
        .Then(UAIEventResponse_AssessCrime(
            GameplayTag::Crime_Lockpicking,
            EPerceptionCharacterType::SensedCharacter,
            EPerceptionCharacterType::None));
}

/// RESPONSES

class UAIARM_Crime_Interaction_Responses : UAIAssessmentResponseModule
{
    default SubModules.Add(UAIARM_Crime_OwnedInteractableUse_Responses_ToWarningOrCombat);
    default SubModules.Add(UAIARM_Crime_OwnedInteractableUse_Responses_ToWatchStrongerHostile);
    default SubModules.Add(UAIARM_Crime_Lockpicking_Responses_ToWarningOrCombat);
    default SubModules.Add(UAIARM_Crime_Lockpicking_Responses_ToWatchStrongerHostile);
    default SubModules.Add(UAIARM_Crime_Interaction_Responses_InCombat);
}

///// RESPONSE RULES CONFIGURATIONS
class UAIARM_Crime_Lockpicking_Responses_ToWarningOrCombat : UAIAssessmentResponseModule
{
    default BlockIfHasAnyOwnedTags.AddTag(GameplayTag::AIState_Conflict_WatchHostile);
    default BlockIfHasAnyOwnedTags.AddTag(GameplayTag::AIState_Conflict_Warning);
    default BlockIfHasAnyOwnedTags.AddTag(GameplayTag::AIState_Conflict_Combat);
    default BlockIfHasAnyOwnedTags.AddTag(GameplayTag::AIState_Conflict_TurnToAttacker);
    default BlockIfHasAnyOwnedTags.AddTag(GameplayTag::Debuff_Fear);
    default BlockIfHasAnyOwnedTags.AddTag(GameplayTag::AIState_Conflict_Flee);
    default BlockIfHasAnyOwnedTags.AddTag(GameplayTag::AIState_Conflict_Disengage);

    default SubModules.Add(UAIARM_Crime_Lockpicking_Responses_ToWarning);
    default SubModules.Add(UAIARM_Crime_Lockpicking_Responses_ToCombat);

    // default Rules.Add(GameplayTag::Crime_Lockpicking)
    //     .RequireTrue(
    //         Assessed::IsCrimeSeverityMinimal
    //     )
    //     .Then(UAIEventResponse_ForgetLastCrimeOfType(EPerceptionCharacterType::Instigator, GameplayTag::Crime_Lockpicking));
        // .Then(UAIEventResponse_VoiceReaction(GameplayTag::Sound_Voice_Reaction_Wea)); TODO Reaction

    default Rules.Add(GameplayTag::Crime_Lockpicking)
        .RequireTrue(
            Assessed::IsCrimeSeverityLow
        )
        .Then(UAIEventResponse_ForgiveLastCrimeOfTypeRelevantToSelf(EPerceptionCharacterType::Instigator, GameplayTag::Crime_Lockpicking));
}

class UAIARM_Crime_Lockpicking_Responses_ToWarning : UAIAssessmentResponseModule
{
    default Rules.Add(GameplayTag::Crime_Lockpicking)
        .RequireTrue(
            Assessed::IsCrimeSeverityMedium
        )
        .RequireFalse(
            Assessed::InstigatorIsStrongerThanSelf |
            Assessed::IsAnyFriendlyEnforcerOrLeaderInvolved
        )
        .Then(UAIEventResponse_AddHostileModifier(EPerceptionCharacterType::Instigator))
        .Then(UAIEventResponse_SwitchState(GameplayTag::AIState_Conflict_Warning_Lockpicking, EPerceptionCharacterType::Instigator, true));

    default Rules.Add(GameplayTag::Crime_Lockpicking)
        .RequireTrue(
            Assessed::IsCrimeSeverityHigh
        )
        .RequireFalse(
            Assessed::InstigatorIsStrongerThanSelf |
            Assessed::IsAnyFriendlyEnforcerOrLeaderInvolved
        )
        .Then(UAIEventResponse_AddHostileModifier(EPerceptionCharacterType::Instigator))
        .Then(UAIEventResponse_SwitchState(GameplayTag::AIState_Conflict_Warning_Lockpicking, EPerceptionCharacterType::Instigator, true));
    
    // Past Crime
    default Rules.Add(GameplayTag::AIEvent_Seen_PastCrimeInstigator)
        .EventHasTag(GameplayTag::Crime_Lockpicking)
        .RequireTrue(
            Assessed::IsCrimeSeverityMedium |
            Assessed::SensedOrInstigatorIsBeingWarned
        )
        .RequireFalse(
            Assessed::InstigatorIsStrongerThanSelf |
            Assessed::IsAnyFriendlyEnforcerOrLeaderInvolved
        )
        .Then(UAIEventResponse_AddHostileModifier(EPerceptionCharacterType::Instigator))
        .Then(UAIEventResponse_SwitchState(GameplayTag::AIState_Conflict_Warning_Lockpicking, EPerceptionCharacterType::Instigator, true));

    default Rules.Add(GameplayTag::AIEvent_Seen_PastCrimeInstigator)
        .EventHasTag(GameplayTag::Crime_Lockpicking)
        .RequireTrue(
            Assessed::IsCrimeSeverityHigh |
            Assessed::SensedOrInstigatorIsBeingWarned
        )
        .RequireFalse(
            Assessed::InstigatorIsStrongerThanSelf |
            Assessed::IsAnyFriendlyEnforcerOrLeaderInvolved
        )
        .Then(UAIEventResponse_AddHostileModifier(EPerceptionCharacterType::Instigator))
        .Then(UAIEventResponse_SwitchState(GameplayTag::AIState_Conflict_Warning_Lockpicking, EPerceptionCharacterType::Instigator, true));
}

class UAIARM_Crime_Lockpicking_Responses_ToCombat : UAIAssessmentResponseModule
{
    default Rules.Add(GameplayTag::Crime_Lockpicking)
        .RequireTrue(
            Assessed::IsCrimeSeverityCritical
        )
        .RequireFalse(
            Assessed::InstigatorIsStrongerThanSelf |
            Assessed::InstigatorWasCombatForgivenBefore |
            Assessed::IsAnyFriendlyEnforcerOrLeaderInvolved
        )
        .Then(UAIEventResponse_AddEnemyModifier(EPerceptionCharacterType::Instigator))
        .Then(UAIEventResponse_AddLootModifier())
        .Then(UAIEventResponse_VoiceReaction(GameplayTag::Sound_Voice_Reaction_Combat_Start, EPerceptionCharacterType::Instigator)
            .AddContextTagToTarget(GameplayTag::VoicelineContext_Thief))
        // .Then(UAIEventResponse_ForgetAllCrimesOfType(EPerceptionCharacterType::Instigator, GameplayTag::Crime_IgnoredWarning_Lockpicking))
        .Then(UAIEventResponse_SwitchState(GameplayTag::AIState_Conflict_Combat, EPerceptionCharacterType::Instigator, true));

    default Rules.Add(GameplayTag::Crime_Lockpicking)
        .RequireTrue(
            Assessed::IsCrimeSeverityCritical |
            Assessed::InstigatorWasCombatForgivenBefore
        )
        .RequireFalse(
            Assessed::InstigatorIsStrongerThanSelf |
            Assessed::IsAnyFriendlyEnforcerOrLeaderInvolved
        )
        .Then(UAIEventResponse_AddEnemyModifier(EPerceptionCharacterType::Instigator))
        .Then(UAIEventResponse_AddLootModifier())
        .Then(UAIEventResponse_VoiceReaction(GameplayTag::Sound_Voice_Reaction_Combat_Start, EPerceptionCharacterType::Instigator)
            .AddContextTagToTarget(GameplayTag::VoicelineContext_NotHadEnough))
        // .Then(UAIEventResponse_ForgetAllCrimesOfType(EPerceptionCharacterType::Instigator, GameplayTag::Crime_IgnoredWarning_Lockpicking))
        .Then(UAIEventResponse_SwitchState(GameplayTag::AIState_Conflict_Combat, EPerceptionCharacterType::Instigator, true));
    
    // Past Crime
    default Rules.Add(GameplayTag::AIEvent_Seen_PastCrimeInstigator)
        .EventHasTag(GameplayTag::Crime_Lockpicking)
        .RequireTrue(
            Assessed::IsCrimeSeverityCritical |
            Assessed::SensedOrInstigatorIsBeingWarned
        )
        .RequireFalse(
            Assessed::InstigatorIsStrongerThanSelf |
            Assessed::InstigatorWasCombatForgivenBefore |
            Assessed::IsAnyFriendlyEnforcerOrLeaderInvolved
        )
        .Then(UAIEventResponse_AddEnemyModifier(EPerceptionCharacterType::Instigator))
        .Then(UAIEventResponse_AddLootModifier())
        .Then(UAIEventResponse_VoiceReaction(GameplayTag::Sound_Voice_Reaction_Combat_Start, EPerceptionCharacterType::Instigator)
            .AddContextTagToTarget(GameplayTag::VoicelineContext_Thief))
        // .Then(UAIEventResponse_ForgetAllCrimesOfType(EPerceptionCharacterType::Instigator, GameplayTag::Crime_IgnoredWarning_Lockpicking))
        .Then(UAIEventResponse_SwitchState(GameplayTag::AIState_Conflict_Combat, EPerceptionCharacterType::Instigator, true));

    default Rules.Add(GameplayTag::AIEvent_Seen_PastCrimeInstigator)
        .EventHasTag(GameplayTag::Crime_Lockpicking)
        .RequireTrue(
            Assessed::IsCrimeSeverityCritical |
            Assessed::InstigatorWasCombatForgivenBefore |
            Assessed::SensedOrInstigatorIsBeingWarned
        )
        .RequireFalse(
            Assessed::InstigatorIsStrongerThanSelf |
            Assessed::IsAnyFriendlyEnforcerOrLeaderInvolved
        )
        .Then(UAIEventResponse_AddEnemyModifier(EPerceptionCharacterType::Instigator))
        .Then(UAIEventResponse_AddLootModifier())
        .Then(UAIEventResponse_VoiceReaction(GameplayTag::Sound_Voice_Reaction_Combat_Start, EPerceptionCharacterType::Instigator)
            .AddContextTagToTarget(GameplayTag::VoicelineContext_NotHadEnough))
        // .Then(UAIEventResponse_ForgetAllCrimesOfType(EPerceptionCharacterType::Instigator, GameplayTag::Crime_IgnoredWarning_Lockpicking))
        .Then(UAIEventResponse_SwitchState(GameplayTag::AIState_Conflict_Combat, EPerceptionCharacterType::Instigator, true));
}

class UAIARM_Crime_OwnedInteractableUse_Responses_ToWarningOrCombat : UAIAssessmentResponseModule
{
    default BlockIfHasAnyOwnedTags.AddTag(GameplayTag::AIState_Conflict_WatchHostile);
    default BlockIfHasAnyOwnedTags.AddTag(GameplayTag::AIState_Conflict_Warning);
    default BlockIfHasAnyOwnedTags.AddTag(GameplayTag::AIState_Conflict_Combat);
    default BlockIfHasAnyOwnedTags.AddTag(GameplayTag::AIState_Conflict_TurnToAttacker);
    default BlockIfHasAnyOwnedTags.AddTag(GameplayTag::Debuff_Fear);
    default BlockIfHasAnyOwnedTags.AddTag(GameplayTag::AIState_Conflict_Flee);
    default BlockIfHasAnyOwnedTags.AddTag(GameplayTag::AIState_Conflict_Disengage);

    default SubModules.Add(UAIARM_Crime_OwnedInteractableUse_Responses_ToWarning);
    default SubModules.Add(UAIARM_Crime_OwnedInteractableUse_Responses_ToCombat);

    // default Rules.Add(GameplayTag::Crime_Interaction)
    //     .RequireTrue(
    //         Assessed::IsCrimeSeverityMinimal
    //     )
    //     .Then(UAIEventResponse_ForgetLastCrimeOfType(EPerceptionCharacterType::Instigator, GameplayTag::Crime_Interaction));
        // .Then(UAIEventResponse_VoiceReaction(GameplayTag::Sound_Voice_Reaction_Wea)); TODO Reaction

    default Rules.Add(GameplayTag::Crime_Interaction)
        .RequireTrue(
            Assessed::IsCrimeSeverityLow
        )
        .Then(UAIEventResponse_ForgiveLastCrimeOfTypeRelevantToSelf(EPerceptionCharacterType::Instigator, GameplayTag::Crime_Interaction));
}

class UAIARM_Crime_OwnedInteractableUse_Responses_ToWarning : UAIAssessmentResponseModule
{
    default Rules.Add(GameplayTag::Crime_Interaction)
        .RequireTrue(
            Assessed::IsCrimeSeverityMedium
        )
        .RequireFalse(
            Assessed::InstigatorIsStrongerThanSelf |
            Assessed::IsAnyFriendlyEnforcerOrLeaderInvolved
        )
        .Then(UAIEventResponse_AddHostileModifier(EPerceptionCharacterType::Instigator))
        .Then(UAIEventResponse_SwitchState(GameplayTag::AIState_Conflict_Warning_Interaction, EPerceptionCharacterType::Instigator, true));

    default Rules.Add(GameplayTag::Crime_Interaction)
        .RequireTrue(
            Assessed::IsCrimeSeverityHigh
        )
        .RequireFalse(
            Assessed::InstigatorIsStrongerThanSelf |
            Assessed::IsAnyFriendlyEnforcerOrLeaderInvolved
        )
        .Then(UAIEventResponse_AddHostileModifier(EPerceptionCharacterType::Instigator))
        .Then(UAIEventResponse_SwitchState(GameplayTag::AIState_Conflict_Warning_Interaction, EPerceptionCharacterType::Instigator, true));
    
    // Past Crime
    default Rules.Add(GameplayTag::AIEvent_Seen_PastCrimeInstigator)
        .EventHasTag(GameplayTag::Crime_Interaction)
        .RequireTrue(
            Assessed::IsCrimeSeverityMedium |
            Assessed::SensedOrInstigatorIsBeingWarned
        )
        .RequireFalse(
            Assessed::InstigatorIsStrongerThanSelf |
            Assessed::IsAnyFriendlyEnforcerOrLeaderInvolved
        )
        .Then(UAIEventResponse_AddHostileModifier(EPerceptionCharacterType::Instigator))
        .Then(UAIEventResponse_SwitchState(GameplayTag::AIState_Conflict_Warning_Interaction, EPerceptionCharacterType::Instigator, true));

    default Rules.Add(GameplayTag::AIEvent_Seen_PastCrimeInstigator)
        .EventHasTag(GameplayTag::Crime_Interaction)
        .RequireTrue(
            Assessed::IsCrimeSeverityHigh |
            Assessed::SensedOrInstigatorIsBeingWarned
        )
        .RequireFalse(
            Assessed::InstigatorIsStrongerThanSelf |
            Assessed::IsAnyFriendlyEnforcerOrLeaderInvolved
        )
        .Then(UAIEventResponse_AddHostileModifier(EPerceptionCharacterType::Instigator))
        .Then(UAIEventResponse_SwitchState(GameplayTag::AIState_Conflict_Warning_Interaction, EPerceptionCharacterType::Instigator, true));
}

class UAIARM_Crime_OwnedInteractableUse_Responses_ToCombat : UAIAssessmentResponseModule
{
    default Rules.Add(GameplayTag::Crime_Interaction)
        .RequireTrue(
            Assessed::IsCrimeSeverityCritical
        )
        .RequireFalse(
            Assessed::InstigatorIsStrongerThanSelf |
            Assessed::InstigatorWasCombatForgivenBefore |
            Assessed::IsAnyFriendlyEnforcerOrLeaderInvolved
        )
        .Then(UAIEventResponse_AddEnemyModifier(EPerceptionCharacterType::Instigator))
        .Then(UAIEventResponse_AddLootModifier())
        .Then(UAIEventResponse_VoiceReaction(GameplayTag::Sound_Voice_Reaction_Combat_Start_YouAskedForIt))
        .Then(UAIEventResponse_SwitchState(GameplayTag::AIState_Conflict_Combat, EPerceptionCharacterType::Instigator, true));

    default Rules.Add(GameplayTag::Crime_Interaction)
        .RequireTrue(
            Assessed::IsCrimeSeverityCritical |
            Assessed::InstigatorWasCombatForgivenBefore
        )
        .RequireFalse(
            Assessed::InstigatorIsStrongerThanSelf |
            Assessed::IsAnyFriendlyEnforcerOrLeaderInvolved
        )
        .Then(UAIEventResponse_AddEnemyModifier(EPerceptionCharacterType::Instigator))
        .Then(UAIEventResponse_AddLootModifier())
        .Then(UAIEventResponse_VoiceReaction(GameplayTag::Sound_Voice_Reaction_Combat_Start, EPerceptionCharacterType::Instigator)
            .AddContextTagToTarget(GameplayTag::VoicelineContext_NotHadEnough))
        .Then(UAIEventResponse_SwitchState(GameplayTag::AIState_Conflict_Combat, EPerceptionCharacterType::Instigator, true));
    
    // Past Crime
    default Rules.Add(GameplayTag::AIEvent_Seen_PastCrimeInstigator)
        .EventHasTag(GameplayTag::Crime_Interaction)
        .RequireTrue(
            Assessed::IsCrimeSeverityCritical |
            Assessed::SensedOrInstigatorIsBeingWarned
        )
        .RequireFalse(
            Assessed::InstigatorIsStrongerThanSelf |
            Assessed::InstigatorWasCombatForgivenBefore |
            Assessed::IsAnyFriendlyEnforcerOrLeaderInvolved
        )
        .Then(UAIEventResponse_AddEnemyModifier(EPerceptionCharacterType::Instigator))
        .Then(UAIEventResponse_AddLootModifier())
        .Then(UAIEventResponse_VoiceReaction(GameplayTag::Sound_Voice_Reaction_Combat_Start_YouAskedForIt))
        .Then(UAIEventResponse_SwitchState(GameplayTag::AIState_Conflict_Combat, EPerceptionCharacterType::Instigator, true));

    default Rules.Add(GameplayTag::AIEvent_Seen_PastCrimeInstigator)
        .EventHasTag(GameplayTag::Crime_Interaction)
        .RequireTrue(
            Assessed::IsCrimeSeverityCritical |
            Assessed::InstigatorWasCombatForgivenBefore |
            Assessed::SensedOrInstigatorIsBeingWarned
        )
        .RequireFalse(
            Assessed::InstigatorIsStrongerThanSelf |
            Assessed::IsAnyFriendlyEnforcerOrLeaderInvolved
        )
        .Then(UAIEventResponse_AddEnemyModifier(EPerceptionCharacterType::Instigator))
        .Then(UAIEventResponse_AddLootModifier())
        .Then(UAIEventResponse_VoiceReaction(GameplayTag::Sound_Voice_Reaction_Combat_Start, EPerceptionCharacterType::Instigator)
            .AddContextTagToTarget(GameplayTag::VoicelineContext_NotHadEnough))
        .Then(UAIEventResponse_SwitchState(GameplayTag::AIState_Conflict_Combat, EPerceptionCharacterType::Instigator, true));
}

class UAIARM_Crime_Lockpicking_Responses_ToWatchStrongerHostile : UAIAssessmentResponseModule
{
    default BlockIfHasAnyOwnedTags.AddTag(GameplayTag::AIState_Conflict_WatchHostile);
    default BlockIfHasAnyOwnedTags.AddTag(GameplayTag::AIState_Conflict_Warning);
    default BlockIfHasAnyOwnedTags.AddTag(GameplayTag::AIState_Conflict_Combat);
    default BlockIfHasAnyOwnedTags.AddTag(GameplayTag::AIState_Conflict_TurnToAttacker);
    default BlockIfHasAnyOwnedTags.AddTag(GameplayTag::Debuff_Fear);
    default BlockIfHasAnyOwnedTags.AddTag(GameplayTag::AIState_Conflict_Flee);
    default BlockIfHasAnyOwnedTags.AddTag(GameplayTag::AIState_Conflict_Disengage);

    default Rules.Add(GameplayTag::Crime_Lockpicking)
        .RequireTrue(
            Assessed::IsCrimeSeverityMedium |
            Assessed::InstigatorIsStrongerThanSelf
        )
        .Then(UAIEventResponse_AddHostileModifier(EPerceptionCharacterType::Instigator))
        .Then(UAIEventResponse_SwitchState(GameplayTag::AIState_Conflict_WatchHostile, EPerceptionCharacterType::Instigator, true));

    default Rules.Add(GameplayTag::Crime_Lockpicking)
        .RequireTrue(
            Assessed::IsCrimeSeverityHigh |
            Assessed::InstigatorIsStrongerThanSelf
        )
        .Then(UAIEventResponse_AddHostileModifier(EPerceptionCharacterType::Instigator))
        .Then(UAIEventResponse_SwitchState(GameplayTag::AIState_Conflict_WatchHostile, EPerceptionCharacterType::Instigator, true));
    
    default Rules.Add(GameplayTag::Crime_Lockpicking)
        .RequireTrue(
            Assessed::IsCrimeSeverityCritical |
            Assessed::InstigatorIsStrongerThanSelf |
            Assessed::IsAnyFriendlyEnforcerOrLeaderInvolved
        )
        .Then(UAIEventResponse_AddHostileModifier(EPerceptionCharacterType::Instigator))
        .Then(UAIEventResponse_SwitchState(GameplayTag::AIState_Conflict_WatchHostile, EPerceptionCharacterType::SensedCharacter));
    
    default Rules.Add(GameplayTag::Crime_Lockpicking)
        .RequireTrue(
            Assessed::IsCrimeSeverityCritical |
            Assessed::InstigatorIsStrongerThanSelf
        )
        .RequireFalse(
            Assessed::IsAnyFriendlyEnforcerOrLeaderInvolved
        )
        .Then(UAIEventResponse_AddHostileModifier(EPerceptionCharacterType::Instigator))
        .Then(UAIEventResponse_SwitchState(GameplayTag::AIState_Conflict_GoGetGuard, EPerceptionCharacterType::SensedCharacter));
}

class UAIARM_Crime_OwnedInteractableUse_Responses_ToWatchStrongerHostile : UAIAssessmentResponseModule
{
    default BlockIfHasAnyOwnedTags.AddTag(GameplayTag::AIState_Conflict_WatchHostile);
    default BlockIfHasAnyOwnedTags.AddTag(GameplayTag::AIState_Conflict_Warning);
    default BlockIfHasAnyOwnedTags.AddTag(GameplayTag::AIState_Conflict_Combat);
    default BlockIfHasAnyOwnedTags.AddTag(GameplayTag::AIState_Conflict_TurnToAttacker);
    default BlockIfHasAnyOwnedTags.AddTag(GameplayTag::Debuff_Fear);
    default BlockIfHasAnyOwnedTags.AddTag(GameplayTag::AIState_Conflict_Flee);
    default BlockIfHasAnyOwnedTags.AddTag(GameplayTag::AIState_Conflict_Disengage);

    default Rules.Add(GameplayTag::Crime_Interaction)
        .RequireTrue(
            Assessed::IsCrimeSeverityMedium |
            Assessed::InstigatorIsStrongerThanSelf
        )
        .Then(UAIEventResponse_AddHostileModifier(EPerceptionCharacterType::Instigator))
        .Then(UAIEventResponse_SwitchState(GameplayTag::AIState_Conflict_WatchHostile, EPerceptionCharacterType::Instigator, true));

    default Rules.Add(GameplayTag::Crime_Interaction)
        .RequireTrue(
            Assessed::IsCrimeSeverityHigh |
            Assessed::InstigatorIsStrongerThanSelf
        )
        .Then(UAIEventResponse_AddHostileModifier(EPerceptionCharacterType::Instigator))
        .Then(UAIEventResponse_SwitchState(GameplayTag::AIState_Conflict_WatchHostile, EPerceptionCharacterType::Instigator, true));
    
    default Rules.Add(GameplayTag::Crime_Interaction)
        .RequireTrue(
            Assessed::IsCrimeSeverityCritical |
            Assessed::InstigatorIsStrongerThanSelf |
            Assessed::IsAnyFriendlyEnforcerOrLeaderInvolved
        )
        .Then(UAIEventResponse_AddHostileModifier(EPerceptionCharacterType::Instigator))
        .Then(UAIEventResponse_SwitchState(GameplayTag::AIState_Conflict_WatchHostile, EPerceptionCharacterType::SensedCharacter));
    
    default Rules.Add(GameplayTag::Crime_Interaction)
        .RequireTrue(
            Assessed::IsCrimeSeverityCritical |
            Assessed::InstigatorIsStrongerThanSelf
        )
        .RequireFalse(
            Assessed::IsAnyFriendlyEnforcerOrLeaderInvolved
        )
        .Then(UAIEventResponse_AddHostileModifier(EPerceptionCharacterType::Instigator))
        .Then(UAIEventResponse_SwitchState(GameplayTag::AIState_Conflict_GoGetGuard, EPerceptionCharacterType::SensedCharacter));
}

class UAIARM_Crime_Interaction_Responses_InCombat : UAIAssessmentResponseModule
{
    default RequiredOwnedTags.AddTag(GameplayTag::AIState_Conflict_Combat);
    
    default SubModules.Add(UAIARM_Crime_Lockpicking_Responses_InCombat);
    default SubModules.Add(UAIARM_Crime_OwnedInteractableUse_Responses_InCombat);
}

class UAIARM_Crime_Lockpicking_Responses_InCombat : UAIAssessmentResponseModule
{    
    default Rules.Add(GameplayTag::Crime_Lockpicking)
        .RequireTrue(
            Assessed::IsCrimeSeverityCritical
        )
        .Then(UAIEventResponse_AddEnemyModifier(EPerceptionCharacterType::Instigator));
}

class UAIARM_Crime_OwnedInteractableUse_Responses_InCombat : UAIAssessmentResponseModule
{    
    default Rules.Add(GameplayTag::Crime_Interaction)
        .RequireTrue(
            Assessed::IsCrimeSeverityCritical
        )
        .Then(UAIEventResponse_AddEnemyModifier(EPerceptionCharacterType::Instigator));
}

//// IGNORED WARNING

class UAIARM_Crime_IgnoredWarning_Interaction_Responses : UAIAssessmentResponseModule
{
    default RequiredOwnedTags.AddTag(GameplayTag::AIState_Conflict_Warning);

    default SubModules.Add(UAIARM_Crime_IgnoredWarning_Lockpicking_Responses);
    default SubModules.Add(UAIARM_Crime_IgnoredWarning_OwnedInteractableUse_Responses);
}

class UAIARM_Crime_IgnoredWarning_Lockpicking_Responses : UAIAssessmentResponseModule
{
    default RequiredOwnedTags.AddTag(GameplayTag::AIState_Conflict_Warning_Lockpicking);
    
    default Rules.Add(GameplayTag::AIEvent_Threat_AllWarningsDone)
        .RequireTrue(
            Assessed::IsSelfStateGroupLeader
        )
        .RequireFalse(
            Assessed::IsTrainingFight
        )
        .Then(UAIEventResponse_AddEnemyModifier(EPerceptionCharacterType::Instigator))
        .Then(UAIEventResponse_AddLootModifier())
        .Then(UAIEventResponse_VoiceReaction(GameplayTag::Sound_Voice_Reaction_Combat_Start, EPerceptionCharacterType::Instigator)
            .AddContextTagToTarget(GameplayTag::VoicelineContext_Thief))
        .Then(UAIEventResponse_SwitchState(GameplayTag::AIState_Conflict_Combat, EPerceptionCharacterType::Instigator));
}

class UAIARM_Crime_IgnoredWarning_OwnedInteractableUse_Responses : UAIAssessmentResponseModule
{
    default RequiredOwnedTags.AddTag(GameplayTag::AIState_Conflict_Warning_Interaction);
    
    default Rules.Add(GameplayTag::AIEvent_Threat_AllWarningsDone)
        .RequireTrue(
            Assessed::IsSelfStateGroupLeader
        )
        .RequireFalse(
            Assessed::IsTrainingFight
        )
        .Then(UAIEventResponse_AddEnemyModifier(EPerceptionCharacterType::Instigator))
        .Then(UAIEventResponse_AddLootModifier())
        .Then(UAIEventResponse_VoiceReaction(GameplayTag::Sound_Voice_Reaction_Combat_Start_YouAskedForIt))
        .Then(UAIEventResponse_SwitchState(GameplayTag::AIState_Conflict_Combat, EPerceptionCharacterType::Instigator));
}

/// WARNING END
class UAIARM_Crime_Interaction_WarningEnd : UAIAssessmentResponseModule
{
    default RequireAnyOwnedTags.AddTag(GameplayTag::AIState_Conflict_Warning_Lockpicking);
    default RequireAnyOwnedTags.AddTag(GameplayTag::AIState_Conflict_Warning_Interaction);

    default Rules.Add(GameplayTag::AIEvent_Sensed_NoEnemiesNoHostiles)
        .Then(UAIEventResponse_VoiceReaction(GameplayTag::Sound_Voice_Reaction_Crime_WiseMove, EPerceptionCharacterType::None))
        .Then(UAIEventResponse_SwitchState(GameplayTag::AIState_AssessGoToDailyRoutine, EPerceptionCharacterType::None));
}