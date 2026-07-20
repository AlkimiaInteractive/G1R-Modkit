/**
 *  Theft warning escalation rules.
 *
 *  Handles the three events emitted by UAIState_Warning_Crime_Human_Theft when the thief
 *  fails to comply:
 *    AIEvent_Crime_Theft_WarningTimedOut  — compliance deadline elapsed with no return.
 *    AIEvent_Crime_Theft_WarningRefused   — exceeded MaxWrongDropsBeforeCombat.
 *    AIEvent_Crime_Theft_WarningFledAway  — lost LoS long enough to exhaust the visibility timeout. *
 */

class UAIARM_Crime_Theft_WarningEscalation : UAIAssessmentResponseModule
{
    default SubModules.Add(UAIARM_Crime_Theft_WarningEscalation_TimedOut);
    default SubModules.Add(UAIARM_Crime_Theft_WarningEscalation_Refused);
    default SubModules.Add(UAIARM_Crime_Theft_WarningEscalation_FledAway);
}

/** Compliance timer expired. */
class UAIARM_Crime_Theft_WarningEscalation_TimedOut : UAIAssessmentResponseModule
{
    // Personal victim - execute on defeat reputation
    default Rules.Add(GameplayTag::AIEvent_Crime_Theft_WarningTimedOut)
        .RequireTrue(
            Assessed::WitnessIsPersonalVictimOfCrime |
            Assessed::CrimeReputationAtExecuteLevel
        )
        .Then(UAIEventResponse_AddEnemyModifier(EPerceptionCharacterType::Instigator))
        .Then(UAIEventResponse_AddExecuteModifier(EPerceptionCharacterType::Instigator))
        .Then(UAIEventResponse_LeavePartyOf(EPerceptionCharacterType::Instigator))
        .Then(UAIEventResponse_VoiceReaction(GameplayTag::Sound_Voice_Reaction_Combat_Start_Thief_MyStuff, EPerceptionCharacterType::Instigator))
        .Then(UAIEventResponse_SwitchState(GameplayTag::AIState_Conflict_Combat, EPerceptionCharacterType::Instigator));

    // Personal victim - MyStuff (no execute marker)
    default Rules.Add(GameplayTag::AIEvent_Crime_Theft_WarningTimedOut)
        .RequireTrue(
            Assessed::WitnessIsPersonalVictimOfCrime
        )
        .RequireFalse(
            Assessed::CrimeReputationAtExecuteLevel
        )
        .Then(UAIEventResponse_AddEnemyModifier(EPerceptionCharacterType::Instigator))
        //.Then(UAIEventResponse_AddUseFistsModifier(EPerceptionCharacterType::Instigator))
        .Then(UAIEventResponse_LeavePartyOf(EPerceptionCharacterType::Instigator))
        .Then(UAIEventResponse_VoiceReaction(GameplayTag::Sound_Voice_Reaction_Combat_Start_Thief_MyStuff, EPerceptionCharacterType::Instigator))
        .Then(UAIEventResponse_SwitchState(GameplayTag::AIState_Conflict_Combat, EPerceptionCharacterType::Instigator));

    // Area enforcer (not personal victim) - execute on defeat reputation
    default Rules.Add(GameplayTag::AIEvent_Crime_Theft_WarningTimedOut)
        .RequireTrue(
            Assessed::WitnessIsEnforcerOfCrimeArea |
            Assessed::CrimeReputationAtExecuteLevel
        )
        .RequireFalse(
            Assessed::WitnessIsPersonalVictimOfCrime
        )
        .Then(UAIEventResponse_AddEnemyModifier(EPerceptionCharacterType::Instigator))
        .Then(UAIEventResponse_AddExecuteModifier(EPerceptionCharacterType::Instigator))
        .Then(UAIEventResponse_LeavePartyOf(EPerceptionCharacterType::Instigator))
        .Then(UAIEventResponse_VoiceReaction(GameplayTag::Sound_Voice_Reaction_Combat_Start_Thief_Guard, EPerceptionCharacterType::Instigator))
        .Then(UAIEventResponse_SwitchState(GameplayTag::AIState_Conflict_Combat, EPerceptionCharacterType::Instigator));

