// ──────────────────────────────────────────────
//  HUMAN Blocking Path
// ──────────────────────────────────────────────

class UAIARM_Crime_Human_BlockingPath : UAIAssessmentResponseModule
{
    default SubModules.Add(UAIARM_Crime_BlockingPath_Perception);
    default SubModules.Add(UAIARM_Crime_BlockingPath_Responses);
    default SubModules.Add(UAIARM_Crime_BlockingPath_WarningEnd);
}

class UAIARM_Crime_BlockingPath_Responses : UAIAssessmentResponseModule
{
    default SubModules.Add(UAIARM_Crime_BlockingPath_Responses_NotInConflict);
    default SubModules.Add(UAIARM_Crime_BlockingPath_Responses_WaitForBlockedPath);
    default SubModules.Add(UAIARM_Crime_BlockingPath_Responses_WarningBlockedPath);
}

class UAIARM_Crime_BlockingPath_Responses_NotInConflict : UAIAssessmentResponseModule
{
    default BlockIfHasAnyOwnedTags.AddLeafTag(GameplayTag::AIState_Conflict);
    default BlockIfHasAnyOwnedTags.AddLeafTag(GameplayTag::AIState_Wait_BlockedPath);

    default Rules.Add(GameplayTag::Crime_BlockingPath)
        .RequireTrue(Assessed::SelfIsHostileOrAngryTowardSensed)
        .RequireFalse(Assessed::IsBlockingPathEscalationGuardRestricted)
        .Then(UAIEventResponse_AddHostileModifier(EPerceptionCharacterType::SensedCharacter))
        .Then(UAIEventResponse_AddUseFistsModifier(EPerceptionCharacterType::Instigator))
        .Then(UAIEventResponse_SwitchStateWithConflictType(
            GameplayTag::AIState_Conflict_Warning_BlockedPath,
            EPerceptionCharacterType::SensedCharacter, EConflictType::PettyFight));

    default Rules.Add(GameplayTag::Crime_BlockingPath)
        .RequireTrue(Assessed::SelfIsHostileOrAngryTowardSensed | Assessed::IsBlockingPathEscalationGuardRestricted)
        .Then(UAIEventResponse_SwitchState(GameplayTag::AIState_Wait_BlockedPath, EPerceptionCharacterType::SensedCharacter));

    default Rules.Add(GameplayTag::Crime_BlockingPath)
        .RequireTrue(Assessed::IsBlockingPathEscalationGuardRestricted)
        .RequireFalse(Assessed::SelfIsHostileOrAngryTowardSensed)
        .Then(UAIEventResponse_SwitchState(GameplayTag::AIState_Wait_BlockedPath, EPerceptionCharacterType::SensedCharacter));

    default Rules.Add(GameplayTag::Crime_BlockingPath)
        .RequireTrue(Assessed::ShouldBlockingPathEscalationGoToCombat)
        .RequireFalse(Assessed::SelfIsHostileOrAngryTowardSensed | Assessed::IsBlockingPathEscalationGuardRestricted)
        .Then(UAIEventResponse_AddEnemyModifier(EPerceptionCharacterType::SensedCharacter))
        .Then(UAIEventResponse_AddUseFistsModifier(EPerceptionCharacterType::SensedCharacter))
        .Then(UAIEventResponse_VoiceReaction(GameplayTag::Sound_Voice_Reaction_Combat_Start, EPerceptionCharacterType::SensedCharacter)
            .AddContextTagToTarget(GameplayTag::VoicelineContext_AskedForIt))
        .Then(UAIEventResponse_SwitchStateWithConflictType(
            GameplayTag::AIState_Conflict_Combat, EPerceptionCharacterType::SensedCharacter,
            EConflictType::PettyFight, true));

    default Rules.Add(GameplayTag::Crime_BlockingPath)
        .RequireTrue(Assessed::ShouldBlockingPathSkipWaitToWarning)
        .RequireFalse(Assessed::SelfIsHostileOrAngryTowardSensed | Assessed::IsBlockingPathEscalationGuardRestricted | Assessed::ShouldBlockingPathEscalationGoToCombat)
        .Then(UAIEventResponse_AddHostileModifier(EPerceptionCharacterType::SensedCharacter))
        .Then(UAIEventResponse_AddUseFistsModifier(EPerceptionCharacterType::Instigator))
        .Then(UAIEventResponse_SwitchState(GameplayTag::AIState_Conflict_Warning_BlockedPath, EPerceptionCharacterType::SensedCharacter));

