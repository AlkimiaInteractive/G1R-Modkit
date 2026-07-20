class UAIARM_Crime_Human_Theft : UAIAssessmentResponseModule
{
    default SubModules.Add(UAIARM_Crime_Theft_Perception);
    default SubModules.Add(UAIARM_Crime_Theft_Responses);
    default SubModules.Add(UAIARM_Crime_PastTheft_Responses);
    default SubModules.Add(UAIARM_Crime_Theft_Scold_Responses);
}

class UAIARM_Crime_Theft_Perception : UAIAssessmentResponseModule
{
    default Rules.Add(GameplayTag::AIEvent_Seen_Theft)
        // .RequireFalse(
        //     InvolvedItemIsValuable
        // )
        .Then(UAIEventResponse_AssessCrime(
            GameplayTag::Crime_Theft,
            EPerceptionCharacterType::SensedCharacter,
            EPerceptionCharacterType::AffectedCharacter)
        );
}

// ----------------------------------------------
//  LIVE THEFT RESPONSES
// ----------------------------------------------

class UAIARM_Crime_Theft_Responses : UAIAssessmentResponseModule
{
    default BlockIfHasAnyOwnedTags.AddTag(GameplayTag::AIState_Conflict_Warning);
    default BlockIfHasAnyOwnedTags.AddTag(GameplayTag::AIState_Conflict_WatchHostile);
    default BlockIfHasAnyOwnedTags.AddTag(GameplayTag::AIState_Conflict_WatchHostileFight);
    default BlockIfHasAnyOwnedTags.AddTag(GameplayTag::AIState_Conflict_Combat);
    default BlockIfHasAnyOwnedTags.AddTag(GameplayTag::AIState_Conflict_Disengage);
    default BlockIfHasAnyOwnedTags.AddTag(GameplayTag::AIState_Conflict_Flee);
    default BlockIfHasAnyOwnedTags.AddTag(GameplayTag::AIState_Conflict_Paralyzed);
    default BlockIfHasAnyOwnedTags.AddTag(GameplayTag::AIState_Conflict_TurnToAttacker);
    default BlockIfHasAnyOwnedTags.AddTag(GameplayTag::AIState_Conflict_ChaseAndLookForHidingCharacter);

    default SubModules.Add(UAIARM_Crime_Theft_Responses_PersonalVictim);
    default SubModules.Add(UAIARM_Crime_Theft_Responses_AreaEnforcer);
    default SubModules.Add(UAIARM_Crime_Theft_Responses_FriendOrGuildmate);
}

// ----------------------------------------------
//  Personal victim
// ----------------------------------------------

class UAIARM_Crime_Theft_Responses_PersonalVictim : UAIAssessmentResponseModule
{
    // Rep-escalated + at execute-on-defeat level -> Combat + mark for execute on defeat.
    default Rules.Add(GameplayTag::Crime_Theft)
        .RequireTrue(
            Assessed::WitnessIsPersonalVictimOfCrime |
            Assessed::CrimeReputationHasEscalated |
            Assessed::CrimeReputationAtExecuteLevel
        )
        .RequireFalse(
            Assessed::ShouldIgnoreCrime |
            Assessed::InstigatorIsStrongerThanSelf
        )
        .Then(UAIEventResponse_AddEnemyModifier(EPerceptionCharacterType::Instigator))
        .Then(UAIEventResponse_AddExecuteModifier(EPerceptionCharacterType::Instigator))
        .Then(UAIEventResponse_LeavePartyOf(EPerceptionCharacterType::Instigator))
        .Then(UAIEventResponse_VoiceReaction(GameplayTag::Sound_Voice_Reaction_Combat_Start_Thief_MyStuff, EPerceptionCharacterType::Instigator))
        .Then(UAIEventResponse_SwitchState(GameplayTag::AIState_Conflict_Combat, EPerceptionCharacterType::Instigator));

    // Rep-escalated + below execute-on-defeat level -> Combat, no execute marker.
    default Rules.Add(GameplayTag::Crime_Theft)
        .RequireTrue(
            Assessed::WitnessIsPersonalVictimOfCrime |
            Assessed::CrimeReputationHasEscalated
        )
        .RequireFalse(
            Assessed::ShouldIgnoreCrime |
            Assessed::CrimeReputationAtExecuteLevel |
            Assessed::InstigatorIsStrongerThanSelf
        )
        .Then(UAIEventResponse_AddEnemyModifier(EPerceptionCharacterType::Instigator))
        //.Then(UAIEventResponse_AddUseFistsModifier(EPerceptionCharacterType::Instigator))
        .Then(UAIEventResponse_LeavePartyOf(EPerceptionCharacterType::Instigator))
        .Then(UAIEventResponse_VoiceReaction(GameplayTag::Sound_Voice_Reaction_Combat_Start_Thief_MyStuff, EPerceptionCharacterType::Instigator))
        .Then(UAIEventResponse_SwitchState(GameplayTag::AIState_Conflict_Combat, EPerceptionCharacterType::Instigator));

    // Can confront safely (non-rep-escalated) -> WarningHostile.
    default Rules.Add(GameplayTag::Crime_Theft)
        .RequireTrue(
            Assessed::WitnessIsPersonalVictimOfCrime
        )
        .RequireFalse(
            Assessed::ShouldIgnoreCrime |
            Assessed::CrimeReputationHasEscalated |
            Assessed::InstigatorIsStrongerThanSelf
        )
        .Then(UAIEventResponse_AddHostileModifier(EPerceptionCharacterType::Instigator))
        //.Then(UAIEventResponse_AddUseFistsModifier(EPerceptionCharacterType::Instigator))
        .Then(UAIEventResponse_LeavePartyOf(EPerceptionCharacterType::Instigator))
        .Then(UAIEventResponse_VoiceReaction(GameplayTag::Sound_Voice_Reaction_Warning_Thief_GiveBack, EPerceptionCharacterType::Instigator)
            .AddContextTagToTarget(GameplayTag::VoicelineContext_Thief))
        .Then(UAIEventResponse_SwitchState(GameplayTag::AIState_Conflict_Warning_Theft, EPerceptionCharacterType::Instigator));

