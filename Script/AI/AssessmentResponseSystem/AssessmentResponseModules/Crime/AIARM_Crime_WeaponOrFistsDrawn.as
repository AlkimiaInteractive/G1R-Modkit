class UAIARM_Crime_Human_WeaponOrFistsDrawn : UAIAssessmentResponseModule
{
    default SubModules.Add(UAIARM_Crime_WeaponDrawn);
    default SubModules.Add(UAIARM_Crime_FistsDrawn);
    default SubModules.Add(UAIARM_Crime_FistsOrWeaponDrawn_WarningEnd);
}

class UAIARM_Crime_Orc_WeaponOrFistsDrawn : UAIAssessmentResponseModule
{
    default SubModules.Add(UAIARM_Crime_WeaponDrawn);
    default SubModules.Add(UAIARM_Crime_FistsDrawn);
    default SubModules.Add(UAIARM_Crime_FistsOrWeaponDrawn_WarningEnd);
}

class UAIARM_Crime_WeaponDrawn : UAIAssessmentResponseModule
{
    default SubModules.Add(UAIARM_Crime_WeaponDrawn_Perception);
    // default SubModules.Add(UAIARM_Crime_IgnoredWarning_WeaponDrawn_Perception);
    default SubModules.Add(UAIARM_Crime_WeaponDrawn_Responses);
    default SubModules.Add(UAIARM_Crime_IgnoredWarning_WeaponDrawn_Responses);
}

class UAIARM_Crime_FistsDrawn : UAIAssessmentResponseModule
{
    default SubModules.Add(UAIARM_Crime_FistsDrawn_Perception);
    // default SubModules.Add(UAIARM_Crime_IgnoredWarning_FistsDrawn_Perception);
    default SubModules.Add(UAIARM_Crime_FistsDrawn_Responses);
    default SubModules.Add(UAIARM_Crime_IgnoredWarning_FistsDrawn_Responses);
}

///// PERCEPTION-CRIME BINDINGS
class UAIARM_Crime_WeaponDrawn_Perception : UAIAssessmentResponseModule
{
    default BlockIfHasAnyOwnedTags.AddTag(GameplayTag::AIState_Conflict_Warning_Threat);
    default BlockIfHasAnyOwnedTags.AddTag(GameplayTag::AIState_Conflict_WatchFight);
    default BlockIfHasAnyOwnedTags.AddTag(GameplayTag::AIState_Conflict_TurnToAttacker);
    default BlockIfHasAnyOwnedTags.AddTag(GameplayTag::State_Conversation);
    default BlockIfHasAnyOwnedTags.AddTag(GameplayTag::State_Defeated);

    default BlockIfAssessedHasAnyOwnedTags.AddTag(GameplayTag::State_Defeated);
    default BlockIfAssessedHasAnyOwnedTags.AddTag(GameplayTag::State_Conversation);
    default BlockIfAssessedHasAnyOwnedTags.AddTag(GameplayTag::State_Perceptions_GetIgnored);

    default RequirePursueCrimesOnAssessedCharacter.AddTag(GameplayTag::Crime_ThreateningWeaponDrawn);

    default Rules.Add(GameplayTag::AIEvent_Seen_Fighter_Human)
        .RequireTrue(
            Assessed::IsThreatening |
            Assessed::HasSensedDrawnThreateningWeapon |
            Assessed::SensedIsWithWeapon
        )
        .RequireFalse(
            Assessed::IsInPartyWithSensedCharacter |
            Assessed::SensedIsSelfSummoner |
            Assessed::IsSensedDrawingOrUndrawingWeapon |
            Assessed::SensedWasEnemy |
            Assessed::SensedOrInstigatorIsBeingWarned
        )
        .Then(UAIEventResponse_AssessCrime(
            GameplayTag::Crime_ThreateningWeaponDrawn,
            EPerceptionCharacterType::SensedCharacter, 
            EPerceptionCharacterType::SensedCharactersTarget));
    
    // default Rules.Add(GameplayTag::AIEvent_Seen_UndrawWeapon)
    //     .Then(UAIEventResponse_ForgiveAllCrimesOfType(EPerceptionCharacterType::SensedCharacter, GameplayTag::Crime_ThreateningWeaponDrawn))
    //     .Then(UAIEventResponse_ForgiveAllCrimesOfType(EPerceptionCharacterType::SensedCharacter, GameplayTag::Crime_IgnoredWarning_WeaponDrawn))
    //     .Then(UAIEventResponse_UpdateCrimeSeverityTowardsPlayer());
}

class UAIARM_Crime_FistsDrawn_Perception : UAIAssessmentResponseModule
{
    default BlockIfHasAnyOwnedTags.AddTag(GameplayTag::AIState_Conflict_Warning_Threat);
    default BlockIfHasAnyOwnedTags.AddTag(GameplayTag::AIState_Conflict_WatchFight);
    default BlockIfHasAnyOwnedTags.AddTag(GameplayTag::AIState_Conflict_TurnToAttacker);
    default BlockIfHasAnyOwnedTags.AddTag(GameplayTag::State_Defeated);
    
    default BlockIfAssessedHasAnyOwnedTags.AddTag(GameplayTag::State_Defeated);
    default BlockIfAssessedHasAnyOwnedTags.AddTag(GameplayTag::State_Conversation);
    default BlockIfAssessedHasAnyOwnedTags.AddTag(GameplayTag::State_Perceptions_GetIgnored);

    default RequirePursueCrimesOnAssessedCharacter.AddTag(GameplayTag::Crime_FistsDrawn);

    default Rules.Add(GameplayTag::AIEvent_Seen_Fighter_Human)
        .RequireTrue(
            Assessed::IsThreatening |
            Assessed::HasSensedDrawnThreateningWeapon |
            Assessed::SensedIsWithFists
        )
        .RequireFalse(
            Assessed::IsInPartyWithSensedCharacter |
            Assessed::SensedIsSelfSummoner |
            Assessed::IsSensedDrawingOrUndrawingWeapon |
            Assessed::SensedWasEnemy |
            Assessed::SensedOrInstigatorIsBeingWarned
        )
        .Then(UAIEventResponse_AssessCrime(
            GameplayTag::Crime_FistsDrawn,
            EPerceptionCharacterType::SensedCharacter, 
            EPerceptionCharacterType::SensedCharactersTarget));
    
    // default Rules.Add(GameplayTag::AIEvent_Seen_UndrawWeapon)
    //     .Then(UAIEventResponse_ForgiveAllCrimesOfType(EPerceptionCharacterType::SensedCharacter, GameplayTag::Crime_FistsDrawn))
    //     .Then(UAIEventResponse_ForgetAllCrimesOfType(EPerceptionCharacterType::SensedCharacter, GameplayTag::Crime_IgnoredWarning_FistsDrawn))
    //     .Then(UAIEventResponse_UpdateCrimeSeverityTowardsPlayer());
}

class UAIARM_Crime_IgnoredWarning_WeaponDrawn_Perception : UAIAssessmentResponseModule
{
    default RequiredOwnedTags.AddTag(GameplayTag::AIState_Conflict_Warning_Threat);

