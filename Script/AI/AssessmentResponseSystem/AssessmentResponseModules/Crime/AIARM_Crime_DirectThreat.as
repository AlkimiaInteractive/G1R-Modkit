class UAIARM_Crime_Human_DirectThreat : UAIAssessmentResponseModule
{
    default SubModules.Add(UAIARM_Crime_DirectThreat_Weapon_Perception);
    default SubModules.Add(UAIARM_Crime_DirectThreat_Fists_Perception);
    default SubModules.Add(UAIARM_Crime_DirectThreat_Responses);
}

class UAIARM_Crime_Orc_DirectThreat : UAIAssessmentResponseModule
{
    default SubModules.Add(UAIARM_Crime_DirectThreat_Weapon_Perception);
    default SubModules.Add(UAIARM_Crime_DirectThreat_Fists_Perception);
    default SubModules.Add(UAIARM_Crime_DirectThreat_Responses);
}

///// PERCEPTION-CRIME BINDINGS
class UAIARM_Crime_DirectThreat_Weapon_Perception : UAIAssessmentResponseModule
{
    default BlockIfHasAnyOwnedTags.AddTag(GameplayTag::AIState_Conflict_Warning_Threat);
    default BlockIfHasAnyOwnedTags.AddTag(GameplayTag::AIState_Conflict_TurnToAttacker);
    default BlockIfHasAnyOwnedTags.AddTag(GameplayTag::AIState_Conflict_WatchFight);
    default BlockIfHasAnyOwnedTags.AddTag(GameplayTag::AIState_DailyRoutine_WatchFight);
    default BlockIfHasAnyOwnedTags.AddTag(GameplayTag::AIState_Conflict_WatchHostile);
    default BlockIfHasAnyOwnedTags.AddTag(GameplayTag::State_Conversation);
    default BlockIfHasAnyOwnedTags.AddTag(GameplayTag::State_Defeated);

    default BlockIfAssessedHasAnyOwnedTags.AddTag(GameplayTag::State_Defeated);
    default BlockIfAssessedHasAnyOwnedTags.AddTag(GameplayTag::State_Conversation);
    default BlockIfAssessedHasAnyOwnedTags.AddTag(GameplayTag::State_Perceptions_GetIgnored);

    default RequireNotPursueCrimesOnAssessedCharacter.AddTag(GameplayTag::Crime_ThreateningWeaponDrawn);

    default SubModules.Add(UAIARM_Crime_DirectThreat_Weapon_Perception_Melee);
    default SubModules.Add(UAIARM_Crime_DirectThreat_Weapon_Perception_Ranged);
    default SubModules.Add(UAIARM_Crime_DirectThreat_Weapon_Perception_Magic_HighThreat);
    default SubModules.Add(UAIARM_Crime_DirectThreat_Weapon_Perception_Magic_LowThreat);
}

class UAIARM_Crime_DirectThreat_Weapon_Perception_Melee : UAIAssessmentResponseModule
{
    default RequirePursueCrimesOnAssessedCharacter.AddTag(GameplayTag::Crime_DirectThreat_Weapon_Melee);

    default Rules.Add(GameplayTag::AIEvent_Seen_DirectThreat_Weapon_Melee)
        .RequireTrue(
            Assessed::IsThreatening |
            Assessed::HasSensedDrawnThreateningWeapon
        )
        .RequireFalse(
            Assessed::IsInPartyWithSensedCharacter |
            Assessed::SensedIsSelfSummoner |
            Assessed::IsSensedDrawingOrUndrawingWeapon |
            Assessed::SensedWasEnemy |
            Assessed::SensedIsTrainingWithTheirTarget |
            Assessed::SensedOrInstigatorIsBeingWarned |
            Assessed::IsPettyFight |
            Assessed::IsTrainingFight
        )
        .Then(UAIEventResponse_AssessCrime(
            GameplayTag::Crime_DirectThreat_Weapon_Melee,
            EPerceptionCharacterType::SensedCharacter, 
            EPerceptionCharacterType::AffectedCharacter));
    
    // default Rules.Add(GameplayTag::AIEvent_Seen_UndrawWeapon)
    //     .Then(UAIEventResponse_ForgiveAllCrimesOfType(EPerceptionCharacterType::SensedCharacter, GameplayTag::Crime_DirectThreat_Weapon_Melee))
    //     .Then(UAIEventResponse_UpdateCrimeSeverityTowardsPlayer());
}

class UAIARM_Crime_DirectThreat_Weapon_Perception_Ranged : UAIAssessmentResponseModule
{
    default RequirePursueCrimesOnAssessedCharacter.AddTag(GameplayTag::Crime_DirectThreat_Weapon_Ranged);

    default Rules.Add(GameplayTag::AIEvent_Seen_DirectThreat_Weapon_Ranged)
        .RequireTrue(
            Assessed::IsThreatening |
            Assessed::HasSensedDrawnThreateningWeapon
        )
        .RequireFalse(
            Assessed::IsInPartyWithSensedCharacter |
            Assessed::SensedIsSelfSummoner |
            Assessed::IsSensedDrawingOrUndrawingWeapon |
            Assessed::SensedWasEnemy |
            Assessed::SensedIsTrainingWithTheirTarget |
            Assessed::SensedOrInstigatorIsBeingWarned |
            Assessed::IsPettyFight |
            Assessed::IsTrainingFight
        )
        .Then(UAIEventResponse_AssessCrime(
            GameplayTag::Crime_DirectThreat_Weapon_Ranged,
            EPerceptionCharacterType::SensedCharacter, 
            EPerceptionCharacterType::AffectedCharacter));
    
    // default Rules.Add(GameplayTag::AIEvent_Seen_UndrawWeapon)
    //     .Then(UAIEventResponse_ForgiveAllCrimesOfType(EPerceptionCharacterType::SensedCharacter, GameplayTag::Crime_DirectThreat_Weapon_Ranged))
    //     .Then(UAIEventResponse_UpdateCrimeSeverityTowardsPlayer());
}

class UAIARM_Crime_DirectThreat_Weapon_Perception_Magic_HighThreat : UAIAssessmentResponseModule
{
    default RequirePursueCrimesOnAssessedCharacter.AddTag(GameplayTag::Crime_DirectThreat_Weapon_Magic_HighThreat);