    // Area enforcer (not personal victim) - Guard (no execute marker)
    default Rules.Add(GameplayTag::AIEvent_Crime_Theft_WarningTimedOut)
        .RequireTrue(
            Assessed::WitnessIsEnforcerOfCrimeArea
        )
        .RequireFalse(
            Assessed::WitnessIsPersonalVictimOfCrime |
            Assessed::CrimeReputationAtExecuteLevel
        )
        .Then(UAIEventResponse_AddEnemyModifier(EPerceptionCharacterType::Instigator))
        //.Then(UAIEventResponse_AddUseFistsModifier(EPerceptionCharacterType::Instigator))
        .Then(UAIEventResponse_LeavePartyOf(EPerceptionCharacterType::Instigator))
        .Then(UAIEventResponse_VoiceReaction(GameplayTag::Sound_Voice_Reaction_Combat_Start_Thief_Guard, EPerceptionCharacterType::Instigator))
        .Then(UAIEventResponse_SwitchState(GameplayTag::AIState_Conflict_Combat, EPerceptionCharacterType::Instigator));

    // Other - execute on defeat reputation
    default Rules.Add(GameplayTag::AIEvent_Crime_Theft_WarningTimedOut)
        .RequireTrue(
            Assessed::CrimeReputationAtExecuteLevel
        )
        .RequireFalse(
            Assessed::WitnessIsPersonalVictimOfCrime |
            Assessed::WitnessIsEnforcerOfCrimeArea
        )
        .Then(UAIEventResponse_AddEnemyModifier(EPerceptionCharacterType::Instigator))
        .Then(UAIEventResponse_AddExecuteModifier(EPerceptionCharacterType::Instigator))
        .Then(UAIEventResponse_LeavePartyOf(EPerceptionCharacterType::Instigator))
        .Then(UAIEventResponse_VoiceReaction(GameplayTag::Sound_Voice_Reaction_Combat_Start_Thief, EPerceptionCharacterType::Instigator))
        .Then(UAIEventResponse_SwitchState(GameplayTag::AIState_Conflict_Combat, EPerceptionCharacterType::Instigator));

    // Other - no execute marker
    default Rules.Add(GameplayTag::AIEvent_Crime_Theft_WarningTimedOut)
        .RequireFalse(
            Assessed::WitnessIsPersonalVictimOfCrime |
            Assessed::WitnessIsEnforcerOfCrimeArea |
            Assessed::CrimeReputationAtExecuteLevel
        )
        .Then(UAIEventResponse_AddEnemyModifier(EPerceptionCharacterType::Instigator))
        //.Then(UAIEventResponse_AddUseFistsModifier(EPerceptionCharacterType::Instigator))
        .Then(UAIEventResponse_LeavePartyOf(EPerceptionCharacterType::Instigator))
        .Then(UAIEventResponse_VoiceReaction(GameplayTag::Sound_Voice_Reaction_Combat_Start_Thief, EPerceptionCharacterType::Instigator))
        .Then(UAIEventResponse_SwitchState(GameplayTag::AIState_Conflict_Combat, EPerceptionCharacterType::Instigator));
}

/** Wrong-item drops exceeded MaxWrongDropsBeforeCombat. */
class UAIARM_Crime_Theft_WarningEscalation_Refused : UAIAssessmentResponseModule
{
    // Personal victim - MyStuff (execute marker)
    default Rules.Add(GameplayTag::AIEvent_Crime_Theft_WarningRefused)
        .RequireTrue(
            Assessed::WitnessIsPersonalVictimOfCrime |
            Assessed::CrimeReputationAtExecuteLevel
        )
        .Then(UAIEventResponse_AddEnemyModifier(EPerceptionCharacterType::Instigator))
        .Then(UAIEventResponse_AddExecuteModifier(EPerceptionCharacterType::Instigator))
        .Then(UAIEventResponse_LeavePartyOf(EPerceptionCharacterType::Instigator))
        .Then(UAIEventResponse_VoiceReaction(GameplayTag::Sound_Voice_Reaction_Combat_Start_Thief_MyStuff, EPerceptionCharacterType::Instigator))
        .Then(UAIEventResponse_SwitchState(GameplayTag::AIState_Conflict_Combat, EPerceptionCharacterType::Instigator));