    default BlockIfAssessedHasAnyOwnedTags.AddTag(GameplayTag::State_Perceptions_GetIgnored);

    default RequirePursueCrimesOnAssessedCharacter.AddTag(GameplayTag::Crime_IgnoredWarning_WeaponDrawn);

    default Rules.Add(GameplayTag::AIEvent_Seen_Fighter_Human)
        .RequireTrue(
            Assessed::IsThreatening |
            Assessed::HasSensedDrawnThreateningWeapon |
            Assessed::SensedIsWithWeapon |
            Assessed::IsSelfStateGroupLeader
        )
        .RequireFalse(
            Assessed::IsInPartyWithSensedCharacter |
            Assessed::SensedIsSelfSummoner |
            Assessed::IsSensedDrawingOrUndrawingWeapon |
            Assessed::SensedWasEnemy
        )
        .Then(UAIEventResponse_RelayEventToOtherStateGroupMembers(
            GameplayTag::AIEvent_Group_IgnoredWarning
        ))
        .Then(UAIEventResponse_AssessCrime(
            GameplayTag::Crime_IgnoredWarning_WeaponDrawn,
            EPerceptionCharacterType::SensedCharacter,
            EPerceptionCharacterType::Self));

    default Rules.Add(GameplayTag::AIEvent_Threat_IsTooClose)
        .RequireTrue(
            Assessed::IsThreatening |
            Assessed::HasSensedDrawnThreateningWeapon |
            Assessed::SensedIsWithWeapon
        )
        .RequireFalse(
            Assessed::IsInPartyWithSensedCharacter |
            Assessed::SensedIsSelfSummoner |
            Assessed::IsSensedDrawingOrUndrawingWeapon |
            Assessed::SensedWasEnemy
        )
        .Then(UAIEventResponse_RelayEventToOtherStateGroupMembers(
            GameplayTag::AIEvent_Group_ThreatIsTooClose
        ))
        .Then(UAIEventResponse_AssessCrime(
            GameplayTag::Crime_ThreateningWeaponTooClose,
            EPerceptionCharacterType::SensedCharacter, 
            EPerceptionCharacterType::Self));
    
    default Rules.Add(GameplayTag::AIEvent_Group_IgnoredWarning)
        .RequireTrue(
            Assessed::IsThreatening |
            Assessed::HasSensedDrawnThreateningWeapon |
            Assessed::SensedIsWithWeapon
        )
        .RequireFalse(
            Assessed::IsInPartyWithSensedCharacter |
            Assessed::SensedIsSelfSummoner |
            Assessed::IsSensedDrawingOrUndrawingWeapon |
            Assessed::SensedWasEnemy |
            Assessed::IsSelfStateGroupLeader
        )
        .Then(UAIEventResponse_AssessCrime(
            GameplayTag::Crime_IgnoredWarning_WeaponDrawn,
            EPerceptionCharacterType::SensedCharacter,
            EPerceptionCharacterType::Self));

    default Rules.Add(GameplayTag::AIEvent_Group_ThreatIsTooClose)
        .RequireTrue(
            Assessed::IsThreatening |
            Assessed::HasSensedDrawnThreateningWeapon |
            Assessed::SensedIsWithWeapon
        )
        .RequireFalse(
            Assessed::IsInPartyWithSensedCharacter |
            Assessed::SensedIsSelfSummoner |
            Assessed::IsSensedDrawingOrUndrawingWeapon |
            Assessed::SensedWasEnemy
        )
        .Then(UAIEventResponse_AssessCrime(
            GameplayTag::Crime_ThreateningWeaponTooClose,
            EPerceptionCharacterType::SensedCharacter, 
            EPerceptionCharacterType::Self));
}

class UAIARM_Crime_IgnoredWarning_FistsDrawn_Perception : UAIAssessmentResponseModule
{
    default RequiredOwnedTags.AddTag(GameplayTag::AIState_Conflict_Warning_Threat);

    default BlockIfAssessedHasAnyOwnedTags.AddTag(GameplayTag::State_Perceptions_GetIgnored);

    default RequirePursueCrimesOnAssessedCharacter.AddTag(GameplayTag::Crime_IgnoredWarning_FistsDrawn);
    
    default Rules.Add(GameplayTag::AIEvent_Seen_Fighter_Human)
        .RequireTrue(
            Assessed::IsThreatening |
            Assessed::HasSensedDrawnThreateningWeapon |
            Assessed::SensedIsWithFists |
            Assessed::IsSelfStateGroupLeader
        )
        .RequireFalse(
            Assessed::IsInPartyWithSensedCharacter |
            Assessed::SensedIsSelfSummoner |
            Assessed::IsSensedDrawingOrUndrawingWeapon |
            Assessed::SensedWasEnemy
        )
        .Then(UAIEventResponse_RelayEventToOtherStateGroupMembers(
            GameplayTag::AIEvent_Group_IgnoredWarning
        ))
        .Then(UAIEventResponse_AssessCrime(
            GameplayTag::Crime_IgnoredWarning_FistsDrawn,
            EPerceptionCharacterType::SensedCharacter, 
            EPerceptionCharacterType::Self));
        
    default Rules.Add(GameplayTag::AIEvent_Threat_IsTooClose)
        .RequireTrue(
            Assessed::IsThreatening |
            Assessed::HasSensedDrawnThreateningWeapon |
            Assessed::SensedIsWithFists
        )
        .RequireFalse(
            Assessed::IsInPartyWithSensedCharacter |
            Assessed::SensedIsSelfSummoner |
            Assessed::IsSensedDrawingOrUndrawingWeapon |
            Assessed::SensedWasEnemy
        )
        .Then(UAIEventResponse_RelayEventToOtherStateGroupMembers(
            GameplayTag::AIEvent_Group_ThreatIsTooClose
        ))
        .Then(UAIEventResponse_AssessCrime(
            GameplayTag::Crime_FistsTooClose,
            EPerceptionCharacterType::SensedCharacter, 
            EPerceptionCharacterType::Self));

        default Rules.Add(GameplayTag::AIEvent_Group_IgnoredWarning)
        .RequireTrue(
            Assessed::IsThreatening |
            Assessed::HasSensedDrawnThreateningWeapon |
            Assessed::SensedIsWithFists
        )
        .RequireFalse(
            Assessed::IsInPartyWithSensedCharacter |
            Assessed::SensedIsSelfSummoner |
            Assessed::IsSensedDrawingOrUndrawingWeapon |
            Assessed::SensedWasEnemy |
            Assessed::IsSelfStateGroupLeader
        )
        .Then(UAIEventResponse_AssessCrime(
            GameplayTag::Crime_IgnoredWarning_FistsDrawn,
            EPerceptionCharacterType::SensedCharacter, 
            EPerceptionCharacterType::Self));
        