    // Overmatched + guards nearby -> CallGuards.
    default Rules.Add(GameplayTag::Crime_Theft)
        .RequireTrue(
            Assessed::WitnessIsPersonalVictimOfCrime |
            Assessed::InstigatorIsStrongerThanSelf |
            Assessed::GuardsNearby
        )
        .RequireFalse(
            Assessed::ShouldIgnoreCrime
        )
        .Then(UAIEventResponse_AddEnemyModifier(EPerceptionCharacterType::Instigator))
        .Then(UAIEventResponse_LeavePartyOf(EPerceptionCharacterType::Instigator))
        .Then(UAIEventResponse_VoiceReaction(GameplayTag::Sound_Voice_Reaction_Crime_Thief_GetsAway, EPerceptionCharacterType::Instigator))
        .Then(UAIEventResponse_SwitchState(GameplayTag::AIState_Conflict_GoGetGuard, EPerceptionCharacterType::None));

    // Overmatched + no guards -> WatchHostile.
    default Rules.Add(GameplayTag::Crime_Theft)
        .RequireTrue(
            Assessed::WitnessIsPersonalVictimOfCrime |
            Assessed::InstigatorIsStrongerThanSelf
        )
        .RequireFalse(
            Assessed::ShouldIgnoreCrime |
            Assessed::GuardsNearby
        )
        .Then(UAIEventResponse_AddHostileModifier(EPerceptionCharacterType::Instigator))
        .Then(UAIEventResponse_VoiceReaction(GameplayTag::Sound_Voice_Reaction_Thief_OkayKeepIt, EPerceptionCharacterType::Instigator))
        .Then(UAIEventResponse_SwitchState(GameplayTag::AIState_Conflict_WatchHostile, EPerceptionCharacterType::Instigator));
}

// ----------------------------------------------
//  Area enforcer (Guard/Leader/BodyGuard/Boss)
// ----------------------------------------------

class UAIARM_Crime_Theft_Responses_AreaEnforcer : UAIAssessmentResponseModule
{
    // Rep-escalated + at execute-on-defeat level -> Combat + mark for execute on defeat.
    default Rules.Add(GameplayTag::Crime_Theft)
        .RequireTrue(
            Assessed::WitnessIsEnforcerOfCrimeArea |
            Assessed::CrimeReputationHasEscalated |
            Assessed::CrimeReputationAtExecuteLevel
        )
        .RequireFalse(
            Assessed::ShouldIgnoreCrime |
            Assessed::WitnessIsPersonalVictimOfCrime |
            Assessed::IsAnyFriendlyEnforcerOrLeaderInvolved |
            Assessed::InstigatorIsStrongerThanSelf
        )
        .Then(UAIEventResponse_AddEnemyModifier(EPerceptionCharacterType::Instigator))
        .Then(UAIEventResponse_AddExecuteModifier(EPerceptionCharacterType::Instigator))
        .Then(UAIEventResponse_LeavePartyOf(EPerceptionCharacterType::Instigator))
        .Then(UAIEventResponse_VoiceReaction(GameplayTag::Sound_Voice_Reaction_Combat_Start_Thief_Guard, EPerceptionCharacterType::Instigator))
        .Then(UAIEventResponse_SwitchState(GameplayTag::AIState_Conflict_Combat, EPerceptionCharacterType::Instigator));

    // Rep-escalated + below execute-on-defeat level -> Combat, no execute marker.
    default Rules.Add(GameplayTag::Crime_Theft)
        .RequireTrue(
            Assessed::WitnessIsEnforcerOfCrimeArea |
            Assessed::CrimeReputationHasEscalated
        )
        .RequireFalse(
            Assessed::ShouldIgnoreCrime |
            Assessed::CrimeReputationAtExecuteLevel |
            Assessed::WitnessIsPersonalVictimOfCrime |
            Assessed::IsAnyFriendlyEnforcerOrLeaderInvolved |
            Assessed::InstigatorIsStrongerThanSelf
        )
        .Then(UAIEventResponse_AddEnemyModifier(EPerceptionCharacterType::Instigator))
        //.Then(UAIEventResponse_AddUseFistsModifier(EPerceptionCharacterType::Instigator))
        .Then(UAIEventResponse_LeavePartyOf(EPerceptionCharacterType::Instigator))
        .Then(UAIEventResponse_VoiceReaction(GameplayTag::Sound_Voice_Reaction_Combat_Start_Thief_Guard, EPerceptionCharacterType::Instigator))
        .Then(UAIEventResponse_SwitchState(GameplayTag::AIState_Conflict_Combat, EPerceptionCharacterType::Instigator));

    // Rep-escalated + overmatched + guards nearby -> CallGuards.
    default Rules.Add(GameplayTag::Crime_Theft)
        .RequireTrue(
            Assessed::WitnessIsEnforcerOfCrimeArea |
            Assessed::CrimeReputationHasEscalated |
            Assessed::InstigatorIsStrongerThanSelf |
            Assessed::GuardsNearby
        )
        .RequireFalse(
            Assessed::ShouldIgnoreCrime |
            Assessed::WitnessIsPersonalVictimOfCrime |
            Assessed::IsAnyFriendlyEnforcerOrLeaderInvolved
        )
        .Then(UAIEventResponse_AddEnemyModifier(EPerceptionCharacterType::Instigator))
        .Then(UAIEventResponse_LeavePartyOf(EPerceptionCharacterType::Instigator))
        .Then(UAIEventResponse_VoiceReaction(GameplayTag::Sound_Voice_Reaction_Crime_Thief_GetsAway, EPerceptionCharacterType::Instigator))
        .Then(UAIEventResponse_SwitchState(GameplayTag::AIState_Conflict_GoGetGuard, EPerceptionCharacterType::None));

