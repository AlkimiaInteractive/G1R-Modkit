UCLASS()
class UAIARM_Crime_GeneralEscalation : UAIAssessmentResponseModule
{
    default SubModules.Add(UAIARM_Crime_GeneralEscalation_WhenStayingOutOfConflict);
    default SubModules.Add(UAIARM_Crime_GeneralEscalation_WhenAlreadyInConflict);
    default SubModules.Add(UAIARM_Crime_GeneralEscalation_WhenInCombat);
    default SubModules.Add(UAIARM_Crime_GeneralEscalation_WhenImpaired);    
}

UCLASS()
class UAIARM_Crime_GeneralEscalation_WhenStayingOutOfConflict : UAIAssessmentResponseModule
{
    default RequireAnyOwnedTags.AddTag(GameplayTag::AIState_Conflict_WatchHostile);
    default RequireAnyOwnedTags.AddTag(GameplayTag::AIState_Conflict_WatchHostileFight);
    default RequireAnyOwnedTags.AddTag(GameplayTag::AIState_Conflict_Disengage);
    default RequireAnyOwnedTags.AddTag(GameplayTag::AIState_Conflict_Flee);

    default SubModules.Add(UAIARM_Crime_GeneralEscalation_Pickpocket_AlertVictim);
    default SubModules.Add(UAIARM_Crime_GeneralEscalation_Pickpocket_ModifiersOnly);
    default SubModules.Add(UAIARM_Crime_GeneralEscalation_Pickpocket_VoicelinesOnly);

    default SubModules.Add(UAIARM_Crime_GeneralEscalation_Theft_ModifiersOnly);
    default SubModules.Add(UAIARM_Crime_GeneralEscalation_Theft_VoicelinesOnly);

    default SubModules.Add(UAIARM_Crime_GeneralEscalation_Interaction_ModifiersOnly);
    default SubModules.Add(UAIARM_Crime_GeneralEscalation_Interaction_VoicelinesOnly);

    default SubModules.Add(UAIARM_Crime_GeneralEscalation_Trespassing_ModifiersOnly);
    default SubModules.Add(UAIARM_Crime_GeneralEscalation_Trespassing_VoicelinesOnly);

    default SubModules.Add(UAIARM_Crime_GeneralEscalation_DirectThreat_ModifiersOnly);
    default SubModules.Add(UAIARM_Crime_GeneralEscalation_DirectThreat_VoicelinesOnly);

    default SubModules.Add(UAIARM_Crime_GeneralEscalation_WeaponDrawn_ModifiersOnly);
    default SubModules.Add(UAIARM_Crime_GeneralEscalation_WeaponDrawn_VoicelinesOnly);

    default SubModules.Add(UAIARM_Crime_GeneralEscalation_FistsDrawn_ModifiersOnly);
    default SubModules.Add(UAIARM_Crime_GeneralEscalation_FistsDrawn_VoicelinesOnly);

    default SubModules.Add(UAIARM_Crime_GeneralEscalation_WhenStayingOutOfConflict_Watching);
}

UCLASS()
class UAIARM_Crime_GeneralEscalation_WhenStayingOutOfConflict_Watching : UAIAssessmentResponseModule
{
    default RequireAnyOwnedTags.AddTag(GameplayTag::AIState_Conflict_WatchHostile);
    default RequireAnyOwnedTags.AddTag(GameplayTag::AIState_Conflict_WatchHostileFight);

    default SubModules.Add(UAIARM_Crime_GeneralEscalation_Pickpocket_SwitchToCombatOnly);

    default SubModules.Add(UAIARM_Crime_GeneralEscalation_Theft_SwitchToCombatOnly);

    default SubModules.Add(UAIARM_Crime_GeneralEscalation_Interaction_SwitchToCombatOnly);

    default SubModules.Add(UAIARM_Crime_GeneralEscalation_Trespassing_SwitchToCombatOnly);

    default SubModules.Add(UAIARM_Crime_GeneralEscalation_DirectThreat_SwitchToCombatOnly);

    default SubModules.Add(UAIARM_Crime_GeneralEscalation_WeaponDrawn_SwitchToCombatOnly);

    default SubModules.Add(UAIARM_Crime_GeneralEscalation_FistsDrawn_SwitchToCombatOnly);
}

UCLASS()
class UAIARM_Crime_GeneralEscalation_WhenAlreadyInConflict : UAIAssessmentResponseModule
{
    default RequireAnyOwnedTags.AddTag(GameplayTag::AIState_Conflict_Warning);
    default RequireAnyOwnedTags.AddTag(GameplayTag::AIState_Conflict_TurnToAttacker);

    default SubModules.Add(UAIARM_Crime_GeneralEscalation_WhenAlreadyInConflict_Pickpocket);
    default SubModules.Add(UAIARM_Crime_GeneralEscalation_WhenAlreadyInConflict_Theft);
    default SubModules.Add(UAIARM_Crime_GeneralEscalation_WhenAlreadyInConflict_Interaction);
    default SubModules.Add(UAIARM_Crime_GeneralEscalation_WhenAlreadyInConflict_Trespassing);
    default SubModules.Add(UAIARM_Crime_GeneralEscalation_WhenAlreadyInConflict_Threat);
}

UCLASS()
class UAIARM_Crime_GeneralEscalation_WhenAlreadyInConflict_Pickpocket : UAIAssessmentResponseModule
{
    default BlockIfHasAnyOwnedTags.AddTag(GameplayTag::AIState_Conflict_Warning_Pickpocket);