    default Rules.Add(GameplayTag::AIEvent_Group_ThreatIsTooClose)
        .RequireTrue(
            Assessed::IsThreatening |
            Assessed::HasSensedDrawnThreateningWeapon |
            Assessed::SensedIsWithFists
        )
        .RequireFalse(
            Assessed::IsInPartyWithSensedCharacter |
            Assessed::SensedIsSelfSummoner |
            Assessed::IsSensedDrawingOrUndrawingWeapon |
            Assessed::SensedWasEnemy
        )
        .Then(UAIEventResponse_AssessCrime(
            GameplayTag::Crime_FistsTooClose,
            EPerceptionCharacterType::SensedCharacter, 
            EPerceptionCharacterType::Self));
}

class UAIARM_Crime_WeaponDrawn_Responses : UAIAssessmentResponseModule
{
    default SubModules.Add(UAIARM_Crime_WeaponDrawn_Responses_ToWarningOrCombat);
    default SubModules.Add(UAIARM_Crime_WeaponDrawn_Responses_ToWatchStrongerHostile);
    default SubModules.Add(UAIARM_Crime_WeaponDrawn_Responses_InCombat);
}

class UAIARM_Crime_FistsDrawn_Responses : UAIAssessmentResponseModule
{
    default SubModules.Add(UAIARM_Crime_FistsDrawn_Responses_ToWarningOrCombat);
    default SubModules.Add(UAIARM_Crime_FistsDrawn_Responses_ToWatchStrongerHostile);
    default SubModules.Add(UAIARM_Crime_FistsDrawn_Responses_InCombat);
}

///// RESPONSE RULES CONFIGURATIONS
class UAIARM_Crime_WeaponDrawn_Responses_ToWarningOrCombat : UAIAssessmentResponseModule
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

    default SubModules.Add(UAIARM_Crime_WeaponDrawn_Responses_ToWarning);
    default SubModules.Add(UAIARM_Crime_WeaponDrawn_Responses_ToCombat);

    // Threatening weapon - Instigator not Stronger
    // default Rules.Add(GameplayTag::Crime_ThreateningWeaponDrawn)
    //     .RequireTrue(
    //         Assessed::IsCrimeSeverityMinimal
    //     )
    //     .Then(UAIEventResponse_ForgetLastCrimeOfType(EPerceptionCharacterType::Instigator, GameplayTag::Crime_ThreateningWeaponDrawn));
        // .Then(UAIEventResponse_VoiceReaction(GameplayTag::Sound_Voice_Reaction_Wea)); TODO Reaction
}

class UAIARM_Crime_WeaponDrawn_Responses_ToWarning : UAIAssessmentResponseModule
{
    default Rules.Add(GameplayTag::Crime_ThreateningWeaponDrawn)
        .RequireTrue(
            Assessed::IsCrimeSeverityMedium
        )
        .RequireFalse(
            Assessed::InstigatorIsStrongerThanSelf |
            Assessed::IsAnyFriendlyEnforcerOrLeaderInvolved
        )
        .Then(UAIEventResponse_AddHostileModifier(EPerceptionCharacterType::Instigator))
        .Then(UAIEventResponse_SwitchState(GameplayTag::AIState_Conflict_Warning_Threat, EPerceptionCharacterType::Instigator, true));

    default Rules.Add(GameplayTag::Crime_ThreateningWeaponDrawn)
        .RequireTrue(
            Assessed::IsCrimeSeverityHigh
        )
        .RequireFalse(
            Assessed::InstigatorIsStrongerThanSelf |
            Assessed::IsAnyFriendlyEnforcerOrLeaderInvolved
        )
        .Then(UAIEventResponse_AddHostileModifier(EPerceptionCharacterType::Instigator))
        .Then(UAIEventResponse_SwitchState(GameplayTag::AIState_Conflict_Warning_Threat, EPerceptionCharacterType::Instigator, true));

    // Past Crime
    default Rules.Add(GameplayTag::AIEvent_Seen_PastCrimeInstigator)
        .EventHasTag(GameplayTag::Crime_ThreateningWeaponDrawn)
        .RequireTrue(
            Assessed::IsCrimeSeverityMedium |
            Assessed::SensedOrInstigatorIsBeingWarned
        )
        .RequireFalse(
            Assessed::InstigatorIsStrongerThanSelf |
            Assessed::IsAnyFriendlyEnforcerOrLeaderInvolved
        )
        .Then(UAIEventResponse_AddHostileModifier(EPerceptionCharacterType::Instigator))
        .Then(UAIEventResponse_SwitchState(GameplayTag::AIState_Conflict_Warning_Threat, EPerceptionCharacterType::Instigator, true));

    default Rules.Add(GameplayTag::AIEvent_Seen_PastCrimeInstigator)
        .EventHasTag(GameplayTag::Crime_ThreateningWeaponDrawn)
        .RequireTrue(
            Assessed::IsCrimeSeverityHigh |
            Assessed::SensedOrInstigatorIsBeingWarned
        )
        .RequireFalse(
            Assessed::InstigatorIsStrongerThanSelf |
            Assessed::IsAnyFriendlyEnforcerOrLeaderInvolved
        )
        .Then(UAIEventResponse_AddHostileModifier(EPerceptionCharacterType::Instigator))
        .Then(UAIEventResponse_SwitchState(GameplayTag::AIState_Conflict_Warning_Threat, EPerceptionCharacterType::Instigator, true));
}

class UAIARM_Crime_WeaponDrawn_Responses_ToCombat : UAIAssessmentResponseModule
{
    default Rules.Add(GameplayTag::Crime_ThreateningWeaponDrawn)
        .RequireTrue(
            Assessed::IsCrimeSeverityCritical
        )
        .RequireFalse(
            Assessed::InstigatorIsStrongerThanSelf |
            Assessed::InstigatorWasCombatForgivenBefore |
            Assessed::IsAnyFriendlyEnforcerOrLeaderInvolved
        )
        .Then(UAIEventResponse_AddEnemyModifier(EPerceptionCharacterType::Instigator))
        .Then(UAIEventResponse_VoiceReaction(GameplayTag::Sound_Voice_Reaction_Combat_Start, EPerceptionCharacterType::Instigator))
        // .Then(UAIEventResponse_ForgetAllCrimesOfType(EPerceptionCharacterType::Instigator, GameplayTag::Crime_IgnoredWarning_WeaponDrawn))
        .Then(UAIEventResponse_SwitchState(GameplayTag::AIState_Conflict_Combat, EPerceptionCharacterType::Instigator, true));

    default Rules.Add(GameplayTag::Crime_ThreateningWeaponDrawn)
        .RequireTrue(
            Assessed::IsCrimeSeverityCritical |
            Assessed::InstigatorWasCombatForgivenBefore
        )
        .RequireFalse(
            Assessed::InstigatorIsStrongerThanSelf |
            Assessed::IsAnyFriendlyEnforcerOrLeaderInvolved
        )
        .Then(UAIEventResponse_AddEnemyModifier(EPerceptionCharacterType::Instigator))
        .Then(UAIEventResponse_VoiceReaction(GameplayTag::Sound_Voice_Reaction_Combat_Start, EPerceptionCharacterType::Instigator)
            .AddContextTagToTarget(GameplayTag::VoicelineContext_NotHadEnough))
        // .Then(UAIEventResponse_ForgetAllCrimesOfType(EPerceptionCharacterType::Instigator, GameplayTag::Crime_IgnoredWarning_WeaponDrawn))
        .Then(UAIEventResponse_SwitchState(GameplayTag::AIState_Conflict_Combat, EPerceptionCharacterType::Instigator, true));

