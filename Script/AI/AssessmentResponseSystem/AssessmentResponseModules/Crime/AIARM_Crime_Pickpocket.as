/**
 * Pickpocket crime AIARM.
 */

class UAIARM_Crime_Human_Pickpocket : UAIAssessmentResponseModule
{
    default SubModules.Add(UAIARM_Crime_Pickpocket_Perception);
    default SubModules.Add(UAIARM_Crime_Pickpocket_Responses);
    default SubModules.Add(UAIARM_Crime_Human_Pickpocket_Warning_Responses);
    default SubModules.Add(UAIARM_Crime_PastPickpocket_Responses);
    default SubModules.Add(UAIARM_Crime_Pickpocket_Scold_Responses);
}

class UAIARM_Crime_Orc_Pickpocket : UAIAssessmentResponseModule
{
    default SubModules.Add(UAIARM_Crime_Pickpocket_Perception);
    default SubModules.Add(UAIARM_Crime_Pickpocket_Responses);
    default SubModules.Add(UAIARM_Crime_PastPickpocket_Responses);
    default SubModules.Add(UAIARM_Crime_Pickpocket_Scold_Responses);
}

// ----------------------------------------------
//  PERCEPTION
// ----------------------------------------------

class UAIARM_Crime_Pickpocket_Perception : UAIAssessmentResponseModule
{
    default Rules.Add(GameplayTag::AIEvent_Seen_PotentialThief_AttemptSucceeded)
        .Then(UAIEventResponse_AssessCrime(
            GameplayTag::Crime_Pickpocket_Success,
            EPerceptionCharacterType::SensedCharacter,
            EPerceptionCharacterType::Self));

    default Rules.Add(GameplayTag::AIEvent_Seen_PotentialThief_AttemptFailed)
        .Then(UAIEventResponse_AssessCrime(
            GameplayTag::Crime_Pickpocket_Fail,
            EPerceptionCharacterType::SensedCharacter,
            EPerceptionCharacterType::Self));

    default Rules.Add(GameplayTag::AIEvent_Sensed_Pickpocketing_Succeeded_OnOther)
        .Then(UAIEventResponse_AssessCrime(
            GameplayTag::Crime_Pickpocket_Success,
            EPerceptionCharacterType::Instigator,
            EPerceptionCharacterType::AffectedCharacter));

    default Rules.Add(GameplayTag::AIEvent_Sensed_Pickpocketing_Failed_OnOther)
        .Then(UAIEventResponse_AssessCrime(
            GameplayTag::Crime_Pickpocket_Fail,
            EPerceptionCharacterType::Instigator,
            EPerceptionCharacterType::AffectedCharacter));

    default Rules.Add(GameplayTag::AIEvent_Heard_Alert_Pickpocket)
        .RequireTrue(Assessed::AffectedIsSelf)
        .Then(UAIEventResponse_AssessCrime(
            GameplayTag::Crime_Pickpocket_Success,
            EPerceptionCharacterType::Instigator,
            EPerceptionCharacterType::Self));
}

// ----------------------------------------------
//  LIVE RESPONSES
// ----------------------------------------------

class UAIARM_Crime_Pickpocket_Responses : UAIAssessmentResponseModule
{
    default SubModules.Add(UAIARM_Crime_Pickpocket_Responses_PersonalVictim);
    default SubModules.Add(UAIARM_Crime_Pickpocket_Responses_AreaEnforcer);
    default SubModules.Add(UAIARM_Crime_Pickpocket_Responses_FriendOrGuildmate);
    default SubModules.Add(UAIARM_Crime_Pickpocket_Responses_Bystander);
}

// ----------------------------------------------
//  Personal victim — non-warning paths only.
// ----------------------------------------------

class UAIARM_Crime_Pickpocket_Responses_PersonalVictim : UAIAssessmentResponseModule
{
    default BlockIfHasAnyOwnedTags.AddTag(GameplayTag::AIState_Conflict_Combat);
    default BlockIfHasAnyOwnedTags.AddTag(GameplayTag::Debuff_Fear);
    default BlockIfHasAnyOwnedTags.AddTag(GameplayTag::AIState_Conflict_Flee);
    default BlockIfHasAnyOwnedTags.AddTag(GameplayTag::AIState_Conflict_Disengage);
    default BlockIfHasAnyOwnedTags.AddTag(GameplayTag::Debuff_Defeated);
    default BlockIfHasAnyOwnedTags.AddTag(GameplayTag::State_Defeated);

    // Rep-escalated + at execute-on-defeat level (success) -> Combat + execute + loot.
    default Rules.Add(GameplayTag::Crime_Pickpocket_Success)
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
        .Then(UAIEventResponse_AddLootModifier(EPerceptionCharacterType::Instigator))
        .Then(UAIEventResponse_LeavePartyOf(EPerceptionCharacterType::Instigator))
        .Then(UAIEventResponse_VoiceReaction(GameplayTag::Sound_Voice_Reaction_Combat_Start_Thief_MyStuff, EPerceptionCharacterType::Instigator)
            .AddContextTagToTarget(GameplayTag::VoicelineContext_Thief)
            .AddContextTagToSpeaker(GameplayTag::VoicelineContext_Victim_Theft))
        .Then(UAIEventResponse_SwitchState(GameplayTag::AIState_Conflict_Combat, EPerceptionCharacterType::Instigator));