    default SubModules.Add(UAIARM_Crime_GeneralEscalation_Pickpocket_AlertVictim);
    default SubModules.Add(UAIARM_Crime_GeneralEscalation_Pickpocket_ModifiersOnly);
    default SubModules.Add(UAIARM_Crime_GeneralEscalation_Pickpocket_VoicelinesOnly);
    default SubModules.Add(UAIARM_Crime_GeneralEscalation_Pickpocket_SwitchToCombatOnly);
}

UCLASS()
class UAIARM_Crime_GeneralEscalation_WhenAlreadyInConflict_Theft : UAIAssessmentResponseModule
{
    default BlockIfHasAnyOwnedTags.AddTag(GameplayTag::AIState_Conflict_Warning_Theft);

    default SubModules.Add(UAIARM_Crime_GeneralEscalation_Theft_ModifiersOnly);
    default SubModules.Add(UAIARM_Crime_GeneralEscalation_Theft_VoicelinesOnly);
    default SubModules.Add(UAIARM_Crime_GeneralEscalation_Theft_SwitchToCombatOnly);
}

UCLASS()
class UAIARM_Crime_GeneralEscalation_WhenAlreadyInConflict_Interaction : UAIAssessmentResponseModule
{
    default BlockIfHasAnyOwnedTags.AddTag(GameplayTag::AIState_Conflict_Warning_Interaction);

    default SubModules.Add(UAIARM_Crime_GeneralEscalation_Interaction_ModifiersOnly);
    default SubModules.Add(UAIARM_Crime_GeneralEscalation_Interaction_VoicelinesOnly);
    default SubModules.Add(UAIARM_Crime_GeneralEscalation_Interaction_SwitchToCombatOnly);
}

UCLASS()
class UAIARM_Crime_GeneralEscalation_WhenAlreadyInConflict_Trespassing : UAIAssessmentResponseModule
{
    default BlockIfHasAnyOwnedTags.AddTag(GameplayTag::AIState_Conflict_Warning_Trespassing);

    default SubModules.Add(UAIARM_Crime_GeneralEscalation_Trespassing_ModifiersOnly);
    default SubModules.Add(UAIARM_Crime_GeneralEscalation_Trespassing_VoicelinesOnly);
    default SubModules.Add(UAIARM_Crime_GeneralEscalation_Trespassing_SwitchToCombatOnly);
}

UCLASS()
class UAIARM_Crime_GeneralEscalation_WhenAlreadyInConflict_Threat : UAIAssessmentResponseModule
{
    default BlockIfHasAnyOwnedTags.AddTag(GameplayTag::AIState_Conflict_Warning_Threat);

    default SubModules.Add(UAIARM_Crime_GeneralEscalation_DirectThreat_ModifiersOnly);
    default SubModules.Add(UAIARM_Crime_GeneralEscalation_DirectThreat_VoicelinesOnly);
    default SubModules.Add(UAIARM_Crime_GeneralEscalation_DirectThreat_SwitchToCombatOnly);

    default SubModules.Add(UAIARM_Crime_GeneralEscalation_WeaponDrawn_ModifiersOnly);
    default SubModules.Add(UAIARM_Crime_GeneralEscalation_WeaponDrawn_VoicelinesOnly);
    default SubModules.Add(UAIARM_Crime_GeneralEscalation_WeaponDrawn_SwitchToCombatOnly);

    default SubModules.Add(UAIARM_Crime_GeneralEscalation_FistsDrawn_ModifiersOnly);
    default SubModules.Add(UAIARM_Crime_GeneralEscalation_FistsDrawn_VoicelinesOnly);
    default SubModules.Add(UAIARM_Crime_GeneralEscalation_FistsDrawn_SwitchToCombatOnly);
}

UCLASS()
class UAIARM_Crime_GeneralEscalation_WhenInCombat : UAIAssessmentResponseModule
{
    default RequireAnyOwnedTags.AddTag(GameplayTag::AIState_Conflict_Combat);

    default SubModules.Add(UAIARM_Crime_GeneralEscalation_Pickpocket_AlertVictim);
    default SubModules.Add(UAIARM_Crime_GeneralEscalation_Pickpocket_ModifiersOnly);
    default SubModules.Add(UAIARM_Crime_GeneralEscalation_Pickpocket_VoicelinesOnly);

    default SubModules.Add(UAIARM_Crime_GeneralEscalation_Theft_ModifiersOnly);
    default SubModules.Add(UAIARM_Crime_GeneralEscalation_Theft_VoicelinesOnly);

    default SubModules.Add(UAIARM_Crime_GeneralEscalation_Interaction_ModifiersOnly);
    default SubModules.Add(UAIARM_Crime_GeneralEscalation_Interaction_VoicelinesOnly);

    default SubModules.Add(UAIARM_Crime_GeneralEscalation_Trespassing_ModifiersOnly);
    default SubModules.Add(UAIARM_Crime_GeneralEscalation_Trespassing_VoicelinesOnly);

    default SubModules.Add(UAIARM_Crime_GeneralEscalation_DirectThreat_ModifiersOnly);
    default SubModules.Add(UAIARM_Crime_GeneralEscalation_DirectThreat_VoicelinesOnly);

    default SubModules.Add(UAIARM_Crime_GeneralEscalation_WeaponDrawn_ModifiersOnly);
    default SubModules.Add(UAIARM_Crime_GeneralEscalation_WeaponDrawn_VoicelinesOnly);

    default SubModules.Add(UAIARM_Crime_GeneralEscalation_FistsDrawn_ModifiersOnly);
    default SubModules.Add(UAIARM_Crime_GeneralEscalation_FistsDrawn_VoicelinesOnly);
}