    // First to respond (non-rep-escalated, not overmatched) -> WarningHostile.
    default Rules.Add(GameplayTag::Crime_Theft)
        .RequireTrue(
            Assessed::WitnessIsEnforcerOfCrimeArea
        )
        .RequireFalse(
            Assessed::ShouldIgnoreCrime |
            Assessed::CrimeReputationHasEscalated |
            Assessed::WitnessIsPersonalVictimOfCrime |
            Assessed::IsAnyFriendlyEnforcerOrLeaderInvolved |
            Assessed::InstigatorIsStrongerThanSelf
        )
        .Then(UAIEventResponse_AddHostileModifier(EPerceptionCharacterType::Instigator))
        //.Then(UAIEventResponse_AddUseFistsModifier(EPerceptionCharacterType::Instigator))
        .Then(UAIEventResponse_LeavePartyOf(EPerceptionCharacterType::Instigator))
        .Then(UAIEventResponse_VoiceReaction(GameplayTag::Sound_Voice_Reaction_Warning_Thief_GiveBack, EPerceptionCharacterType::Instigator)
            .AddContextTagToTarget(GameplayTag::VoicelineContext_Thief))
        .Then(UAIEventResponse_SwitchState(GameplayTag::AIState_Conflict_Warning_Theft, EPerceptionCharacterType::Instigator));

    // Overmatched + no guards -> WatchHostile.
    default Rules.Add(GameplayTag::Crime_Theft)
        .RequireTrue(
            Assessed::WitnessIsEnforcerOfCrimeArea |
            Assessed::InstigatorIsStrongerThanSelf
        )
        .RequireFalse(
            Assessed::ShouldIgnoreCrime |
            Assessed::WitnessIsPersonalVictimOfCrime |
            Assessed::IsAnyFriendlyEnforcerOrLeaderInvolved |
            Assessed::GuardsNearby
        )
        .Then(UAIEventResponse_AddHostileModifier(EPerceptionCharacterType::Instigator))
        .Then(UAIEventResponse_VoiceReaction(GameplayTag::Sound_Voice_Reaction_Thief_OkayKeepIt, EPerceptionCharacterType::Instigator))
        .Then(UAIEventResponse_SwitchState(GameplayTag::AIState_Conflict_WatchHostile, EPerceptionCharacterType::Instigator));
}

// ----------------------------------------------
//  Victim is friend or guildmate
// ----------------------------------------------

class UAIARM_Crime_Theft_Responses_FriendOrGuildmate : UAIAssessmentResponseModule
{
    // Rep-escalated -> Combat (non-lethal). Execute-on-defeat is an enforcer/victim privilege.
    default Rules.Add(GameplayTag::Crime_Theft)
        .RequireTrue(
            Assessed::CrimeReputationHasEscalated
        )
        .RequireFalse(
            Assessed::ShouldIgnoreCrime |
            Assessed::WitnessIsPersonalVictimOfCrime |
            Assessed::WitnessIsEnforcerOfCrimeArea |
            Assessed::CrimeVictimIsOutgroupToWitness |
            Assessed::IsAnyFriendlyEnforcerOrLeaderInvolved |
            Assessed::InstigatorIsStrongerThanSelf
        )
        .Then(UAIEventResponse_AddEnemyModifier(EPerceptionCharacterType::Instigator))
        //.Then(UAIEventResponse_AddUseFistsModifier(EPerceptionCharacterType::Instigator))
        .Then(UAIEventResponse_LeavePartyOf(EPerceptionCharacterType::Instigator))
        .Then(UAIEventResponse_VoiceReaction(GameplayTag::Sound_Voice_Reaction_Combat_Start_Thief, EPerceptionCharacterType::Instigator))
        .Then(UAIEventResponse_SwitchState(GameplayTag::AIState_Conflict_Combat, EPerceptionCharacterType::Instigator));

    // Rep-escalated + overmatched + guards nearby -> CallGuards (no modifier; FoG is soft).
    default Rules.Add(GameplayTag::Crime_Theft)
        .RequireTrue(
            Assessed::CrimeReputationHasEscalated |
            Assessed::InstigatorIsStrongerThanSelf |
            Assessed::GuardsNearby
        )
        .RequireFalse(
            Assessed::ShouldIgnoreCrime |
            Assessed::WitnessIsPersonalVictimOfCrime |
            Assessed::WitnessIsEnforcerOfCrimeArea |
            Assessed::CrimeVictimIsOutgroupToWitness |
            Assessed::IsAnyFriendlyEnforcerOrLeaderInvolved
        )
        .Then(UAIEventResponse_VoiceReaction(GameplayTag::Sound_Voice_Reaction_Crime_Thief_GetsAway, EPerceptionCharacterType::Instigator))
        .Then(UAIEventResponse_SwitchState(GameplayTag::AIState_Conflict_GoGetGuard, EPerceptionCharacterType::None));

    // High stakes + can confront -> WarningHostile.
    default Rules.Add(GameplayTag::Crime_Theft)
        .RequireTrue(
            Assessed::TheftStakesAreHigh
        )
        .RequireFalse(
            Assessed::ShouldIgnoreCrime |
            Assessed::CrimeReputationHasEscalated |
            Assessed::WitnessIsPersonalVictimOfCrime |
            Assessed::WitnessIsEnforcerOfCrimeArea |
            Assessed::CrimeVictimIsOutgroupToWitness |
            Assessed::InstigatorIsStrongerThanSelf
        )
        .Then(UAIEventResponse_AddHostileModifier(EPerceptionCharacterType::Instigator))
        //.Then(UAIEventResponse_AddUseFistsModifier(EPerceptionCharacterType::Instigator))
        .Then(UAIEventResponse_LeavePartyOf(EPerceptionCharacterType::Instigator))
        .Then(UAIEventResponse_VoiceReaction(GameplayTag::Sound_Voice_Reaction_Warning_Thief_GiveBack, EPerceptionCharacterType::Instigator)
            .AddContextTagToTarget(GameplayTag::VoicelineContext_Thief))
        .Then(UAIEventResponse_SwitchState(GameplayTag::AIState_Conflict_Warning_Theft, EPerceptionCharacterType::Instigator));

    // High stakes + overmatched + guards nearby -> CallGuards.
    default Rules.Add(GameplayTag::Crime_Theft)
        .RequireTrue(
            Assessed::TheftStakesAreHigh |
            Assessed::InstigatorIsStrongerThanSelf |
            Assessed::GuardsNearby
        )
        .RequireFalse(
            Assessed::ShouldIgnoreCrime |
            Assessed::CrimeReputationHasEscalated |
            Assessed::WitnessIsPersonalVictimOfCrime |
            Assessed::WitnessIsEnforcerOfCrimeArea |
            Assessed::CrimeVictimIsOutgroupToWitness
        )
        .Then(UAIEventResponse_VoiceReaction(GameplayTag::Sound_Voice_Reaction_Crime_Thief_GetsAway, EPerceptionCharacterType::Instigator))
        .Then(UAIEventResponse_SwitchState(GameplayTag::AIState_Conflict_GoGetGuard, EPerceptionCharacterType::None));