    // Rep-escalated (success), below execute-on-defeat -> Combat + loot, no execute marker.
    default Rules.Add(GameplayTag::Crime_Pickpocket_Success)
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
        .Then(UAIEventResponse_AddUseFistsModifier(EPerceptionCharacterType::Instigator))
        .Then(UAIEventResponse_AddLootModifier(EPerceptionCharacterType::Instigator))
        .Then(UAIEventResponse_LeavePartyOf(EPerceptionCharacterType::Instigator))
        .Then(UAIEventResponse_VoiceReaction(GameplayTag::Sound_Voice_Reaction_Combat_Start_Thief_MyStuff, EPerceptionCharacterType::Instigator)
            .AddContextTagToTarget(GameplayTag::VoicelineContext_Thief)
            .AddContextTagToSpeaker(GameplayTag::VoicelineContext_Victim_Theft))
        .Then(UAIEventResponse_SwitchState(GameplayTag::AIState_Conflict_Combat, EPerceptionCharacterType::Instigator));

    // Personal victim + success, not reputation-escalated yet (below bands above), not overmatched -> Combat + fists + loot.
    // Mutually exclusive with rep-escalated success rows via RequireFalse(CrimeReputationHasEscalated).
    default Rules.Add(GameplayTag::Crime_Pickpocket_Success)
        .RequireTrue(
            Assessed::WitnessIsPersonalVictimOfCrime
        )
        .RequireFalse(
            Assessed::ShouldIgnoreCrime |
            Assessed::CrimeReputationHasEscalated |
            Assessed::InstigatorIsStrongerThanSelf
        )
        .Then(UAIEventResponse_AddEnemyModifier(EPerceptionCharacterType::Instigator))
        .Then(UAIEventResponse_AddUseFistsModifier(EPerceptionCharacterType::Instigator))
        .Then(UAIEventResponse_AddLootModifier(EPerceptionCharacterType::Instigator))
        .Then(UAIEventResponse_LeavePartyOf(EPerceptionCharacterType::Instigator))
        .Then(UAIEventResponse_VoiceReaction(GameplayTag::Sound_Voice_Reaction_Combat_Start_Thief_MyStuff, EPerceptionCharacterType::Instigator)
            .AddContextTagToTarget(GameplayTag::VoicelineContext_Thief)
            .AddContextTagToSpeaker(GameplayTag::VoicelineContext_Victim_Theft))
        .Then(UAIEventResponse_SwitchState(GameplayTag::AIState_Conflict_Combat, EPerceptionCharacterType::Instigator));

    // Rep-escalated + execute (fail) -> Combat + execute, no loot.
    default Rules.Add(GameplayTag::Crime_Pickpocket_Fail)
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
        .Then(UAIEventResponse_VoiceReaction(GameplayTag::Sound_Voice_Reaction_Combat_Start_Thief, EPerceptionCharacterType::Instigator)
            .AddContextTagToTarget(GameplayTag::VoicelineContext_Thief))
        .Then(UAIEventResponse_SwitchState(GameplayTag::AIState_Conflict_Combat, EPerceptionCharacterType::Instigator));

    // Rep-escalated (fail), below execute -> Combat, no loot, no execute.
    default Rules.Add(GameplayTag::Crime_Pickpocket_Fail)
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
        .Then(UAIEventResponse_AddUseFistsModifier(EPerceptionCharacterType::Instigator))
        .Then(UAIEventResponse_LeavePartyOf(EPerceptionCharacterType::Instigator))
        .Then(UAIEventResponse_VoiceReaction(GameplayTag::Sound_Voice_Reaction_Combat_Start_Thief, EPerceptionCharacterType::Instigator)
            .AddContextTagToTarget(GameplayTag::VoicelineContext_Thief))
        .Then(UAIEventResponse_SwitchState(GameplayTag::AIState_Conflict_Combat, EPerceptionCharacterType::Instigator));

    // Overmatched victim -> bark only (DontCare); no state change. Preserves legacy behavior.
    default Rules.Add(GameplayTag::Crime_Pickpocket)
        .RequireTrue(
            Assessed::WitnessIsPersonalVictimOfCrime |
            Assessed::InstigatorIsStrongerThanSelf
        )
        .RequireFalse(
            Assessed::ShouldIgnoreCrime
        )
        .Then(UAIEventResponse_VoiceReaction(GameplayTag::Sound_Voice_Reaction_Interjection_Angry, EPerceptionCharacterType::Instigator));

    // N-th immediate failed attempt against me -> non-lethal combat, no warning state.
    default Rules.Add(GameplayTag::Crime_Pickpocket_Fail)
        .RequireTrue(
            Assessed::WitnessIsPersonalVictimOfCrime |
            Assessed::PickpocketFailCountReachedCombatThreshold
        )
        .RequireFalse(
            Assessed::ShouldIgnoreCrime |
            Assessed::CrimeReputationHasEscalated |
            Assessed::InstigatorIsStrongerThanSelf
        )
        .Then(UAIEventResponse_AddEnemyModifier(EPerceptionCharacterType::Instigator))
        .Then(UAIEventResponse_AddUseFistsModifier(EPerceptionCharacterType::Instigator))
        .Then(UAIEventResponse_LeavePartyOf(EPerceptionCharacterType::Instigator))
        .Then(UAIEventResponse_VoiceReaction(GameplayTag::Sound_Voice_Reaction_Combat_Start_Thief, EPerceptionCharacterType::Instigator)
            .AddContextTagToTarget(GameplayTag::VoicelineContext_Thief)
            .AddContextTagToSpeaker(GameplayTag::VoicelineContext_Victim_Theft))
        .Then(UAIEventResponse_SwitchState(GameplayTag::AIState_Conflict_Combat, EPerceptionCharacterType::Instigator));
}