    // Personal victim - MyStuff (no execute marker)
    default Rules.Add(GameplayTag::AIEvent_Crime_Theft_WarningRefused)
        .RequireTrue(
            Assessed::WitnessIsPersonalVictimOfCrime
        )
        .RequireFalse(
            Assessed::CrimeReputationAtExecuteLevel
        )
        .Then(UAIEventResponse_AddEnemyModifier(EPerceptionCharacterType::Instigator))
        //.Then(UAIEventResponse_AddUseFistsModifier(EPerceptionCharacterType::Instigator))
        .Then(UAIEventResponse_LeavePartyOf(EPerceptionCharacterType::Instigator))
        .Then(UAIEventResponse_VoiceReaction(GameplayTag::Sound_Voice_Reaction_Combat_Start_Thief_MyStuff, EPerceptionCharacterType::Instigator))
        .Then(UAIEventResponse_SwitchState(GameplayTag::AIState_Conflict_Combat, EPerceptionCharacterType::Instigator));

    // Area enforcer - Guard (execute marker)
    default Rules.Add(GameplayTag::AIEvent_Crime_Theft_WarningRefused)
        .RequireTrue(
            Assessed::WitnessIsEnforcerOfCrimeArea |
            Assessed::CrimeReputationAtExecuteLevel
        )
        .RequireFalse(
            Assessed::WitnessIsPersonalVictimOfCrime
        )
        .Then(UAIEventResponse_AddEnemyModifier(EPerceptionCharacterType::Instigator))
        .Then(UAIEventResponse_AddExecuteModifier(EPerceptionCharacterType::Instigator))
        .Then(UAIEventResponse_LeavePartyOf(EPerceptionCharacterType::Instigator))
        .Then(UAIEventResponse_VoiceReaction(GameplayTag::Sound_Voice_Reaction_Combat_Start_Thief_Guard, EPerceptionCharacterType::Instigator))
        .Then(UAIEventResponse_SwitchState(GameplayTag::AIState_Conflict_Combat, EPerceptionCharacterType::Instigator));

    // Area enforcer - Guard (execute marker)
    default Rules.Add(GameplayTag::AIEvent_Crime_Theft_WarningRefused)
        .RequireTrue(
            Assessed::WitnessIsEnforcerOfCrimeArea
        )
        .RequireFalse(
            Assessed::WitnessIsPersonalVictimOfCrime |
            Assessed::CrimeReputationAtExecuteLevel
        )
        .Then(UAIEventResponse_AddEnemyModifier(EPerceptionCharacterType::Instigator))
        //.Then(UAIEventResponse_AddUseFistsModifier(EPerceptionCharacterType::Instigator))
        .Then(UAIEventResponse_LeavePartyOf(EPerceptionCharacterType::Instigator))
        .Then(UAIEventResponse_VoiceReaction(GameplayTag::Sound_Voice_Reaction_Combat_Start_Thief_Guard, EPerceptionCharacterType::Instigator))
        .Then(UAIEventResponse_SwitchState(GameplayTag::AIState_Conflict_Combat, EPerceptionCharacterType::Instigator));