    // Low stakes + overmatched + guards nearby -> CallGuards.
    default Rules.Add(GameplayTag::Crime_Theft)
        .RequireTrue(
            Assessed::InstigatorIsStrongerThanSelf |
            Assessed::GuardsNearby
        )
        .RequireFalse(
            Assessed::ShouldIgnoreCrime |
            Assessed::CrimeReputationHasEscalated |
            Assessed::WitnessIsPersonalVictimOfCrime |
            Assessed::WitnessIsEnforcerOfCrimeArea |
            Assessed::CrimeVictimIsOutgroupToWitness |
            Assessed::TheftStakesAreHigh
        )
        .Then(UAIEventResponse_VoiceReaction(GameplayTag::Sound_Voice_Reaction_Crime_Thief_GetsAway, EPerceptionCharacterType::Instigator))
        .Then(UAIEventResponse_SwitchState(GameplayTag::AIState_Conflict_GoGetGuard, EPerceptionCharacterType::None));

    // Low stakes + overmatched + no guards -> resentment bark only (no WatchHostile).
    default Rules.Add(GameplayTag::Crime_Theft)
        .RequireTrue(
            Assessed::InstigatorIsStrongerThanSelf
        )
        .RequireFalse(
            Assessed::ShouldIgnoreCrime |
            Assessed::WitnessIsPersonalVictimOfCrime |
            Assessed::WitnessIsEnforcerOfCrimeArea |
            Assessed::CrimeVictimIsOutgroupToWitness |
            Assessed::GuardsNearby |
            Assessed::TheftStakesAreHigh
        )
        .Then(UAIEventResponse_VoiceReaction(GameplayTag::Sound_Voice_Reaction_Warning, EPerceptionCharacterType::Instigator));

    // High stakes + overmatched + no guards -> WatchHostile + LookAway.
    default Rules.Add(GameplayTag::Crime_Theft)
        .RequireTrue(
            Assessed::InstigatorIsStrongerThanSelf
        )
        .RequireTrue(
            Assessed::TheftStakesAreHigh
        )
        .RequireFalse(
            Assessed::ShouldIgnoreCrime |
            Assessed::WitnessIsPersonalVictimOfCrime |
            Assessed::WitnessIsEnforcerOfCrimeArea |
            Assessed::CrimeVictimIsOutgroupToWitness |
            Assessed::GuardsNearby
        )
        .Then(UAIEventResponse_AddHostileModifier(EPerceptionCharacterType::Instigator))
        .Then(UAIEventResponse_VoiceReaction(GameplayTag::Sound_Voice_Reaction_Crime_LookAway, EPerceptionCharacterType::Instigator)
            .AddContextTagToTarget(GameplayTag::VoicelineContext_Thief))
        .Then(UAIEventResponse_SwitchState(GameplayTag::AIState_Conflict_WatchHostile, EPerceptionCharacterType::Instigator));
}

// ----------------------------------------------
//  SHARED SCOLD RESPONSES FALLBACK
//  These rules applies to any witness who is not already fully escalated to Warn/Combat by the above rules.
// ----------------------------------------------

class UAIARM_Crime_Theft_Scold_Responses : UAIAssessmentResponseModule
{
    // Area enforcer + another friendly enforcer is already responding -> register support, don't pile.
    default Rules.Add(GameplayTag::Crime_Theft)
        .RequireTrue(
            Assessed::WitnessIsEnforcerOfCrimeArea |
            Assessed::IsAnyFriendlyEnforcerOrLeaderInvolved
        )
        .RequireFalse(
            Assessed::ShouldIgnoreCrime |
            Assessed::CrimeReputationHasEscalated |
            Assessed::WitnessIsPersonalVictimOfCrime
        )
        .Then(UAIEventResponse_VoiceReaction(GameplayTag::Sound_Voice_Reaction_Crime_Thief_HandsOff, EPerceptionCharacterType::Instigator));

    // Friend or guildmate + low stakes + can confront -> voice only, no state change, no drift.
    default Rules.Add(GameplayTag::Crime_Theft)
        .RequireFalse(
            Assessed::ShouldIgnoreCrime |
            Assessed::CrimeReputationHasEscalated |
            Assessed::WitnessIsPersonalVictimOfCrime |
            Assessed::WitnessIsEnforcerOfCrimeArea |
            Assessed::CrimeVictimIsOutgroupToWitness |
            Assessed::TheftStakesAreHigh |
            Assessed::InstigatorIsStrongerThanSelf
        )
        .Then(UAIEventResponse_VoiceReaction(GameplayTag::Sound_Voice_Reaction_Crime_Thief_HandsOff, EPerceptionCharacterType::Instigator));
}

// ----------------------------------------------
//  PAST-THEFT RESPONSES
//
//  When a witness sees a known thief walking past at some later time, only two axes
//  matter:
//    1. Cumulative severity (the carried-forward reputation across all of this criminal's
//       remembered thefts against this witness).
//    2. Witness role (Bystander / AreaEnforcer_NonGate / AreaEnforcer_GateWatchman).
//
// ----------------------------------------------

class UAIARM_Crime_PastTheft_Responses : UAIAssessmentResponseModule
{
    default BlockIfHasAnyOwnedTags.AddTag(GameplayTag::AIState_Conflict_Warning);
    default BlockIfHasAnyOwnedTags.AddTag(GameplayTag::AIState_Conflict_WatchHostile);
    default BlockIfHasAnyOwnedTags.AddTag(GameplayTag::AIState_Conflict_WatchHostileFight);
    default BlockIfHasAnyOwnedTags.AddTag(GameplayTag::AIState_Conflict_Combat);
    default BlockIfHasAnyOwnedTags.AddTag(GameplayTag::AIState_Conflict_Disengage);
    default BlockIfHasAnyOwnedTags.AddTag(GameplayTag::AIState_Conflict_Flee);
    default BlockIfHasAnyOwnedTags.AddTag(GameplayTag::AIState_Conflict_Paralyzed);
    default BlockIfHasAnyOwnedTags.AddTag(GameplayTag::AIState_Conflict_TurnToAttacker);
    default BlockIfHasAnyOwnedTags.AddTag(GameplayTag::AIState_Conflict_ChaseAndLookForHidingCharacter);