// ----------------------------------------------
//  Area enforcer — non-warning paths only.
// ----------------------------------------------

class UAIARM_Crime_Pickpocket_Responses_AreaEnforcer : UAIAssessmentResponseModule
{
    default BlockIfHasAnyOwnedTags.AddTag(GameplayTag::AIState_Conflict_Combat);
    default BlockIfHasAnyOwnedTags.AddTag(GameplayTag::Debuff_Fear);
    default BlockIfHasAnyOwnedTags.AddTag(GameplayTag::AIState_Conflict_Flee);
    default BlockIfHasAnyOwnedTags.AddTag(GameplayTag::AIState_Conflict_Disengage);
    default BlockIfHasAnyOwnedTags.AddTag(GameplayTag::Debuff_Defeated);
    default BlockIfHasAnyOwnedTags.AddTag(GameplayTag::State_Defeated);

    // Rep-escalated + execute level -> Combat + execute (success: loot, fail: no loot).
    default Rules.Add(GameplayTag::Crime_Pickpocket_Success)
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
        .Then(UAIEventResponse_AddLootModifier(EPerceptionCharacterType::Instigator))
        .Then(UAIEventResponse_LeavePartyOf(EPerceptionCharacterType::Instigator))
        .Then(UAIEventResponse_VoiceReaction(GameplayTag::Sound_Voice_Reaction_Combat_Start_Thief, EPerceptionCharacterType::Instigator)
            .AddContextTagToTarget(GameplayTag::VoicelineContext_Thief))
        .Then(UAIEventResponse_SwitchState(GameplayTag::AIState_Conflict_Combat, EPerceptionCharacterType::Instigator));

    // Rep-escalated below execute (success) -> Combat + loot.
    default Rules.Add(GameplayTag::Crime_Pickpocket_Success)
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
        .Then(UAIEventResponse_AddUseFistsModifier(EPerceptionCharacterType::Instigator))
        .Then(UAIEventResponse_AddLootModifier(EPerceptionCharacterType::Instigator))
        .Then(UAIEventResponse_LeavePartyOf(EPerceptionCharacterType::Instigator))
        .Then(UAIEventResponse_VoiceReaction(GameplayTag::Sound_Voice_Reaction_Combat_Start_Thief, EPerceptionCharacterType::Instigator)
            .AddContextTagToTarget(GameplayTag::VoicelineContext_Thief))
        .Then(UAIEventResponse_SwitchState(GameplayTag::AIState_Conflict_Combat, EPerceptionCharacterType::Instigator));

    // Rep-escalated + execute (fail) -> Combat + execute.
    default Rules.Add(GameplayTag::Crime_Pickpocket_Fail)
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
        .Then(UAIEventResponse_VoiceReaction(GameplayTag::Sound_Voice_Reaction_Combat_Start_Thief, EPerceptionCharacterType::Instigator)
            .AddContextTagToTarget(GameplayTag::VoicelineContext_Thief))
        .Then(UAIEventResponse_SwitchState(GameplayTag::AIState_Conflict_Combat, EPerceptionCharacterType::Instigator));

    // Rep-escalated below execute (fail) -> Combat.
    default Rules.Add(GameplayTag::Crime_Pickpocket_Fail)
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
        .Then(UAIEventResponse_AddUseFistsModifier(EPerceptionCharacterType::Instigator))
        .Then(UAIEventResponse_LeavePartyOf(EPerceptionCharacterType::Instigator))
        .Then(UAIEventResponse_VoiceReaction(GameplayTag::Sound_Voice_Reaction_Combat_Start_Thief, EPerceptionCharacterType::Instigator)
            .AddContextTagToTarget(GameplayTag::VoicelineContext_Thief))
        .Then(UAIEventResponse_SwitchState(GameplayTag::AIState_Conflict_Combat, EPerceptionCharacterType::Instigator));

    // Enforcer overmatched + success -> alert victim + BehindYou bark, no combat.
    default Rules.Add(GameplayTag::Crime_Pickpocket_Success)
        .RequireTrue(
            Assessed::WitnessIsEnforcerOfCrimeArea |
            Assessed::InstigatorIsStrongerThanSelf
        )
        .RequireFalse(
            Assessed::ShouldIgnoreCrime |
            Assessed::CrimeReputationHasEscalated |
            Assessed::WitnessIsPersonalVictimOfCrime |
            Assessed::IsAnyFriendlyEnforcerOrLeaderInvolved
        )
        .Then(UAIEventResponse_LeavePartyOf(EPerceptionCharacterType::Instigator))
        .Then(UAIEventResponse_VoiceReaction(GameplayTag::Sound_Voice_Reaction_Crime_Pickpocketing_BehindYou, EPerceptionCharacterType::None))
        .Then(UAIEventResponse_AlertVictimOfPickpocketing());
}

// ----------------------------------------------
//  Friend or guildmate of victim — non-warning paths only.
// ----------------------------------------------

class UAIARM_Crime_Pickpocket_Responses_FriendOrGuildmate : UAIAssessmentResponseModule
{
    default BlockIfHasAnyOwnedTags.AddTag(GameplayTag::AIState_Conflict_Combat);
    default BlockIfHasAnyOwnedTags.AddTag(GameplayTag::Debuff_Fear);
    default BlockIfHasAnyOwnedTags.AddTag(GameplayTag::AIState_Conflict_Flee);
    default BlockIfHasAnyOwnedTags.AddTag(GameplayTag::AIState_Conflict_Disengage);
    default BlockIfHasAnyOwnedTags.AddTag(GameplayTag::Debuff_Defeated);
    default BlockIfHasAnyOwnedTags.AddTag(GameplayTag::State_Defeated);