    default Rules.Add(GameplayTag::AIEvent_Seen_DirectThreat_Weapon_Magic_HighThreat)
        .RequireTrue(
            Assessed::IsThreatening |
            Assessed::HasSensedDrawnThreateningWeapon
        )
        .RequireFalse(
            Assessed::IsInPartyWithSensedCharacter |
            Assessed::SensedIsSelfSummoner |
            Assessed::IsSensedDrawingOrUndrawingWeapon |
            Assessed::SensedWasEnemy |
            Assessed::SensedIsTrainingWithTheirTarget |
            Assessed::SensedOrInstigatorIsBeingWarned |
            Assessed::IsPettyFight |
            Assessed::IsTrainingFight
        )
        .Then(UAIEventResponse_AssessCrime(
            GameplayTag::Crime_DirectThreat_Weapon_Magic_HighThreat,
            EPerceptionCharacterType::SensedCharacter, 
            EPerceptionCharacterType::AffectedCharacter));
    
    // default Rules.Add(GameplayTag::AIEvent_Seen_UndrawWeapon)
    //     .Then(UAIEventResponse_ForgiveAllCrimesOfType(EPerceptionCharacterType::SensedCharacter, GameplayTag::Crime_DirectThreat_Weapon_Magic_HighThreat))
    //     .Then(UAIEventResponse_UpdateCrimeSeverityTowardsPlayer());
}

class UAIARM_Crime_DirectThreat_Weapon_Perception_Magic_LowThreat : UAIAssessmentResponseModule
{
    default RequirePursueCrimesOnAssessedCharacter.AddTag(GameplayTag::Crime_DirectThreat_Weapon_Magic_LowThreat);

    default Rules.Add(GameplayTag::AIEvent_Seen_DirectThreat_Weapon_Magic_LowThreat)
        .RequireTrue(
            Assessed::IsThreatening |
            Assessed::HasSensedDrawnThreateningWeapon
        )
        .RequireFalse(
            Assessed::IsInPartyWithSensedCharacter |
            Assessed::SensedIsSelfSummoner |
            Assessed::IsSensedDrawingOrUndrawingWeapon |
            Assessed::SensedWasEnemy |
            Assessed::SensedIsTrainingWithTheirTarget |
            Assessed::SensedOrInstigatorIsBeingWarned |
            Assessed::IsPettyFight |
            Assessed::IsTrainingFight
        )
        .Then(UAIEventResponse_AssessCrime(
            GameplayTag::Crime_DirectThreat_Weapon_Magic_LowThreat,
            EPerceptionCharacterType::SensedCharacter, 
            EPerceptionCharacterType::AffectedCharacter));
        
    // default Rules.Add(GameplayTag::AIEvent_Seen_UndrawWeapon)
    //     .Then(UAIEventResponse_ForgiveAllCrimesOfType(EPerceptionCharacterType::SensedCharacter, GameplayTag::Crime_DirectThreat_Weapon_Magic_LowThreat))
    //     .Then(UAIEventResponse_UpdateCrimeSeverityTowardsPlayer());
}

class UAIARM_Crime_DirectThreat_Fists_Perception : UAIAssessmentResponseModule
{
    default BlockIfHasAnyOwnedTags.AddTag(GameplayTag::AIState_Conflict_Warning_Threat);
    default BlockIfHasAnyOwnedTags.AddTag(GameplayTag::AIState_Conflict_TurnToAttacker);
    default BlockIfHasAnyOwnedTags.AddTag(GameplayTag::AIState_Conflict_WatchFight);
    default BlockIfHasAnyOwnedTags.AddTag(GameplayTag::AIState_Conflict_WatchHostile);
    default BlockIfHasAnyOwnedTags.AddTag(GameplayTag::State_Conversation);
    default BlockIfHasAnyOwnedTags.AddTag(GameplayTag::State_Defeated);

    default BlockIfAssessedHasAnyOwnedTags.AddTag(GameplayTag::State_Defeated);
    default BlockIfAssessedHasAnyOwnedTags.AddTag(GameplayTag::State_Conversation);
    default BlockIfAssessedHasAnyOwnedTags.AddTag(GameplayTag::State_Perceptions_GetIgnored);

    default RequirePursueCrimesOnAssessedCharacter.AddTag(GameplayTag::Crime_DirectThreat_Fists);
    default RequireNotPursueCrimesOnAssessedCharacter.AddTag(GameplayTag::Crime_FistsDrawn);

    default Rules.Add(GameplayTag::AIEvent_Seen_DirectThreat_Fists)
        .RequireTrue(
            Assessed::IsThreatening |
            Assessed::HasSensedDrawnThreateningWeapon
        )
        .RequireFalse(
            Assessed::IsInPartyWithSensedCharacter |
            Assessed::SensedIsSelfSummoner |
            Assessed::IsSensedDrawingOrUndrawingWeapon |
            Assessed::SensedWasEnemy |
            Assessed::SensedIsTrainingWithTheirTarget |
            Assessed::SensedOrInstigatorIsBeingWarned |
            Assessed::IsPettyFight |
            Assessed::IsTrainingFight
        )
        .Then(UAIEventResponse_AssessCrime(
            GameplayTag::Crime_DirectThreat_Fists,
            EPerceptionCharacterType::SensedCharacter, 
            EPerceptionCharacterType::AffectedCharacter));
}

class UAIARM_Crime_DirectThreat_Responses : UAIAssessmentResponseModule
{
    default SubModules.Add(UAIARM_Crime_DirectThreat_Responses_ToWarningOrCombat);
    default SubModules.Add(UAIARM_Crime_DirectThreat_Responses_ToWatchStrongerHostile);
    default SubModules.Add(UAIARM_Crime_DirectThreat_Responses_InCombat);
}

///// RESPONSE RULES CONFIGURATIONS
class UAIARM_Crime_DirectThreat_Responses_ToWarningOrCombat : UAIAssessmentResponseModule
{
    default BlockIfHasAnyOwnedTags.AddTag(GameplayTag::AIState_Conflict_WatchHostile);
    default BlockIfHasAnyOwnedTags.AddTag(GameplayTag::AIState_Conflict_Warning);
    default BlockIfHasAnyOwnedTags.AddTag(GameplayTag::AIState_Conflict_Combat);
    default BlockIfHasAnyOwnedTags.AddTag(GameplayTag::Debuff_Fear);
    default BlockIfHasAnyOwnedTags.AddTag(GameplayTag::AIState_Conflict_Flee);
    default BlockIfHasAnyOwnedTags.AddTag(GameplayTag::AIState_Conflict_Disengage);

    default SubModules.Add(UAIARM_Crime_DirectThreat_Responses_ToWarning_WeaponAndFists);
    default SubModules.Add(UAIARM_Crime_DirectThreat_Responses_ToWarning_WeaponOnly);