    // Past Crime
    default Rules.Add(GameplayTag::AIEvent_Seen_PastCrimeInstigator)
        .EventHasTag(GameplayTag::Crime_ThreateningWeaponDrawn)
        .RequireTrue(
            Assessed::IsCrimeSeverityCritical
        )
        .RequireFalse(
            Assessed::InstigatorIsStrongerThanSelf |
            Assessed::InstigatorWasCombatForgivenBefore |
            Assessed::IsAnyFriendlyEnforcerOrLeaderInvolved
        )
        .Then(UAIEventResponse_AddEnemyModifier(EPerceptionCharacterType::Instigator))
        .Then(UAIEventResponse_VoiceReaction(GameplayTag::Sound_Voice_Reaction_Combat_Start, EPerceptionCharacterType::Instigator))
        // .Then(UAIEventResponse_ForgetAllCrimesOfType(EPerceptionCharacterType::Instigator, GameplayTag::Crime_IgnoredWarning_WeaponDrawn))
        .Then(UAIEventResponse_SwitchState(GameplayTag::AIState_Conflict_Combat, EPerceptionCharacterType::Instigator, true));

    default Rules.Add(GameplayTag::AIEvent_Seen_PastCrimeInstigator)
        .EventHasTag(GameplayTag::Crime_ThreateningWeaponDrawn)
        .RequireTrue(
            Assessed::IsCrimeSeverityCritical |
            Assessed::InstigatorWasCombatForgivenBefore
        )
        .RequireFalse(
            Assessed::InstigatorIsStrongerThanSelf |
            Assessed::IsAnyFriendlyEnforcerOrLeaderInvolved
        )
        .Then(UAIEventResponse_AddEnemyModifier(EPerceptionCharacterType::Instigator))
        .Then(UAIEventResponse_VoiceReaction(GameplayTag::Sound_Voice_Reaction_Combat_Start, EPerceptionCharacterType::Instigator)
            .AddContextTagToTarget(GameplayTag::VoicelineContext_NotHadEnough))
        // .Then(UAIEventResponse_ForgetAllCrimesOfType(EPerceptionCharacterType::Instigator, GameplayTag::Crime_IgnoredWarning_WeaponDrawn))
        .Then(UAIEventResponse_SwitchState(GameplayTag::AIState_Conflict_Combat, EPerceptionCharacterType::Instigator, true));
}

class UAIARM_Crime_WeaponDrawn_Responses_ToWatchStrongerHostile : UAIAssessmentResponseModule
{
    default BlockIfHasAnyOwnedTags.AddTag(GameplayTag::AIState_Conflict_WatchHostile);
    default BlockIfHasAnyOwnedTags.AddTag(GameplayTag::AIState_Conflict_Warning_Threat);
    default BlockIfHasAnyOwnedTags.AddTag(GameplayTag::AIState_Conflict_Combat);
    default BlockIfHasAnyOwnedTags.AddTag(GameplayTag::Debuff_Fear);
    default BlockIfHasAnyOwnedTags.AddTag(GameplayTag::AIState_Conflict_Flee);
    default BlockIfHasAnyOwnedTags.AddTag(GameplayTag::AIState_Conflict_Disengage);

    // Threatening weapon - Instigator Stronger
    default Rules.Add(GameplayTag::Crime_ThreateningWeaponDrawn)
        .RequireTrue(
            Assessed::IsCrimeSeverityMedium |
            Assessed::InstigatorIsStrongerThanSelf
        )
        .Then(UAIEventResponse_AddHostileModifier(EPerceptionCharacterType::Instigator))
        .Then(UAIEventResponse_SwitchState(GameplayTag::AIState_Conflict_WatchHostile, EPerceptionCharacterType::Instigator, true));

    default Rules.Add(GameplayTag::Crime_ThreateningWeaponDrawn)
        .RequireTrue(
            Assessed::IsCrimeSeverityHigh |
            Assessed::InstigatorIsStrongerThanSelf
        )
        .Then(UAIEventResponse_AddHostileModifier(EPerceptionCharacterType::Instigator))
        .Then(UAIEventResponse_SwitchState(GameplayTag::AIState_Conflict_WatchHostile, EPerceptionCharacterType::Instigator, true));
    
    default Rules.Add(GameplayTag::Crime_ThreateningWeaponDrawn)
        .RequireTrue(
            Assessed::IsCrimeSeverityCritical |
            Assessed::InstigatorIsStrongerThanSelf
        )
        .Then(UAIEventResponse_AddEnemyModifier(EPerceptionCharacterType::Instigator))
        .Then(UAIEventResponse_VoiceReaction(GameplayTag::Sound_Voice_Reaction_Combat_Beaten_YesYes))
        // .Then(UAIEventResponse_ForgetAllCrimesOfType(EPerceptionCharacterType::Instigator, GameplayTag::Crime_IgnoredWarning))
        .Then(UAIEventResponse_SwitchState(GameplayTag::AIState_Conflict_WatchHostile, EPerceptionCharacterType::SensedCharacter));
}

class UAIARM_Crime_WeaponDrawn_Responses_InCombat : UAIAssessmentResponseModule
{
    default RequiredOwnedTags.AddTag(GameplayTag::AIState_Conflict_Combat);

    // Threatening Weapon
    default Rules.Add(GameplayTag::Crime_ThreateningWeaponDrawn)
        .RequireTrue(
            Assessed::IsCrimeSeverityMedium
        )
        .Then(UAIEventResponse_AddHostileModifier(EPerceptionCharacterType::Instigator));

    default Rules.Add(GameplayTag::Crime_ThreateningWeaponDrawn)
        .RequireTrue(
            Assessed::IsCrimeSeverityHigh
        )
        .Then(UAIEventResponse_AddHostileModifier(EPerceptionCharacterType::Instigator));
    
    default Rules.Add(GameplayTag::Crime_ThreateningWeaponDrawn)
        .RequireTrue(
            Assessed::IsCrimeSeverityCritical
        )
        .Then(UAIEventResponse_AddEnemyModifier(EPerceptionCharacterType::Instigator));
}

class UAIARM_Crime_FistsDrawn_Responses_ToWarningOrCombat : UAIAssessmentResponseModule
{
    default BlockIfHasAnyOwnedTags.AddTag(GameplayTag::AIState_Conflict_WatchHostile);
    default BlockIfHasAnyOwnedTags.AddTag(GameplayTag::AIState_Conflict_Warning_Threat);
    default BlockIfHasAnyOwnedTags.AddTag(GameplayTag::AIState_Conflict_Combat);
    default BlockIfHasAnyOwnedTags.AddTag(GameplayTag::Debuff_Fear);
    default BlockIfHasAnyOwnedTags.AddTag(GameplayTag::AIState_Conflict_Flee);
    default BlockIfHasAnyOwnedTags.AddTag(GameplayTag::AIState_Conflict_Disengage);