    default Rules.Add(GameplayTag::Crime_BlockingPath)
        .RequireFalse(Assessed::SelfIsHostileOrAngryTowardSensed | Assessed::IsBlockingPathEscalationGuardRestricted | Assessed::ShouldBlockingPathSkipWaitToWarning | Assessed::ShouldBlockingPathEscalationGoToCombat)
        .Then(UAIEventResponse_SwitchState(GameplayTag::AIState_Wait_BlockedPath, EPerceptionCharacterType::SensedCharacter));
}

class UAIARM_Crime_BlockingPath_Responses_WaitForBlockedPath : UAIAssessmentResponseModule
{
    default RequiredOwnedTags.AddLeafTag(GameplayTag::AIState_Wait_BlockedPath);

    default Rules.Add(GameplayTag::AIEvent_State_Done)
        .Then(UAIEventResponse_ForgetAllCrimesOfType(EPerceptionCharacterType::SensedCharacter, GameplayTag::Crime_BlockingPath))
        .Then(UAIEventResponse_SwitchState(GameplayTag::AIState_AssessGoToDailyRoutine, EPerceptionCharacterType::None));

    default Rules.Add(GameplayTag::AIEvent_BlockingPath_EscalateToWarning)
        .RequireTrue(Assessed::IsBlockingPathEscalationGuardRestricted)
        .Then(UAIEventResponse_VoiceReaction(GameplayTag::Sound_Voice_Reaction_Interjection_Angry, EPerceptionCharacterType::SensedCharacter))
        .Then(UAIEventResponse_SwitchState(GameplayTag::AIState_Wait_BlockedPath, EPerceptionCharacterType::SensedCharacter));

    default Rules.Add(GameplayTag::AIEvent_BlockingPath_EscalateToWarning)
        .RequireTrue(Assessed::IsBlockingPathEscalationMissingTarget)
        .RequireFalse(Assessed::IsBlockingPathEscalationGuardRestricted)
        .Then(UAIEventResponse_ForgetAllCrimesOfType(EPerceptionCharacterType::SensedCharacter, GameplayTag::Crime_BlockingPath))
        .Then(UAIEventResponse_SwitchState(GameplayTag::AIState_AssessGoToDailyRoutine, EPerceptionCharacterType::None));

    default Rules.Add(GameplayTag::AIEvent_BlockingPath_EscalateToWarning)
        .RequireTrue(Assessed::ShouldBlockingPathEscalationGoToCombat)
        .RequireFalse(Assessed::IsBlockingPathEscalationGuardRestricted | Assessed::IsBlockingPathEscalationMissingTarget)
        .Then(UAIEventResponse_AddEnemyModifier(EPerceptionCharacterType::SensedCharacter))
        .Then(UAIEventResponse_AddUseFistsModifier(EPerceptionCharacterType::SensedCharacter))
        .Then(UAIEventResponse_VoiceReaction(GameplayTag::Sound_Voice_Reaction_Combat_Start, EPerceptionCharacterType::SensedCharacter)
            .AddContextTagToTarget(GameplayTag::VoicelineContext_AskedForIt))
        .Then(UAIEventResponse_SwitchStateWithConflictType(
            GameplayTag::AIState_Conflict_Combat, EPerceptionCharacterType::SensedCharacter,
            EConflictType::PettyFight, true));

    default Rules.Add(GameplayTag::AIEvent_BlockingPath_EscalateToWarning)
        .RequireFalse(Assessed::IsBlockingPathEscalationGuardRestricted | Assessed::IsBlockingPathEscalationMissingTarget | Assessed::ShouldBlockingPathEscalationGoToCombat)
        .Then(UAIEventResponse_AddHostileModifier(EPerceptionCharacterType::SensedCharacter))
        .Then(UAIEventResponse_AddUseFistsModifier(EPerceptionCharacterType::Instigator))
        .Then(UAIEventResponse_SwitchState(GameplayTag::AIState_Conflict_Warning_BlockedPath, EPerceptionCharacterType::SensedCharacter));
}

