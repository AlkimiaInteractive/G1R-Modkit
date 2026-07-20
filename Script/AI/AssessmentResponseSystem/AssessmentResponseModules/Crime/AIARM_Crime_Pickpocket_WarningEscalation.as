/**
 * Pickpocket warning escalation rules.
 */

class UAIARM_Crime_Pickpocket_WarningEscalation : UAIAssessmentResponseModule

{

    default SubModules.Add(UAIARM_Crime_Pickpocket_WarningEscalation_TimedOut);

}

/** Thief violated personal space after warning intro (proximity). */
class UAIARM_Crime_Pickpocket_WarningEscalation_TimedOut : UAIAssessmentResponseModule
{

    // Personal victim - execute on defeat reputation
    default Rules.Add(GameplayTag::AIEvent_Crime_Pickpocket_WarningTimedOut)
        .RequireTrue(
            Assessed::WitnessIsPersonalVictimOfCrime |
            Assessed::CrimeReputationAtExecuteLevel
        )
        .Then(UAIEventResponse_AddEnemyModifier(EPerceptionCharacterType::Instigator))
        .Then(UAIEventResponse_AddExecuteModifier(EPerceptionCharacterType::Instigator))
        .Then(UAIEventResponse_LeavePartyOf(EPerceptionCharacterType::Instigator))
        .Then(UAIEventResponse_VoiceReaction(GameplayTag::Sound_Voice_Reaction_Combat_Start, EPerceptionCharacterType::Instigator)
            .AddContextTagToTarget(GameplayTag::VoicelineContext_Thief)
            .AddContextTagToSpeaker(GameplayTag::VoicelineContext_Victim_Theft))
        .Then(UAIEventResponse_SwitchState(GameplayTag::AIState_Conflict_Combat, EPerceptionCharacterType::Instigator));

    // Personal victim - no execute marker
    default Rules.Add(GameplayTag::AIEvent_Crime_Pickpocket_WarningTimedOut)
        .RequireTrue(
            Assessed::WitnessIsPersonalVictimOfCrime
        )
        .RequireFalse(
            Assessed::CrimeReputationAtExecuteLevel
        )
        .Then(UAIEventResponse_AddEnemyModifier(EPerceptionCharacterType::Instigator))
        .Then(UAIEventResponse_AddUseFistsModifier(EPerceptionCharacterType::Instigator))
        .Then(UAIEventResponse_LeavePartyOf(EPerceptionCharacterType::Instigator))
        .Then(UAIEventResponse_VoiceReaction(GameplayTag::Sound_Voice_Reaction_Combat_Start, EPerceptionCharacterType::Instigator)
            .AddContextTagToTarget(GameplayTag::VoicelineContext_Thief)
            .AddContextTagToSpeaker(GameplayTag::VoicelineContext_Victim_Theft))
        .Then(UAIEventResponse_SwitchState(GameplayTag::AIState_Conflict_Combat, EPerceptionCharacterType::Instigator));

    // Area enforcer - execute on defeat reputation
    default Rules.Add(GameplayTag::AIEvent_Crime_Pickpocket_WarningTimedOut)
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
        .Then(UAIEventResponse_VoiceReaction(GameplayTag::Sound_Voice_Reaction_Combat_Start, EPerceptionCharacterType::Instigator)
            .AddContextTagToTarget(GameplayTag::VoicelineContext_Thief))
        .Then(UAIEventResponse_SwitchState(GameplayTag::AIState_Conflict_Combat, EPerceptionCharacterType::Instigator));

    // Area enforcer - no execute marker
    default Rules.Add(GameplayTag::AIEvent_Crime_Pickpocket_WarningTimedOut)
        .RequireTrue(
            Assessed::WitnessIsEnforcerOfCrimeArea
        )
        .RequireFalse(
            Assessed::WitnessIsPersonalVictimOfCrime |
            Assessed::CrimeReputationAtExecuteLevel
        )
        .Then(UAIEventResponse_AddEnemyModifier(EPerceptionCharacterType::Instigator))
        .Then(UAIEventResponse_AddUseFistsModifier(EPerceptionCharacterType::Instigator))
        .Then(UAIEventResponse_LeavePartyOf(EPerceptionCharacterType::Instigator))
        .Then(UAIEventResponse_VoiceReaction(GameplayTag::Sound_Voice_Reaction_Combat_Start, EPerceptionCharacterType::Instigator)
            .AddContextTagToTarget(GameplayTag::VoicelineContext_Thief))
        .Then(UAIEventResponse_SwitchState(GameplayTag::AIState_Conflict_Combat, EPerceptionCharacterType::Instigator));

    // Other - execute on defeat reputation
    default Rules.Add(GameplayTag::AIEvent_Crime_Pickpocket_WarningTimedOut)
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
        .Then(UAIEventResponse_VoiceReaction(GameplayTag::Sound_Voice_Reaction_Combat_Start, EPerceptionCharacterType::Instigator)
            .AddContextTagToTarget(GameplayTag::VoicelineContext_Thief))
        .Then(UAIEventResponse_SwitchState(GameplayTag::AIState_Conflict_Combat, EPerceptionCharacterType::Instigator));

    // Other - no execute marker
    default Rules.Add(GameplayTag::AIEvent_Crime_Pickpocket_WarningTimedOut)
        .RequireFalse(
            Assessed::WitnessIsPersonalVictimOfCrime |
            Assessed::WitnessIsEnforcerOfCrimeArea |
            Assessed::CrimeReputationAtExecuteLevel
        )
        .Then(UAIEventResponse_AddEnemyModifier(EPerceptionCharacterType::Instigator))
        .Then(UAIEventResponse_AddUseFistsModifier(EPerceptionCharacterType::Instigator))
        .Then(UAIEventResponse_LeavePartyOf(EPerceptionCharacterType::Instigator))
        .Then(UAIEventResponse_VoiceReaction(GameplayTag::Sound_Voice_Reaction_Combat_Start, EPerceptionCharacterType::Instigator)
            .AddContextTagToTarget(GameplayTag::VoicelineContext_Thief))
        .Then(UAIEventResponse_SwitchState(GameplayTag::AIState_Conflict_Combat, EPerceptionCharacterType::Instigator));
}