    default SubModules.Add(UAIARM_Crime_DirectThreat_Responses_ToCombat_WeaponAndFists);
    default SubModules.Add(UAIARM_Crime_DirectThreat_Responses_ToCombat_WeaponOnly);

    // default Rules.Add(GameplayTag::Crime_DirectThreat)
    //     .RequireTrue(
    //         Assessed::IsCrimeSeverityMinimal
    //     )
    //     // .Then(UAIEventResponse_ForgetLastCrimeOfType(EPerceptionCharacterType::Instigator, GameplayTag::Crime_DirectThreat));
    //     // .Then(UAIEventResponse_VoiceReaction(GameplayTag::Sound_Voice_Reaction_Wea)); TODO Reaction

    default Rules.Add(GameplayTag::Crime_DirectThreat)
        .RequireTrue(
            Assessed::IsCrimeSeverityLow
        )
        .Then(UAIEventResponse_ForgiveLastCrimeOfTypeRelevantToSelf(EPerceptionCharacterType::Instigator, GameplayTag::Crime_DirectThreat));
}

class UAIARM_Crime_DirectThreat_Responses_ToWarning_WeaponAndFists : UAIAssessmentResponseModule
{
    default BlockIfHasAnyOwnedTags.AddTag(GameplayTag::Role_Guard);
    default BlockIfHasAnyOwnedTags.AddTag(GameplayTag::Role_BodyGuard);

    default SubModules.Add(UAIARM_Crime_DirectThreat_Responses_ToWarning_WeaponAndFists_Enforcer);
    default SubModules.Add(UAIARM_Crime_DirectThreat_Responses_ToWarning_WeaponAndFists_NotEnforcer);
    
    // WEAPON
    default Rules.Add(GameplayTag::Crime_DirectThreat_Weapon)
        .RequireTrue(
            Assessed::IsCrimeSeverityMedium |
            Assessed::AffectedIsSelf
        )
        .RequireFalse(
            Assessed::InstigatorIsStrongerThanSelf
        )
        .Then(UAIEventResponse_AddHostileModifier(EPerceptionCharacterType::Instigator))
        .Then(UAIEventResponse_SwitchState(GameplayTag::AIState_Conflict_Warning_Threat, EPerceptionCharacterType::Instigator, true));

    default Rules.Add(GameplayTag::Crime_DirectThreat_Weapon)
        .RequireTrue(
            Assessed::IsCrimeSeverityHigh |
            Assessed::AffectedIsSelf
        )
        .RequireFalse(
            Assessed::InstigatorIsStrongerThanSelf
        )
        .Then(UAIEventResponse_AddHostileModifier(EPerceptionCharacterType::Instigator))
        .Then(UAIEventResponse_SwitchState(GameplayTag::AIState_Conflict_Warning_Threat, EPerceptionCharacterType::Instigator, true));

    // FISTS
    
    
    default Rules.Add(GameplayTag::Crime_DirectThreat_Fists)
        .RequireTrue(
            Assessed::IsCrimeSeverityMedium |
            Assessed::AffectedIsSelf
        )
        .RequireFalse(
            Assessed::InstigatorIsStrongerThanSelf
        )
        .Then(UAIEventResponse_AddHostileModifier(EPerceptionCharacterType::Instigator))
        .Then(UAIEventResponse_AddUseFistsModifier(EPerceptionCharacterType::Instigator))
        .Then(UAIEventResponse_SwitchState(GameplayTag::AIState_Conflict_Warning_Threat, EPerceptionCharacterType::Instigator, true));

    default Rules.Add(GameplayTag::Crime_DirectThreat_Fists)
        .RequireTrue(
            Assessed::IsCrimeSeverityHigh |
            Assessed::AffectedIsSelf
        )
        .RequireFalse(
            Assessed::InstigatorIsStrongerThanSelf
        )
        .Then(UAIEventResponse_AddHostileModifier(EPerceptionCharacterType::Instigator))
        .Then(UAIEventResponse_AddUseFistsModifier(EPerceptionCharacterType::Instigator))
        .Then(UAIEventResponse_SwitchState(GameplayTag::AIState_Conflict_Warning_Threat, EPerceptionCharacterType::Instigator, true));
}

class UAIARM_Crime_DirectThreat_Responses_ToWarning_WeaponAndFists_Enforcer : UAIAssessmentResponseModule
{
    default RequireAnyOwnedTags.AddTag(GameplayTag::CampRole_Guard);
    default RequireAnyOwnedTags.AddTag(GameplayTag::CampRole_Leadership);
    default RequireAnyOwnedTags.AddTag(GameplayTag::CampRole_Boss);

    // WEAPON
    default Rules.Add(GameplayTag::Crime_DirectThreat_Weapon)
        .RequireTrue(
            Assessed::IsCrimeSeverityMedium
        )
        .RequireFalse(
            Assessed::InstigatorIsStrongerThanSelf
        )
        .Then(UAIEventResponse_AddHostileModifier(EPerceptionCharacterType::Instigator))
        .Then(UAIEventResponse_SwitchState(GameplayTag::AIState_Conflict_Warning_Threat, EPerceptionCharacterType::Instigator, true));

    default Rules.Add(GameplayTag::Crime_DirectThreat_Weapon)
        .RequireTrue(
            Assessed::IsCrimeSeverityHigh
        )
        .RequireFalse(
            Assessed::InstigatorIsStrongerThanSelf
        )
        .Then(UAIEventResponse_AddHostileModifier(EPerceptionCharacterType::Instigator))
        .Then(UAIEventResponse_SwitchState(GameplayTag::AIState_Conflict_Warning_Threat, EPerceptionCharacterType::Instigator, true));

    // FISTS
    default Rules.Add(GameplayTag::Crime_DirectThreat_Fists)
        .RequireTrue(
            Assessed::IsCrimeSeverityMedium
        )
        .RequireFalse(
            Assessed::InstigatorIsStrongerThanSelf
        )
        .Then(UAIEventResponse_AddHostileModifier(EPerceptionCharacterType::Instigator))
        .Then(UAIEventResponse_AddUseFistsModifier(EPerceptionCharacterType::Instigator))
        .Then(UAIEventResponse_SwitchState(GameplayTag::AIState_Conflict_Warning_Threat, EPerceptionCharacterType::Instigator, true));

    default Rules.Add(GameplayTag::Crime_DirectThreat_Fists)
        .RequireTrue(
            Assessed::IsCrimeSeverityHigh
        )
        .RequireFalse(
            Assessed::InstigatorIsStrongerThanSelf
        )
        .Then(UAIEventResponse_AddHostileModifier(EPerceptionCharacterType::Instigator))
        .Then(UAIEventResponse_AddUseFistsModifier(EPerceptionCharacterType::Instigator))
        .Then(UAIEventResponse_SwitchState(GameplayTag::AIState_Conflict_Warning_Threat, EPerceptionCharacterType::Instigator, true));
}