    // Rep at execute level -> Combat (fists only; FoG has no execute/loot privilege).
    default Rules.Add(GameplayTag::Crime_Pickpocket)
        .RequireTrue(
            Assessed::CrimeReputationAtExecuteLevel
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
        .Then(UAIEventResponse_AddUseFistsModifier(EPerceptionCharacterType::Instigator))
        .Then(UAIEventResponse_LeavePartyOf(EPerceptionCharacterType::Instigator))
        .Then(UAIEventResponse_VoiceReaction(GameplayTag::Sound_Voice_Reaction_Combat_Start_Thief, EPerceptionCharacterType::Instigator)
            .AddContextTagToTarget(GameplayTag::VoicelineContext_Thief))
        .Then(UAIEventResponse_SwitchState(GameplayTag::AIState_Conflict_Combat, EPerceptionCharacterType::Instigator));

    // Overmatched + success -> alert victim + BehindYou bark, no combat.
    default Rules.Add(GameplayTag::Crime_Pickpocket_Success)
        .RequireTrue(
            Assessed::InstigatorIsStrongerThanSelf
        )
        .RequireFalse(
            Assessed::ShouldIgnoreCrime |
            Assessed::WitnessIsPersonalVictimOfCrime |
            Assessed::WitnessIsEnforcerOfCrimeArea |
            Assessed::CrimeVictimIsOutgroupToWitness
        )
        .Then(UAIEventResponse_LeavePartyOf(EPerceptionCharacterType::Instigator))
        .Then(UAIEventResponse_VoiceReaction(GameplayTag::Sound_Voice_Reaction_Crime_Pickpocketing_BehindYou, EPerceptionCharacterType::None))
        .Then(UAIEventResponse_AlertVictimOfPickpocketing());
}

// ----------------------------------------------
//  Bystander — alert flow on success.
// ----------------------------------------------

class UAIARM_Crime_Pickpocket_Responses_Bystander : UAIAssessmentResponseModule
{
    default BlockIfHasAnyOwnedTags.AddTag(GameplayTag::AIState_Conflict_Combat);
    default BlockIfHasAnyOwnedTags.AddTag(GameplayTag::Debuff_Fear);
    default BlockIfHasAnyOwnedTags.AddTag(GameplayTag::AIState_Conflict_Flee);
    default BlockIfHasAnyOwnedTags.AddTag(GameplayTag::AIState_Conflict_Disengage);
    default BlockIfHasAnyOwnedTags.AddTag(GameplayTag::Debuff_Defeated);
    default BlockIfHasAnyOwnedTags.AddTag(GameplayTag::State_Defeated);

    // Bystander (outgroup or in-group) witnesses success on someone else -> investigate alert.
    default Rules.Add(GameplayTag::Crime_Pickpocket_Success)
        .RequireFalse(
            Assessed::AffectedIsSelf |
            Assessed::ShouldIgnoreCrime |
            Assessed::WitnessIsPersonalVictimOfCrime |
            Assessed::WitnessIsEnforcerOfCrimeArea |
            Assessed::CrimeReputationAtExecuteLevel |
            Assessed::IsCrimeSeverityMinimal
        )
        .Then(UAIEventResponse_SwitchState(GameplayTag::AIState_AlertCrime_Pickpocket, EPerceptionCharacterType::None));
}

// ----------------------------------------------
//  WARNING ESCALATION
// ----------------------------------------------

class UAIARM_Crime_Human_Pickpocket_Warning_Responses : UAIAssessmentResponseModule
{
    default BlockIfHasAnyOwnedTags.AddTag(GameplayTag::AIState_Conflict_Combat);
    default BlockIfHasAnyOwnedTags.AddTag(GameplayTag::AIState_Conflict_Warning);
    default BlockIfHasAnyOwnedTags.AddTag(GameplayTag::Debuff_Fear);
    default BlockIfHasAnyOwnedTags.AddTag(GameplayTag::AIState_Conflict_Flee);
    default BlockIfHasAnyOwnedTags.AddTag(GameplayTag::AIState_Conflict_Disengage);
    default BlockIfHasAnyOwnedTags.AddTag(GameplayTag::Debuff_Defeated);
    default BlockIfHasAnyOwnedTags.AddTag(GameplayTag::State_Defeated);

    // Personal victim + fail (under threshold) -> bark Pickpocketing_Failed + Warning_Pickpocket.
    default Rules.Add(GameplayTag::Crime_Pickpocket_Fail)
        .RequireTrue(
            Assessed::WitnessIsPersonalVictimOfCrime
        )
        .RequireFalse(
            Assessed::ShouldIgnoreCrime |
            Assessed::CrimeReputationHasEscalated |
            Assessed::PickpocketFailCountReachedCombatThreshold |
            Assessed::InstigatorIsStrongerThanSelf
        )
        .Then(UAIEventResponse_AddHostileModifier(EPerceptionCharacterType::Instigator))
        .Then(UAIEventResponse_LeavePartyOf(EPerceptionCharacterType::Instigator))
        .Then(UAIEventResponse_VoiceReaction(GameplayTag::Sound_Voice_Reaction_Crime_Pickpocketing_Failed, EPerceptionCharacterType::Instigator))
        .Then(UAIEventResponse_SwitchState(GameplayTag::AIState_Conflict_Warning_Pickpocket, EPerceptionCharacterType::Instigator));