UCLASS()
class UAIARM_Crime_GeneralEscalation_WhenImpaired : UAIAssessmentResponseModule
{
    default RequireAnyOwnedTags.AddTag(GameplayTag::AIState_Conflict_Paralyzed);

    default SubModules.Add(UAIARM_Crime_GeneralEscalation_Pickpocket_ModifiersOnly);

    default SubModules.Add(UAIARM_Crime_GeneralEscalation_Theft_ModifiersOnly);

    default SubModules.Add(UAIARM_Crime_GeneralEscalation_Interaction_ModifiersOnly);

    default SubModules.Add(UAIARM_Crime_GeneralEscalation_Trespassing_ModifiersOnly);

    default SubModules.Add(UAIARM_Crime_GeneralEscalation_DirectThreat_ModifiersOnly);

    default SubModules.Add(UAIARM_Crime_GeneralEscalation_WeaponDrawn_ModifiersOnly);

    default SubModules.Add(UAIARM_Crime_GeneralEscalation_FistsDrawn_ModifiersOnly);
}


////// PICKPOCKET SPLIT RULES
UCLASS()
class UAIARM_Crime_GeneralEscalation_Pickpocket_AlertVictim : UAIAssessmentResponseModule
{
    //////// Friend or Guild member

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

    //////// Area Enforcer

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

UCLASS()
class UAIARM_Crime_GeneralEscalation_Pickpocket_ModifiersOnly : UAIAssessmentResponseModule
{
    //////// Friend or Guild member

    default Rules.Add(GameplayTag::Crime_Pickpocket)
        .RequireFalse(
            Assessed::IsCrimeSeverityLow |
            Assessed::IsCrimeSeverityMinimal |
            Assessed::CrimeVictimIsOutgroupToWitness
        )
        .Then(UAIEventResponse_AddEnemyModifier(EPerceptionCharacterType::Instigator));

    //////// Area Enforcer

    // Rep-escalated + execute level -> Combat + execute (success: loot, fail: no loot).
    default Rules.Add(GameplayTag::Crime_Pickpocket)
        .RequireTrue(
            Assessed::CrimeReputationAtExecuteLevel
        )
        .RequireFalse(
            Assessed::IsCrimeSeverityLow |
            Assessed::IsCrimeSeverityMinimal |
            Assessed::CrimeVictimIsOutgroupToWitness |
            Assessed::InstigatorIsStrongerThanSelf
        )
        .Then(UAIEventResponse_AddExecuteModifier(EPerceptionCharacterType::Instigator));

    default Rules.Add(GameplayTag::Crime_Pickpocket_Success)
        .RequireTrue(
            Assessed::WitnessIsEnforcerOfCrimeArea
        )
        .RequireFalse(
            Assessed::IsCrimeSeverityLow |
            Assessed::IsCrimeSeverityMinimal |
            Assessed::CrimeVictimIsOutgroupToWitness
        )
        .Then(UAIEventResponse_AddLootModifier(EPerceptionCharacterType::Instigator));
    
    default Rules.Add(GameplayTag::Crime_Pickpocket_Success)
        .RequireTrue(
            Assessed::WitnessIsPersonalVictimOfCrime
        )
        .Then(UAIEventResponse_AddLootModifier(EPerceptionCharacterType::Instigator));
}

UCLASS()
class UAIARM_Crime_GeneralEscalation_Pickpocket_VoicelinesOnly : UAIAssessmentResponseModule
{
    //////// Friend or Guild member

    // Rep at execute level -> Combat (fists only; FoG has no execute/loot privilege).
    default Rules.Add(GameplayTag::Crime_Pickpocket)
        .RequireFalse(
            Assessed::IsCrimeSeverityLow |
            Assessed::IsCrimeSeverityMinimal |
            Assessed::WitnessIsPersonalVictimOfCrime |
            Assessed::WitnessIsEnforcerOfCrimeArea |
            Assessed::CrimeVictimIsOutgroupToWitness |
            Assessed::IsAnyFriendlyEnforcerOrLeaderInvolved |
            Assessed::InstigatorIsStrongerThanSelf
        )
        .Then(UAIEventResponse_VoiceReaction(GameplayTag::Sound_Voice_Reaction_Combat_Start_Thief, EPerceptionCharacterType::Instigator)
            .AddContextTagToTarget(GameplayTag::VoicelineContext_Thief));

    //////// Area Enforcer

    // Rep-escalated + execute level -> Combat + execute (success: loot, fail: no loot).
    default Rules.Add(GameplayTag::Crime_Pickpocket_Success)
        .RequireTrue(
            Assessed::WitnessIsEnforcerOfCrimeArea
        )
        .RequireFalse(
            Assessed::IsCrimeSeverityLow |
            Assessed::IsCrimeSeverityMinimal |
            Assessed::WitnessIsPersonalVictimOfCrime |
            Assessed::IsAnyFriendlyEnforcerOrLeaderInvolved |
            Assessed::InstigatorIsStrongerThanSelf
        )
        .Then(UAIEventResponse_VoiceReaction(GameplayTag::Sound_Voice_Reaction_Combat_Start_Thief, EPerceptionCharacterType::Instigator)
            .AddContextTagToTarget(GameplayTag::VoicelineContext_Thief));

    //////// Victim