class UAIARM_Crime_DirectThreat_Responses_ToWarning_WeaponAndFists_NotEnforcer : UAIAssessmentResponseModule
{
    default BlockIfHasAnyOwnedTags.AddTag(GameplayTag::CampRole_Guard);
    default BlockIfHasAnyOwnedTags.AddTag(GameplayTag::CampRole_Leadership);
    default BlockIfHasAnyOwnedTags.AddTag(GameplayTag::CampRole_Boss);

    // WEAPON
    default Rules.Add(GameplayTag::Crime_DirectThreat_Weapon)
        .RequireTrue(
            Assessed::IsCrimeSeverityMedium
        )
        .RequireFalse(
            Assessed::InstigatorIsStrongerThanSelf |
            Assessed::IsAnyFriendlyEnforcerOrLeaderInvolved
        )
        .Then(UAIEventResponse_AddHostileModifier(EPerceptionCharacterType::Instigator))
        .Then(UAIEventResponse_SwitchState(GameplayTag::AIState_Conflict_Warning_Threat, EPerceptionCharacterType::Instigator, true));

    default Rules.Add(GameplayTag::Crime_DirectThreat_Weapon)
        .RequireTrue(
            Assessed::IsCrimeSeverityHigh
        )
        .RequireFalse(
            Assessed::InstigatorIsStrongerThanSelf |
            Assessed::IsAnyFriendlyEnforcerOrLeaderInvolved
        )
        .Then(UAIEventResponse_AddHostileModifier(EPerceptionCharacterType::Instigator))
        .Then(UAIEventResponse_SwitchState(GameplayTag::AIState_Conflict_Warning_Threat, EPerceptionCharacterType::Instigator, true));

    // FISTS
    default Rules.Add(GameplayTag::Crime_DirectThreat_Fists)
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

    default Rules.Add(GameplayTag::Crime_DirectThreat_Fists)
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
}

class UAIARM_Crime_DirectThreat_Responses_ToWarning_WeaponOnly : UAIAssessmentResponseModule
{
    default RequireAnyOwnedTags.AddTag(GameplayTag::Role_Guard);
    default RequireAnyOwnedTags.AddTag(GameplayTag::Role_BodyGuard);

    default SubModules.Add(UAIARM_Crime_DirectThreat_Responses_ToWarning_WeaponOnly_Enforcer);
    default SubModules.Add(UAIARM_Crime_DirectThreat_Responses_ToWarning_WeaponOnly_NotEnforcer);

    // WEAPON    
    default Rules.Add(GameplayTag::Crime_DirectThreat)
        .RequireTrue(
            Assessed::IsCrimeSeverityMedium |
            Assessed::AffectedIsSelf
        )
        .RequireFalse(
            Assessed::InstigatorIsStrongerThanSelf
        )
        .Then(UAIEventResponse_AddHostileModifier(EPerceptionCharacterType::Instigator))
        .Then(UAIEventResponse_SwitchState(GameplayTag::AIState_Conflict_Warning_Threat, EPerceptionCharacterType::Instigator, true));

    default Rules.Add(GameplayTag::Crime_DirectThreat)
        .RequireTrue(
            Assessed::IsCrimeSeverityHigh |
            Assessed::AffectedIsSelf
        )
        .RequireFalse(
            Assessed::InstigatorIsStrongerThanSelf
        )
        .Then(UAIEventResponse_AddHostileModifier(EPerceptionCharacterType::Instigator))
        .Then(UAIEventResponse_SwitchState(GameplayTag::AIState_Conflict_Warning_Threat, EPerceptionCharacterType::Instigator, true));
}

class UAIARM_Crime_DirectThreat_Responses_ToWarning_WeaponOnly_Enforcer : UAIAssessmentResponseModule
{
    default RequireAnyOwnedTags.AddTag(GameplayTag::CampRole_Guard);
    default RequireAnyOwnedTags.AddTag(GameplayTag::CampRole_Leadership);
    default RequireAnyOwnedTags.AddTag(GameplayTag::CampRole_Boss);

    // WEAPON
    default Rules.Add(GameplayTag::Crime_DirectThreat)
        .RequireTrue(
            Assessed::IsCrimeSeverityMedium
        )
        .RequireFalse(
            Assessed::InstigatorIsStrongerThanSelf
        )
        .Then(UAIEventResponse_AddHostileModifier(EPerceptionCharacterType::Instigator))
        .Then(UAIEventResponse_SwitchState(GameplayTag::AIState_Conflict_Warning_Threat, EPerceptionCharacterType::Instigator, true));

    default Rules.Add(GameplayTag::Crime_DirectThreat)
        .RequireTrue(
            Assessed::IsCrimeSeverityHigh
        )
        .RequireFalse(
            Assessed::InstigatorIsStrongerThanSelf
        )
        .Then(UAIEventResponse_AddHostileModifier(EPerceptionCharacterType::Instigator))
        .Then(UAIEventResponse_SwitchState(GameplayTag::AIState_Conflict_Warning_Threat, EPerceptionCharacterType::Instigator, true));
}

class UAIARM_Crime_DirectThreat_Responses_ToWarning_WeaponOnly_NotEnforcer : UAIAssessmentResponseModule
{
    default BlockIfHasAnyOwnedTags.AddTag(GameplayTag::CampRole_Guard);
    default BlockIfHasAnyOwnedTags.AddTag(GameplayTag::CampRole_Leadership);
    default BlockIfHasAnyOwnedTags.AddTag(GameplayTag::CampRole_Boss);

    // WEAPON
    default Rules.Add(GameplayTag::Crime_DirectThreat)
        .RequireTrue(
            Assessed::IsCrimeSeverityMedium
        )
        .RequireFalse(
            Assessed::InstigatorIsStrongerThanSelf |
            Assessed::IsAnyFriendlyEnforcerOrLeaderInvolved
        )
        .Then(UAIEventResponse_AddHostileModifier(EPerceptionCharacterType::Instigator))
        .Then(UAIEventResponse_SwitchState(GameplayTag::AIState_Conflict_Warning_Threat, EPerceptionCharacterType::Instigator, true));