    // Personal victim + success -> combat from UAIARM_Crime_Pickpocket_Responses_PersonalVictim (no Warning_Pickpocket).

    // Area enforcer + fresh crime (non-escalated, can confront) -> AlertVictim + BehindYou + Warning_Pickpocket.
    default Rules.Add(GameplayTag::Crime_Pickpocket)
        .RequireTrue(
            Assessed::WitnessIsEnforcerOfCrimeArea
        )
        .RequireFalse(
            Assessed::ShouldIgnoreCrime |
            Assessed::WitnessIsPersonalVictimOfCrime |
            Assessed::CrimeReputationHasEscalated |
            Assessed::IsAnyFriendlyEnforcerOrLeaderInvolved |
            Assessed::InstigatorIsStrongerThanSelf
        )
        .Then(UAIEventResponse_AddHostileModifier(EPerceptionCharacterType::Instigator))
        .Then(UAIEventResponse_LeavePartyOf(EPerceptionCharacterType::Instigator))
        .Then(UAIEventResponse_VoiceReaction(GameplayTag::Sound_Voice_Reaction_Crime_Pickpocketing_BehindYou, EPerceptionCharacterType::Instigator))
        .Then(UAIEventResponse_AlertVictimOfPickpocketing())
        .Then(UAIEventResponse_SwitchState(GameplayTag::AIState_Conflict_Warning_Pickpocket, EPerceptionCharacterType::Instigator));
}

// ----------------------------------------------
//  SHARED SCOLD RESPONSES FALLBACK
// ----------------------------------------------

class UAIARM_Crime_Pickpocket_Scold_Responses : UAIAssessmentResponseModule
{
    default BlockIfHasAnyOwnedTags.AddTag(GameplayTag::AIState_Conflict_Combat);
    default BlockIfHasAnyOwnedTags.AddTag(GameplayTag::Debuff_Fear);
    default BlockIfHasAnyOwnedTags.AddTag(GameplayTag::AIState_Conflict_Flee);
    default BlockIfHasAnyOwnedTags.AddTag(GameplayTag::AIState_Conflict_Disengage);
    default BlockIfHasAnyOwnedTags.AddTag(GameplayTag::Debuff_Defeated);
    default BlockIfHasAnyOwnedTags.AddTag(GameplayTag::State_Defeated);
    default BlockIfHasAnyOwnedTags.AddTag(GameplayTag::AIState_Conflict_Warning);

    // Bystander/FoG sees a fail on someone else -> Vocative_Angry bark.
    default Rules.Add(GameplayTag::Crime_Pickpocket_Fail)
        .RequireFalse(
            Assessed::AffectedIsSelf |
            Assessed::ShouldIgnoreCrime |
            Assessed::WitnessIsEnforcerOfCrimeArea
        )
        .Then(UAIEventResponse_VoiceReaction(GameplayTag::Sound_Voice_Address_Vocative_Angry, EPerceptionCharacterType::Instigator));

    // Area enforcer + another friendly enforcer is already responding -> register support, don't pile.
    default Rules.Add(GameplayTag::Crime_Pickpocket)
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
}

// ----------------------------------------------
//  PAST-PICKPOCKET RESPONSES
// ----------------------------------------------

class UAIARM_Crime_PastPickpocket_Responses : UAIAssessmentResponseModule
{
    default SubModules.Add(UAIARM_Crime_PastPickpocket_Responses_ModifiersOnly);
    default SubModules.Add(UAIARM_Crime_PastPickpocket_Responses_Bystander);
    default SubModules.Add(UAIARM_Crime_PastPickpocket_Responses_AreaEnforcer);
    default SubModules.Add(UAIARM_Crime_PastPickpocket_Responses_PersonalVictim);
}

// ----------------------------------------------
//  Modifier-only attachment for already-engaged witnesses.
// ----------------------------------------------

class UAIARM_Crime_PastPickpocket_Responses_ModifiersOnly : UAIAssessmentResponseModule
{
    default RequireAnyOwnedTags.AddTag(GameplayTag::AIState_Conflict_Combat);
    default RequireAnyOwnedTags.AddTag(GameplayTag::AIState_Conflict_Disengage);
    default RequireAnyOwnedTags.AddTag(GameplayTag::Debuff_Defeated);
    default RequireAnyOwnedTags.AddTag(GameplayTag::State_Defeated);

    // Critical -> mark enemy and use fists.
    default Rules.Add(GameplayTag::AIEvent_Seen_PastCrimeInstigator)
        .EventHasTag(GameplayTag::Crime_Pickpocket)
        .RequireTrue(
            Assessed::IsCrimeSeverityCritical
        )
        .RequireFalse(
            Assessed::ShouldIgnoreCrime
        )
        .Then(UAIEventResponse_AddEnemyModifier(EPerceptionCharacterType::Instigator))
        .Then(UAIEventResponse_AddUseFistsModifier(EPerceptionCharacterType::Instigator));