    default SubModules.Add(UAIARM_Crime_PastTheft_Responses_PersonalVictim);
    default SubModules.Add(UAIARM_Crime_PastTheft_Responses_Bystander);
    default SubModules.Add(UAIARM_Crime_PastTheft_Responses_AreaEnforcer_NonGate);
    default SubModules.Add(UAIARM_Crime_PastTheft_Responses_AreaEnforcer_GateWatchman);
    default SubModules.Add(UAIARM_Crime_IgnoredDemandPaymentWarning);
}

// ----------------------------------------------
//  Personal victim (re-sighting)
//  Mirrors UAIARM_Crime_Theft_Responses_PersonalVictim priority order.
// ----------------------------------------------

class UAIARM_Crime_PastTheft_Responses_PersonalVictim : UAIAssessmentResponseModule
{
    // Rep-escalated + execute level -> Combat + execute marker.
    default Rules.Add(GameplayTag::AIEvent_Seen_PastCrimeInstigator)
        .EventHasTag(GameplayTag::Crime_Theft)
        .RequireTrue(
            Assessed::WitnessIsPersonalVictimOfCrime |
            Assessed::CrimeReputationHasEscalated |
            Assessed::CrimeReputationAtExecuteLevel
        )
        .RequireFalse(
            Assessed::ShouldIgnoreCrime |
            Assessed::IsCrimeSeverityMinimal |
            Assessed::InstigatorIsStrongerThanSelf
        )
        .Then(UAIEventResponse_AddEnemyModifier(EPerceptionCharacterType::Instigator))
        .Then(UAIEventResponse_AddExecuteModifier(EPerceptionCharacterType::Instigator))
        .Then(UAIEventResponse_LeavePartyOf(EPerceptionCharacterType::Instigator))
        .Then(UAIEventResponse_VoiceReaction(GameplayTag::Sound_Voice_Reaction_Combat_Start_Thief_MyStuff, EPerceptionCharacterType::Instigator))
        .Then(UAIEventResponse_SwitchState(GameplayTag::AIState_Conflict_Combat, EPerceptionCharacterType::Instigator));

    // Rep-escalated + below execute level -> Combat, no execute marker.
    default Rules.Add(GameplayTag::AIEvent_Seen_PastCrimeInstigator)
        .EventHasTag(GameplayTag::Crime_Theft)
        .RequireTrue(
            Assessed::WitnessIsPersonalVictimOfCrime |
            Assessed::CrimeReputationHasEscalated
        )
        .RequireFalse(
            Assessed::ShouldIgnoreCrime |
            Assessed::IsCrimeSeverityMinimal |
            Assessed::CrimeReputationAtExecuteLevel |
            Assessed::InstigatorIsStrongerThanSelf
        )
        .Then(UAIEventResponse_AddEnemyModifier(EPerceptionCharacterType::Instigator))
        //.Then(UAIEventResponse_AddUseFistsModifier(EPerceptionCharacterType::Instigator))
        .Then(UAIEventResponse_LeavePartyOf(EPerceptionCharacterType::Instigator))
        .Then(UAIEventResponse_VoiceReaction(GameplayTag::Sound_Voice_Reaction_Combat_Start_Thief_MyStuff, EPerceptionCharacterType::Instigator))
        .Then(UAIEventResponse_SwitchState(GameplayTag::AIState_Conflict_Combat, EPerceptionCharacterType::Instigator));

    // Can confront (not overmatched, not rep-escalated) -> Warning_Theft (give-back).
    default Rules.Add(GameplayTag::AIEvent_Seen_PastCrimeInstigator)
        .EventHasTag(GameplayTag::Crime_Theft)
        .RequireTrue(
            Assessed::WitnessIsPersonalVictimOfCrime
        )
        .RequireFalse(
            Assessed::ShouldIgnoreCrime |
            Assessed::IsCrimeSeverityMinimal |
            Assessed::CrimeReputationHasEscalated |
            Assessed::InstigatorIsStrongerThanSelf
        )
        .Then(UAIEventResponse_AddHostileModifier(EPerceptionCharacterType::Instigator))
        //.Then(UAIEventResponse_AddUseFistsModifier(EPerceptionCharacterType::Instigator))
        .Then(UAIEventResponse_LeavePartyOf(EPerceptionCharacterType::Instigator))
        .Then(UAIEventResponse_VoiceReaction(GameplayTag::Sound_Voice_Reaction_Warning_Thief_GiveBack, EPerceptionCharacterType::Instigator)
            .AddContextTagToTarget(GameplayTag::VoicelineContext_Thief))
        .Then(UAIEventResponse_SwitchState(GameplayTag::AIState_Conflict_Warning_Theft, EPerceptionCharacterType::Instigator));

    // Overmatched + guards nearby -> GoGetGuard.
    default Rules.Add(GameplayTag::AIEvent_Seen_PastCrimeInstigator)
        .EventHasTag(GameplayTag::Crime_Theft)
        .RequireTrue(
            Assessed::WitnessIsPersonalVictimOfCrime |
            Assessed::InstigatorIsStrongerThanSelf |
            Assessed::GuardsNearby
        )
        .RequireFalse(
            Assessed::ShouldIgnoreCrime |
            Assessed::IsCrimeSeverityMinimal
        )
        .Then(UAIEventResponse_AddEnemyModifier(EPerceptionCharacterType::Instigator))
        .Then(UAIEventResponse_LeavePartyOf(EPerceptionCharacterType::Instigator))
        .Then(UAIEventResponse_VoiceReaction(GameplayTag::Sound_Voice_Reaction_Crime_Thief_GetsAway, EPerceptionCharacterType::Instigator))
        .Then(UAIEventResponse_SwitchState(GameplayTag::AIState_Conflict_GoGetGuard, EPerceptionCharacterType::None));