    // Other - execute marker
    default Rules.Add(GameplayTag::AIEvent_Crime_Theft_WarningRefused)
        .RequireTrue(
            Assessed::CrimeReputationAtExecuteLevel
        )
        .RequireFalse(
            Assessed::WitnessIsPersonalVictimOfCrime |
            Assessed::WitnessIsEnforcerOfCrimeArea
        )
        .Then(UAIEventResponse_AddEnemyModifier(EPerceptionCharacterType::Instigator))
        .Then(UAIEventResponse_AddExecuteModifier(EPerceptionCharacterType::Instigator))
        .Then(UAIEventResponse_LeavePartyOf(EPerceptionCharacterType::Instigator))
        .Then(UAIEventResponse_VoiceReaction(GameplayTag::Sound_Voice_Reaction_Combat_Start_Thief, EPerceptionCharacterType::Instigator))
        .Then(UAIEventResponse_SwitchState(GameplayTag::AIState_Conflict_Combat, EPerceptionCharacterType::Instigator));

    // Other - no execute marker
    default Rules.Add(GameplayTag::AIEvent_Crime_Theft_WarningRefused)
        .RequireFalse(
            Assessed::WitnessIsPersonalVictimOfCrime |
            Assessed::WitnessIsEnforcerOfCrimeArea |
            Assessed::CrimeReputationAtExecuteLevel
        )
        .Then(UAIEventResponse_AddEnemyModifier(EPerceptionCharacterType::Instigator))
        //.Then(UAIEventResponse_AddUseFistsModifier(EPerceptionCharacterType::Instigator))
        .Then(UAIEventResponse_LeavePartyOf(EPerceptionCharacterType::Instigator))
        .Then(UAIEventResponse_VoiceReaction(GameplayTag::Sound_Voice_Reaction_Combat_Start_Thief, EPerceptionCharacterType::Instigator))
        .Then(UAIEventResponse_SwitchState(GameplayTag::AIState_Conflict_Combat, EPerceptionCharacterType::Instigator));
}

/** Thief far from scene or LoS lost long enough. */
class UAIARM_Crime_Theft_WarningEscalation_FledAway : UAIAssessmentResponseModule
{
    // Personal victim - MyStuff (execute marker)
    default Rules.Add(GameplayTag::AIEvent_Crime_Theft_WarningFledAway)
        .RequireTrue(
            Assessed::WitnessIsPersonalVictimOfCrime |
            Assessed::CrimeReputationAtExecuteLevel
        )
        .Then(UAIEventResponse_AddEnemyModifier(EPerceptionCharacterType::Instigator))
        .Then(UAIEventResponse_AddExecuteModifier(EPerceptionCharacterType::Instigator))
        .Then(UAIEventResponse_LeavePartyOf(EPerceptionCharacterType::Instigator))
        .Then(UAIEventResponse_VoiceReaction(GameplayTag::Sound_Voice_Reaction_Combat_Start_Thief_MyStuff, EPerceptionCharacterType::Instigator))
        .Then(UAIEventResponse_SwitchState(GameplayTag::AIState_Conflict_Combat, EPerceptionCharacterType::Instigator));

    // Personal victim - MyStuff (no execute marker)
    default Rules.Add(GameplayTag::AIEvent_Crime_Theft_WarningFledAway)
        .RequireTrue(
            Assessed::WitnessIsPersonalVictimOfCrime
        )
        .RequireFalse(
            Assessed::CrimeReputationAtExecuteLevel
        )
        .Then(UAIEventResponse_AddEnemyModifier(EPerceptionCharacterType::Instigator))
        //.Then(UAIEventResponse_AddUseFistsModifier(EPerceptionCharacterType::Instigator))
        .Then(UAIEventResponse_LeavePartyOf(EPerceptionCharacterType::Instigator))
        .Then(UAIEventResponse_VoiceReaction(GameplayTag::Sound_Voice_Reaction_Combat_Start_Thief_MyStuff, EPerceptionCharacterType::Instigator))
        .Then(UAIEventResponse_SwitchState(GameplayTag::AIState_Conflict_Combat, EPerceptionCharacterType::Instigator));