    // Critical success -> additionally allow looting back the criminal.
    default Rules.Add(GameplayTag::AIEvent_Seen_PastCrimeInstigator)
        .EventHasTag(GameplayTag::Crime_Pickpocket_Success)
        .RequireTrue(
            Assessed::IsCrimeSeverityCritical
        )
        .RequireFalse(
            Assessed::ShouldIgnoreCrime
        )
        .Then(UAIEventResponse_AddLootModifier(EPerceptionCharacterType::Instigator));
}

// ----------------------------------------------
//  Bystander past-pickpocket (severity ladder)
// ----------------------------------------------

class UAIARM_Crime_PastPickpocket_Responses_Bystander : UAIAssessmentResponseModule
{
    default BlockIfHasAnyOwnedTags.AddTag(GameplayTag::AIState_Conflict_Combat);
    default BlockIfHasAnyOwnedTags.AddTag(GameplayTag::AIState_Conflict_Warning);
    default BlockIfHasAnyOwnedTags.AddTag(GameplayTag::Debuff_Fear);
    default BlockIfHasAnyOwnedTags.AddTag(GameplayTag::AIState_Conflict_Flee);
    default BlockIfHasAnyOwnedTags.AddTag(GameplayTag::AIState_Conflict_Disengage);
    default BlockIfHasAnyOwnedTags.AddTag(GameplayTag::Debuff_Defeated);
    default BlockIfHasAnyOwnedTags.AddTag(GameplayTag::State_Defeated);

    // Low severity -> wariness chatter only.
    default Rules.Add(GameplayTag::AIEvent_Seen_PastCrimeInstigator)
        .EventHasTag(GameplayTag::Crime_Pickpocket)
        .RequireTrue(
            Assessed::IsCrimeSeverityLow
        )
        .RequireFalse(
            Assessed::ShouldIgnoreCrime |
            Assessed::WitnessIsEnforcerOfCrimeArea
        )
        .Then(UAIEventResponse_VoiceReaction(GameplayTag::Sound_Voice_Reaction_Crime_Thief_HandsOff, EPerceptionCharacterType::Instigator));

    // Medium severity -> resentful bark.
    default Rules.Add(GameplayTag::AIEvent_Seen_PastCrimeInstigator)
        .EventHasTag(GameplayTag::Crime_Pickpocket)
        .RequireTrue(
            Assessed::IsCrimeSeverityMedium
        )
        .RequireFalse(
            Assessed::ShouldIgnoreCrime |
            Assessed::WitnessIsEnforcerOfCrimeArea
        )
        .Then(UAIEventResponse_VoiceReaction(GameplayTag::Sound_Voice_Reaction_Crime_Thief_HandsOff, EPerceptionCharacterType::Instigator));

    // High severity -> alert flow.
    default Rules.Add(GameplayTag::AIEvent_Seen_PastCrimeInstigator)
        .EventHasTag(GameplayTag::Crime_Pickpocket)
        .RequireTrue(
            Assessed::IsCrimeSeverityHigh
        )
        .RequireFalse(
            Assessed::ShouldIgnoreCrime |
            Assessed::WitnessIsEnforcerOfCrimeArea
        )
        .Then(UAIEventResponse_SwitchState(GameplayTag::AIState_AlertCrime_Pickpocket, EPerceptionCharacterType::None));

    // Critical success or overmatched -> alert victim + BehindYou (no combat from bystander).
    default Rules.Add(GameplayTag::AIEvent_Seen_PastCrimeInstigator)
        .EventHasTag(GameplayTag::Crime_Pickpocket_Success)
        .RequireTrue(
            Assessed::IsCrimeSeverityCritical |
            Assessed::InstigatorIsStrongerThanSelf
        )
        .RequireFalse(
            Assessed::ShouldIgnoreCrime |
            Assessed::WitnessIsEnforcerOfCrimeArea
        )
        .Then(UAIEventResponse_LeavePartyOf(EPerceptionCharacterType::Instigator))
        .Then(UAIEventResponse_VoiceReaction(GameplayTag::Sound_Voice_Reaction_Crime_Pickpocketing_BehindYou, EPerceptionCharacterType::None))
        .Then(UAIEventResponse_AlertVictimOfPickpocketing());
}

// ----------------------------------------------
//  Area enforcer past-pickpocket
// ----------------------------------------------

class UAIARM_Crime_PastPickpocket_Responses_AreaEnforcer : UAIAssessmentResponseModule
{
    default BlockIfHasAnyOwnedTags.AddTag(GameplayTag::AIState_Conflict_Combat);
    default BlockIfHasAnyOwnedTags.AddTag(GameplayTag::AIState_Conflict_Warning);
    default BlockIfHasAnyOwnedTags.AddTag(GameplayTag::Debuff_Fear);
    default BlockIfHasAnyOwnedTags.AddTag(GameplayTag::AIState_Conflict_Flee);
    default BlockIfHasAnyOwnedTags.AddTag(GameplayTag::AIState_Conflict_Disengage);
    default BlockIfHasAnyOwnedTags.AddTag(GameplayTag::Debuff_Defeated);
    default BlockIfHasAnyOwnedTags.AddTag(GameplayTag::State_Defeated);