    default SubModules.Add(UAIARM_Crime_FistsDrawn_Responses_ToWarning_Weapon);
    default SubModules.Add(UAIARM_Crime_FistsDrawn_Responses_ToWarning_Fists);
    default SubModules.Add(UAIARM_Crime_FistsDrawn_Responses_ToCombat_Weapon);
    default SubModules.Add(UAIARM_Crime_FistsDrawn_Responses_ToCombat_Fists);

    // default Rules.Add(GameplayTag::Crime_FistsDrawn)
    //     .RequireTrue(
    //         Assessed::IsCrimeSeverityMinimal
    //     )
    //     .Then(UAIEventResponse_ForgetLastCrimeOfType(EPerceptionCharacterType::Instigator, GameplayTag::Crime_FistsDrawn));
        // .Then(UAIEventResponse_VoiceReaction(GameplayTag::Sound_Voice_Reaction_Wea)); TODO Reaction
}

class UAIARM_Crime_FistsDrawn_Responses_ToWarning_Weapon : UAIAssessmentResponseModule
{
    default RequireAnyOwnedTags.AddTag(GameplayTag::Role_Guard);
    default RequireAnyOwnedTags.AddTag(GameplayTag::Role_BodyGuard);

    default Rules.Add(GameplayTag::Crime_FistsDrawn)
        .RequireTrue(
            Assessed::IsCrimeSeverityMedium
        )
        .RequireFalse(
            Assessed::InstigatorIsStrongerThanSelf |
            Assessed::IsAnyFriendlyEnforcerOrLeaderInvolved
        )
        .Then(UAIEventResponse_AddHostileModifier(EPerceptionCharacterType::Instigator))
        .Then(UAIEventResponse_SwitchState(GameplayTag::AIState_Conflict_Warning_Threat, EPerceptionCharacterType::Instigator, true));

    default Rules.Add(GameplayTag::Crime_FistsDrawn)
        .RequireTrue(
            Assessed::IsCrimeSeverityHigh
        )
        .RequireFalse(
            Assessed::InstigatorIsStrongerThanSelf |
            Assessed::IsAnyFriendlyEnforcerOrLeaderInvolved
        )
        .Then(UAIEventResponse_AddHostileModifier(EPerceptionCharacterType::Instigator))
        .Then(UAIEventResponse_SwitchState(GameplayTag::AIState_Conflict_Warning_Threat, EPerceptionCharacterType::Instigator, true));
    
    // Past Crime
    default Rules.Add(GameplayTag::AIEvent_Seen_PastCrimeInstigator)
        .EventHasTag(GameplayTag::Crime_FistsDrawn)
        .RequireTrue(
            Assessed::IsCrimeSeverityMedium |
            Assessed::SensedOrInstigatorIsBeingWarned
        )
        .RequireFalse(
            Assessed::InstigatorIsStrongerThanSelf |
            Assessed::IsAnyFriendlyEnforcerOrLeaderInvolved
        )
        .Then(UAIEventResponse_AddHostileModifier(EPerceptionCharacterType::Instigator))
        .Then(UAIEventResponse_SwitchState(GameplayTag::AIState_Conflict_Warning_Threat, EPerceptionCharacterType::Instigator, true));

    default Rules.Add(GameplayTag::AIEvent_Seen_PastCrimeInstigator)
        .EventHasTag(GameplayTag::Crime_FistsDrawn)
        .RequireTrue(
            Assessed::IsCrimeSeverityHigh |
            Assessed::SensedOrInstigatorIsBeingWarned
        )
        .RequireFalse(
            Assessed::InstigatorIsStrongerThanSelf |
            Assessed::IsAnyFriendlyEnforcerOrLeaderInvolved
        )
        .Then(UAIEventResponse_AddHostileModifier(EPerceptionCharacterType::Instigator))
        .Then(UAIEventResponse_SwitchState(GameplayTag::AIState_Conflict_Warning_Threat, EPerceptionCharacterType::Instigator, true));
}

class UAIARM_Crime_FistsDrawn_Responses_ToWarning_Fists : UAIAssessmentResponseModule
{
    default BlockIfHasAnyOwnedTags.AddTag(GameplayTag::Role_Guard);
    default BlockIfHasAnyOwnedTags.AddTag(GameplayTag::Role_BodyGuard);

    default Rules.Add(GameplayTag::Crime_FistsDrawn)
        .RequireTrue(
            Assessed::IsCrimeSeverityMedium
        )
        .RequireFalse(
            Assessed::InstigatorIsStrongerThanSelf |
            Assessed::IsAnyFriendlyEnforcerOrLeaderInvolved
        )
        .Then(UAIEventResponse_AddHostileModifier(EPerceptionCharacterType::Instigator))
        .Then(UAIEventResponse_AddUseFistsModifier(EPerceptionCharacterType::Instigator))
        .Then(UAIEventResponse_SwitchState(GameplayTag::AIState_Conflict_Warning_Threat, EPerceptionCharacterType::Instigator, true));

    default Rules.Add(GameplayTag::Crime_FistsDrawn)
        .RequireTrue(
            Assessed::IsCrimeSeverityHigh
        )
        .RequireFalse(
            Assessed::InstigatorIsStrongerThanSelf |
            Assessed::IsAnyFriendlyEnforcerOrLeaderInvolved
        )
        .Then(UAIEventResponse_AddHostileModifier(EPerceptionCharacterType::Instigator))
        .Then(UAIEventResponse_AddUseFistsModifier(EPerceptionCharacterType::Instigator))
        .Then(UAIEventResponse_SwitchState(GameplayTag::AIState_Conflict_Warning_Threat, EPerceptionCharacterType::Instigator, true));
    
    // Past Crime
    default Rules.Add(GameplayTag::Crime_FistsDrawn)
        .RequireTrue(
            Assessed::IsCrimeSeverityMedium |
            Assessed::SensedOrInstigatorIsBeingWarned
        )
        .RequireFalse(
            Assessed::InstigatorIsStrongerThanSelf |
            Assessed::IsAnyFriendlyEnforcerOrLeaderInvolved
        )
        .Then(UAIEventResponse_AddHostileModifier(EPerceptionCharacterType::Instigator))
        .Then(UAIEventResponse_AddUseFistsModifier(EPerceptionCharacterType::Instigator))
        .Then(UAIEventResponse_SwitchState(GameplayTag::AIState_Conflict_Warning_Threat, EPerceptionCharacterType::Instigator, true));

    default Rules.Add(GameplayTag::Crime_FistsDrawn)
        .RequireTrue(
            Assessed::IsCrimeSeverityHigh |
            Assessed::SensedOrInstigatorIsBeingWarned
        )
        .RequireFalse(
            Assessed::InstigatorIsStrongerThanSelf |
            Assessed::IsAnyFriendlyEnforcerOrLeaderInvolved
        )
        .Then(UAIEventResponse_AddHostileModifier(EPerceptionCharacterType::Instigator))
        .Then(UAIEventResponse_AddUseFistsModifier(EPerceptionCharacterType::Instigator))
        .Then(UAIEventResponse_SwitchState(GameplayTag::AIState_Conflict_Warning_Threat, EPerceptionCharacterType::Instigator, true));
}