class UAIARM_Crime_BlockingPath_Responses_WarningBlockedPath : UAIAssessmentResponseModule
{
    default RequiredOwnedTags.AddLeafTag(GameplayTag::AIState_Conflict_Warning_BlockedPath);

    default Rules.Add(GameplayTag::AIEvent_BlockingPath_EscalateToCombat)
        .RequireTrue(Assessed::IsBlockingPathEscalationGuardRestricted)
        .Then(UAIEventResponse_SwitchState(GameplayTag::AIState_Wait_BlockedPath, EPerceptionCharacterType::SensedCharacter));

    default Rules.Add(GameplayTag::AIEvent_BlockingPath_EscalateToCombat)
        .RequireFalse(Assessed::IsBlockingPathEscalationGuardRestricted)
        .Then(UAIEventResponse_AddEnemyModifier(EPerceptionCharacterType::SensedCharacter))
        .Then(UAIEventResponse_AddUseFistsModifier(EPerceptionCharacterType::SensedCharacter))
        .Then(UAIEventResponse_SwitchStateWithConflictType(
            GameplayTag::AIState_Conflict_Combat, EPerceptionCharacterType::SensedCharacter,
            EConflictType::PettyFight, true));
}

// ──────────────────────────────────────────────
//  ORC Blocking Path
// ──────────────────────────────────────────────

class UAIARM_Crime_Orc_BlockingPath : UAIAssessmentResponseModule
{
    default SubModules.Add(UAIARM_Crime_BlockingPath_Perception);
    default SubModules.Add(UAIARM_Crime_Orc_BlockingPath_Responses);
    default SubModules.Add(UAIARM_Crime_BlockingPath_WarningEnd);
}

class UAIARM_Crime_Orc_BlockingPath_Responses : UAIAssessmentResponseModule
{
    default SubModules.Add(UAIARM_Crime_Orc_BlockingPath_Responses_NotInConflict);
    default SubModules.Add(UAIARM_Crime_Orc_BlockingPath_Responses_WaitForBlockedPath);
    default SubModules.Add(UAIARM_Crime_Orc_BlockingPath_Responses_WarningBlockedPath);
}

class UAIARM_Crime_Orc_BlockingPath_Responses_NotInConflict : UAIAssessmentResponseModule
{
    default BlockIfHasAnyOwnedTags.AddLeafTag(GameplayTag::AIState_Conflict);
    default BlockIfHasAnyOwnedTags.AddLeafTag(GameplayTag::AIState_Wait_BlockedPath);

    default Rules.Add(GameplayTag::Crime_BlockingPath)
        .RequireTrue(Assessed::SelfIsHostileOrAngryTowardSensed)
        .RequireFalse(Assessed::IsBlockingPathEscalationGuardRestricted_Orc)
        .Then(UAIEventResponse_AddHostileModifier(EPerceptionCharacterType::SensedCharacter))
        .Then(UAIEventResponse_AddUseFistsModifier(EPerceptionCharacterType::Instigator))
        .Then(UAIEventResponse_SwitchStateWithConflictType(
            GameplayTag::AIState_Conflict_Warning_BlockedPath,
            EPerceptionCharacterType::SensedCharacter, EConflictType::PettyFight));

    default Rules.Add(GameplayTag::Crime_BlockingPath)
        .RequireTrue(Assessed::SelfIsHostileOrAngryTowardSensed | Assessed::IsBlockingPathEscalationGuardRestricted_Orc)
        .Then(UAIEventResponse_SwitchState(GameplayTag::AIState_Wait_BlockedPath, EPerceptionCharacterType::SensedCharacter));

    default Rules.Add(GameplayTag::Crime_BlockingPath)
        .RequireTrue(Assessed::IsBlockingPathEscalationGuardRestricted_Orc)
        .RequireFalse(Assessed::SelfIsHostileOrAngryTowardSensed)
        .Then(UAIEventResponse_SwitchState(GameplayTag::AIState_Wait_BlockedPath, EPerceptionCharacterType::SensedCharacter));

