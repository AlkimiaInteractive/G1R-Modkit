class UAIARM_Crime_Human_Murder : UAIAssessmentResponseModule
{
    default SubModules.Add(UAIARM_Crime_Murder_Perception);
    default SubModules.Add(UAIARM_Crime_Murder_Responses);
}

class UAIARM_Crime_Orc_Murder : UAIAssessmentResponseModule
{
    default SubModules.Add(UAIARM_Crime_Murder_Perception);
    default SubModules.Add(UAIARM_Crime_Murder_Responses);
}

class UAIARM_Crime_Murder_Perception : UAIAssessmentResponseModule
{    
    // Sensed murderer while aware of murderer
    default Rules.Add(GameplayTag::AIEvent_Sensed_OtherKilled)
        .RequireTrue(
            Assessed::AwareOfInstigator
        )
        .Then(UAIEventResponse_AssessCrime(
            GameplayTag::Crime_Murder,
            EPerceptionCharacterType::Instigator,
            EPerceptionCharacterType::SensedCharacter
        ));

    // Seen murderer after searching
    default Rules.Add(GameplayTag::AIEvent_Seen_Murderer)
        .Then(UAIEventResponse_AssessCrime(
            GameplayTag::Crime_Murder,
            EPerceptionCharacterType::Instigator,
            EPerceptionCharacterType::SensedCharacter
        ));
}

class UAIARM_Crime_Murder_Responses : UAIAssessmentResponseModule
{
    default SubModules.Add(UAIARM_Crime_Murder_Responses_ModifiersOnly);

    /// To Watch Fight
    // default Rules.Add(GameplayTag::Crime_Murder)
    //     .RequireFalse(
    //         Assessed::AffectedIsProtected |
    //         Assessed::InstigatorWasFriendly |
    //         Assessed::IsCrimeSeverityHigh |
    //         Assessed::IsCrimeSeverityCritical
    //     )
        //.Then(UAIEventResponse_VoiceReaction(GameplayTag::Sound_Voice_Reaction_Murder_LowSeverity, EPerceptionCharacterType::Instigator)); // TODO

    default SubModules.Add(UAIARM_Crime_Murder_CombatEnd);
    default SubModules.Add(UAIARM_Crime_Murder_Responses_FightOrFlight);
}

class UAIARM_Crime_Murder_Responses_FightOrFlight : UAIAssessmentResponseModule
{
    default BlockIfHasAnyOwnedTags.AddTag(GameplayTag::AIState_Conflict_Combat);
    default BlockIfHasAnyOwnedTags.AddTag(GameplayTag::Debuff_Fear);
    default BlockIfHasAnyOwnedTags.AddTag(GameplayTag::AIState_Conflict_Flee);
    default BlockIfHasAnyOwnedTags.AddTag(GameplayTag::AIState_Conflict_Disengage);
    default BlockIfHasAnyOwnedTags.AddTag(GameplayTag::AIState_Conflict_Flee_GetGuardHelp);
    default BlockIfHasAnyOwnedTags.AddTag(GameplayTag::Debuff_Defeated);
    default BlockIfHasAnyOwnedTags.AddTag(GameplayTag::State_Defeated);
    
    // Affected is protected
    default Rules.Add(GameplayTag::Crime_Murder)
        .RequireTrue(
            Assessed::AffectedIsProtected |
            Assessed::IsCrimeSeverityCritical
        )
        .RequireFalse(
            Assessed::InstigatorIsStrongerThanSelf
        )
        .Then(UAIEventResponse_AddEnemyModifier(EPerceptionCharacterType::Instigator))
        .Then(UAIEventResponse_AddExecuteModifier(EPerceptionCharacterType::Instigator))
        .Then(UAIEventResponse_LeavePartyOf(EPerceptionCharacterType::Instigator))
        .Then(UAIEventResponse_SwitchState(GameplayTag::AIState_Conflict_Combat, EPerceptionCharacterType::Instigator))
        .Then(UAIEventResponse_VoiceReaction(GameplayTag::Sound_Voice_Reaction_Combat_Start, EPerceptionCharacterType::Instigator)
            .AddContextTagToTarget(GameplayTag::VoicelineContext_AttackedCharge));
    
    // Affected is friendly
    default Rules.Add(GameplayTag::Crime_Murder)
        .RequireTrue(
            Assessed::AffectedWasFriendly |
            Assessed::IsCrimeSeverityCritical
        )
        .RequireFalse(
            Assessed::AffectedIsProtected |
            Assessed::InstigatorIsStrongerThanSelf
        )
        .Then(UAIEventResponse_AddEnemyModifier(EPerceptionCharacterType::Instigator))
        .Then(UAIEventResponse_AddExecuteModifier(EPerceptionCharacterType::Instigator))
        .Then(UAIEventResponse_LeavePartyOf(EPerceptionCharacterType::Instigator))
        .Then(UAIEventResponse_SwitchState(GameplayTag::AIState_Conflict_Combat, EPerceptionCharacterType::Instigator))
        .Then(UAIEventResponse_VoiceReaction(GameplayTag::Sound_Voice_Reaction_Combat_Start, EPerceptionCharacterType::Instigator)
            .AddContextTagToTarget(GameplayTag::VoicelineContext_KilledOneOfUs));