    // Overmatched + no guards -> WatchHostile.
    default Rules.Add(GameplayTag::AIEvent_Seen_PastCrimeInstigator)
        .EventHasTag(GameplayTag::Crime_Theft)
        .RequireTrue(
            Assessed::WitnessIsPersonalVictimOfCrime |
            Assessed::InstigatorIsStrongerThanSelf
        )
        .RequireFalse(
            Assessed::ShouldIgnoreCrime |
            Assessed::IsCrimeSeverityMinimal |
            Assessed::GuardsNearby
        )
        .Then(UAIEventResponse_AddHostileModifier(EPerceptionCharacterType::Instigator))
        .Then(UAIEventResponse_VoiceReaction(GameplayTag::Sound_Voice_Reaction_Crime_Thief_GetsAway, EPerceptionCharacterType::Instigator))
        .Then(UAIEventResponse_SwitchState(GameplayTag::AIState_Conflict_WatchHostile, EPerceptionCharacterType::Instigator));
}

// ----------------------------------------------
//  Bystander
// ----------------------------------------------

class UAIARM_Crime_PastTheft_Responses_Bystander : UAIARM_NoGuardNorLeaderRole
{
    // Any severity over Low -> non-enforcer bystander scolds the passing thief.
    default Rules.Add(GameplayTag::AIEvent_Seen_PastCrimeInstigator)
        .EventHasTag(GameplayTag::Crime_Theft)
        .RequireFalse(
            Assessed::IsCrimeSeverityNone |
            Assessed::IsCrimeSeverityMinimal |
            Assessed::IsCrimeSeverityLow |
            Assessed::ShouldIgnoreCrime |
            Assessed::WitnessIsEnforcerOfCrimeArea |
            Assessed::WitnessIsPersonalVictimOfCrime
        )
        .Then(UAIEventResponse_VoiceReaction(GameplayTag::Sound_Voice_Reaction_Chatter_YouStoleFromUs, EPerceptionCharacterType::Instigator));

    // Critical + can confront (not overmatched) -> CallGuards.
    // default Rules.Add(GameplayTag::AIEvent_Seen_PastCrimeInstigator)
    //     .EventHasTag(GameplayTag::Crime_Theft)
    //     .RequireTrue(
    //         Assessed::IsCrimeSeverityCritical
    //     )
    //     .RequireFalse(
    //         Assessed::ShouldIgnoreCrime |
    //         Assessed::WitnessIsEnforcerOfCrimeArea |
    //         Assessed::WitnessIsPersonalVictimOfCrime |
    //         Assessed::InstigatorIsStrongerThanSelf
    //     )
    //     .Then(UAIEventResponse_VoiceReaction(GameplayTag::Sound_Voice_Reaction_Crime_Thief_GetsAway, EPerceptionCharacterType::Instigator))
    //     .Then(UAIEventResponse_SwitchState(GameplayTag::AIState_Conflict_GoGetGuard, EPerceptionCharacterType::None));

    // // Critical + overmatched -> WatchHostile.
    // default Rules.Add(GameplayTag::AIEvent_Seen_PastCrimeInstigator)
    //     .EventHasTag(GameplayTag::Crime_Theft)
    //     .RequireTrue(
    //         Assessed::IsCrimeSeverityCritical |
    //         Assessed::InstigatorIsStrongerThanSelf
    //     )
    //     .RequireFalse(
    //         Assessed::ShouldIgnoreCrime |
    //         Assessed::WitnessIsEnforcerOfCrimeArea |
    //         Assessed::WitnessIsPersonalVictimOfCrime
    //     )
    //     .Then(UAIEventResponse_AddHostileModifier(EPerceptionCharacterType::Instigator))
    //     .Then(UAIEventResponse_VoiceReaction(GameplayTag::Sound_Voice_Reaction_Crime_Thief_GetsAway, EPerceptionCharacterType::Instigator))
    //     .Then(UAIEventResponse_SwitchState(GameplayTag::AIState_Conflict_WatchHostile, EPerceptionCharacterType::Instigator));
}

// ----------------------------------------------
//  Area enforcer
// ----------------------------------------------

class UAIARM_Crime_PastTheft_Responses_AreaEnforcer_NonGate : UAIAssessmentResponseModule
{
    default BlockIfHasAnyOwnedTags.AddTag(GameplayTag::Role_GateWatchman);

    // Low severity -> wariness chatter only.
    default Rules.Add(GameplayTag::AIEvent_Seen_PastCrimeInstigator)
        .EventHasTag(GameplayTag::Crime_Theft)
        .RequireTrue(
            Assessed::WitnessIsEnforcerOfCrimeArea |
            Assessed::IsCrimeSeverityLow
        )
        .RequireFalse(
            Assessed::ShouldIgnoreCrime
        )
        .Then(UAIEventResponse_VoiceReaction(GameplayTag::Sound_Voice_Reaction_Chatter_YouStoleFromUs, EPerceptionCharacterType::Instigator));

    // Medium severity -> wariness chatter only.
    default Rules.Add(GameplayTag::AIEvent_Seen_PastCrimeInstigator)
        .EventHasTag(GameplayTag::Crime_Theft)
        .RequireTrue(
            Assessed::WitnessIsEnforcerOfCrimeArea |
            Assessed::IsCrimeSeverityMedium
        )
        .RequireFalse(
            Assessed::ShouldIgnoreCrime
        )
        .Then(UAIEventResponse_VoiceReaction(GameplayTag::Sound_Voice_Reaction_Chatter_YouStoleFromUs, EPerceptionCharacterType::Instigator));

    // High severity -> NotWelcomeHere warning state, first to respond.
    default Rules.Add(GameplayTag::AIEvent_Seen_PastCrimeInstigator)
        .EventHasTag(GameplayTag::Crime_Theft)
        .RequireTrue(
            Assessed::WitnessIsEnforcerOfCrimeArea |
            Assessed::IsCrimeSeverityHigh
        )
        .RequireFalse(
            Assessed::ShouldIgnoreCrime |
            Assessed::IsAnyFriendlyEnforcerOrLeaderInvolved
        )
        .Then(UAIEventResponse_AddHostileModifier(EPerceptionCharacterType::Instigator))
        .Then(UAIEventResponse_SwitchState(GameplayTag::AIState_Conflict_Warning_NotWelcomeHere, EPerceptionCharacterType::Instigator));
    