    // Critical past success + can confront -> Combat (with execute marker when reputation at execute level).
    default Rules.Add(GameplayTag::AIEvent_Seen_PastCrimeInstigator)
        .EventHasTag(GameplayTag::Crime_Pickpocket_Success)
        .RequireTrue(
            Assessed::WitnessIsEnforcerOfCrimeArea |
            Assessed::IsCrimeSeverityCritical |
            Assessed::CrimeReputationAtExecuteLevel
        )
        .RequireFalse(
            Assessed::ShouldIgnoreCrime |
            Assessed::IsAnyFriendlyEnforcerOrLeaderInvolved |
            Assessed::InstigatorIsStrongerThanSelf
        )
        .Then(UAIEventResponse_AddEnemyModifier(EPerceptionCharacterType::Instigator))
        .Then(UAIEventResponse_AddExecuteModifier(EPerceptionCharacterType::Instigator))
        .Then(UAIEventResponse_AddLootModifier(EPerceptionCharacterType::Instigator))
        .Then(UAIEventResponse_LeavePartyOf(EPerceptionCharacterType::Instigator))
        .Then(UAIEventResponse_VoiceReaction(GameplayTag::Sound_Voice_Reaction_Combat_Start, EPerceptionCharacterType::Instigator)
            .AddContextTagToTarget(GameplayTag::VoicelineContext_Thief))
        .Then(UAIEventResponse_AlertVictimOfPickpocketing())
        .Then(UAIEventResponse_SwitchState(GameplayTag::AIState_Conflict_Combat, EPerceptionCharacterType::Instigator));

    // Critical past success below execute -> Combat (no execute).
    default Rules.Add(GameplayTag::AIEvent_Seen_PastCrimeInstigator)
        .EventHasTag(GameplayTag::Crime_Pickpocket_Success)
        .RequireTrue(
            Assessed::WitnessIsEnforcerOfCrimeArea |
            Assessed::IsCrimeSeverityCritical
        )
        .RequireFalse(
            Assessed::ShouldIgnoreCrime |
            Assessed::CrimeReputationAtExecuteLevel |
            Assessed::IsAnyFriendlyEnforcerOrLeaderInvolved |
            Assessed::InstigatorIsStrongerThanSelf
        )
        .Then(UAIEventResponse_AddEnemyModifier(EPerceptionCharacterType::Instigator))
        .Then(UAIEventResponse_AddUseFistsModifier(EPerceptionCharacterType::Instigator))
        .Then(UAIEventResponse_AddLootModifier(EPerceptionCharacterType::Instigator))
        .Then(UAIEventResponse_LeavePartyOf(EPerceptionCharacterType::Instigator))
        .Then(UAIEventResponse_VoiceReaction(GameplayTag::Sound_Voice_Reaction_Combat_Start, EPerceptionCharacterType::Instigator)
            .AddContextTagToTarget(GameplayTag::VoicelineContext_Thief))
        .Then(UAIEventResponse_AlertVictimOfPickpocketing())
        .Then(UAIEventResponse_SwitchState(GameplayTag::AIState_Conflict_Combat, EPerceptionCharacterType::Instigator));

    // Critical past fail -> Combat (no execute).
    default Rules.Add(GameplayTag::AIEvent_Seen_PastCrimeInstigator)
        .EventHasTag(GameplayTag::Crime_Pickpocket_Fail)
        .RequireTrue(
            Assessed::WitnessIsEnforcerOfCrimeArea |
            Assessed::IsCrimeSeverityCritical
        )
        .RequireFalse(
            Assessed::ShouldIgnoreCrime |
            Assessed::IsAnyFriendlyEnforcerOrLeaderInvolved |
            Assessed::InstigatorIsStrongerThanSelf
        )
        .Then(UAIEventResponse_AddEnemyModifier(EPerceptionCharacterType::Instigator))
        .Then(UAIEventResponse_AddUseFistsModifier(EPerceptionCharacterType::Instigator))
        .Then(UAIEventResponse_AddLootModifier(EPerceptionCharacterType::Instigator))
        .Then(UAIEventResponse_LeavePartyOf(EPerceptionCharacterType::Instigator))
        .Then(UAIEventResponse_VoiceReaction(GameplayTag::Sound_Voice_Reaction_Combat_Start, EPerceptionCharacterType::Instigator)
            .AddContextTagToTarget(GameplayTag::VoicelineContext_Thief))
        .Then(UAIEventResponse_SwitchState(GameplayTag::AIState_Conflict_Combat, EPerceptionCharacterType::Instigator));

    // High severity past -> alert.
    default Rules.Add(GameplayTag::AIEvent_Seen_PastCrimeInstigator)
        .EventHasTag(GameplayTag::Crime_Pickpocket)
        .RequireTrue(
            Assessed::WitnessIsEnforcerOfCrimeArea |
            Assessed::IsCrimeSeverityHigh
        )
        .RequireFalse(
            Assessed::ShouldIgnoreCrime |
            Assessed::IsAnyFriendlyEnforcerOrLeaderInvolved
        )
        .Then(UAIEventResponse_SwitchState(GameplayTag::AIState_AlertCrime_Pickpocket, EPerceptionCharacterType::None));

    // Low/Medium severity past -> chatter only.
    default Rules.Add(GameplayTag::AIEvent_Seen_PastCrimeInstigator)
        .EventHasTag(GameplayTag::Crime_Pickpocket)
        .RequireTrue(
            Assessed::WitnessIsEnforcerOfCrimeArea |
            Assessed::IsCrimeSeverityLow
        )
        .RequireFalse(
            Assessed::ShouldIgnoreCrime
        )
        .Then(UAIEventResponse_VoiceReaction(GameplayTag::Sound_Voice_Reaction_Crime_Thief_HandsOff, EPerceptionCharacterType::Instigator));