    // Instigator is stronger
    default Rules.Add(GameplayTag::Crime_Murder)
        .RequireTrue(
            Assessed::AffectedWasFriendly |
            Assessed::IsCrimeSeverityCritical |
            Assessed::InstigatorIsStrongerThanSelf
        )
        .Then(UAIEventResponse_AddEnemyModifier(EPerceptionCharacterType::Instigator))
        .Then(UAIEventResponse_AddExecuteModifier(EPerceptionCharacterType::Instigator))
        .Then(UAIEventResponse_LeavePartyOf(EPerceptionCharacterType::Instigator))
        .Then(UAIEventResponse_SwitchState(GameplayTag::AIState_Conflict_Flee_GetGuardHelp, EPerceptionCharacterType::Instigator)
                .AddContextTag(GameplayTag::Action_Ambient_GetJumpscared));
    
    default Rules.Add(GameplayTag::Crime_Murder)
        .RequireTrue(
            Assessed::AffectedIsProtected |
            Assessed::IsCrimeSeverityCritical |
            Assessed::InstigatorIsStrongerThanSelf
        )
        .RequireFalse(
            Assessed::AffectedWasFriendly
        )
        .Then(UAIEventResponse_AddEnemyModifier(EPerceptionCharacterType::Instigator))
        .Then(UAIEventResponse_AddExecuteModifier(EPerceptionCharacterType::Instigator))
        .Then(UAIEventResponse_LeavePartyOf(EPerceptionCharacterType::Instigator))
        .Then(UAIEventResponse_SwitchState(GameplayTag::AIState_Conflict_Flee_GetGuardHelp, EPerceptionCharacterType::Instigator)
                .AddContextTag(GameplayTag::Action_Ambient_GetJumpscared));

    
    // Affected is protected
    default Rules.Add(GameplayTag::AIEvent_Seen_PastCrimeInstigator)
        .EventHasTag(GameplayTag::Crime_Murder)
        .RequireTrue(
            Assessed::AffectedIsProtected |
            Assessed::IsCrimeSeverityCritical
        )
        .RequireFalse(
            Assessed::InstigatorIsStrongerThanSelf
        )
        .Then(UAIEventResponse_AddEnemyModifier(EPerceptionCharacterType::Instigator))
        .Then(UAIEventResponse_AddExecuteModifier(EPerceptionCharacterType::Instigator))
        .Then(UAIEventResponse_LeavePartyOf(EPerceptionCharacterType::Instigator))
        .Then(UAIEventResponse_SwitchState(GameplayTag::AIState_Conflict_Combat, EPerceptionCharacterType::Instigator))
        .Then(UAIEventResponse_VoiceReaction(GameplayTag::Sound_Voice_Reaction_Combat_Start, EPerceptionCharacterType::Instigator)
            .AddContextTagToTarget(GameplayTag::VoicelineContext_AttackedCharge));
    
    // Affected is friendly
    default Rules.Add(GameplayTag::AIEvent_Seen_PastCrimeInstigator)
        .EventHasTag(GameplayTag::Crime_Murder)
        .RequireTrue(
            Assessed::AffectedWasFriendly |
            Assessed::IsCrimeSeverityCritical
        )
        .RequireFalse(
            Assessed::AffectedIsProtected |
            Assessed::InstigatorIsStrongerThanSelf
        )
        .Then(UAIEventResponse_AddEnemyModifier(EPerceptionCharacterType::Instigator))
        .Then(UAIEventResponse_AddExecuteModifier(EPerceptionCharacterType::Instigator))
        .Then(UAIEventResponse_LeavePartyOf(EPerceptionCharacterType::Instigator))
        .Then(UAIEventResponse_SwitchState(GameplayTag::AIState_Conflict_Combat, EPerceptionCharacterType::Instigator))
        .Then(UAIEventResponse_VoiceReaction(GameplayTag::Sound_Voice_Reaction_Combat_Start, EPerceptionCharacterType::Instigator)
            .AddContextTagToTarget(GameplayTag::VoicelineContext_KilledOneOfUs));

    // Instigator is stronger