    default Rules.Add(GameplayTag::Crime_DirectThreat)
        .RequireTrue(
            Assessed::IsCrimeSeverityHigh
        )
        .RequireFalse(
            Assessed::InstigatorIsStrongerThanSelf |
            Assessed::IsAnyFriendlyEnforcerOrLeaderInvolved
        )
        .Then(UAIEventResponse_AddHostileModifier(EPerceptionCharacterType::Instigator))
        .Then(UAIEventResponse_SwitchState(GameplayTag::AIState_Conflict_Warning_Threat, EPerceptionCharacterType::Instigator, true));
}

class UAIARM_Crime_DirectThreat_Responses_ToCombat_WeaponAndFists : UAIAssessmentResponseModule
{
    default BlockIfHasAnyOwnedTags.AddTag(GameplayTag::Role_Guard);
    default BlockIfHasAnyOwnedTags.AddTag(GameplayTag::Role_BodyGuard);

    default SubModules.Add(UAIARM_Crime_DirectThreat_Responses_ToCombat_WeaponAndFists_Enforcer);
    default SubModules.Add(UAIARM_Crime_DirectThreat_Responses_ToCombat_WeaponAndFists_NotEnforcer);

    // Not forgiven before
    // WEAPON   
    default Rules.Add(GameplayTag::Crime_DirectThreat_Weapon)
        .RequireTrue(
            Assessed::IsCrimeSeverityCritical |
            Assessed::AffectedIsSelf
        )
        .RequireFalse(
            Assessed::InstigatorIsStrongerThanSelf |
            Assessed::InstigatorWasCombatForgivenBefore
        )
        .Then(UAIEventResponse_AddEnemyModifier(EPerceptionCharacterType::Instigator))
        .Then(UAIEventResponse_VoiceReaction(GameplayTag::Sound_Voice_Reaction_Combat_Start, EPerceptionCharacterType::Instigator))
        .Then(UAIEventResponse_SwitchState(GameplayTag::AIState_Conflict_Combat, EPerceptionCharacterType::Instigator, true));

    // Forgiven before
    // WEAPON    
    default Rules.Add(GameplayTag::Crime_DirectThreat_Weapon)
        .RequireTrue(
            Assessed::IsCrimeSeverityCritical |
            Assessed::InstigatorWasCombatForgivenBefore |
            Assessed::AffectedIsSelf
        )
        .RequireFalse(
            Assessed::InstigatorIsStrongerThanSelf
        )
        .Then(UAIEventResponse_AddEnemyModifier(EPerceptionCharacterType::Instigator))
        .Then(UAIEventResponse_VoiceReaction(GameplayTag::Sound_Voice_Reaction_Combat_Start, EPerceptionCharacterType::Instigator)
            .AddContextTagToTarget(GameplayTag::VoicelineContext_NotHadEnough))
        .Then(UAIEventResponse_SwitchState(GameplayTag::AIState_Conflict_Combat, EPerceptionCharacterType::Instigator, true));

    // Not forgiven before
    // FISTS    
    default Rules.Add(GameplayTag::Crime_DirectThreat_Fists)
        .RequireTrue(
            Assessed::IsCrimeSeverityCritical |
            Assessed::AffectedIsSelf
        )
        .RequireFalse(
            Assessed::InstigatorIsStrongerThanSelf |
            Assessed::InstigatorWasCombatForgivenBefore
        )
        .Then(UAIEventResponse_AddEnemyModifier(EPerceptionCharacterType::Instigator))
        .Then(UAIEventResponse_AddUseFistsModifier(EPerceptionCharacterType::Instigator))
        .Then(UAIEventResponse_VoiceReaction(GameplayTag::Sound_Voice_Reaction_Combat_Start, EPerceptionCharacterType::Instigator))
        .Then(UAIEventResponse_SwitchState(GameplayTag::AIState_Conflict_Combat, EPerceptionCharacterType::Instigator, true));

    // Forgiven before
    // FISTS    
    default Rules.Add(GameplayTag::Crime_DirectThreat_Fists)
        .RequireTrue(
            Assessed::IsCrimeSeverityCritical |
            Assessed::InstigatorWasCombatForgivenBefore |
            Assessed::AffectedIsSelf
        )
        .RequireFalse(
            Assessed::InstigatorIsStrongerThanSelf
        )
        .Then(UAIEventResponse_AddEnemyModifier(EPerceptionCharacterType::Instigator))
        .Then(UAIEventResponse_AddUseFistsModifier(EPerceptionCharacterType::Instigator))
        .Then(UAIEventResponse_VoiceReaction(GameplayTag::Sound_Voice_Reaction_Combat_Start, EPerceptionCharacterType::Instigator))
        .Then(UAIEventResponse_SwitchState(GameplayTag::AIState_Conflict_Combat, EPerceptionCharacterType::Instigator, true));
}

class UAIARM_Crime_DirectThreat_Responses_ToCombat_WeaponAndFists_Enforcer : UAIAssessmentResponseModule
{
    default RequireAnyOwnedTags.AddTag(GameplayTag::CampRole_Guard);
    default RequireAnyOwnedTags.AddTag(GameplayTag::CampRole_Leadership);
    default RequireAnyOwnedTags.AddTag(GameplayTag::CampRole_Boss);

    // Not forgiven before
    // WEAPON
    default Rules.Add(GameplayTag::Crime_DirectThreat_Weapon)
        .RequireTrue(
            Assessed::IsCrimeSeverityCritical
        )
        .RequireFalse(
            Assessed::InstigatorIsStrongerThanSelf |
            Assessed::InstigatorWasCombatForgivenBefore
        )
        .Then(UAIEventResponse_AddEnemyModifier(EPerceptionCharacterType::Instigator))
        .Then(UAIEventResponse_VoiceReaction(GameplayTag::Sound_Voice_Reaction_Combat_Start, EPerceptionCharacterType::Instigator))
        .Then(UAIEventResponse_SwitchState(GameplayTag::AIState_Conflict_Combat, EPerceptionCharacterType::Instigator, true));
    
    // Forgiven before
    // WEAPON
    default Rules.Add(GameplayTag::Crime_DirectThreat_Weapon)
        .RequireTrue(
            Assessed::IsCrimeSeverityCritical |
            Assessed::InstigatorWasCombatForgivenBefore
        )
        .RequireFalse(
            Assessed::InstigatorIsStrongerThanSelf
        )
        .Then(UAIEventResponse_AddEnemyModifier(EPerceptionCharacterType::Instigator))
        .Then(UAIEventResponse_VoiceReaction(GameplayTag::Sound_Voice_Reaction_Combat_Start, EPerceptionCharacterType::Instigator)
            .AddContextTagToTarget(GameplayTag::VoicelineContext_NotHadEnough))
        .Then(UAIEventResponse_SwitchState(GameplayTag::AIState_Conflict_Combat, EPerceptionCharacterType::Instigator, true));
    
