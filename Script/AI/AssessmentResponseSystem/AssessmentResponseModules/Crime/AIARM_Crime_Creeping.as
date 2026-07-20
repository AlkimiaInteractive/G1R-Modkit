class UAIARM_Crime_Human_Creeping : UAIAssessmentResponseModule
{
    default RequireAnyOwnedTags.AddTag(GameplayTag::AIState_DailyRoutine);
    default BlockIfHasAnyOwnedTags.AddTag(GameplayTag::AIState_Guide);
    default BlockIfHasAnyOwnedTags.AddTag(GameplayTag::AIState_Follow);
    default BlockIfHasAnyOwnedTags.AddTag(GameplayTag::AIState_Observe_Creeping);
    default BlockIfHasAnyOwnedTags.AddTag(GameplayTag::AIState_Conflict_Warning_Creeping);

    default SubModules.Add(UAIARM_Crime_Creeping_Perception);
    default SubModules.Add(UAIARM_Crime_Human_Creeping_Responses);
}

class UAIARM_Crime_Orc_Creeping : UAIAssessmentResponseModule
{
    default RequireAnyOwnedTags.AddTag(GameplayTag::AIState_DailyRoutine);
    default BlockIfHasAnyOwnedTags.AddTag(GameplayTag::AIState_Guide);
    default BlockIfHasAnyOwnedTags.AddTag(GameplayTag::AIState_Follow);
    default BlockIfHasAnyOwnedTags.AddTag(GameplayTag::AIState_Observe_Creeping);

    default SubModules.Add(UAIARM_Crime_Creeping_Perception);
    default SubModules.Add(UAIARM_Crime_Orc_Creeping_Responses);
}

// ----------------------------------------------
//  PERCEPTION
// ----------------------------------------------

class UAIARM_Crime_Creeping_Perception : UAIAssessmentResponseModule
{
    // Direct sighting: witness records the crime AND relays a synthetic perception to allies
    default Rules.Add(GameplayTag::AIEvent_Seen_Creeping)
        .RequireTrue(
            Assessed::SensedIsPlayer
        )
        .RequireFalse(
            Assessed::PerceptionContextHasCreepingBarkRelayTag
        )
        .Then(UAIEventResponse_AssessCrime(
            GameplayTag::Crime_Creeping,
            EPerceptionCharacterType::SensedCharacter,
            EPerceptionCharacterType::Self)
        )
        .Then(UAIEventResponse_RelayCreepingAlertAroundInstigator());

    // Relayed sighting: assess only. Listener registers its own first-hand entry and routes normal response.
    default Rules.Add(GameplayTag::AIEvent_Seen_Creeping)
        .RequireTrue(
            Assessed::SensedIsPlayer |
            Assessed::PerceptionContextHasCreepingBarkRelayTag
        )
        .Then(UAIEventResponse_AssessCrime(
            GameplayTag::Crime_Creeping,
            EPerceptionCharacterType::SensedCharacter,
            EPerceptionCharacterType::Self)
        );
}

// ----------------------------------------------
//  HUMAN — LIVE RESPONSES
// ----------------------------------------------

class UAIARM_Crime_Human_Creeping_Responses : UAIAssessmentResponseModule
{
    default SubModules.Add(UAIARM_Crime_Human_Creeping_Responses_AreaEnforcer);
    default SubModules.Add(UAIARM_Crime_Human_Creeping_Responses_NonEnforcer);
}

// ----------------------------------------------
//  Area enforcer (Guard/Leader/BodyGuard/Boss)
// -----------------------------------------------

class UAIARM_Crime_Human_Creeping_Responses_AreaEnforcer : UAIAssessmentResponseModule
{
    // Within re-creep grace AND at execute-on-defeat count > execute marker + PettyFight combat.
    default Rules.Add(GameplayTag::Crime_Creeping)
        .RequireTrue(
            Assessed::WitnessIsEnforcerOfCrimeArea |
            Assessed::CreepingShouldJumpStraightToWarning |
            Assessed::CrimeReputationAtExecuteLevel
        )
        .RequireFalse(
            Assessed::ShouldIgnoreCrime
        )
        .Then(UAIEventResponse_AddEnemyModifier(EPerceptionCharacterType::Instigator))
        .Then(UAIEventResponse_AddExecuteModifier(EPerceptionCharacterType::Instigator))
        .Then(UAIEventResponse_LeavePartyOf(EPerceptionCharacterType::Instigator))
        .Then(UAIEventResponse_VoiceReaction(GameplayTag::Sound_Voice_Reaction_Combat_Start, EPerceptionCharacterType::Instigator))
        .Then(UAIEventResponse_SwitchStateWithConflictType(GameplayTag::AIState_Conflict_Combat, EPerceptionCharacterType::Instigator, EConflictType::PettyFight));

    // Within re-creep grace, below execute count > fists out + warning state.
    default Rules.Add(GameplayTag::Crime_Creeping)
        .RequireTrue(
            Assessed::WitnessIsEnforcerOfCrimeArea |
            Assessed::CreepingShouldJumpStraightToWarning
        )
        .RequireFalse(
            Assessed::ShouldIgnoreCrime |
            Assessed::CrimeReputationAtExecuteLevel
        )
        .Then(UAIEventResponse_AddUseFistsModifier(EPerceptionCharacterType::Instigator))
        .Then(UAIEventResponse_VoiceReaction(GameplayTag::Sound_Voice_Reaction_Warning, EPerceptionCharacterType::Instigator))
        .Then(UAIEventResponse_SwitchState(GameplayTag::AIState_Conflict_Warning_Creeping, EPerceptionCharacterType::Instigator));