    default Rules.Add(GameplayTag::AIEvent_Seen_PastCrimeInstigator)
        .EventHasTag(GameplayTag::Crime_Murder)
        .RequireTrue(
            Assessed::AffectedWasFriendly |
            Assessed::IsCrimeSeverityCritical |
            Assessed::InstigatorIsStrongerThanSelf
        )
        .Then(UAIEventResponse_AddEnemyModifier(EPerceptionCharacterType::Instigator))
        .Then(UAIEventResponse_AddExecuteModifier(EPerceptionCharacterType::Instigator))
        .Then(UAIEventResponse_LeavePartyOf(EPerceptionCharacterType::Instigator))
        .Then(UAIEventResponse_SwitchState(GameplayTag::AIState_Conflict_Flee_GetGuardHelp, EPerceptionCharacterType::Instigator)
                .AddContextTag(GameplayTag::Action_Ambient_GetJumpscared));
    
    default Rules.Add(GameplayTag::AIEvent_Seen_PastCrimeInstigator)
        .EventHasTag(GameplayTag::Crime_Murder)
        .RequireTrue(
            Assessed::AffectedIsProtected |
            Assessed::IsCrimeSeverityCritical |
            Assessed::InstigatorIsStrongerThanSelf
        )
        .RequireFalse(
            Assessed::AffectedWasFriendly
        )
        .Then(UAIEventResponse_AddEnemyModifier(EPerceptionCharacterType::Instigator))
        .Then(UAIEventResponse_AddExecuteModifier(EPerceptionCharacterType::Instigator))
        .Then(UAIEventResponse_LeavePartyOf(EPerceptionCharacterType::Instigator))
        .Then(UAIEventResponse_SwitchState(GameplayTag::AIState_Conflict_Flee_GetGuardHelp, EPerceptionCharacterType::Instigator)
                .AddContextTag(GameplayTag::Action_Ambient_GetJumpscared));
}

class UAIARM_Crime_Murder_CombatEnd : UAIAssessmentResponseModule
{
    default RequiredOwnedTags.AddTag(GameplayTag::AIState_Conflict_Combat);

    default Rules.Add(GameplayTag::Crime_Murder)
        .RequireTrue(
            Assessed::AffectedWasEnemy
        )
        .RequireFalse(
            Assessed::LivingStandingEnemiesPerceived
        )
        .Then(UAIEventResponse_SwitchState(GameplayTag::AIState_Conflict_CombatEndActions, EPerceptionCharacterType::AffectedCharacter)
            .AddContextTag(GameplayTag::VoicelineContext_Death));
}

class UAIARM_Crime_Murder_Responses_ModifiersOnly: UAIAssessmentResponseModule
{
    default RequiredOwnedTags.AddTag(GameplayTag::AIState_Conflict_Combat);
    
    // Affected is protected
    default Rules.Add(GameplayTag::Crime_Murder)
        .RequireTrue(
            Assessed::AffectedIsProtected |
            Assessed::IsCrimeSeverityCritical
        )
        .Then(UAIEventResponse_AddEnemyModifier(EPerceptionCharacterType::Instigator))
        .Then(UAIEventResponse_AddExecuteModifier(EPerceptionCharacterType::Instigator))
        .Then(UAIEventResponse_LeavePartyOf(EPerceptionCharacterType::Instigator));
    
    default Rules.Add(GameplayTag::AIEvent_Seen_PastCrimeInstigator)
        .EventHasTag(GameplayTag::Crime_Murder)
        .RequireTrue(
            Assessed::AffectedIsProtected |
            Assessed::IsCrimeSeverityCritical
        )
        .Then(UAIEventResponse_AddEnemyModifier(EPerceptionCharacterType::Instigator))
        .Then(UAIEventResponse_AddExecuteModifier(EPerceptionCharacterType::Instigator))
        .Then(UAIEventResponse_LeavePartyOf(EPerceptionCharacterType::Instigator));
    
    // Affected is friendly
    default Rules.Add(GameplayTag::Crime_Murder)
        .RequireTrue(
            Assessed::AffectedWasFriendly |
            Assessed::IsCrimeSeverityCritical
        )
        .RequireFalse(
            Assessed::AffectedIsProtected
        )
        .Then(UAIEventResponse_AddEnemyModifier(EPerceptionCharacterType::Instigator))
        .Then(UAIEventResponse_AddExecuteModifier(EPerceptionCharacterType::Instigator))
        .Then(UAIEventResponse_LeavePartyOf(EPerceptionCharacterType::Instigator));
    
    default Rules.Add(GameplayTag::AIEvent_Seen_PastCrimeInstigator)
        .EventHasTag(GameplayTag::Crime_Murder)
        .RequireTrue(
            Assessed::AffectedWasFriendly |
            Assessed::IsCrimeSeverityCritical
        )
        .RequireFalse(
            Assessed::AffectedIsProtected
        )
        .Then(UAIEventResponse_AddEnemyModifier(EPerceptionCharacterType::Instigator))
        .Then(UAIEventResponse_AddExecuteModifier(EPerceptionCharacterType::Instigator))
        .Then(UAIEventResponse_LeavePartyOf(EPerceptionCharacterType::Instigator));
}