    // Not forgiven before
    // FISTS
    default Rules.Add(GameplayTag::Crime_DirectThreat_Fists)
        .RequireTrue(
            Assessed::IsCrimeSeverityCritical
        )
        .RequireFalse(
            Assessed::InstigatorIsStrongerThanSelf |
            Assessed::InstigatorWasCombatForgivenBefore
        )
        .Then(UAIEventResponse_AddEnemyModifier(EPerceptionCharacterType::Instigator))
        .Then(UAIEventResponse_AddUseFistsModifier(EPerceptionCharacterType::Instigator))
        .Then(UAIEventResponse_VoiceReaction(GameplayTag::Sound_Voice_Reaction_Combat_Start, EPerceptionCharacterType::Instigator))
        .Then(UAIEventResponse_SwitchState(GameplayTag::AIState_Conflict_Combat, EPerceptionCharacterType::Instigator, true));
    
    // Forgiven before
    // FISTS
    default Rules.Add(GameplayTag::Crime_DirectThreat_Fists)
        .RequireTrue(
            Assessed::IsCrimeSeverityCritical |
            Assessed::InstigatorWasCombatForgivenBefore
        )
        .RequireFalse(
            Assessed::InstigatorIsStrongerThanSelf
        )
        .Then(UAIEventResponse_AddEnemyModifier(EPerceptionCharacterType::Instigator))
        .Then(UAIEventResponse_AddUseFistsModifier(EPerceptionCharacterType::Instigator))
        .Then(UAIEventResponse_VoiceReaction(GameplayTag::Sound_Voice_Reaction_Combat_Start, EPerceptionCharacterType::Instigator))
        .Then(UAIEventResponse_SwitchState(GameplayTag::AIState_Conflict_Combat, EPerceptionCharacterType::Instigator, true));
}

class UAIARM_Crime_DirectThreat_Responses_ToCombat_WeaponAndFists_NotEnforcer : UAIAssessmentResponseModule
{
    default BlockIfHasAnyOwnedTags.AddTag(GameplayTag::CampRole_Guard);
    default BlockIfHasAnyOwnedTags.AddTag(GameplayTag::CampRole_Leadership);
    default BlockIfHasAnyOwnedTags.AddTag(GameplayTag::CampRole_Boss);

    // Not forgiven before
    // WEAPON
    default Rules.Add(GameplayTag::Crime_DirectThreat_Weapon)
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
        .Then(UAIEventResponse_SwitchState(GameplayTag::AIState_Conflict_Combat, EPerceptionCharacterType::Instigator, true));
    
    // Forgiven before
    // WEAPON
    default Rules.Add(GameplayTag::Crime_DirectThreat_Weapon)
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
        .Then(UAIEventResponse_SwitchState(GameplayTag::AIState_Conflict_Combat, EPerceptionCharacterType::Instigator, true));
    
    // Not forgiven before
    // FISTS
    default Rules.Add(GameplayTag::Crime_DirectThreat_Fists)
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
        .Then(UAIEventResponse_SwitchState(GameplayTag::AIState_Conflict_Combat, EPerceptionCharacterType::Instigator, true));
    
    // Forgiven before
    // FISTS
    default Rules.Add(GameplayTag::Crime_DirectThreat_Fists)
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
        .Then(UAIEventResponse_VoiceReaction(GameplayTag::Sound_Voice_Reaction_Combat_Start, EPerceptionCharacterType::Instigator))
        .Then(UAIEventResponse_SwitchState(GameplayTag::AIState_Conflict_Combat, EPerceptionCharacterType::Instigator, true));
}

class UAIARM_Crime_DirectThreat_Responses_ToCombat_WeaponOnly : UAIAssessmentResponseModule
{
    default RequireAnyOwnedTags.AddTag(GameplayTag::Role_Guard);
    default RequireAnyOwnedTags.AddTag(GameplayTag::Role_BodyGuard);

    default SubModules.Add(UAIARM_Crime_DirectThreat_Responses_ToCombat_WeaponOnly_Enforcer);
    default SubModules.Add(UAIARM_Crime_DirectThreat_Responses_ToCombat_WeaponOnly_NotEnforcer);

    // Not forgiven before
    // WEAPON    
    default Rules.Add(GameplayTag::Crime_DirectThreat)
        .RequireTrue(
            Assessed::IsCrimeSeverityCritical |
            Assessed::AffectedIsSelf
        )
        .RequireFalse(
            Assessed::InstigatorIsStrongerThanSelf |
            Assessed::InstigatorWasCombatForgivenBefore
        )
        .Then(UAIEventResponse_AddEnemyModifier(EPerceptionCharacterType::Instigator))
        .Then(UAIEventResponse_VoiceReaction(GameplayTag::Sound_Voice_Reaction_Combat_Start, EPerceptionCharacterType::Instigator))
        .Then(UAIEventResponse_SwitchState(GameplayTag::AIState_Conflict_Combat, EPerceptionCharacterType::Instigator, true));

    // Forgiven before
    // WEAPON
    default Rules.Add(GameplayTag::Crime_DirectThreat)
        .RequireTrue(
            Assessed::IsCrimeSeverityCritical |
            Assessed::InstigatorWasCombatForgivenBefore |
            Assessed::AffectedIsSelf
        )
        .RequireFalse(
            Assessed::InstigatorIsStrongerThanSelf
        )
        .Then(UAIEventResponse_AddEnemyModifier(EPerceptionCharacterType::Instigator))
        .Then(UAIEventResponse_VoiceReaction(GameplayTag::Sound_Voice_Reaction_Combat_Start, EPerceptionCharacterType::Instigator)
            .AddContextTagToTarget(GameplayTag::VoicelineContext_NotHadEnough))
        .Then(UAIEventResponse_SwitchState(GameplayTag::AIState_Conflict_Combat, EPerceptionCharacterType::Instigator, true));
}

class UAIARM_Crime_DirectThreat_Responses_ToCombat_WeaponOnly_Enforcer : UAIAssessmentResponseModule
{
    default RequireAnyOwnedTags.AddTag(GameplayTag::CampRole_Guard);
    default RequireAnyOwnedTags.AddTag(GameplayTag::CampRole_Leadership);
    default RequireAnyOwnedTags.AddTag(GameplayTag::CampRole_Boss);