    // Rep-escalated + at execute-on-defeat level (success) -> Combat + execute + loot.
    default Rules.Add(GameplayTag::Crime_Pickpocket_Success)
        .RequireTrue(
            Assessed::WitnessIsPersonalVictimOfCrime
        )
        .RequireFalse(
            Assessed::IsCrimeSeverityLow |
            Assessed::IsCrimeSeverityMinimal |
            Assessed::InstigatorIsStrongerThanSelf
        )
        .Then(UAIEventResponse_VoiceReaction(GameplayTag::Sound_Voice_Reaction_Combat_Start_Thief_MyStuff, EPerceptionCharacterType::Instigator)
            .AddContextTagToTarget(GameplayTag::VoicelineContext_Thief)
            .AddContextTagToSpeaker(GameplayTag::VoicelineContext_Victim_Theft));

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
        .Then(UAIEventResponse_VoiceReaction(GameplayTag::Sound_Voice_Reaction_Combat_Start_Thief, EPerceptionCharacterType::Instigator)
            .AddContextTagToTarget(GameplayTag::VoicelineContext_Thief)
            .AddContextTagToSpeaker(GameplayTag::VoicelineContext_Victim_Theft));
}

UCLASS()
class UAIARM_Crime_GeneralEscalation_Pickpocket_SwitchToCombatOnly : UAIAssessmentResponseModule
{
    //////// Friend or Guild member

    // Rep at execute level -> Combat (fists only; FoG has no execute/loot privilege).
    default Rules.Add(GameplayTag::Crime_Pickpocket)
        .RequireFalse(
            Assessed::IsCrimeSeverityLow |
            Assessed::IsCrimeSeverityMinimal |
            Assessed::WitnessIsPersonalVictimOfCrime |
            Assessed::WitnessIsEnforcerOfCrimeArea |
            Assessed::CrimeVictimIsOutgroupToWitness |
            Assessed::IsAnyFriendlyEnforcerOrLeaderInvolved |
            Assessed::InstigatorIsStrongerThanSelf
        )
        .Then(UAIEventResponse_AddEnemyModifier(EPerceptionCharacterType::Instigator))
        .Then(UAIEventResponse_LeavePartyOf(EPerceptionCharacterType::Instigator))
        .Then(UAIEventResponse_SwitchState(GameplayTag::AIState_Conflict_Combat, EPerceptionCharacterType::Instigator));

    //////// Area Enforcer

    // Rep-escalated + execute level -> Combat + execute (success: loot, fail: no loot).
    default Rules.Add(GameplayTag::Crime_Pickpocket)
        .RequireTrue(
            Assessed::WitnessIsEnforcerOfCrimeArea
        )
        .RequireFalse(
            Assessed::IsCrimeSeverityLow |
            Assessed::IsCrimeSeverityMinimal |
            Assessed::WitnessIsPersonalVictimOfCrime |
            Assessed::IsAnyFriendlyEnforcerOrLeaderInvolved |
            Assessed::InstigatorIsStrongerThanSelf
        )
        .Then(UAIEventResponse_AddEnemyModifier(EPerceptionCharacterType::Instigator))
        .Then(UAIEventResponse_LeavePartyOf(EPerceptionCharacterType::Instigator))
        .Then(UAIEventResponse_SwitchState(GameplayTag::AIState_Conflict_Combat, EPerceptionCharacterType::Instigator));

    //////// Victim

    // Rep-escalated + at execute-on-defeat level (success) -> Combat + execute + loot.
    default Rules.Add(GameplayTag::Crime_Pickpocket)
        .RequireTrue(
            Assessed::WitnessIsPersonalVictimOfCrime
        )
        .RequireFalse(
            Assessed::IsCrimeSeverityLow |
            Assessed::IsCrimeSeverityMinimal |
            Assessed::InstigatorIsStrongerThanSelf
        )
        .Then(UAIEventResponse_AddEnemyModifier(EPerceptionCharacterType::Instigator))
        .Then(UAIEventResponse_LeavePartyOf(EPerceptionCharacterType::Instigator))
        .Then(UAIEventResponse_SwitchState(GameplayTag::AIState_Conflict_Combat, EPerceptionCharacterType::Instigator));
}

////// INTERACTION SPLIT RULES
UCLASS()
class UAIARM_Crime_GeneralEscalation_Interaction_ModifiersOnly : UAIAssessmentResponseModule
{
    default Rules.Add(GameplayTag::Crime_Interaction)
        .RequireFalse(
            Assessed::IsCrimeSeverityLow |
            Assessed::IsCrimeSeverityMinimal |
            Assessed::InstigatorIsStrongerThanSelf |
            Assessed::InstigatorWasCombatForgivenBefore |
            Assessed::IsAnyFriendlyEnforcerOrLeaderInvolved
        )
        .Then(UAIEventResponse_AddExecuteModifier(EPerceptionCharacterType::Instigator));
    
    default Rules.Add(GameplayTag::Crime_Interaction)
        .RequireFalse(
            Assessed::IsCrimeSeverityLow |
            Assessed::IsCrimeSeverityMinimal |
            Assessed::InstigatorIsStrongerThanSelf |
            Assessed::IsAnyFriendlyEnforcerOrLeaderInvolved
        )
        .Then(UAIEventResponse_AddEnemyModifier(EPerceptionCharacterType::Instigator))
        .Then(UAIEventResponse_AddLootModifier(EPerceptionCharacterType::Instigator));
}

UCLASS()
class UAIARM_Crime_GeneralEscalation_Interaction_VoicelinesOnly : UAIAssessmentResponseModule
{
    default Rules.Add(GameplayTag::Crime_Interaction)
        .RequireFalse(
            Assessed::IsCrimeSeverityLow |
            Assessed::IsCrimeSeverityMinimal |
            Assessed::InstigatorIsStrongerThanSelf |
            Assessed::InstigatorWasCombatForgivenBefore |
            Assessed::IsAnyFriendlyEnforcerOrLeaderInvolved
        )
        .Then(UAIEventResponse_VoiceReaction(GameplayTag::Sound_Voice_Reaction_Combat_Start_YouAskedForIt));
}

UCLASS()
class UAIARM_Crime_GeneralEscalation_Interaction_SwitchToCombatOnly : UAIAssessmentResponseModule
{
    default Rules.Add(GameplayTag::Crime_Interaction)
        .RequireFalse(
            Assessed::IsCrimeSeverityLow |
            Assessed::IsCrimeSeverityMinimal |
            Assessed::InstigatorIsStrongerThanSelf |
            Assessed::InstigatorWasCombatForgivenBefore |
            Assessed::IsAnyFriendlyEnforcerOrLeaderInvolved
        )
        .Then(UAIEventResponse_AddEnemyModifier(EPerceptionCharacterType::Instigator))
        .Then(UAIEventResponse_SwitchState(GameplayTag::AIState_Conflict_Combat, EPerceptionCharacterType::Instigator, true));
}

////// THEFT SPLIT RULES

UCLASS()
class UAIARM_Crime_GeneralEscalation_Theft_ModifiersOnly : UAIAssessmentResponseModule
{
    //////// Friend or Guild member