class UAIARM_Crime_FistsDrawn_Responses_ToCombat_Weapon : UAIAssessmentResponseModule
{
    default RequireAnyOwnedTags.AddTag(GameplayTag::Role_Guard);
    default RequireAnyOwnedTags.AddTag(GameplayTag::Role_BodyGuard);

    default Rules.Add(GameplayTag::Crime_FistsDrawn)
        .RequireTrue(
            Assessed::IsCrimeSeverityCritical
        )
        .RequireFalse(
            Assessed::InstigatorIsStrongerThanSelf |
            Assessed::InstigatorWasCombatForgivenBefore |
            Assessed::IsAnyFriendlyEnforcerOrLeaderInvolved
        )
        .Then(UAIEventResponse_AddEnemyModifier(EPerceptionCharacterType::Instigator))
        .Then(UAIEventResponse_VoiceReaction(GameplayTag::Sound_Voice_Reaction_Combat_Start, EPerceptionCharacterType::Instigator))
        // .Then(UAIEventResponse_ForgetAllCrimesOfType(EPerceptionCharacterType::Instigator, GameplayTag::Crime_IgnoredWarning_FistsDrawn))
        .Then(UAIEventResponse_SwitchState(GameplayTag::AIState_Conflict_Combat, EPerceptionCharacterType::Instigator, true));

    default Rules.Add(GameplayTag::Crime_FistsDrawn)
        .RequireTrue(
            Assessed::IsCrimeSeverityCritical |
            Assessed::InstigatorWasCombatForgivenBefore
        )
        .RequireFalse(
            Assessed::InstigatorIsStrongerThanSelf |
            Assessed::IsAnyFriendlyEnforcerOrLeaderInvolved
        )
        .Then(UAIEventResponse_AddEnemyModifier(EPerceptionCharacterType::Instigator))
        .Then(UAIEventResponse_VoiceReaction(GameplayTag::Sound_Voice_Reaction_Combat_Start, EPerceptionCharacterType::Instigator)
            .AddContextTagToTarget(GameplayTag::VoicelineContext_NotHadEnough))
        // .Then(UAIEventResponse_ForgetAllCrimesOfType(EPerceptionCharacterType::Instigator, GameplayTag::Crime_IgnoredWarning_FistsDrawn))
        .Then(UAIEventResponse_SwitchState(GameplayTag::AIState_Conflict_Combat, EPerceptionCharacterType::Instigator, true));
    
    // Past Crime
    default Rules.Add(GameplayTag::AIEvent_Seen_PastCrimeInstigator)
        .EventHasTag(GameplayTag::Crime_FistsDrawn)
        .RequireTrue(
            Assessed::IsCrimeSeverityCritical
        )
        .RequireFalse(
            Assessed::InstigatorIsStrongerThanSelf |
            Assessed::InstigatorWasCombatForgivenBefore |
            Assessed::IsAnyFriendlyEnforcerOrLeaderInvolved
        )
        .Then(UAIEventResponse_AddEnemyModifier(EPerceptionCharacterType::Instigator))
        .Then(UAIEventResponse_VoiceReaction(GameplayTag::Sound_Voice_Reaction_Combat_Start, EPerceptionCharacterType::Instigator))
        // .Then(UAIEventResponse_ForgetAllCrimesOfType(EPerceptionCharacterType::Instigator, GameplayTag::Crime_IgnoredWarning_FistsDrawn))
        .Then(UAIEventResponse_SwitchState(GameplayTag::AIState_Conflict_Combat, EPerceptionCharacterType::Instigator, true));

    default Rules.Add(GameplayTag::AIEvent_Seen_PastCrimeInstigator)
        .EventHasTag(GameplayTag::Crime_FistsDrawn)
        .RequireTrue(
            Assessed::IsCrimeSeverityCritical |
            Assessed::InstigatorWasCombatForgivenBefore
        )
        .RequireFalse(
            Assessed::InstigatorIsStrongerThanSelf |
            Assessed::IsAnyFriendlyEnforcerOrLeaderInvolved
        )
        .Then(UAIEventResponse_AddEnemyModifier(EPerceptionCharacterType::Instigator))
        .Then(UAIEventResponse_VoiceReaction(GameplayTag::Sound_Voice_Reaction_Combat_Start, EPerceptionCharacterType::Instigator)
            .AddContextTagToTarget(GameplayTag::VoicelineContext_NotHadEnough))
        // .Then(UAIEventResponse_ForgetAllCrimesOfType(EPerceptionCharacterType::Instigator, GameplayTag::Crime_IgnoredWarning_FistsDrawn))
        .Then(UAIEventResponse_SwitchState(GameplayTag::AIState_Conflict_Combat, EPerceptionCharacterType::Instigator, true));
}

class UAIARM_Crime_FistsDrawn_Responses_ToCombat_Fists : UAIAssessmentResponseModule
{
    default BlockIfHasAnyOwnedTags.AddTag(GameplayTag::Role_Guard);
    default BlockIfHasAnyOwnedTags.AddTag(GameplayTag::Role_BodyGuard);

    default Rules.Add(GameplayTag::Crime_FistsDrawn)
        .RequireTrue(
            Assessed::IsCrimeSeverityCritical
        )
        .RequireFalse(
            Assessed::InstigatorIsStrongerThanSelf |
            Assessed::InstigatorWasCombatForgivenBefore |
            Assessed::IsAnyFriendlyEnforcerOrLeaderInvolved
        )
        .Then(UAIEventResponse_AddEnemyModifier(EPerceptionCharacterType::Instigator))
        .Then(UAIEventResponse_AddUseFistsModifier(EPerceptionCharacterType::Instigator))
        .Then(UAIEventResponse_VoiceReaction(GameplayTag::Sound_Voice_Reaction_Combat_Start, EPerceptionCharacterType::Instigator))
        // .Then(UAIEventResponse_ForgetAllCrimesOfType(EPerceptionCharacterType::Instigator, GameplayTag::Crime_IgnoredWarning_FistsDrawn))
        .Then(UAIEventResponse_SwitchState(GameplayTag::AIState_Conflict_Combat, EPerceptionCharacterType::Instigator, true));

    default Rules.Add(GameplayTag::Crime_FistsDrawn)
        .RequireTrue(
            Assessed::IsCrimeSeverityCritical |
            Assessed::InstigatorWasCombatForgivenBefore
        )
        .RequireFalse(
            Assessed::InstigatorIsStrongerThanSelf |
            Assessed::IsAnyFriendlyEnforcerOrLeaderInvolved
        )
        .Then(UAIEventResponse_AddEnemyModifier(EPerceptionCharacterType::Instigator))
        .Then(UAIEventResponse_AddUseFistsModifier(EPerceptionCharacterType::Instigator))
        .Then(UAIEventResponse_VoiceReaction(GameplayTag::Sound_Voice_Reaction_Combat_Start, EPerceptionCharacterType::Instigator)
            .AddContextTagToTarget(GameplayTag::VoicelineContext_NotHadEnough))
        // .Then(UAIEventResponse_ForgetAllCrimesOfType(EPerceptionCharacterType::Instigator, GameplayTag::Crime_IgnoredWarning_FistsDrawn))
        .Then(UAIEventResponse_SwitchState(GameplayTag::AIState_Conflict_Combat, EPerceptionCharacterType::Instigator, true));
    