    // Not forgiven before
    // WEAPON
    default Rules.Add(GameplayTag::Crime_DirectThreat)
        .RequireTrue(
            Assessed::IsCrimeSeverityCritical
        )
        .RequireFalse(
            Assessed::InstigatorIsStrongerThanSelf |
            Assessed::InstigatorWasCombatForgivenBefore
        )
        .Then(UAIEventResponse_AddEnemyModifier(EPerceptionCharacterType::Instigator))
        .Then(UAIEventResponse_VoiceReaction(GameplayTag::Sound_Voice_Reaction_Combat_Start, EPerceptionCharacterType::Instigator))
        .Then(UAIEventResponse_SwitchState(GameplayTag::AIState_Conflict_Combat, EPerceptionCharacterType::Instigator, true));

    // Forgiven before
    // WEAPON
    default Rules.Add(GameplayTag::Crime_DirectThreat)
        .RequireTrue(
            Assessed::IsCrimeSeverityCritical |
            Assessed::InstigatorWasCombatForgivenBefore
        )
        .RequireFalse(
            Assessed::InstigatorIsStrongerThanSelf
        )
        .Then(UAIEventResponse_AddEnemyModifier(EPerceptionCharacterType::Instigator))
        .Then(UAIEventResponse_VoiceReaction(GameplayTag::Sound_Voice_Reaction_Combat_Start, EPerceptionCharacterType::Instigator)
            .AddContextTagToTarget(GameplayTag::VoicelineContext_NotHadEnough))
        .Then(UAIEventResponse_SwitchState(GameplayTag::AIState_Conflict_Combat, EPerceptionCharacterType::Instigator, true));
}

class UAIARM_Crime_DirectThreat_Responses_ToCombat_WeaponOnly_NotEnforcer : UAIAssessmentResponseModule
{
    default BlockIfHasAnyOwnedTags.AddTag(GameplayTag::CampRole_Guard);
    default BlockIfHasAnyOwnedTags.AddTag(GameplayTag::CampRole_Leadership);
    default BlockIfHasAnyOwnedTags.AddTag(GameplayTag::CampRole_Boss);

    // Not forgiven before
    // WEAPON
    default Rules.Add(GameplayTag::Crime_DirectThreat)
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
        .Then(UAIEventResponse_SwitchState(GameplayTag::AIState_Conflict_Combat, EPerceptionCharacterType::Instigator, true));

    // Forgiven before
    // WEAPON
    default Rules.Add(GameplayTag::Crime_DirectThreat)
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
        .Then(UAIEventResponse_SwitchState(GameplayTag::AIState_Conflict_Combat, EPerceptionCharacterType::Instigator, true));
}

class UAIARM_Crime_DirectThreat_Responses_ToWatchStrongerHostile : UAIAssessmentResponseModule
{
    default BlockIfHasAnyOwnedTags.AddTag(GameplayTag::AIState_Conflict_WatchHostile);
    default BlockIfHasAnyOwnedTags.AddTag(GameplayTag::AIState_Conflict_Warning_Threat);
    default BlockIfHasAnyOwnedTags.AddTag(GameplayTag::AIState_Conflict_Combat);
    default BlockIfHasAnyOwnedTags.AddTag(GameplayTag::Debuff_Fear);
    default BlockIfHasAnyOwnedTags.AddTag(GameplayTag::AIState_Conflict_Flee);
    default BlockIfHasAnyOwnedTags.AddTag(GameplayTag::AIState_Conflict_Disengage);

    default SubModules.Add(UAIARM_Crime_DirectThreat_Responses_ToWatchStrongerHostile_NotEnforcer);

    // Threatening weapon - Instigator Stronger
    default Rules.Add(GameplayTag::Crime_DirectThreat_Weapon)
        .RequireTrue(
            Assessed::IsCrimeSeverityMedium |
            Assessed::InstigatorIsStrongerThanSelf
        )
        .Then(UAIEventResponse_AddHostileModifier(EPerceptionCharacterType::Instigator))
        .Then(UAIEventResponse_SwitchState(GameplayTag::AIState_Conflict_WatchHostile, EPerceptionCharacterType::Instigator, true));

    default Rules.Add(GameplayTag::Crime_DirectThreat_Weapon)
        .RequireTrue(
            Assessed::IsCrimeSeverityHigh |
            Assessed::InstigatorIsStrongerThanSelf
        )
        .Then(UAIEventResponse_AddHostileModifier(EPerceptionCharacterType::Instigator))
        .Then(UAIEventResponse_SwitchState(GameplayTag::AIState_Conflict_WatchHostile, EPerceptionCharacterType::Instigator, true));
    
    default Rules.Add(GameplayTag::Crime_DirectThreat_Weapon)
        .RequireTrue(
            Assessed::IsCrimeSeverityCritical |
            Assessed::InstigatorIsStrongerThanSelf |
            Assessed::AffectedIsSelf
        )
        .Then(UAIEventResponse_AddEnemyModifier(EPerceptionCharacterType::Instigator))
        .Then(UAIEventResponse_VoiceReaction(GameplayTag::Sound_Voice_Reaction_Combat_Beaten_YesYes))
        .Then(UAIEventResponse_SwitchState(GameplayTag::AIState_Conflict_WatchHostile, EPerceptionCharacterType::SensedCharacter));

    // Fists
    default Rules.Add(GameplayTag::Crime_DirectThreat_Fists)
        .RequireTrue(
            Assessed::IsCrimeSeverityMedium |
            Assessed::InstigatorIsStrongerThanSelf
        )
        .Then(UAIEventResponse_AddHostileModifier(EPerceptionCharacterType::Instigator))
        .Then(UAIEventResponse_AddUseFistsModifier(EPerceptionCharacterType::Instigator))
        .Then(UAIEventResponse_SwitchState(GameplayTag::AIState_Conflict_WatchHostile, EPerceptionCharacterType::Instigator, true));

    default Rules.Add(GameplayTag::Crime_DirectThreat_Fists)
        .RequireTrue(
            Assessed::IsCrimeSeverityHigh |
            Assessed::InstigatorIsStrongerThanSelf
        )
        .Then(UAIEventResponse_AddHostileModifier(EPerceptionCharacterType::Instigator))
        .Then(UAIEventResponse_AddUseFistsModifier(EPerceptionCharacterType::Instigator))
        .Then(UAIEventResponse_SwitchState(GameplayTag::AIState_Conflict_WatchHostile, EPerceptionCharacterType::Instigator, true));
    