    default Rules.Add(GameplayTag::Crime_Theft)
        .RequireFalse(
            Assessed::IsCrimeSeverityLow |
            Assessed::IsCrimeSeverityMinimal |
            Assessed::CrimeVictimIsOutgroupToWitness
        )
        .Then(UAIEventResponse_AddEnemyModifier(EPerceptionCharacterType::Instigator));

    //////// Area Enforcer

    // Rep-escalated + execute level -> Combat + execute (success: loot, fail: no loot).
    default Rules.Add(GameplayTag::Crime_Theft)
        .RequireTrue(
            Assessed::CrimeReputationAtExecuteLevel
        )
        .RequireFalse(
            Assessed::IsCrimeSeverityLow |
            Assessed::IsCrimeSeverityMinimal |
            Assessed::CrimeVictimIsOutgroupToWitness |
            Assessed::InstigatorIsStrongerThanSelf
        )
        .Then(UAIEventResponse_AddExecuteModifier(EPerceptionCharacterType::Instigator));

    default Rules.Add(GameplayTag::Crime_Theft)
        .RequireTrue(
            Assessed::WitnessIsEnforcerOfCrimeArea
        )
        .RequireFalse(
            Assessed::IsCrimeSeverityLow |
            Assessed::IsCrimeSeverityMinimal |
            Assessed::CrimeVictimIsOutgroupToWitness
        )
        .Then(UAIEventResponse_AddLootModifier(EPerceptionCharacterType::Instigator));
    
    default Rules.Add(GameplayTag::Crime_Theft)
        .RequireTrue(
            Assessed::WitnessIsPersonalVictimOfCrime
        )
        .Then(UAIEventResponse_AddLootModifier(EPerceptionCharacterType::Instigator));
}

UCLASS()
class UAIARM_Crime_GeneralEscalation_Theft_VoicelinesOnly : UAIAssessmentResponseModule
{
    //////// Friend or Guild member

    // Rep at execute level -> Combat (fists only; FoG has no execute/loot privilege).
    default Rules.Add(GameplayTag::Crime_Theft)
        .RequireFalse(
            Assessed::IsCrimeSeverityLow |
            Assessed::IsCrimeSeverityMinimal |
            Assessed::WitnessIsPersonalVictimOfCrime |
            Assessed::WitnessIsEnforcerOfCrimeArea |
            Assessed::CrimeVictimIsOutgroupToWitness |
            Assessed::IsAnyFriendlyEnforcerOrLeaderInvolved |
            Assessed::InstigatorIsStrongerThanSelf
        )
        .Then(UAIEventResponse_VoiceReaction(GameplayTag::Sound_Voice_Reaction_Combat_Start_Thief, EPerceptionCharacterType::Instigator)
            .AddContextTagToTarget(GameplayTag::VoicelineContext_Thief));

    //////// Area Enforcer

    // Rep-escalated + execute level -> Combat + execute (success: loot, fail: no loot).
    default Rules.Add(GameplayTag::Crime_Theft)
        .RequireTrue(
            Assessed::WitnessIsEnforcerOfCrimeArea
        )
        .RequireFalse(
            Assessed::IsCrimeSeverityLow |
            Assessed::IsCrimeSeverityMinimal |
            Assessed::WitnessIsPersonalVictimOfCrime |
            Assessed::IsAnyFriendlyEnforcerOrLeaderInvolved |
            Assessed::InstigatorIsStrongerThanSelf
        )
        .Then(UAIEventResponse_VoiceReaction(GameplayTag::Sound_Voice_Reaction_Combat_Start_Thief, EPerceptionCharacterType::Instigator)
            .AddContextTagToTarget(GameplayTag::VoicelineContext_Thief));

    //////// Victim

    // Rep-escalated + at execute-on-defeat level (success) -> Combat + execute + loot.
    default Rules.Add(GameplayTag::Crime_Theft)
        .RequireTrue(
            Assessed::WitnessIsPersonalVictimOfCrime
        )
        .RequireFalse(
            Assessed::IsCrimeSeverityLow |
            Assessed::IsCrimeSeverityMinimal |
            Assessed::InstigatorIsStrongerThanSelf
        )
        .Then(UAIEventResponse_VoiceReaction(GameplayTag::Sound_Voice_Reaction_Combat_Start_Thief_MyStuff, EPerceptionCharacterType::Instigator)
            .AddContextTagToTarget(GameplayTag::VoicelineContext_Thief)
            .AddContextTagToSpeaker(GameplayTag::VoicelineContext_Victim_Theft));