    default Rules.Add(GameplayTag::Crime_BlockingPath)
        .RequireTrue(Assessed::ShouldBlockingPathEscalationGoToCombat_Orc)
        .RequireFalse(Assessed::SelfIsHostileOrAngryTowardSensed | Assessed::IsBlockingPathEscalationGuardRestricted_Orc)
        .Then(UAIEventResponse_AddEnemyModifier(EPerceptionCharacterType::SensedCharacter))
        .Then(UAIEventResponse_AddUseFistsModifier(EPerceptionCharacterType::SensedCharacter))
        .Then(UAIEventResponse_VoiceReaction(GameplayTag::Sound_Voice_Reaction_Combat_Start, EPerceptionCharacterType::SensedCharacter)
            .AddContextTagToTarget(GameplayTag::VoicelineContext_AskedForIt))
        .Then(UAIEventResponse_SwitchStateWithConflictType(
            GameplayTag::AIState_Conflict_Combat, EPerceptionCharacterType::SensedCharacter,
            EConflictType::PettyFight, true));

    default Rules.Add(GameplayTag::Crime_BlockingPath)
        .RequireTrue(Assessed::ShouldBlockingPathSkipWaitToWarning_Orc)
        .RequireFalse(Assessed::SelfIsHostileOrAngryTowardSensed | Assessed::IsBlockingPathEscalationGuardRestricted_Orc | Assessed::ShouldBlockingPathEscalationGoToCombat_Orc)
        .Then(UAIEventResponse_AddHostileModifier(EPerceptionCharacterType::SensedCharacter))
        .Then(UAIEventResponse_AddUseFistsModifier(EPerceptionCharacterType::Instigator))
        .Then(UAIEventResponse_SwitchState(GameplayTag::AIState_Conflict_Warning_BlockedPath, EPerceptionCharacterType::SensedCharacter));

    default Rules.Add(GameplayTag::Crime_BlockingPath)
        .RequireFalse(Assessed::SelfIsHostileOrAngryTowardSensed | Assessed::IsBlockingPathEscalationGuardRestricted_Orc | Assessed::ShouldBlockingPathSkipWaitToWarning_Orc | Assessed::ShouldBlockingPathEscalationGoToCombat_Orc)
        .Then(UAIEventResponse_SwitchState(GameplayTag::AIState_Wait_BlockedPath, EPerceptionCharacterType::SensedCharacter));
}

class UAIARM_Crime_Orc_BlockingPath_Responses_WaitForBlockedPath : UAIAssessmentResponseModule
{
    default RequiredOwnedTags.AddLeafTag(GameplayTag::AIState_Wait_BlockedPath);

    default Rules.Add(GameplayTag::AIEvent_State_Done)
        .Then(UAIEventResponse_ForgetAllCrimesOfType(EPerceptionCharacterType::SensedCharacter, GameplayTag::Crime_BlockingPath))
        .Then(UAIEventResponse_SwitchState(GameplayTag::AIState_AssessGoToDailyRoutine, EPerceptionCharacterType::None));

    default Rules.Add(GameplayTag::AIEvent_BlockingPath_EscalateToWarning)
        .RequireTrue(Assessed::IsBlockingPathEscalationGuardRestricted_Orc)
        .Then(UAIEventResponse_VoiceReaction(GameplayTag::Sound_Voice_Reaction_Interjection_Angry, EPerceptionCharacterType::SensedCharacter))
        .Then(UAIEventResponse_SwitchState(GameplayTag::AIState_Wait_BlockedPath, EPerceptionCharacterType::SensedCharacter));

    default Rules.Add(GameplayTag::AIEvent_BlockingPath_EscalateToWarning)
        .RequireTrue(Assessed::IsBlockingPathEscalationMissingTarget)
        .RequireFalse(Assessed::IsBlockingPathEscalationGuardRestricted_Orc)
        .Then(UAIEventResponse_ForgetAllCrimesOfType(EPerceptionCharacterType::SensedCharacter, GameplayTag::Crime_BlockingPath))
        .Then(UAIEventResponse_SwitchState(GameplayTag::AIState_AssessGoToDailyRoutine, EPerceptionCharacterType::None));