    // Area enforcer - Guard (execute marker)
    default Rules.Add(GameplayTag::AIEvent_Crime_Theft_WarningFledAway)
        .RequireTrue(
            Assessed::WitnessIsEnforcerOfCrimeArea |
            Assessed::CrimeReputationAtExecuteLevel
        )
        .RequireFalse(
            Assessed::WitnessIsPersonalVictimOfCrime
        )
        .Then(UAIEventResponse_AddEnemyModifier(EPerceptionCharacterType::Instigator))
        .Then(UAIEventResponse_AddExecuteModifier(EPerceptionCharacterType::Instigator))
        .Then(UAIEventResponse_LeavePartyOf(EPerceptionCharacterType::Instigator))
        .Then(UAIEventResponse_VoiceReaction(GameplayTag::Sound_Voice_Reaction_Combat_Start_Thief_Guard, EPerceptionCharacterType::Instigator))
        .Then(UAIEventResponse_SwitchState(GameplayTag::AIState_Conflict_Combat, EPerceptionCharacterType::Instigator));

    // Area enforcer - Guard (no execute marker)
    default Rules.Add(GameplayTag::AIEvent_Crime_Theft_WarningFledAway)
        .RequireTrue(
            Assessed::WitnessIsEnforcerOfCrimeArea
        )
        .RequireFalse(
            Assessed::WitnessIsPersonalVictimOfCrime |
            Assessed::CrimeReputationAtExecuteLevel
        )
        .Then(UAIEventResponse_AddEnemyModifier(EPerceptionCharacterType::Instigator))
        //.Then(UAIEventResponse_AddUseFistsModifier(EPerceptionCharacterType::Instigator))
        .Then(UAIEventResponse_LeavePartyOf(EPerceptionCharacterType::Instigator))
        .Then(UAIEventResponse_VoiceReaction(GameplayTag::Sound_Voice_Reaction_Combat_Start_Thief_Guard, EPerceptionCharacterType::Instigator))
        .Then(UAIEventResponse_SwitchState(GameplayTag::AIState_Conflict_Combat, EPerceptionCharacterType::Instigator));

    // Other - execute marker
    default Rules.Add(GameplayTag::AIEvent_Crime_Theft_WarningFledAway)
        .RequireTrue(
            Assessed::CrimeReputationAtExecuteLevel
        )
        .RequireFalse(
            Assessed::WitnessIsPersonalVictimOfCrime |
            Assessed::WitnessIsEnforcerOfCrimeArea
        )
        .Then(UAIEventResponse_AddEnemyModifier(EPerceptionCharacterType::Instigator))
        .Then(UAIEventResponse_AddExecuteModifier(EPerceptionCharacterType::Instigator))
        .Then(UAIEventResponse_LeavePartyOf(EPerceptionCharacterType::Instigator))
        .Then(UAIEventResponse_VoiceReaction(GameplayTag::Sound_Voice_Reaction_Combat_Start_Thief, EPerceptionCharacterType::Instigator))
        .Then(UAIEventResponse_SwitchState(GameplayTag::AIState_Conflict_Combat, EPerceptionCharacterType::Instigator));

    // Other - no execute marker
    default Rules.Add(GameplayTag::AIEvent_Crime_Theft_WarningFledAway)
        .RequireFalse(
            Assessed::WitnessIsPersonalVictimOfCrime |
            Assessed::WitnessIsEnforcerOfCrimeArea |
            Assessed::CrimeReputationAtExecuteLevel
        )
        .Then(UAIEventResponse_AddEnemyModifier(EPerceptionCharacterType::Instigator))
        //.Then(UAIEventResponse_AddUseFistsModifier(EPerceptionCharacterType::Instigator))
        .Then(UAIEventResponse_LeavePartyOf(EPerceptionCharacterType::Instigator))
        .Then(UAIEventResponse_VoiceReaction(GameplayTag::Sound_Voice_Reaction_Combat_Start_Thief, EPerceptionCharacterType::Instigator))
        .Then(UAIEventResponse_SwitchState(GameplayTag::AIState_Conflict_Combat, EPerceptionCharacterType::Instigator));
}