    // Overmatched victim -> bark only (DontCare); no state change. Preserves legacy behavior.
    default Rules.Add(GameplayTag::Crime_Theft)
        .RequireTrue(
            Assessed::WitnessIsPersonalVictimOfCrime |
            Assessed::InstigatorIsStrongerThanSelf
        )
        .RequireFalse(
            Assessed::ShouldIgnoreCrime
        )
        .Then(UAIEventResponse_VoiceReaction(GameplayTag::Sound_Voice_Reaction_Interjection_Angry, EPerceptionCharacterType::Instigator));
}

UCLASS()
class UAIARM_Crime_GeneralEscalation_Theft_SwitchToCombatOnly : UAIAssessmentResponseModule
{
    //////// Friend or Guild member

    // Rep at execute level -> Combat (fists only; FoG has no execute/loot privilege).
    default Rules.Add(GameplayTag::Crime_Theft)
        .RequireTrue(
            Assessed::WitnessIsEnforcerOfCrimeArea
        )
        .RequireFalse(
            Assessed::IsCrimeSeverityLow |
            Assessed::IsCrimeSeverityMinimal |
            Assessed::WitnessIsPersonalVictimOfCrime |
            Assessed::CrimeVictimIsOutgroupToWitness |
            Assessed::InstigatorIsStrongerThanSelf
        )
        .Then(UAIEventResponse_AddEnemyModifier(EPerceptionCharacterType::Instigator))
        .Then(UAIEventResponse_LeavePartyOf(EPerceptionCharacterType::Instigator))
        .Then(UAIEventResponse_SwitchState(GameplayTag::AIState_Conflict_Combat, EPerceptionCharacterType::Instigator));

    //////// Area Enforcer

    // Rep-escalated + execute level -> Combat + execute (success: loot, fail: no loot).
    default Rules.Add(GameplayTag::Crime_Theft)
        .RequireTrue(
            Assessed::WitnessIsPersonalVictimOfCrime
        )
        .RequireFalse(
            Assessed::IsCrimeSeverityLow |
            Assessed::IsCrimeSeverityMinimal |            
            Assessed::WitnessIsEnforcerOfCrimeArea |
            Assessed::InstigatorIsStrongerThanSelf
        )
        .Then(UAIEventResponse_AddEnemyModifier(EPerceptionCharacterType::Instigator))
        .Then(UAIEventResponse_LeavePartyOf(EPerceptionCharacterType::Instigator))
        .Then(UAIEventResponse_SwitchState(GameplayTag::AIState_Conflict_Combat, EPerceptionCharacterType::Instigator));

    //////// Victim

    // Rep-escalated + at execute-on-defeat level (success) -> Combat + execute + loot.
    default Rules.Add(GameplayTag::Crime_Theft)
        .RequireTrue(
            Assessed::WitnessIsPersonalVictimOfCrime
        )
        .RequireFalse(
            Assessed::IsCrimeSeverityLow |
            Assessed::IsCrimeSeverityMinimal |
            Assessed::InstigatorIsStrongerThanSelf
        )
        .Then(UAIEventResponse_AddEnemyModifier(EPerceptionCharacterType::Instigator))
        .Then(UAIEventResponse_LeavePartyOf(EPerceptionCharacterType::Instigator))
        .Then(UAIEventResponse_SwitchState(GameplayTag::AIState_Conflict_Combat, EPerceptionCharacterType::Instigator));
}

////// TRESPASSING SPLIT RULES

UCLASS()
class UAIARM_Crime_GeneralEscalation_Trespassing_ModifiersOnly : UAIAssessmentResponseModule
{
    // default Rules.Add(GameplayTag::Crime_Trespassing)
    //     .RequireFalse(
    //         Assessed::IsCrimeSeverityLow |
    //         Assessed::IsCrimeSeverityMinimal |
    //         Assessed::InstigatorIsStrongerThanSelf |
    //         Assessed::InstigatorWasCombatForgivenBefore |
    //         Assessed::IsAnyFriendlyEnforcerOrLeaderInvolved
    //     )
    //     .Then(UAIEventResponse_AddExecuteModifier(EPerceptionCharacterType::Instigator));

    default Rules.Add(GameplayTag::Crime_Trespassing)
        .RequireFalse(
            Assessed::IsCrimeSeverityLow |
            Assessed::IsCrimeSeverityMinimal |
            Assessed::InstigatorIsStrongerThanSelf |
            Assessed::IsAnyFriendlyEnforcerOrLeaderInvolved
        )
        .Then(UAIEventResponse_AddEnemyModifier(EPerceptionCharacterType::Instigator))
        .Then(UAIEventResponse_AddLootModifier(EPerceptionCharacterType::Instigator));
}

UCLASS()
class UAIARM_Crime_GeneralEscalation_Trespassing_VoicelinesOnly : UAIAssessmentResponseModule
{
    default Rules.Add(GameplayTag::Crime_Trespassing)
        .RequireFalse(
            Assessed::IsCrimeSeverityLow |
            Assessed::IsCrimeSeverityMinimal |
            Assessed::InstigatorIsStrongerThanSelf |
            Assessed::InstigatorWasCombatForgivenBefore |
            Assessed::IsAnyFriendlyEnforcerOrLeaderInvolved
        )
        .Then(UAIEventResponse_VoiceReaction(GameplayTag::Sound_Voice_Reaction_Combat_Start)
            .AddContextTagToTarget(GameplayTag::VoicelineContext_Intruder));
}

UCLASS()
class UAIARM_Crime_GeneralEscalation_Trespassing_SwitchToCombatOnly : UAIAssessmentResponseModule
{
    default Rules.Add(GameplayTag::Crime_Trespassing)
        .RequireFalse(
            Assessed::IsCrimeSeverityLow |
            Assessed::IsCrimeSeverityMinimal |
            Assessed::InstigatorIsStrongerThanSelf |
            Assessed::InstigatorWasCombatForgivenBefore |
            Assessed::IsAnyFriendlyEnforcerOrLeaderInvolved
        )
        .Then(UAIEventResponse_AddEnemyModifier(EPerceptionCharacterType::Instigator))
        .Then(UAIEventResponse_SwitchState(GameplayTag::AIState_Conflict_Combat, EPerceptionCharacterType::Instigator, true));
}

////// DIRECT THREAT SPLIT RULES
UCLASS()
class UAIARM_Crime_GeneralEscalation_DirectThreat_ModifiersOnly : UAIAssessmentResponseModule
{
    default Rules.Add(GameplayTag::Crime_DirectThreat)
        .RequireFalse(
            Assessed::IsCrimeSeverityLow |
            Assessed::IsCrimeSeverityMinimal |
            Assessed::InstigatorIsStrongerThanSelf |
            Assessed::InstigatorWasCombatForgivenBefore |
            Assessed::IsAnyFriendlyEnforcerOrLeaderInvolved
        )
        .Then(UAIEventResponse_AddExecuteModifier(EPerceptionCharacterType::Instigator));