    default Rules.Add(GameplayTag::AIEvent_Seen_PastCrimeInstigator)
        .EventHasTag(GameplayTag::Crime_Theft)
        .RequireTrue(
            Assessed::WitnessIsEnforcerOfCrimeArea |
            Assessed::IsCrimeSeverityCritical
        )
        .RequireFalse(
            Assessed::ShouldIgnoreCrime |
            Assessed::IsAnyFriendlyEnforcerOrLeaderInvolved
        )
        .Then(UAIEventResponse_AddHostileModifier(EPerceptionCharacterType::Instigator))
        .Then(UAIEventResponse_SwitchState(GameplayTag::AIState_Conflict_Warning_NotWelcomeHere, EPerceptionCharacterType::Instigator));

    // // Critical + can confront -> Combat + execute on defeat.
    // default Rules.Add(GameplayTag::AIEvent_Seen_PastCrimeInstigator)
    //     .EventHasTag(GameplayTag::Crime_Theft)
    //     .RequireTrue(
    //         Assessed::WitnessIsEnforcerOfCrimeArea |
    //         Assessed::IsCrimeSeverityCritical
    //     )
    //     .RequireFalse(
    //         Assessed::ShouldIgnoreCrime |
    //         Assessed::IsAnyFriendlyEnforcerOrLeaderInvolved |
    //         Assessed::InstigatorIsStrongerThanSelf
    //     )
    //     .Then(UAIEventResponse_AddEnemyModifier(EPerceptionCharacterType::Instigator))
    //     .Then(UAIEventResponse_AddExecuteModifier(EPerceptionCharacterType::Instigator))
    //     .Then(UAIEventResponse_LeavePartyOf(EPerceptionCharacterType::Instigator))
    //     .Then(UAIEventResponse_VoiceReaction(GameplayTag::Sound_Voice_Reaction_Combat_Start_Thief_Guard, EPerceptionCharacterType::Instigator))
    //     .Then(UAIEventResponse_SwitchState(GameplayTag::AIState_Conflict_Combat, EPerceptionCharacterType::Instigator));

    // // Critical + overmatched -> WatchHostile.
    // default Rules.Add(GameplayTag::AIEvent_Seen_PastCrimeInstigator)
    //     .EventHasTag(GameplayTag::Crime_Theft)
    //     .RequireTrue(
    //         Assessed::WitnessIsEnforcerOfCrimeArea |
    //         Assessed::IsCrimeSeverityCritical |
    //         Assessed::InstigatorIsStrongerThanSelf
    //     )
    //     .RequireFalse(
    //         Assessed::ShouldIgnoreCrime |
    //         Assessed::IsAnyFriendlyEnforcerOrLeaderInvolved
    //     )
    //     .Then(UAIEventResponse_AddHostileModifier(EPerceptionCharacterType::Instigator))
    //     .Then(UAIEventResponse_VoiceReaction(GameplayTag::Sound_Voice_Reaction_Crime_Thief_GetsAway, EPerceptionCharacterType::Instigator))
    //     .Then(UAIEventResponse_SwitchState(GameplayTag::AIState_Conflict_WatchHostile, EPerceptionCharacterType::Instigator));
}

// ----------------------------------------------
//  Area enforcer — gate watchman
// ----------------------------------------------

class UAIARM_Crime_PastTheft_Responses_AreaEnforcer_GateWatchman : UAIAssessmentResponseModule
{
    default RequireAnyOwnedTags.AddTag(GameplayTag::Role_GateWatchman);

    // Any non-Critical severity -> DemandPayment (fine-collection UX).
    default Rules.Add(GameplayTag::AIEvent_Seen_PastCrimeInstigator)
        .EventHasTag(GameplayTag::Crime_Theft)
        .RequireTrue(
            Assessed::WitnessIsEnforcerOfCrimeArea
        )
        .RequireFalse(
            Assessed::ShouldIgnoreCrime |
            Assessed::IsCrimeSeverityMinimal |
            Assessed::IsAnyFriendlyEnforcerOrLeaderInvolved
        )
        .Then(UAIEventResponse_AddHostileModifier(EPerceptionCharacterType::Instigator))
        .Then(UAIEventResponse_LeavePartyOf(EPerceptionCharacterType::Instigator))
        .Then(UAIEventResponse_VoiceReaction(GameplayTag::Sound_Voice_Reaction_Chatter_YouStoleFromUs, EPerceptionCharacterType::Instigator))
        .Then(UAIEventResponse_SwitchState(GameplayTag::AIState_Wait_DemandPaymentForCrimes, EPerceptionCharacterType::Instigator));

    // // Critical + can confront -> Combat + execute on defeat.
    // default Rules.Add(GameplayTag::AIEvent_Seen_PastCrimeInstigator)
    //     .EventHasTag(GameplayTag::Crime_Theft)
    //     .RequireTrue(
    //         Assessed::WitnessIsEnforcerOfCrimeArea |
    //         Assessed::IsCrimeSeverityCritical
    //     )
    //     .RequireFalse(
    //         Assessed::ShouldIgnoreCrime |
    //         Assessed::IsAnyFriendlyEnforcerOrLeaderInvolved |
    //         Assessed::InstigatorIsStrongerThanSelf
    //     )
    //     .Then(UAIEventResponse_AddEnemyModifier(EPerceptionCharacterType::Instigator))
    //     .Then(UAIEventResponse_AddExecuteModifier(EPerceptionCharacterType::Instigator))
    //     .Then(UAIEventResponse_LeavePartyOf(EPerceptionCharacterType::Instigator))
    //     .Then(UAIEventResponse_VoiceReaction(GameplayTag::Sound_Voice_Reaction_Combat_Start_Thief_Guard, EPerceptionCharacterType::Instigator))
    //     .Then(UAIEventResponse_SwitchState(GameplayTag::AIState_Conflict_Combat, EPerceptionCharacterType::Instigator));