    // Past Crime
    default Rules.Add(GameplayTag::AIEvent_Seen_PastCrimeInstigator)
        .EventHasTag(GameplayTag::Crime_FistsDrawn)
        .RequireTrue(
            Assessed::IsCrimeSeverityCritical
        )
        .RequireFalse(
            Assessed::InstigatorIsStrongerThanSelf |
            Assessed::InstigatorWasCombatForgivenBefore |
            Assessed::IsAnyFriendlyEnforcerOrLeaderInvolved
        )
        .Then(UAIEventResponse_AddEnemyModifier(EPerceptionCharacterType::Instigator))
        .Then(UAIEventResponse_AddUseFistsModifier(EPerceptionCharacterType::Instigator))
        .Then(UAIEventResponse_VoiceReaction(GameplayTag::Sound_Voice_Reaction_Combat_Start, EPerceptionCharacterType::Instigator))
        // .Then(UAIEventResponse_ForgetAllCrimesOfType(EPerceptionCharacterType::Instigator, GameplayTag::Crime_IgnoredWarning_FistsDrawn))
        .Then(UAIEventResponse_SwitchState(GameplayTag::AIState_Conflict_Combat, EPerceptionCharacterType::Instigator, true));

    default Rules.Add(GameplayTag::AIEvent_Seen_PastCrimeInstigator)
        .EventHasTag(GameplayTag::Crime_FistsDrawn)
        .RequireTrue(
            Assessed::IsCrimeSeverityCritical |
            Assessed::InstigatorWasCombatForgivenBefore
        )
        .RequireFalse(
            Assessed::InstigatorIsStrongerThanSelf |
            Assessed::IsAnyFriendlyEnforcerOrLeaderInvolved
        )
        .Then(UAIEventResponse_AddEnemyModifier(EPerceptionCharacterType::Instigator))
        .Then(UAIEventResponse_AddUseFistsModifier(EPerceptionCharacterType::Instigator))
        .Then(UAIEventResponse_VoiceReaction(GameplayTag::Sound_Voice_Reaction_Combat_Start, EPerceptionCharacterType::Instigator)
            .AddContextTagToTarget(GameplayTag::VoicelineContext_NotHadEnough))
        // .Then(UAIEventResponse_ForgetAllCrimesOfType(EPerceptionCharacterType::Instigator, GameplayTag::Crime_IgnoredWarning_FistsDrawn))
        .Then(UAIEventResponse_SwitchState(GameplayTag::AIState_Conflict_Combat, EPerceptionCharacterType::Instigator, true));
}

class UAIARM_Crime_FistsDrawn_Responses_ToWatchStrongerHostile : UAIAssessmentResponseModule
{
    default BlockIfHasAnyOwnedTags.AddTag(GameplayTag::AIState_Conflict_WatchHostile);
    default BlockIfHasAnyOwnedTags.AddTag(GameplayTag::AIState_Conflict_Warning_Threat);
    default BlockIfHasAnyOwnedTags.AddTag(GameplayTag::AIState_Conflict_Combat);
    default BlockIfHasAnyOwnedTags.AddTag(GameplayTag::Debuff_Fear);
    default BlockIfHasAnyOwnedTags.AddTag(GameplayTag::AIState_Conflict_Flee);
    default BlockIfHasAnyOwnedTags.AddTag(GameplayTag::AIState_Conflict_Disengage);

    // Fists - Instigator Stronger
    default Rules.Add(GameplayTag::Crime_FistsDrawn)
        .RequireTrue(
            Assessed::IsCrimeSeverityMedium |
            Assessed::InstigatorIsStrongerThanSelf
        )
        .RequireFalse(
            Assessed::IsAnyFriendlyEnforcerOrLeaderInvolved
        )
        .Then(UAIEventResponse_AddHostileModifier(EPerceptionCharacterType::Instigator))
        .Then(UAIEventResponse_AddUseFistsModifier(EPerceptionCharacterType::Instigator))
        .Then(UAIEventResponse_SwitchState(GameplayTag::AIState_Conflict_WatchHostile, EPerceptionCharacterType::Instigator, true));

    default Rules.Add(GameplayTag::Crime_FistsDrawn)
        .RequireTrue(
            Assessed::IsCrimeSeverityHigh |
            Assessed::InstigatorIsStrongerThanSelf
        )
        .RequireFalse(
            Assessed::IsAnyFriendlyEnforcerOrLeaderInvolved
        )
        .Then(UAIEventResponse_AddHostileModifier(EPerceptionCharacterType::Instigator))
        .Then(UAIEventResponse_AddUseFistsModifier(EPerceptionCharacterType::Instigator))
        .Then(UAIEventResponse_SwitchState(GameplayTag::AIState_Conflict_WatchHostile, EPerceptionCharacterType::Instigator, true));
    
    default Rules.Add(GameplayTag::Crime_FistsDrawn)
        .RequireTrue(
            Assessed::IsCrimeSeverityCritical |
            Assessed::InstigatorIsStrongerThanSelf
        )
        .RequireFalse(
            Assessed::IsAnyFriendlyEnforcerOrLeaderInvolved
        )
        .Then(UAIEventResponse_AddEnemyModifier(EPerceptionCharacterType::Instigator))
        .Then(UAIEventResponse_AddUseFistsModifier(EPerceptionCharacterType::Instigator))
        .Then(UAIEventResponse_VoiceReaction(GameplayTag::Sound_Voice_Reaction_Combat_Beaten_YesYes))
        // .Then(UAIEventResponse_ForgetAllCrimesOfType(EPerceptionCharacterType::Instigator, GameplayTag::Crime_IgnoredWarning))
        .Then(UAIEventResponse_SwitchState(GameplayTag::AIState_Conflict_WatchHostile, EPerceptionCharacterType::SensedCharacter));
}

class UAIARM_Crime_FistsDrawn_Responses_InCombat : UAIAssessmentResponseModule
{
    default RequiredOwnedTags.AddTag(GameplayTag::AIState_Conflict_Combat);

    // Fists
    default Rules.Add(GameplayTag::Crime_FistsDrawn)
        .RequireTrue(
            Assessed::IsCrimeSeverityMedium
        )
        .Then(UAIEventResponse_AddHostileModifier(EPerceptionCharacterType::Instigator))
        .Then(UAIEventResponse_AddUseFistsModifier(EPerceptionCharacterType::Instigator));