    default Rules.Add(GameplayTag::Crime_DirectThreat)
        .RequireFalse(
            Assessed::IsCrimeSeverityLow |
            Assessed::IsCrimeSeverityMinimal |
            Assessed::InstigatorIsStrongerThanSelf |
            Assessed::IsAnyFriendlyEnforcerOrLeaderInvolved
        )
        .Then(UAIEventResponse_AddEnemyModifier(EPerceptionCharacterType::Instigator))
        .Then(UAIEventResponse_AddLootModifier(EPerceptionCharacterType::Instigator));
}

UCLASS()
class UAIARM_Crime_GeneralEscalation_DirectThreat_VoicelinesOnly : UAIAssessmentResponseModule
{
    default Rules.Add(GameplayTag::Crime_DirectThreat)
        .RequireTrue(
            Assessed::InstigatorWasCombatForgivenBefore
        )
        .RequireFalse(
            Assessed::IsCrimeSeverityLow |
            Assessed::IsCrimeSeverityMinimal |
            Assessed::InstigatorIsStrongerThanSelf |
            Assessed::IsAnyFriendlyEnforcerOrLeaderInvolved
        )
        .Then(UAIEventResponse_VoiceReaction(GameplayTag::Sound_Voice_Reaction_Combat_Start_YouStillNotHaveEnough));

    default Rules.Add(GameplayTag::Crime_DirectThreat)
        .RequireFalse(
            Assessed::IsCrimeSeverityLow |
            Assessed::IsCrimeSeverityMinimal |
            Assessed::InstigatorIsStrongerThanSelf |
            Assessed::InstigatorWasCombatForgivenBefore |
            Assessed::IsAnyFriendlyEnforcerOrLeaderInvolved
        )
        .Then(UAIEventResponse_VoiceReaction(GameplayTag::Sound_Voice_Reaction_Combat_Start_YouAskedForIt));
}

UCLASS()
class UAIARM_Crime_GeneralEscalation_DirectThreat_SwitchToCombatOnly : UAIAssessmentResponseModule
{
    default Rules.Add(GameplayTag::Crime_DirectThreat)
        .RequireFalse(
            Assessed::IsCrimeSeverityLow |
            Assessed::IsCrimeSeverityMinimal |
            Assessed::InstigatorIsStrongerThanSelf
        )
        .Then(UAIEventResponse_AddEnemyModifier(EPerceptionCharacterType::Instigator))
        .Then(UAIEventResponse_SwitchState(GameplayTag::AIState_Conflict_Combat, EPerceptionCharacterType::Instigator, true));
}

////// WEAPON DRAWN SPLIT RULES
UCLASS()
class UAIARM_Crime_GeneralEscalation_WeaponDrawn_ModifiersOnly : UAIAssessmentResponseModule
{
    default RequirePursueCrimesOnAssessedCharacter.AddTag(GameplayTag::Crime_ThreateningWeaponDrawn);

    default Rules.Add(GameplayTag::Crime_ThreateningWeaponDrawn)
        .RequireFalse(
            Assessed::IsCrimeSeverityLow |
            Assessed::IsCrimeSeverityMinimal |
            Assessed::InstigatorIsStrongerThanSelf |
            Assessed::InstigatorWasCombatForgivenBefore |
            Assessed::IsAnyFriendlyEnforcerOrLeaderInvolved
        )
        .Then(UAIEventResponse_AddExecuteModifier(EPerceptionCharacterType::Instigator));

    default Rules.Add(GameplayTag::Crime_ThreateningWeaponDrawn)
        .RequireFalse(
            Assessed::IsCrimeSeverityLow |
            Assessed::IsCrimeSeverityMinimal |
            Assessed::InstigatorIsStrongerThanSelf |
            Assessed::IsAnyFriendlyEnforcerOrLeaderInvolved
        )
        .Then(UAIEventResponse_AddEnemyModifier(EPerceptionCharacterType::Instigator))
        .Then(UAIEventResponse_AddLootModifier(EPerceptionCharacterType::Instigator));
}

UCLASS()
class UAIARM_Crime_GeneralEscalation_WeaponDrawn_VoicelinesOnly : UAIAssessmentResponseModule
{
    default RequirePursueCrimesOnAssessedCharacter.AddTag(GameplayTag::Crime_ThreateningWeaponDrawn);