    default Rules.Add(GameplayTag::AIEvent_BlockingPath_EscalateToWarning)
        .RequireTrue(Assessed::ShouldBlockingPathEscalationGoToCombat_Orc)
        .RequireFalse(Assessed::IsBlockingPathEscalationGuardRestricted_Orc | Assessed::IsBlockingPathEscalationMissingTarget)
        .Then(UAIEventResponse_AddEnemyModifier(EPerceptionCharacterType::SensedCharacter))
        .Then(UAIEventResponse_AddUseFistsModifier(EPerceptionCharacterType::SensedCharacter))
        .Then(UAIEventResponse_VoiceReaction(GameplayTag::Sound_Voice_Reaction_Combat_Start, EPerceptionCharacterType::SensedCharacter)
            .AddContextTagToTarget(GameplayTag::VoicelineContext_AskedForIt))
        .Then(UAIEventResponse_SwitchStateWithConflictType(
            GameplayTag::AIState_Conflict_Combat, EPerceptionCharacterType::SensedCharacter,
            EConflictType::PettyFight, true));

    default Rules.Add(GameplayTag::AIEvent_BlockingPath_EscalateToWarning)
        .RequireFalse(Assessed::IsBlockingPathEscalationGuardRestricted_Orc | Assessed::IsBlockingPathEscalationMissingTarget | Assessed::ShouldBlockingPathEscalationGoToCombat_Orc)
        .Then(UAIEventResponse_AddHostileModifier(EPerceptionCharacterType::SensedCharacter))
        .Then(UAIEventResponse_AddUseFistsModifier(EPerceptionCharacterType::Instigator))
        .Then(UAIEventResponse_SwitchState(GameplayTag::AIState_Conflict_Warning_BlockedPath, EPerceptionCharacterType::SensedCharacter));
}

class UAIARM_Crime_Orc_BlockingPath_Responses_WarningBlockedPath : UAIAssessmentResponseModule
{
    default RequiredOwnedTags.AddLeafTag(GameplayTag::AIState_Conflict_Warning_BlockedPath);

    default Rules.Add(GameplayTag::AIEvent_BlockingPath_EscalateToCombat)
        .RequireTrue(Assessed::IsBlockingPathEscalationGuardRestricted_Orc)
        .Then(UAIEventResponse_SwitchState(GameplayTag::AIState_Wait_BlockedPath, EPerceptionCharacterType::SensedCharacter));

    default Rules.Add(GameplayTag::AIEvent_BlockingPath_EscalateToCombat)
        .RequireFalse(Assessed::IsBlockingPathEscalationGuardRestricted_Orc)
        .Then(UAIEventResponse_AddEnemyModifier(EPerceptionCharacterType::SensedCharacter))
        .Then(UAIEventResponse_AddUseFistsModifier(EPerceptionCharacterType::SensedCharacter))
        .Then(UAIEventResponse_SwitchStateWithConflictType(
            GameplayTag::AIState_Conflict_Combat, EPerceptionCharacterType::SensedCharacter,
            EConflictType::PettyFight, true));
}

// ──────────────────────────────────────────────
//  SHARED
// ──────────────────────────────────────────────

class UAIARM_Crime_BlockingPath_Perception : UAIAssessmentResponseModule
{
    default BlockIfAssessedHasAnyOwnedTags.AddTag(GameplayTag::State_Defeated);
    default BlockIfAssessedHasAnyOwnedTags.AddTag(GameplayTag::State_Conversation);
    default BlockIfAssessedHasAnyOwnedTags.AddTag(GameplayTag::State_Interact);
    default BlockIfHasAnyOwnedTags.AddTag(GameplayTag::State_Conversation);

    default BlockIfAssessedHasAnyOwnedTags.AddTag(GameplayTag::State_Perceptions_GetIgnored);

    default Rules.Add(GameplayTag::AIEvent_Seen_CharacterBlockingPath)
        .Then(UAIEventResponse_AssessCrime(GameplayTag::Crime_BlockingPath, EPerceptionCharacterType::SensedCharacter, EPerceptionCharacterType::Self));
}

class UAIARM_Crime_BlockingPath_WarningEnd : UAIAssessmentResponseModule
{
    default RequiredOwnedTags.AddTag(GameplayTag::AIState_Conflict_Warning_BlockedPath);

    default Rules.Add(GameplayTag::AIEvent_Sensed_NoEnemiesNoHostiles)
            .Then(UAIEventResponse_SwitchState(GameplayTag::AIState_AssessGoToDailyRoutine, EPerceptionCharacterType::None));
}