    default Rules.Add(GameplayTag::AIEvent_Seen_PastCrimeInstigator)
        .EventHasTag(GameplayTag::Crime_Pickpocket)
        .RequireTrue(
            Assessed::WitnessIsEnforcerOfCrimeArea |
            Assessed::IsCrimeSeverityMedium
        )
        .RequireFalse(
            Assessed::ShouldIgnoreCrime
        )
        .Then(UAIEventResponse_VoiceReaction(GameplayTag::Sound_Voice_Reaction_Crime_Thief_HandsOff, EPerceptionCharacterType::Instigator));
}

// ----------------------------------------------
//  Personal victim past-pickpocket
// ----------------------------------------------

class UAIARM_Crime_PastPickpocket_Responses_PersonalVictim : UAIAssessmentResponseModule
{
    default BlockIfHasAnyOwnedTags.AddTag(GameplayTag::AIState_Conflict_Combat);
    default BlockIfHasAnyOwnedTags.AddTag(GameplayTag::AIState_Conflict_Warning);
    default BlockIfHasAnyOwnedTags.AddTag(GameplayTag::Debuff_Fear);
    default BlockIfHasAnyOwnedTags.AddTag(GameplayTag::AIState_Conflict_Flee);
    default BlockIfHasAnyOwnedTags.AddTag(GameplayTag::AIState_Conflict_Disengage);
    default BlockIfHasAnyOwnedTags.AddTag(GameplayTag::Debuff_Defeated);
    default BlockIfHasAnyOwnedTags.AddTag(GameplayTag::State_Defeated);

    // Critical past success against me -> Combat + fists + loot (execute when at execute level).
    default Rules.Add(GameplayTag::AIEvent_Seen_PastCrimeInstigator)
        .EventHasTag(GameplayTag::Crime_Pickpocket_Success)
        .RequireTrue(
            Assessed::WitnessIsPersonalVictimOfCrime |
            Assessed::IsCrimeSeverityCritical |
            Assessed::CrimeReputationAtExecuteLevel
        )
        .RequireFalse(
            Assessed::ShouldIgnoreCrime |
            Assessed::InstigatorIsStrongerThanSelf
        )
        .Then(UAIEventResponse_AddEnemyModifier(EPerceptionCharacterType::Instigator))
        .Then(UAIEventResponse_AddExecuteModifier(EPerceptionCharacterType::Instigator))
        .Then(UAIEventResponse_AddLootModifier(EPerceptionCharacterType::Instigator))
        .Then(UAIEventResponse_LeavePartyOf(EPerceptionCharacterType::Instigator))
        .Then(UAIEventResponse_VoiceReaction(GameplayTag::Sound_Voice_Reaction_Combat_Start, EPerceptionCharacterType::Instigator)
            .AddContextTagToTarget(GameplayTag::VoicelineContext_Thief)
            .AddContextTagToSpeaker(GameplayTag::VoicelineContext_Victim_Theft))
        .Then(UAIEventResponse_SwitchState(GameplayTag::AIState_Conflict_Combat, EPerceptionCharacterType::Instigator));

    default Rules.Add(GameplayTag::AIEvent_Seen_PastCrimeInstigator)
        .EventHasTag(GameplayTag::Crime_Pickpocket_Success)
        .RequireTrue(
            Assessed::WitnessIsPersonalVictimOfCrime |
            Assessed::IsCrimeSeverityCritical
        )
        .RequireFalse(
            Assessed::ShouldIgnoreCrime |
            Assessed::CrimeReputationAtExecuteLevel |
            Assessed::InstigatorIsStrongerThanSelf
        )
        .Then(UAIEventResponse_AddEnemyModifier(EPerceptionCharacterType::Instigator))
        .Then(UAIEventResponse_AddUseFistsModifier(EPerceptionCharacterType::Instigator))
        .Then(UAIEventResponse_AddLootModifier(EPerceptionCharacterType::Instigator))
        .Then(UAIEventResponse_LeavePartyOf(EPerceptionCharacterType::Instigator))
        .Then(UAIEventResponse_VoiceReaction(GameplayTag::Sound_Voice_Reaction_Combat_Start, EPerceptionCharacterType::Instigator)
            .AddContextTagToTarget(GameplayTag::VoicelineContext_Thief)
            .AddContextTagToSpeaker(GameplayTag::VoicelineContext_Victim_Theft))
        .Then(UAIEventResponse_SwitchState(GameplayTag::AIState_Conflict_Combat, EPerceptionCharacterType::Instigator));

    // Critical past fail against me -> Combat + fists, no loot.
    default Rules.Add(GameplayTag::AIEvent_Seen_PastCrimeInstigator)
        .EventHasTag(GameplayTag::Crime_Pickpocket_Fail)
        .RequireTrue(
            Assessed::WitnessIsPersonalVictimOfCrime |
            Assessed::IsCrimeSeverityCritical
        )
        .RequireFalse(
            Assessed::ShouldIgnoreCrime |
            Assessed::InstigatorIsStrongerThanSelf
        )
        .Then(UAIEventResponse_AddEnemyModifier(EPerceptionCharacterType::Instigator))
        .Then(UAIEventResponse_AddUseFistsModifier(EPerceptionCharacterType::Instigator))
        .Then(UAIEventResponse_LeavePartyOf(EPerceptionCharacterType::Instigator))
        .Then(UAIEventResponse_VoiceReaction(GameplayTag::Sound_Voice_Reaction_Combat_Start, EPerceptionCharacterType::Instigator)
            .AddContextTagToTarget(GameplayTag::VoicelineContext_Thief))
        .Then(UAIEventResponse_SwitchState(GameplayTag::AIState_Conflict_Combat, EPerceptionCharacterType::Instigator));
}