    default Rules.Add(GameplayTag::Crime_ThreateningWeaponDrawn)
        .RequireTrue(
            Assessed::InstigatorWasCombatForgivenBefore
        )
        .RequireFalse(
            Assessed::IsCrimeSeverityLow |
            Assessed::IsCrimeSeverityMinimal |
            Assessed::InstigatorIsStrongerThanSelf |
            Assessed::IsAnyFriendlyEnforcerOrLeaderInvolved
        )
        .Then(UAIEventResponse_VoiceReaction(GameplayTag::Sound_Voice_Reaction_Combat_Start_YouStillNotHaveEnough));
    
    default Rules.Add(GameplayTag::Crime_ThreateningWeaponDrawn)
        .RequireFalse(
            Assessed::IsCrimeSeverityLow |
            Assessed::IsCrimeSeverityMinimal |
            Assessed::InstigatorIsStrongerThanSelf |
            Assessed::InstigatorWasCombatForgivenBefore |
            Assessed::IsAnyFriendlyEnforcerOrLeaderInvolved
        )
        .Then(UAIEventResponse_VoiceReaction(GameplayTag::Sound_Voice_Reaction_Combat_Start_YouAskedForIt));
}

UCLASS()
class UAIARM_Crime_GeneralEscalation_WeaponDrawn_SwitchToCombatOnly : UAIAssessmentResponseModule
{
    default RequirePursueCrimesOnAssessedCharacter.AddTag(GameplayTag::Crime_ThreateningWeaponDrawn);

    default Rules.Add(GameplayTag::Crime_ThreateningWeaponDrawn)
        .RequireFalse(
            Assessed::IsCrimeSeverityLow |
            Assessed::IsCrimeSeverityMinimal |
            Assessed::InstigatorIsStrongerThanSelf
        )
        .Then(UAIEventResponse_AddEnemyModifier(EPerceptionCharacterType::Instigator))
        .Then(UAIEventResponse_SwitchState(GameplayTag::AIState_Conflict_Combat, EPerceptionCharacterType::Instigator, true));
}

////// FISTS DRAWN SPLIT RULES
UCLASS()
class UAIARM_Crime_GeneralEscalation_FistsDrawn_ModifiersOnly : UAIAssessmentResponseModule
{
    default RequirePursueCrimesOnAssessedCharacter.AddTag(GameplayTag::Crime_FistsDrawn);

    default Rules.Add(GameplayTag::Crime_FistsDrawn)
        .RequireFalse(
            Assessed::IsCrimeSeverityLow |
            Assessed::IsCrimeSeverityMinimal |
            Assessed::InstigatorIsStrongerThanSelf |
            Assessed::InstigatorWasCombatForgivenBefore |
            Assessed::IsAnyFriendlyEnforcerOrLeaderInvolved
        )
        .Then(UAIEventResponse_AddExecuteModifier(EPerceptionCharacterType::Instigator));

    default Rules.Add(GameplayTag::Crime_FistsDrawn)
        .RequireFalse(
            Assessed::IsCrimeSeverityLow |
            Assessed::IsCrimeSeverityMinimal |
            Assessed::InstigatorIsStrongerThanSelf |
            Assessed::IsAnyFriendlyEnforcerOrLeaderInvolved
        )
        .Then(UAIEventResponse_AddEnemyModifier(EPerceptionCharacterType::Instigator))
        .Then(UAIEventResponse_AddLootModifier(EPerceptionCharacterType::Instigator));
}

UCLASS()
class UAIARM_Crime_GeneralEscalation_FistsDrawn_VoicelinesOnly : UAIAssessmentResponseModule
{
    default RequirePursueCrimesOnAssessedCharacter.AddTag(GameplayTag::Crime_FistsDrawn);

    default Rules.Add(GameplayTag::Crime_FistsDrawn)
        .RequireTrue(
            Assessed::InstigatorWasCombatForgivenBefore
        )
        .RequireFalse(
            Assessed::IsCrimeSeverityLow |
            Assessed::IsCrimeSeverityMinimal |
            Assessed::InstigatorIsStrongerThanSelf |
            Assessed::IsAnyFriendlyEnforcerOrLeaderInvolved
        )
        .Then(UAIEventResponse_VoiceReaction(GameplayTag::Sound_Voice_Reaction_Combat_Start_YouStillNotHaveEnough));
    
    default Rules.Add(GameplayTag::Crime_FistsDrawn)
        .RequireFalse(
            Assessed::IsCrimeSeverityLow |
            Assessed::IsCrimeSeverityMinimal |
            Assessed::InstigatorIsStrongerThanSelf |
            Assessed::InstigatorWasCombatForgivenBefore |
            Assessed::IsAnyFriendlyEnforcerOrLeaderInvolved
        )
        .Then(UAIEventResponse_VoiceReaction(GameplayTag::Sound_Voice_Reaction_Combat_Start_YouAskedForIt));
}

UCLASS()
class UAIARM_Crime_GeneralEscalation_FistsDrawn_SwitchToCombatOnly : UAIAssessmentResponseModule
{
    default RequirePursueCrimesOnAssessedCharacter.AddTag(GameplayTag::Crime_FistsDrawn);

    default Rules.Add(GameplayTag::Crime_FistsDrawn)
        .RequireFalse(
            Assessed::IsCrimeSeverityLow |
            Assessed::IsCrimeSeverityMinimal |
            Assessed::InstigatorIsStrongerThanSelf
        )
        .Then(UAIEventResponse_AddEnemyModifier(EPerceptionCharacterType::Instigator))
        .Then(UAIEventResponse_SwitchState(GameplayTag::AIState_Conflict_Combat, EPerceptionCharacterType::Instigator, true));
}