    // Outside grace (or first encounter) > fresh observe.
    default Rules.Add(GameplayTag::Crime_Creeping)
        .RequireTrue(
            Assessed::WitnessIsEnforcerOfCrimeArea
        )
        .RequireFalse(
            Assessed::ShouldIgnoreCrime |
            Assessed::CreepingShouldJumpStraightToWarning
        )
        .Then(UAIEventResponse_VoiceReaction(GameplayTag::Sound_Voice_Reaction_Crime_Suspect, EPerceptionCharacterType::Instigator))
        .Then(UAIEventResponse_SwitchState(GameplayTag::AIState_Observe_Creeping, EPerceptionCharacterType::Instigator));

}

class UAIARM_Crime_Human_Creeping_EscalateToWarning : UAIAssessmentResponseModule
{
    default BlockIfHasAnyOwnedTags.AddTag(GameplayTag::AIState_Guide);
    default BlockIfHasAnyOwnedTags.AddTag(GameplayTag::AIState_Follow);

    // Observe state only emits this event when its tuning has bEscalates=true
    default Rules.Add(GameplayTag::AIEvent_Crime_Creeping_EscalateToWarning)
        .RequireTrue(
            Assessed::WitnessIsEnforcerOfCrimeArea
        )
        .RequireFalse(
            Assessed::ShouldIgnoreCrime
        )
        .Then(UAIEventResponse_AddUseFistsModifier(EPerceptionCharacterType::Instigator))
        .Then(UAIEventResponse_VoiceReaction(GameplayTag::Sound_Voice_Reaction_Warning, EPerceptionCharacterType::Instigator))
        .Then(UAIEventResponse_SwitchState(GameplayTag::AIState_Conflict_Warning_Creeping, EPerceptionCharacterType::Instigator));
}

// ----------------------------------------------
//  Non-enforcer witness
// ----------------------------------------------
class UAIARM_Crime_Human_Creeping_Responses_NonEnforcer : UAIAssessmentResponseModule
{
    default Rules.Add(GameplayTag::Crime_Creeping)
        .RequireFalse(
            Assessed::ShouldIgnoreCrime |
            Assessed::WitnessIsEnforcerOfCrimeArea
        )
        .Then(UAIEventResponse_VoiceReaction(GameplayTag::Sound_Voice_Reaction_Crime_Suspect, EPerceptionCharacterType::Instigator))
        .Then(UAIEventResponse_SwitchState(GameplayTag::AIState_Observe_Creeping, EPerceptionCharacterType::Instigator));
}

// ----------------------------------------------
//  HUMAN - WARNING ESCALATION
// ----------------------------------------------

class UAIARM_Crime_Human_Creeping_WarningEscalation : UAIAssessmentResponseModule
{
    // Reputation at execute level > execute marker + PettyFight combat.
    default Rules.Add(GameplayTag::AIEvent_Crime_Creeping_WarningTimedOut)
        .RequireTrue(
            Assessed::CrimeReputationAtExecuteLevel
        )
        .Then(UAIEventResponse_AddEnemyModifier(EPerceptionCharacterType::Instigator))
        .Then(UAIEventResponse_AddExecuteModifier(EPerceptionCharacterType::Instigator))
        .Then(UAIEventResponse_LeavePartyOf(EPerceptionCharacterType::Instigator))
        .Then(UAIEventResponse_VoiceReaction(GameplayTag::Sound_Voice_Reaction_Combat_Start, EPerceptionCharacterType::Instigator))
        .Then(UAIEventResponse_SwitchStateWithConflictType(GameplayTag::AIState_Conflict_Combat, EPerceptionCharacterType::Instigator, EConflictType::PettyFight));

    // Below execute level > fists + PettyFight combat.
    default Rules.Add(GameplayTag::AIEvent_Crime_Creeping_WarningTimedOut)
        .RequireFalse(
            Assessed::CrimeReputationAtExecuteLevel
        )
        .Then(UAIEventResponse_AddEnemyModifier(EPerceptionCharacterType::Instigator))
        .Then(UAIEventResponse_AddUseFistsModifier(EPerceptionCharacterType::Instigator))
        .Then(UAIEventResponse_LeavePartyOf(EPerceptionCharacterType::Instigator))
        .Then(UAIEventResponse_VoiceReaction(GameplayTag::Sound_Voice_Reaction_Combat_Start, EPerceptionCharacterType::Instigator))
        .Then(UAIEventResponse_SwitchStateWithConflictType(GameplayTag::AIState_Conflict_Combat, EPerceptionCharacterType::Instigator, EConflictType::PettyFight));
}

// ----------------------------------------------
//  ORC — VOICE ONLY
// ----------------------------------------------

class UAIARM_Crime_Orc_Creeping_Responses : UAIAssessmentResponseModule
{
    default Rules.Add(GameplayTag::Crime_Creeping)
        .RequireFalse(
            Assessed::ShouldIgnoreCrime
        )
        .Then(UAIEventResponse_VoiceReaction(GameplayTag::Sound_Voice_Reaction_Crime_Suspect, EPerceptionCharacterType::Instigator))
        .Then(UAIEventResponse_SwitchState(GameplayTag::AIState_Observe_Creeping, EPerceptionCharacterType::Instigator));
}