    default Rules.Add(GameplayTag::Crime_FistsDrawn)
        .RequireTrue(
            Assessed::IsCrimeSeverityHigh
        )
        .Then(UAIEventResponse_AddHostileModifier(EPerceptionCharacterType::Instigator))
        .Then(UAIEventResponse_AddUseFistsModifier(EPerceptionCharacterType::Instigator));
    
    default Rules.Add(GameplayTag::Crime_FistsDrawn)
        .RequireTrue(
            Assessed::IsCrimeSeverityCritical
        )
        .Then(UAIEventResponse_AddEnemyModifier(EPerceptionCharacterType::Instigator))
        .Then(UAIEventResponse_AddUseFistsModifier(EPerceptionCharacterType::Instigator));
}

class UAIARM_Crime_IgnoredWarning_WeaponDrawn_Responses : UAIAssessmentResponseModule
{
    default RequiredOwnedTags.AddTag(GameplayTag::AIState_Conflict_Warning_Threat);

    default Rules.Add(GameplayTag::AIEvent_Threat_AllWarningsDone)
        .RequireTrue(
            Assessed::IsSelfStateGroupLeader
        )
        .RequireFalse(
            Assessed::IsTrainingFight
        )
        .Then(UAIEventResponse_AddEnemyModifier(EPerceptionCharacterType::Instigator))
        .Then(UAIEventResponse_VoiceReaction(GameplayTag::Sound_Voice_Reaction_Combat_Start, EPerceptionCharacterType::Instigator)
            .AddContextTagToTarget(GameplayTag::VoicelineContext_AskedForIt))
        .Then(UAIEventResponse_SwitchState(GameplayTag::AIState_Conflict_Combat, EPerceptionCharacterType::Instigator));
    
    default Rules.Add(GameplayTag::AIEvent_Threat_AllWarningsDone)
        .RequireFalse(
            Assessed::IsSelfStateGroupLeader |
            Assessed::IsTrainingFight
        )
        .Then(UAIEventResponse_AddEnemyModifier(EPerceptionCharacterType::Instigator))
        .Then(UAIEventResponse_SwitchState(GameplayTag::AIState_Conflict_Combat, EPerceptionCharacterType::Instigator));

    default Rules.Add(GameplayTag::Crime_ThreateningWeaponTooClose)
        .RequireTrue(
            Assessed::IsCrimeSeverityCritical
        )
        .Then(UAIEventResponse_AddEnemyModifier(EPerceptionCharacterType::Instigator))
        .Then(UAIEventResponse_VoiceReaction(GameplayTag::Sound_Voice_Reaction_Combat_Start, EPerceptionCharacterType::Instigator)
            .AddContextTagToTarget(GameplayTag::VoicelineContext_AskedForIt))
        // .Then(UAIEventResponse_ForgetAllCrimesOfType(EPerceptionCharacterType::Instigator, GameplayTag::Crime_IgnoredWarning_WeaponDrawn))
        // .Then(UAIEventResponse_ForgetAllCrimesOfType(EPerceptionCharacterType::Instigator, GameplayTag::Crime_ThreateningWeaponTooClose))
        .Then(UAIEventResponse_SwitchState(GameplayTag::AIState_Conflict_Combat, EPerceptionCharacterType::Instigator));
}

class UAIARM_Crime_IgnoredWarning_FistsDrawn_Responses : UAIAssessmentResponseModule
{
    default RequiredOwnedTags.AddTag(GameplayTag::AIState_Conflict_Warning_Threat);

    // Fists
    default Rules.Add(GameplayTag::AIEvent_Threat_AllWarningsDone)
        .RequireTrue(
            Assessed::IsSelfStateGroupLeader |
            Assessed::InstigatorIsWithFists
        )
        .RequireFalse(
            Assessed::IsTrainingFight
        )
        .Then(UAIEventResponse_AddUseFistsModifier(EPerceptionCharacterType::Instigator))
        .Then(UAIEventResponse_AddEnemyModifier(EPerceptionCharacterType::Instigator))
        .Then(UAIEventResponse_VoiceReaction(GameplayTag::Sound_Voice_Reaction_Combat_Start, EPerceptionCharacterType::Instigator)
            .AddContextTagToTarget(GameplayTag::VoicelineContext_AskedForIt))
        .Then(UAIEventResponse_SwitchState(GameplayTag::AIState_Conflict_Combat, EPerceptionCharacterType::Instigator));
    
    default Rules.Add(GameplayTag::AIEvent_Threat_AllWarningsDone)
        .RequireTrue(
            Assessed::InstigatorIsWithFists
        )
        .RequireFalse(
            Assessed::IsSelfStateGroupLeader |
            Assessed::IsTrainingFight
        )
        .Then(UAIEventResponse_AddUseFistsModifier(EPerceptionCharacterType::Instigator))
        .Then(UAIEventResponse_AddEnemyModifier(EPerceptionCharacterType::Instigator))
        .Then(UAIEventResponse_SwitchState(GameplayTag::AIState_Conflict_Combat, EPerceptionCharacterType::Instigator));

    default Rules.Add(GameplayTag::Crime_FistsTooClose)
        .RequireTrue(
            Assessed::IsCrimeSeverityCritical
        )
        .Then(UAIEventResponse_AddEnemyModifier(EPerceptionCharacterType::Instigator))
        .Then(UAIEventResponse_AddUseFistsModifier(EPerceptionCharacterType::Instigator))
        .Then(UAIEventResponse_VoiceReaction(GameplayTag::Sound_Voice_Reaction_Combat_Start, EPerceptionCharacterType::Instigator)
            .AddContextTagToTarget(GameplayTag::VoicelineContext_AskedForIt))
        // .Then(UAIEventResponse_ForgetAllCrimesOfType(EPerceptionCharacterType::Instigator, GameplayTag::Crime_IgnoredWarning_FistsDrawn))
        // .Then(UAIEventResponse_ForgetAllCrimesOfType(EPerceptionCharacterType::Instigator, GameplayTag::Crime_FistsTooClose))
        .Then(UAIEventResponse_SwitchState(GameplayTag::AIState_Conflict_Combat, EPerceptionCharacterType::Instigator));
}

class UAIARM_Crime_FistsOrWeaponDrawn_WarningEnd : UAIAssessmentResponseModule
{
    default RequiredOwnedTags.AddTag(GameplayTag::AIState_Conflict_Warning_Threat);

    default Rules.Add(GameplayTag::AIEvent_Sensed_NoEnemiesNoHostiles)
        .RequireFalse(
            Assessed::AtLeastOneHostileHasDrawnNonFistWeapon |
            Assessed::AllHostileWeaponsAreFists
        )
        .Then(UAIEventResponse_VoiceReaction(GameplayTag::Sound_Voice_Reaction_Crime_WiseMove_WeaponDown, EPerceptionCharacterType::None)
            .AddContextTagToTarget(GameplayTag::VoicelineContext_Weapon));

    default Rules.Add(GameplayTag::AIEvent_Sensed_NoEnemiesNoHostiles)
            .Then(UAIEventResponse_SwitchState(GameplayTag::AIState_AssessGoToDailyRoutine, EPerceptionCharacterType::None));
}