    default Rules.Add(GameplayTag::Crime_DirectThreat_Fists)
        .RequireTrue(
            Assessed::IsCrimeSeverityCritical |
            Assessed::InstigatorIsStrongerThanSelf |
            Assessed::AffectedIsSelf
        )
        .Then(UAIEventResponse_AddEnemyModifier(EPerceptionCharacterType::Instigator))
        .Then(UAIEventResponse_AddUseFistsModifier(EPerceptionCharacterType::Instigator))
        .Then(UAIEventResponse_VoiceReaction(GameplayTag::Sound_Voice_Reaction_Combat_Beaten_YesYes))
        .Then(UAIEventResponse_SwitchState(GameplayTag::AIState_Conflict_WatchHostile, EPerceptionCharacterType::SensedCharacter));
}

class UAIARM_Crime_DirectThreat_Responses_ToWatchStrongerHostile_NotEnforcer : UAIAssessmentResponseModule
{
    default BlockIfHasAnyOwnedTags.AddTag(GameplayTag::CampRole_Guard);
    default BlockIfHasAnyOwnedTags.AddTag(GameplayTag::CampRole_Leadership);
    default BlockIfHasAnyOwnedTags.AddTag(GameplayTag::CampRole_Boss);

    // Threatening weapon - Instigator Stronger
    default Rules.Add(GameplayTag::Crime_DirectThreat_Weapon)
        .RequireTrue(
            Assessed::IsCrimeSeverityMedium |
            Assessed::IsAnyFriendlyEnforcerOrLeaderInvolved
        )
        .Then(UAIEventResponse_AddHostileModifier(EPerceptionCharacterType::Instigator))
        .Then(UAIEventResponse_SwitchState(GameplayTag::AIState_Conflict_WatchHostile, EPerceptionCharacterType::Instigator, true));

    default Rules.Add(GameplayTag::Crime_DirectThreat_Weapon)
        .RequireTrue(
            Assessed::IsCrimeSeverityHigh |
            Assessed::IsAnyFriendlyEnforcerOrLeaderInvolved
        )
        .Then(UAIEventResponse_AddHostileModifier(EPerceptionCharacterType::Instigator))
        .Then(UAIEventResponse_SwitchState(GameplayTag::AIState_Conflict_WatchHostile, EPerceptionCharacterType::Instigator, true));
    
    default Rules.Add(GameplayTag::Crime_DirectThreat_Weapon)
        .RequireTrue(
            Assessed::IsCrimeSeverityCritical |
            Assessed::IsAnyFriendlyEnforcerOrLeaderInvolved
        )
        .Then(UAIEventResponse_AddEnemyModifier(EPerceptionCharacterType::Instigator))
        .Then(UAIEventResponse_SwitchState(GameplayTag::AIState_Conflict_WatchHostile, EPerceptionCharacterType::SensedCharacter));

    // Fists
    default Rules.Add(GameplayTag::Crime_DirectThreat_Fists)
        .RequireTrue(
            Assessed::IsCrimeSeverityMedium |
            Assessed::IsAnyFriendlyEnforcerOrLeaderInvolved
        )
        .Then(UAIEventResponse_AddHostileModifier(EPerceptionCharacterType::Instigator))
        .Then(UAIEventResponse_AddUseFistsModifier(EPerceptionCharacterType::Instigator))
        .Then(UAIEventResponse_SwitchState(GameplayTag::AIState_Conflict_WatchHostile, EPerceptionCharacterType::Instigator, true));

    default Rules.Add(GameplayTag::Crime_DirectThreat_Fists)
        .RequireTrue(
            Assessed::IsCrimeSeverityHigh |
            Assessed::IsAnyFriendlyEnforcerOrLeaderInvolved
        )
        .Then(UAIEventResponse_AddHostileModifier(EPerceptionCharacterType::Instigator))
        .Then(UAIEventResponse_AddUseFistsModifier(EPerceptionCharacterType::Instigator))
        .Then(UAIEventResponse_SwitchState(GameplayTag::AIState_Conflict_WatchHostile, EPerceptionCharacterType::Instigator, true));
    
    default Rules.Add(GameplayTag::Crime_DirectThreat_Fists)
        .RequireTrue(
            Assessed::IsCrimeSeverityCritical |
            Assessed::IsAnyFriendlyEnforcerOrLeaderInvolved
        )
        .Then(UAIEventResponse_AddEnemyModifier(EPerceptionCharacterType::Instigator))
        .Then(UAIEventResponse_AddUseFistsModifier(EPerceptionCharacterType::Instigator))
        .Then(UAIEventResponse_SwitchState(GameplayTag::AIState_Conflict_WatchHostile, EPerceptionCharacterType::SensedCharacter));
}

class UAIARM_Crime_DirectThreat_Responses_InCombat : UAIAssessmentResponseModule
{
    default RequiredOwnedTags.AddTag(GameplayTag::AIState_Conflict_Combat);

    // Threatening Weapon
    default Rules.Add(GameplayTag::Crime_DirectThreat_Weapon)
        .RequireTrue(
            Assessed::IsCrimeSeverityMedium
        )
        .Then(UAIEventResponse_AddHostileModifier(EPerceptionCharacterType::Instigator));

    default Rules.Add(GameplayTag::Crime_DirectThreat_Weapon)
        .RequireTrue(
            Assessed::IsCrimeSeverityHigh
        )
        .Then(UAIEventResponse_AddHostileModifier(EPerceptionCharacterType::Instigator));
    
    default Rules.Add(GameplayTag::Crime_DirectThreat_Weapon)
        .RequireTrue(
            Assessed::IsCrimeSeverityCritical
        )
        .Then(UAIEventResponse_AddEnemyModifier(EPerceptionCharacterType::Instigator));

    // Fists
    default Rules.Add(GameplayTag::Crime_DirectThreat_Fists)
        .RequireTrue(
            Assessed::IsCrimeSeverityMedium
        )
        .Then(UAIEventResponse_AddHostileModifier(EPerceptionCharacterType::Instigator))
        .Then(UAIEventResponse_AddUseFistsModifier(EPerceptionCharacterType::Instigator));

    default Rules.Add(GameplayTag::Crime_DirectThreat_Fists)
        .RequireTrue(
            Assessed::IsCrimeSeverityHigh
        )
        .Then(UAIEventResponse_AddHostileModifier(EPerceptionCharacterType::Instigator))
        .Then(UAIEventResponse_AddUseFistsModifier(EPerceptionCharacterType::Instigator));
    
    default Rules.Add(GameplayTag::Crime_DirectThreat_Fists)
        .RequireTrue(
            Assessed::IsCrimeSeverityCritical
        )
        .Then(UAIEventResponse_AddEnemyModifier(EPerceptionCharacterType::Instigator))
        .Then(UAIEventResponse_AddUseFistsModifier(EPerceptionCharacterType::Instigator));
}