    // // Critical + overmatched -> WatchHostile.
    // default Rules.Add(GameplayTag::AIEvent_Seen_PastCrimeInstigator)
    //     .EventHasTag(GameplayTag::Crime_Theft)
    //     .RequireTrue(
    //         Assessed::WitnessIsEnforcerOfCrimeArea |
    //         Assessed::IsCrimeSeverityCritical |
    //         Assessed::InstigatorIsStrongerThanSelf
    //     )
    //     .RequireFalse(
    //         Assessed::ShouldIgnoreCrime |
    //         Assessed::IsAnyFriendlyEnforcerOrLeaderInvolved
    //     )
    //     .Then(UAIEventResponse_AddHostileModifier(EPerceptionCharacterType::Instigator))
    //     .Then(UAIEventResponse_VoiceReaction(GameplayTag::Sound_Voice_Reaction_Chatter_YouStoleFromUs, EPerceptionCharacterType::Instigator))
    //     .Then(UAIEventResponse_SwitchState(GameplayTag::AIState_Conflict_WatchHostile, EPerceptionCharacterType::Instigator));
}

class UAIARM_Crime_IgnoredDemandPaymentWarning : UAIAssessmentResponseModule
{
    default RequiredOwnedTags.AddTag(GameplayTag::AIState_Wait_DemandPaymentForCrimes);

    default Rules.Add(GameplayTag::AIEvent_TargetRefusedToPayFine)
        .RequireTrue(
            Assessed::IsSelfStateGroupLeader
        )
        .Then(UAIEventResponse_RelayEventToOtherStateGroupMembers(
            GameplayTag::AIEvent_Group_TargetRefusedToPayFine
        ))
        .Then(UAIEventResponse_VoiceReaction(GameplayTag::Sound_Voice_Reaction_Combat_Start_Thief_Guard, EPerceptionCharacterType::Instigator))
        .Then(UAIEventResponse_SwitchStateWithConflictType(GameplayTag::AIState_Conflict_Combat, EPerceptionCharacterType::Instigator, EConflictType::PettyFight));
        
    default Rules.Add(GameplayTag::AIEvent_Group_TargetRefusedToPayFine)
        .RequireFalse(
            Assessed::IsSelfStateGroupLeader
        )
        .Then(UAIEventResponse_SwitchStateWithConflictType(GameplayTag::AIState_Conflict_Combat, EPerceptionCharacterType::Instigator, EConflictType::PettyFight));
}

// ----------------------------------------------
//  GUARD ESCORT HANDOFF
//  Generic confront-at-crime-scene dispatch for Theft crimes.
// ----------------------------------------------

class UAIARM_Crime_Theft_GuardEscortHandoff : UAIAssessmentResponseModule
{
    default SubModules.Add(UAIARM_Crime_Theft_ConfrontAtCrimeScene_InvestigateAlarm);
    default SubModules.Add(UAIARM_Crime_Theft_ConfrontAtCrimeScene_TheftPursuit);
    default SubModules.Add(UAIARM_Crime_Theft_ConfrontAtCrimeScene_GoGetGuard);
}

/** Guard (InvestigateAlarm) has sighted / reached the thief: warn with give-back and switch to Warning_Theft. */
class UAIARM_Crime_Theft_ConfrontAtCrimeScene_InvestigateAlarm : UAIAssessmentResponseModule
{
    default RequireAnyOwnedTags.AddTag(GameplayTag::AIState_Conflict_InvestigateAlarm);

    default Rules.Add(GameplayTag::AIEvent_Guard_ConfrontedCriminalAtCrimeScene)
        .EventHasTag(GameplayTag::Crime_Theft)
        .RequireFalse(
            Assessed::ShouldIgnoreCrime
        )
        .Then(UAIEventResponse_AddHostileModifier(EPerceptionCharacterType::Instigator))
        //.Then(UAIEventResponse_AddUseFistsModifier(EPerceptionCharacterType::Instigator))
        .Then(UAIEventResponse_VoiceReaction(GameplayTag::Sound_Voice_Reaction_Warning_Thief_GiveBack, EPerceptionCharacterType::Instigator)
            .AddContextTagToTarget(GameplayTag::VoicelineContext_Thief))
        .Then(UAIEventResponse_SwitchState(GameplayTag::AIState_Conflict_Warning_Theft, EPerceptionCharacterType::Instigator));
}

/** Personal-victim TheftPursuit followup has sighted / reached the thief. */
class UAIARM_Crime_Theft_ConfrontAtCrimeScene_TheftPursuit : UAIAssessmentResponseModule
{
    default RequireAnyOwnedTags.AddTag(GameplayTag::AIState_Conflict_TheftPursuit);

    default Rules.Add(GameplayTag::AIEvent_Guard_ConfrontedCriminalAtCrimeScene)
        .EventHasTag(GameplayTag::Crime_Theft)
        .RequireFalse(
            Assessed::ShouldIgnoreCrime
        )
        .Then(UAIEventResponse_AddHostileModifier(EPerceptionCharacterType::Instigator))
        //.Then(UAIEventResponse_AddUseFistsModifier(EPerceptionCharacterType::Instigator))
        .Then(UAIEventResponse_VoiceReaction(GameplayTag::Sound_Voice_Reaction_Warning_Thief_GiveBack, EPerceptionCharacterType::Instigator)
            .AddContextTagToTarget(GameplayTag::VoicelineContext_Thief))
        .Then(UAIEventResponse_SwitchState(GameplayTag::AIState_Conflict_Warning_Theft, EPerceptionCharacterType::Instigator));
}

/** Personal victim (GoGetGuard escort) arrived at the crime scene with a guard: same as _InvestigateAlarm. */
class UAIARM_Crime_Theft_ConfrontAtCrimeScene_GoGetGuard : UAIAssessmentResponseModule
{
    default RequireAnyOwnedTags.AddTag(GameplayTag::AIState_Conflict_GoGetGuard);

    default Rules.Add(GameplayTag::AIEvent_Guard_ConfrontedCriminalAtCrimeScene)
        .EventHasTag(GameplayTag::Crime_Theft)
        .RequireFalse(
            Assessed::ShouldIgnoreCrime
        )
        .Then(UAIEventResponse_AddHostileModifier(EPerceptionCharacterType::Instigator))
        //.Then(UAIEventResponse_AddUseFistsModifier(EPerceptionCharacterType::Instigator))
        .Then(UAIEventResponse_VoiceReaction(GameplayTag::Sound_Voice_Reaction_Warning_Thief_GiveBack, EPerceptionCharacterType::Instigator)
            .AddContextTagToTarget(GameplayTag::VoicelineContext_Thief))
        .Then(UAIEventResponse_SwitchState(GameplayTag::AIState_Conflict_Warning_Theft, EPerceptionCharacterType::Instigator));
}
