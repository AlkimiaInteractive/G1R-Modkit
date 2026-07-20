class UAIARM_JoinConflict : UAIAssessmentResponseModule
{

}

class UAIARM_Human_JoinConflict : UAIARM_JoinConflict
{
    default BlockIfAssessedHasAnyOwnedTags.AddLeafTag(GameplayTag::AIState_Conflict_GoGetGuard);
    default BlockIfAssessedHasAnyOwnedTags.AddLeafTag(GameplayTag::AIState_Guide);
    default BlockIfHasAnyOwnedTags.AddTag(GameplayTag::AIState_Conflict_Combat);
    default BlockIfHasAnyOwnedTags.AddTag(GameplayTag::AIState_Conflict_Disengage);
    default BlockIfHasAnyOwnedTags.AddTag(GameplayTag::AIState_Conflict_Fear);
    default BlockIfHasAnyOwnedTags.AddTag(GameplayTag::AIState_Conflict_Flee);
    default BlockIfHasAnyOwnedTags.AddTag(GameplayTag::AIState_Conflict_Paralyzed);

    default SubModules.Add(UAIARM_Human_JoinConflict_SeenWarning);
    default SubModules.Add(UAIARM_Human_JoinConflict_SeenCombat);
    default SubModules.Add(UAIARM_Human_JoinConflict_ToWatchFight);
    default SubModules.Add(UAIARM_Human_JoinConflict_ToCombat);
    default SubModules.Add(UAIARM_Human_JoinConflict_ToFlee);
    default SubModules.Add(UAIARM_Human_JoinConflict_ToWatchHostile);
    default SubModules.Add(UAIARM_Human_JoinConflict_ToWarning);
}

class UAIARM_Human_JoinConflict_SeenWarning : UAIAssessmentResponseModule
{
    default Rules.Add(GameplayTag::AIEvent_Seen_Warning)
        .RequireFalse(
            Assessed::IsTrainingFight
        )
        .Then(UAIEventResponse_AssessJoinConflict(EPerceptionCharacterType::SensedCharacter));
}

class UAIARM_Human_JoinConflict_SeenCombat : UAIAssessmentResponseModule
{
    default Rules.Add(GameplayTag::AIEvent_Seen_Combat)
        .RequireFalse(
            Assessed::IsTrainingFight
        )
        .Then(UAIEventResponse_AssessJoinConflict(EPerceptionCharacterType::SensedCharacter));
}

//      - WatchFight - AIEvent_JoinConflict_WatchFight [Event assessment should sync enemy modifiers]
//      - Combat - AIEvent_JoinConflict_Combat [Event assessment should sync enemy modifiers]
//      - Flee - AIEvent_JoinConflict_Flee [Event assessment should sync enemy modifiers]
//      - WatchHostile - AIEvent_JoinConflict_WatchHostile [Event assessment should sync hostile modifiers]
//      - Warning - AIEvent_JoinConflict_Warning + EventTag(WarningAIStateTagOfOther?) [Event assessment should sync enemy modifiers]

class UAIARM_Human_JoinConflict_ToWatchFight : UAIAssessmentResponseModule
{
    default BlockIfHasAnyOwnedTags.AddTag(GameplayTag::AIState_Conflict_WatchFight);
    default BlockIfHasAnyOwnedTags.AddTag(GameplayTag::AIState_Conflict_Combat);
    default BlockIfHasAnyOwnedTags.AddTag(GameplayTag::AIState_Conflict_ChaseAndLookForHidingCharacter);
    default BlockIfHasAnyOwnedTags.AddTag(GameplayTag::AIState_Conflict_Disengage);
    default BlockIfHasAnyOwnedTags.AddTag(GameplayTag::AIState_Conflict_Fear);
    default BlockIfHasAnyOwnedTags.AddTag(GameplayTag::AIState_Conflict_Flee);
    default BlockIfHasAnyOwnedTags.AddTag(GameplayTag::AIState_Conflict_GoGetGuard);
    default BlockIfHasAnyOwnedTags.AddTag(GameplayTag::AIState_Conflict_Paralyzed);
    default BlockIfHasAnyOwnedTags.AddTag(GameplayTag::AIState_Conflict_WatchHostileFight);

    default SubModules.Add(UAIARM_Human_JoinConflict_ToWatchFight_Oblivious);

    //  Determine if character should go to WatchFight, Combat or Flee
    //      WatchFight if
    //      - AT LEAST 1 TRUE
    //          * No allies or no opponents
    //          * Friendly non player opponents
    //          * Opponent player in party
    //      - NO ENEMY WITH ATTACKONSIGHT

    default Rules.Add(GameplayTag::AIEvent_ConflictAssessment)
        .EventHasTag(GameplayTag::AIConflictAssessment_FightingConflict)
        .EventDoesNotHaveTag(GameplayTag::AIConflictAssessment_NoAlliedCharacters)
        .EventDoesNotHaveTag(GameplayTag::AIConflictAssessment_NoOpposingCharacters)
        .EventDoesNotHaveTag(GameplayTag::AIConflictAssessment_FriendlyNPCOpponent)
        .EventDoesNotHaveTag(GameplayTag::AIConflictAssessment_InPartyWithPlayerOpponent)
        .EventDoesNotHaveTag(GameplayTag::AIConflictAssessment_FriendlyAllies)
        .EventHasTag(GameplayTag::AIConflictAssessment_PremiumProtectedOpponents)
        .EventHasTag(GameplayTag::AIConflictAssessment_CombatFavorableForAllies)
        .RequireFalse(
            Assessed::IsTrainingFight |
            Assessed::IsPettyFight
        )
        .Then(UAIEventResponse_SwitchState(GameplayTag::AIState_Conflict_WatchFight, EPerceptionCharacterType::None, false));

    default Rules.Add(GameplayTag::AIEvent_ConflictAssessment)
        .EventHasTag(GameplayTag::AIConflictAssessment_FightingConflict)
        .EventDoesNotHaveTag(GameplayTag::AIConflictAssessment_AttackOnSightEnemiesInvolved)
        .EventDoesNotHaveTag(GameplayTag::AIConflictAssessment_AngryOrWorseCreatures)
        .EventHasTag(GameplayTag::AIConflictAssessment_NoAlliedCharacters)
        .RequireFalse(
            Assessed::IsTrainingFight
        )
        .Then(UAIEventResponse_SwitchState(GameplayTag::AIState_Conflict_WatchFight, EPerceptionCharacterType::None, false));
    
    default Rules.Add(GameplayTag::AIEvent_ConflictAssessment)
        .EventHasTag(GameplayTag::AIConflictAssessment_FightingConflict)
        .EventDoesNotHaveTag(GameplayTag::AIConflictAssessment_AttackOnSightEnemiesInvolved)
        .EventDoesNotHaveTag(GameplayTag::AIConflictAssessment_AngryOrWorseCreatures)
        .EventHasTag(GameplayTag::AIConflictAssessment_NoOpposingCharacters)
        .RequireFalse(
            Assessed::IsTrainingFight
        )
        .Then(UAIEventResponse_SwitchState(GameplayTag::AIState_Conflict_WatchFight, EPerceptionCharacterType::None, false));
    
    default Rules.Add(GameplayTag::AIEvent_ConflictAssessment)
        .EventHasTag(GameplayTag::AIConflictAssessment_FightingConflict)
        .EventDoesNotHaveTag(GameplayTag::AIConflictAssessment_AttackOnSightEnemiesInvolved)
        .EventDoesNotHaveTag(GameplayTag::AIConflictAssessment_AngryOrWorseCreatures)
        .EventHasTag(GameplayTag::AIConflictAssessment_FriendlyNPCOpponent)
        .RequireFalse(
            Assessed::IsTrainingFight
        )
        .Then(UAIEventResponse_SwitchState(GameplayTag::AIState_Conflict_WatchFight, EPerceptionCharacterType::None, false));
    
    default Rules.Add(GameplayTag::AIEvent_ConflictAssessment)
        .EventHasTag(GameplayTag::AIConflictAssessment_FightingConflict)
        .EventDoesNotHaveTag(GameplayTag::AIConflictAssessment_AttackOnSightEnemiesInvolved)
        .EventDoesNotHaveTag(GameplayTag::AIConflictAssessment_AngryOrWorseCreatures)
        .EventHasTag(GameplayTag::AIConflictAssessment_InPartyWithPlayerOpponent)
        .RequireFalse(
            Assessed::IsTrainingFight
        )
        .Then(UAIEventResponse_SwitchState(GameplayTag::AIState_Conflict_WatchFight, EPerceptionCharacterType::None, false));
    
    default Rules.Add(GameplayTag::AIEvent_ConflictAssessment)
        .EventHasTag(GameplayTag::AIConflictAssessment_FightingConflict)
        .EventDoesNotHaveTag(GameplayTag::AIConflictAssessment_PersonallyPremiumProtectedAllies)
        .RequireTrue(
            Assessed::IsPettyFight
        )
        .Then(UAIEventResponse_SwitchState(GameplayTag::AIState_Conflict_WatchFight, EPerceptionCharacterType::None, false));
    
    default Rules.Add(GameplayTag::AIEvent_ConflictAssessment)
        .EventHasTag(GameplayTag::AIConflictAssessment_FightingConflict)
        .EventHasTag(GameplayTag::AIConflictAssessment_PersonallyPremiumProtectedAllies)
        .EventHasTag(GameplayTag::AIConflictAssessment_PersonallyPremiumProtectedOpponents)
        .RequireTrue(
            Assessed::IsPettyFight
        )
        .Then(UAIEventResponse_SwitchState(GameplayTag::AIState_Conflict_WatchFight, EPerceptionCharacterType::None, false));
    
    // default Rules.Add(GameplayTag::AIEvent_ConflictAssessment)
    //     .EventHasTag(GameplayTag::AIConflictAssessment_FightingConflict)
    //     .RequireTrue(
    //         Assessed::IsTrainingFight
    //     )
    //     .RequireFalse(
    //         Assessed::SelfIsParticipantOfPerceivedConflict
    //     )
    //     .Then(UAIEventResponse_SwitchState(GameplayTag::AIState_Conflict_WatchFight, EPerceptionCharacterType::None, false));

    default Rules.Add(GameplayTag::AIEvent_ConflictAssessment)
        .EventHasTag(GameplayTag::AIConflictAssessment_FightingConflict)
        .EventHasTag(GameplayTag::AIConflictAssessment_AngryOrWorseCreatures)
        .EventHasTag(GameplayTag::AIConflictAssessment_AlliedEnforcerPresent)
        .EventDoesNotHaveTag(GameplayTag::AIConflictAssessment_CombatFavorableForAllies)
        .RequireFalse(
            Assessed::IsTrainingFight |
            Assessed::IsPettyFight
        )
        .Then(UAIEventResponse_SynchEnemiesWithConflictGroupOfCharacter(EPerceptionCharacterType::SensedCharacter))
        .Then(UAIEventResponse_SwitchState(GameplayTag::AIState_Conflict_WatchFight, EPerceptionCharacterType::None, false));
    
    default Rules.Add(GameplayTag::AIEvent_ConflictAssessment)
        .EventHasTag(GameplayTag::AIConflictAssessment_FightingConflict)
        .EventHasTag(GameplayTag::AIConflictAssessment_AttackOnSightEnemiesInvolved)
        .EventHasTag(GameplayTag::AIConflictAssessment_AlliedEnforcerPresent)
        .EventDoesNotHaveTag(GameplayTag::AIConflictAssessment_CombatFavorableForAllies)
        .RequireFalse(
            Assessed::IsTrainingFight |
            Assessed::IsPettyFight
        )
        .Then(UAIEventResponse_SynchEnemiesWithConflictGroupOfCharacter(EPerceptionCharacterType::SensedCharacter))
        .Then(UAIEventResponse_SwitchState(GameplayTag::AIState_Conflict_WatchFight, EPerceptionCharacterType::None, false));
    
    default Rules.Add(GameplayTag::AIEvent_ConflictAssessment)
        .EventHasTag(GameplayTag::AIConflictAssessment_FightingConflict)
        .EventHasTag(GameplayTag::AIConflictAssessment_AlliedEnforcerPresent)
        .EventDoesNotHaveTag(GameplayTag::AIConflictAssessment_NoAlliedCharacters)
        .EventDoesNotHaveTag(GameplayTag::AIConflictAssessment_NoOpposingCharacters)
        .EventDoesNotHaveTag(GameplayTag::AIConflictAssessment_FriendlyNPCOpponent)
        .EventDoesNotHaveTag(GameplayTag::AIConflictAssessment_InPartyWithPlayerOpponent)
        .EventDoesNotHaveTag(GameplayTag::AIConflictAssessment_PersonallyPremiumProtectedAllies)
        .EventDoesNotHaveTag(GameplayTag::AIConflictAssessment_CombatFavorableForAllies)
        .RequireFalse(
            Assessed::IsTrainingFight |
            Assessed::IsPettyFight
        )
        .Then(UAIEventResponse_SynchEnemiesWithConflictGroupOfCharacter(EPerceptionCharacterType::SensedCharacter))
        .Then(UAIEventResponse_SwitchState(GameplayTag::AIState_Conflict_WatchFight, EPerceptionCharacterType::None, false));
}

class UAIARM_Human_JoinConflict_ToWatchFight_Oblivious : UAIAssessmentResponseModule
{
    default RequireAnyOwnedTags.AddTag(GameplayTag::Character_Personality_Oblivious);

    default Rules.Add(GameplayTag::AIEvent_ConflictAssessment)
        .EventDoesNotHaveTag(GameplayTag::AIConflictAssessment_AlliedEnforcerPresent)
        .EventHasTag(GameplayTag::AIConflictAssessment_AngryOrWorseCreatures)
        .RequireFalse(
            Assessed::IsTrainingFight |
            Assessed::IsPettyFight
        )
        .Then(UAIEventResponse_SynchEnemiesWithConflictGroupOfCharacter(EPerceptionCharacterType::SensedCharacter))
        .Then(UAIEventResponse_SwitchState(GameplayTag::AIState_Conflict_WatchFight, EPerceptionCharacterType::None, false));

    default Rules.Add(GameplayTag::AIEvent_ConflictAssessment)
        .EventHasTag(GameplayTag::AIConflictAssessment_FightingConflict)
        .EventHasTag(GameplayTag::AIConflictAssessment_AngryOrWorseCreatures)
        .EventDoesNotHaveTag(GameplayTag::AIConflictAssessment_CombatFavorableForAllies)
        .EventDoesNotHaveTag(GameplayTag::AIConflictAssessment_AlliedEnforcerPresent)
        .RequireFalse(
            Assessed::IsTrainingFight |
            Assessed::IsPettyFight
        )
        .Then(UAIEventResponse_SynchEnemiesWithConflictGroupOfCharacter(EPerceptionCharacterType::SensedCharacter))
        .Then(UAIEventResponse_SwitchState(GameplayTag::AIState_Conflict_WatchFight, EPerceptionCharacterType::None, false));
    
    default Rules.Add(GameplayTag::AIEvent_ConflictAssessment)
        .EventHasTag(GameplayTag::AIConflictAssessment_FightingConflict)
        .EventHasTag(GameplayTag::AIConflictAssessment_AttackOnSightEnemiesInvolved)
        .EventDoesNotHaveTag(GameplayTag::AIConflictAssessment_CombatFavorableForAllies)
        .EventDoesNotHaveTag(GameplayTag::AIConflictAssessment_AlliedEnforcerPresent)
        .RequireFalse(
            Assessed::IsTrainingFight |
            Assessed::IsPettyFight
        )
        .Then(UAIEventResponse_SynchEnemiesWithConflictGroupOfCharacter(EPerceptionCharacterType::SensedCharacter))
        .Then(UAIEventResponse_SwitchState(GameplayTag::AIState_Conflict_WatchFight, EPerceptionCharacterType::None, false));
    
    default Rules.Add(GameplayTag::AIEvent_ConflictAssessment)
        .EventHasTag(GameplayTag::AIConflictAssessment_FightingConflict)
        .EventDoesNotHaveTag(GameplayTag::AIConflictAssessment_NoAlliedCharacters)
        .EventDoesNotHaveTag(GameplayTag::AIConflictAssessment_NoOpposingCharacters)
        .EventDoesNotHaveTag(GameplayTag::AIConflictAssessment_FriendlyNPCOpponent)
        .EventDoesNotHaveTag(GameplayTag::AIConflictAssessment_InPartyWithPlayerOpponent)
        .EventDoesNotHaveTag(GameplayTag::AIConflictAssessment_CombatFavorableForAllies)
        .EventDoesNotHaveTag(GameplayTag::AIConflictAssessment_AlliedEnforcerPresent)
        .RequireFalse(
            Assessed::IsTrainingFight |
            Assessed::IsPettyFight
        )
        .Then(UAIEventResponse_SynchEnemiesWithConflictGroupOfCharacter(EPerceptionCharacterType::SensedCharacter))
        .Then(UAIEventResponse_SwitchState(GameplayTag::AIState_Conflict_WatchFight, EPerceptionCharacterType::None, false));
}

class UAIARM_Human_JoinConflict_ToCombat : UAIAssessmentResponseModule
{
    default BlockIfHasAnyOwnedTags.AddTag(GameplayTag::AIState_Conflict_Combat);
    default BlockIfHasAnyOwnedTags.AddTag(GameplayTag::AIState_Conflict_Disengage);
    default BlockIfHasAnyOwnedTags.AddTag(GameplayTag::AIState_Conflict_Fear);
    default BlockIfHasAnyOwnedTags.AddTag(GameplayTag::AIState_Conflict_Flee);
    default BlockIfHasAnyOwnedTags.AddTag(GameplayTag::AIState_Conflict_Paralyzed);

    default SubModules.Add(UAIARM_Human_JoinConflict_ToCombat_Enforcer);

    //  Combat if
    //      - Attack on sight enemy involved 
    //      or ALL TRUE
    //          * No friendly non player opponents
    //          * No opponent players in party
    //          * No neutral player in party

    // default Rules.Add(GameplayTag::AIEvent_UnresolvedConflictFight)
    //     .RequireFalse(
    //         Assessed::SensedIsStrongerThanSelf
    //     )
    //     .Then(UAIEventResponse_AddEnemyModifier(EPerceptionCharacterType::SensedCharacter))
    //     .Then(UAIEventResponse_SwitchState(GameplayTag::AIState_Conflict_Combat, EPerceptionCharacterType::SensedCharacter, false));

    default Rules.Add(GameplayTag::AIEvent_ConflictAssessment)
        .EventHasTag(GameplayTag::AIConflictAssessment_FightingConflict)
        .EventHasTag(GameplayTag::AIConflictAssessment_AttackOnSightEnemiesInvolved)
        .EventHasTag(GameplayTag::AIConflictAssessment_CombatFavorableForAllies)
        .RequireFalse(
            Assessed::IsTrainingFight |
            Assessed::IsPettyFight
        )
        .Then(UAIEventResponse_SynchEnemiesWithConflictGroupOfCharacter(EPerceptionCharacterType::SensedCharacter))
        .Then(UAIEventResponse_SwitchState(GameplayTag::AIState_Conflict_Combat, EPerceptionCharacterType::None, false));
    
    default Rules.Add(GameplayTag::AIEvent_ConflictAssessment)
        .EventHasTag(GameplayTag::AIConflictAssessment_FightingConflict)
        .EventDoesNotHaveTag(GameplayTag::AIConflictAssessment_NoAlliedCharacters)
        .EventDoesNotHaveTag(GameplayTag::AIConflictAssessment_NoOpposingCharacters)
        .EventDoesNotHaveTag(GameplayTag::AIConflictAssessment_FriendlyNPCOpponent)
        .EventDoesNotHaveTag(GameplayTag::AIConflictAssessment_InPartyWithPlayerOpponent)
        .EventDoesNotHaveTag(GameplayTag::AIConflictAssessment_PremiumProtectedOpponents)
        .EventHasTag(GameplayTag::AIConflictAssessment_CombatFavorableForAllies)
        .RequireFalse(
            Assessed::IsTrainingFight |
            Assessed::IsPettyFight
        )
        .Then(UAIEventResponse_SynchEnemiesWithConflictGroupOfCharacter(EPerceptionCharacterType::SensedCharacter))
        .Then(UAIEventResponse_SwitchState(GameplayTag::AIState_Conflict_Combat, EPerceptionCharacterType::None, false));
    
    default Rules.Add(GameplayTag::AIEvent_ConflictAssessment)
        .EventHasTag(GameplayTag::AIConflictAssessment_FightingConflict)
        .EventDoesNotHaveTag(GameplayTag::AIConflictAssessment_NoAlliedCharacters)
        .EventDoesNotHaveTag(GameplayTag::AIConflictAssessment_NoOpposingCharacters)
        .EventDoesNotHaveTag(GameplayTag::AIConflictAssessment_FriendlyNPCOpponent)
        .EventDoesNotHaveTag(GameplayTag::AIConflictAssessment_InPartyWithPlayerOpponent)
        .EventHasTag(GameplayTag::AIConflictAssessment_FriendlyAllies)
        .EventHasTag(GameplayTag::AIConflictAssessment_PremiumProtectedOpponents)
        .EventHasTag(GameplayTag::AIConflictAssessment_CombatFavorableForAllies)
        .RequireFalse(
            Assessed::IsTrainingFight |
            Assessed::IsPettyFight
        )
        .Then(UAIEventResponse_SynchEnemiesWithConflictGroupOfCharacter(EPerceptionCharacterType::SensedCharacter))
        .Then(UAIEventResponse_SwitchState(GameplayTag::AIState_Conflict_Combat, EPerceptionCharacterType::None, false));
    
    default Rules.Add(GameplayTag::AIEvent_ConflictAssessment)
        .EventHasTag(GameplayTag::AIConflictAssessment_FightingConflict)
        .EventDoesNotHaveTag(GameplayTag::AIConflictAssessment_NoAlliedCharacters)
        .EventDoesNotHaveTag(GameplayTag::AIConflictAssessment_NoOpposingCharacters)
        .EventDoesNotHaveTag(GameplayTag::AIConflictAssessment_FriendlyNPCOpponent)
        .EventDoesNotHaveTag(GameplayTag::AIConflictAssessment_InPartyWithPlayerOpponent)
        .EventHasTag(GameplayTag::AIConflictAssessment_PremiumProtectedAllies)
        .EventHasTag(GameplayTag::AIConflictAssessment_ProtectedOpponents)
        .EventHasTag(GameplayTag::AIConflictAssessment_CombatFavorableForAllies)
        .RequireFalse(
            Assessed::IsTrainingFight |
            Assessed::IsPettyFight
        )
        .Then(UAIEventResponse_SynchEnemiesWithConflictGroupOfCharacter(EPerceptionCharacterType::SensedCharacter))
        .Then(UAIEventResponse_SwitchState(GameplayTag::AIState_Conflict_Combat, EPerceptionCharacterType::None, false));
    
    default Rules.Add(GameplayTag::AIEvent_ConflictAssessment)
        .EventHasTag(GameplayTag::AIConflictAssessment_FightingConflict)
        .EventDoesNotHaveTag(GameplayTag::AIConflictAssessment_NoAlliedCharacters)
        .EventDoesNotHaveTag(GameplayTag::AIConflictAssessment_NoOpposingCharacters)
        .EventDoesNotHaveTag(GameplayTag::AIConflictAssessment_FriendlyNPCOpponent)
        .EventDoesNotHaveTag(GameplayTag::AIConflictAssessment_InPartyWithPlayerOpponent)
        .EventHasTag(GameplayTag::AIConflictAssessment_PremiumProtectedAllies)
        .EventHasTag(GameplayTag::AIConflictAssessment_ProtectedOpponents)
        .EventHasTag(GameplayTag::AIConflictAssessment_CombatFavorableForAllies)
        .RequireTrue(
            Assessed::IsPettyFight
        )
        .Then(UAIEventResponse_SynchEnemiesWithConflictGroupOfCharacter(EPerceptionCharacterType::SensedCharacter))
        .Then(UAIEventResponse_SwitchStateWithConflictType(GameplayTag::AIState_Conflict_Combat, EPerceptionCharacterType::None, EConflictType::PettyFight, false));
}

class UAIARM_Human_JoinConflict_ToCombat_Enforcer : UAIARM_GuardOrLeaderRole
{
    default Rules.Add(GameplayTag::AIEvent_ConflictAssessment)
        .EventHasTag(GameplayTag::AIConflictAssessment_FightingConflict)
        .EventHasTag(GameplayTag::AIConflictAssessment_AngryOrWorseCreatures)
        .EventHasTag(GameplayTag::AIConflictAssessment_CombatFavorableForAllies)
        .RequireFalse(
            Assessed::IsTrainingFight |
            Assessed::IsPettyFight
        )
        .Then(UAIEventResponse_SynchEnemiesWithConflictGroupOfCharacter(EPerceptionCharacterType::SensedCharacter))
        .Then(UAIEventResponse_SwitchState(GameplayTag::AIState_Conflict_Combat, EPerceptionCharacterType::None, false));
}

class UAIARM_Human_JoinConflict_ToFlee : UAIARM_NoGuardNorLeaderRole
{
    default BlockIfHasAnyOwnedTags.AddTag(GameplayTag::AIState_Conflict_Combat);
    default BlockIfHasAnyOwnedTags.AddTag(GameplayTag::AIState_Conflict_Disengage);
    default BlockIfHasAnyOwnedTags.AddTag(GameplayTag::AIState_Conflict_Fear);
    default BlockIfHasAnyOwnedTags.AddTag(GameplayTag::AIState_Conflict_Flee);
    default BlockIfHasAnyOwnedTags.AddTag(GameplayTag::AIState_Conflict_Paralyzed);

    default BlockIfHasAnyOwnedTags.AddTag(GameplayTag::Character_Personality_Oblivious);
    default BlockIfHasAnyOwnedTags.AddTag(GameplayTag::Character_Personality_Brave);
    
    default SubModules.Add(UAIARM_Human_JoinConflict_ToFlee_NonEnforcer);

    // default Rules.Add(GameplayTag::AIEvent_UnresolvedConflictFight)
    //     .RequireTrue(
    //         Assessed::SensedIsStrongerThanSelf
    //     )
    //     .Then(UAIEventResponse_AddEnemyModifier(EPerceptionCharacterType::SensedCharacter))
    //     .Then(UAIEventResponse_SwitchState(GameplayTag::AIState_Conflict_Flee_GetGuardHelp, EPerceptionCharacterType::SensedCharacter, false));
    
    // Need to check bravery, presence of enforcers in conflict
    default Rules.Add(GameplayTag::AIEvent_ConflictAssessment)
        .EventHasTag(GameplayTag::AIConflictAssessment_FightingConflict)
        .EventHasTag(GameplayTag::AIConflictAssessment_AngryOrWorseCreatures)
        .EventDoesNotHaveTag(GameplayTag::AIConflictAssessment_CombatFavorableForAllies)
        .EventDoesNotHaveTag(GameplayTag::AIConflictAssessment_AlliedEnforcerPresent)
        .RequireFalse(
            Assessed::IsTrainingFight |
            Assessed::IsPettyFight
        )
        .Then(UAIEventResponse_SynchEnemiesWithConflictGroupOfCharacter(EPerceptionCharacterType::SensedCharacter))
        .Then(UAIEventResponse_SwitchState(GameplayTag::AIState_Conflict_Flee_GetGuardHelp, EPerceptionCharacterType::None, false));
    
    default Rules.Add(GameplayTag::AIEvent_ConflictAssessment)
        .EventHasTag(GameplayTag::AIConflictAssessment_FightingConflict)
        .EventHasTag(GameplayTag::AIConflictAssessment_AttackOnSightEnemiesInvolved)
        .EventDoesNotHaveTag(GameplayTag::AIConflictAssessment_CombatFavorableForAllies)
        .EventDoesNotHaveTag(GameplayTag::AIConflictAssessment_AlliedEnforcerPresent)
        .RequireFalse(
            Assessed::IsTrainingFight |
            Assessed::IsPettyFight
        )
        .Then(UAIEventResponse_SynchEnemiesWithConflictGroupOfCharacter(EPerceptionCharacterType::SensedCharacter))
        .Then(UAIEventResponse_SwitchState(GameplayTag::AIState_Conflict_Flee_GetGuardHelp, EPerceptionCharacterType::None, false));
    
    default Rules.Add(GameplayTag::AIEvent_ConflictAssessment)
        .EventHasTag(GameplayTag::AIConflictAssessment_FightingConflict)
        .EventDoesNotHaveTag(GameplayTag::AIConflictAssessment_NoAlliedCharacters)
        .EventDoesNotHaveTag(GameplayTag::AIConflictAssessment_NoOpposingCharacters)
        .EventDoesNotHaveTag(GameplayTag::AIConflictAssessment_FriendlyNPCOpponent)
        .EventDoesNotHaveTag(GameplayTag::AIConflictAssessment_InPartyWithPlayerOpponent)
        .EventDoesNotHaveTag(GameplayTag::AIConflictAssessment_CombatFavorableForAllies)
        .EventDoesNotHaveTag(GameplayTag::AIConflictAssessment_AlliedEnforcerPresent)
        .RequireFalse(
            Assessed::IsTrainingFight |
            Assessed::IsPettyFight
        )
        .Then(UAIEventResponse_SynchEnemiesWithConflictGroupOfCharacter(EPerceptionCharacterType::SensedCharacter))
        .Then(UAIEventResponse_SwitchState(GameplayTag::AIState_Conflict_Flee_GetGuardHelp, EPerceptionCharacterType::None, false));

    
}

class UAIARM_Human_JoinConflict_ToFlee_NonEnforcer : UAIARM_NoGuardNorLeaderRole
{
    default Rules.Add(GameplayTag::AIEvent_ConflictAssessment)
        .EventDoesNotHaveTag(GameplayTag::AIConflictAssessment_AlliedEnforcerPresent)
        .EventDoesNotHaveTag(GameplayTag::AIConflictAssessment_InPartyWithPlayerAlly)
        .EventDoesNotHaveTag(GameplayTag::AIConflictAssessment_InPartyWithPlayerNeutral)
        .EventHasTag(GameplayTag::AIConflictAssessment_AngryOrWorseCreatures)
        .RequireFalse(
            Assessed::IsTrainingFight |
            Assessed::IsPettyFight
        )
        .Then(UAIEventResponse_SynchEnemiesWithConflictGroupOfCharacter(EPerceptionCharacterType::SensedCharacter))
        .Then(UAIEventResponse_SwitchState(GameplayTag::AIState_Conflict_Flee, EPerceptionCharacterType::None, false));
}

class UAIARM_Human_JoinConflict_ToWatchHostile : UAIAssessmentResponseModule
{
    default BlockIfHasAnyOwnedTags.AddTag(GameplayTag::AIState_Conflict_Combat);
    default BlockIfHasAnyOwnedTags.AddTag(GameplayTag::AIState_Conflict_ChaseAndLookForHidingCharacter);
    default BlockIfHasAnyOwnedTags.AddTag(GameplayTag::AIState_Conflict_Disengage);
    default BlockIfHasAnyOwnedTags.AddTag(GameplayTag::AIState_Conflict_Fear);
    default BlockIfHasAnyOwnedTags.AddTag(GameplayTag::AIState_Conflict_Flee);
    default BlockIfHasAnyOwnedTags.AddTag(GameplayTag::AIState_Conflict_GoGetGuard);
    default BlockIfHasAnyOwnedTags.AddTag(GameplayTag::AIState_Conflict_Paralyzed);
    default BlockIfHasAnyOwnedTags.AddTag(GameplayTag::AIState_Conflict_WatchHostileFight);
    default BlockIfHasAnyOwnedTags.AddTag(GameplayTag::AIState_Conflict_WatchFight);
    default BlockIfHasAnyOwnedTags.AddTag(GameplayTag::AIState_Conflict_Warning);

    default SubModules.Add(UAIARM_Human_JoinConflict_ToWatchHostile_NotEnforcer);

    default Rules.Add(GameplayTag::AIEvent_ConflictAssessment)
        .EventDoesNotHaveTag(GameplayTag::AIConflictAssessment_FightingConflict)
        .RequireTrue(
            Assessed::IsPettyFight
        )
        .Then(UAIEventResponse_SwitchState(GameplayTag::AIState_Conflict_WatchHostile, EPerceptionCharacterType::None, false)
            .AddContextTag(GameplayTag::AIStateContext_NoStartInteraction));
    
    default Rules.Add(GameplayTag::AIEvent_ConflictAssessment)
        .EventDoesNotHaveTag(GameplayTag::AIConflictAssessment_FightingConflict)
        .EventDoesNotHaveTag(GameplayTag::AIState_Conflict_Warning)
        .RequireFalse(
            Assessed::IsTrainingFight |
            Assessed::IsPettyFight
        )
        .Then(UAIEventResponse_SynchHostilesWithConflictGroupOfCharacter(EPerceptionCharacterType::SensedCharacter))
        .Then(UAIEventResponse_SwitchState(GameplayTag::AIState_Conflict_WatchHostile, EPerceptionCharacterType::None, false)
            .AddContextTag(GameplayTag::AIStateContext_NoStartInteraction));

    default Rules.Add(GameplayTag::AIEvent_ConflictAssessment)
        .EventHasTag(GameplayTag::AIConflictAssessment_AlliedEnforcerPresent)
        .EventHasTag(GameplayTag::AIConflictAssessment_AngryOrWorseCreatures)
        .EventDoesNotHaveTag(GameplayTag::AIConflictAssessment_CombatFavorableForAllies)
        .RequireFalse(
            Assessed::IsTrainingFight |
            Assessed::IsPettyFight
        )
        .Then(UAIEventResponse_SynchHostilesWithConflictGroupOfCharacter(EPerceptionCharacterType::SensedCharacter))
        .Then(UAIEventResponse_SwitchState(GameplayTag::AIState_Conflict_WatchHostile, EPerceptionCharacterType::None, false));
}

class UAIARM_Human_JoinConflict_ToWatchHostile_NotEnforcer : UAIARM_NoGuardNorLeaderRole
{
    default Rules.Add(GameplayTag::AIEvent_ConflictAssessment)
        .EventHasTag(GameplayTag::AIConflictAssessment_AlliedEnforcerPresent)
        .EventHasTag(GameplayTag::AIConflictAssessment_AngryOrWorseCreatures)
        .EventHasTag(GameplayTag::AIConflictAssessment_CombatFavorableForAllies)
        .RequireFalse(
            Assessed::IsTrainingFight |
            Assessed::IsPettyFight
        )
        .Then(UAIEventResponse_SynchEnemiesWithConflictGroupOfCharacter(EPerceptionCharacterType::SensedCharacter))
        .Then(UAIEventResponse_SwitchState(GameplayTag::AIState_Conflict_Combat, EPerceptionCharacterType::None, false));

    default Rules.Add(GameplayTag::AIEvent_ConflictAssessment)
        .EventDoesNotHaveTag(GameplayTag::AIConflictAssessment_FightingConflict)
        .EventHasTag(GameplayTag::AIConflictAssessment_AlliedEnforcerPresent)
        .RequireFalse(
            Assessed::IsTrainingFight |
            Assessed::IsPettyFight
        )
        .Then(UAIEventResponse_SynchHostilesWithConflictGroupOfCharacter(EPerceptionCharacterType::SensedCharacter))
        .Then(UAIEventResponse_SwitchState(GameplayTag::AIState_Conflict_WatchHostile, EPerceptionCharacterType::None, false)
            .AddContextTag(GameplayTag::AIStateContext_NoStartInteraction));
    
    default Rules.Add(GameplayTag::AIEvent_ConflictAssessment)
        .EventDoesNotHaveTag(GameplayTag::AIConflictAssessment_FightingConflict)
        .EventDoesNotHaveTag(GameplayTag::AIConflictAssessment_CombatFavorableForAllies)
        .RequireFalse(
            Assessed::IsTrainingFight |
            Assessed::IsPettyFight
        )
        .Then(UAIEventResponse_SynchHostilesWithConflictGroupOfCharacter(EPerceptionCharacterType::SensedCharacter))
        .Then(UAIEventResponse_SwitchState(GameplayTag::AIState_Conflict_WatchHostile, EPerceptionCharacterType::None, false)
            .AddContextTag(GameplayTag::AIStateContext_NoStartInteraction));
}

class UAIARM_Human_JoinConflict_ToWarning : UAIAssessmentResponseModule
{
    default BlockIfHasAnyOwnedTags.AddTag(GameplayTag::AIState_Conflict_Combat);
    default BlockIfHasAnyOwnedTags.AddTag(GameplayTag::AIState_Conflict_Disengage);
    default BlockIfHasAnyOwnedTags.AddTag(GameplayTag::AIState_Conflict_Fear);
    default BlockIfHasAnyOwnedTags.AddTag(GameplayTag::AIState_Conflict_Flee);
    default BlockIfHasAnyOwnedTags.AddTag(GameplayTag::AIState_Conflict_Paralyzed);
    default BlockIfHasAnyOwnedTags.AddTag(GameplayTag::AIState_Conflict_Warning);

    default SubModules.Add(UAIARM_Human_JoinConflict_ToWarning_Enforcer);
    default SubModules.Add(UAIARM_Human_JoinConflict_ToWarning_NotEnforcer);
}

class UAIARM_Human_JoinConflict_ToWarning_Enforcer : UAIARM_GuardOrLeaderRole
{
    // default Rules.Add(GameplayTag::AIEvent_ConflictAssessment)
    //     .EventDoesNotHaveTag(GameplayTag::AIConflictAssessment_FightingConflict)
    //     .EventHasTag(GameplayTag::AIState_Conflict_Warning_Trespassing)
    //     .RequireFalse(
    //         Assessed::IsTrainingFight |
    //         Assessed::IsPettyFight
    //     )
    //     .Then(UAIEventResponse_SynchHostilesWithConflictGroupOfCharacter(EPerceptionCharacterType::SensedCharacter))
    //     .Then(UAIEventResponse_SwitchState(GameplayTag::AIState_Conflict_Warning_Trespassing, EPerceptionCharacterType::AffectedCharacter, false));
    
    default Rules.Add(GameplayTag::AIEvent_ConflictAssessment)
        .EventDoesNotHaveTag(GameplayTag::AIConflictAssessment_FightingConflict)
        .EventHasTag(GameplayTag::AIState_Conflict_Warning_NotWelcomeHere)
        .RequireFalse(
            Assessed::IsTrainingFight |
            Assessed::IsPettyFight
        )
        .Then(UAIEventResponse_SynchHostilesWithConflictGroupOfCharacter(EPerceptionCharacterType::SensedCharacter))
        .Then(UAIEventResponse_SwitchState(GameplayTag::AIState_Conflict_Warning_NotWelcomeHere, EPerceptionCharacterType::AffectedCharacter, false));
    
    default Rules.Add(GameplayTag::AIEvent_ConflictAssessment)
        .EventDoesNotHaveTag(GameplayTag::AIConflictAssessment_FightingConflict)
        .EventHasTag(GameplayTag::AIState_Conflict_Warning_Interaction)
        .RequireFalse(
            Assessed::IsTrainingFight |
            Assessed::IsPettyFight
        )
        .Then(UAIEventResponse_SynchHostilesWithConflictGroupOfCharacter(EPerceptionCharacterType::SensedCharacter))
        .Then(UAIEventResponse_SwitchState(GameplayTag::AIState_Conflict_Warning_Interaction, EPerceptionCharacterType::AffectedCharacter, false));

    default Rules.Add(GameplayTag::AIEvent_ConflictAssessment)
        .EventDoesNotHaveTag(GameplayTag::AIConflictAssessment_FightingConflict)
        .EventHasTag(GameplayTag::AIState_Conflict_Warning_Lockpicking)
        .RequireFalse(
            Assessed::IsTrainingFight |
            Assessed::IsPettyFight
        )
        .Then(UAIEventResponse_SynchHostilesWithConflictGroupOfCharacter(EPerceptionCharacterType::SensedCharacter))
        .Then(UAIEventResponse_SwitchState(GameplayTag::AIState_Conflict_Warning_Lockpicking, EPerceptionCharacterType::AffectedCharacter, false));
    
    default Rules.Add(GameplayTag::AIEvent_ConflictAssessment)
        .EventDoesNotHaveTag(GameplayTag::AIConflictAssessment_FightingConflict)
        .EventHasTag(GameplayTag::AIState_Conflict_Warning_Theft)
        .RequireFalse(
            Assessed::IsTrainingFight |
            Assessed::IsPettyFight
        )
        .Then(UAIEventResponse_SynchHostilesWithConflictGroupOfCharacter(EPerceptionCharacterType::SensedCharacter))
        .Then(UAIEventResponse_SwitchState(GameplayTag::AIState_Conflict_Warning_Theft, EPerceptionCharacterType::AffectedCharacter, false));
    
    default Rules.Add(GameplayTag::AIEvent_ConflictAssessment)
        .EventDoesNotHaveTag(GameplayTag::AIConflictAssessment_FightingConflict)
        .EventHasTag(GameplayTag::AIState_Conflict_Warning_Pickpocket)
        .RequireFalse(
            Assessed::IsTrainingFight |
            Assessed::IsPettyFight
        )
        .Then(UAIEventResponse_SynchHostilesWithConflictGroupOfCharacter(EPerceptionCharacterType::SensedCharacter))
        .Then(UAIEventResponse_SwitchState(GameplayTag::AIState_Conflict_Warning_Pickpocket, EPerceptionCharacterType::AffectedCharacter, false));
    
    default Rules.Add(GameplayTag::AIEvent_ConflictAssessment)
        .EventDoesNotHaveTag(GameplayTag::AIConflictAssessment_FightingConflict)
        .EventHasTag(GameplayTag::AIState_Conflict_Warning_Threat)
        .RequireFalse(
            Assessed::IsTrainingFight |
            Assessed::IsPettyFight
        )
        .Then(UAIEventResponse_SynchHostilesWithConflictGroupOfCharacter(EPerceptionCharacterType::SensedCharacter))
        .Then(UAIEventResponse_SwitchState(GameplayTag::AIState_Conflict_Warning_Threat, EPerceptionCharacterType::AffectedCharacter, false));
}

class UAIARM_Human_JoinConflict_ToWarning_NotEnforcer : UAIARM_NoGuardNorLeaderRole
{
    default Rules.Add(GameplayTag::AIEvent_ConflictAssessment)
        .EventDoesNotHaveTag(GameplayTag::AIConflictAssessment_FightingConflict)
        .EventDoesNotHaveTag(GameplayTag::AIConflictAssessment_AlliedEnforcerPresent)
        .EventHasTag(GameplayTag::AIConflictAssessment_CombatFavorableForAllies)
        .EventHasTag(GameplayTag::AIState_Conflict_Warning_Trespassing)
        .RequireFalse(
            Assessed::IsTrainingFight |
            Assessed::IsPettyFight
        )
        .Then(UAIEventResponse_SynchHostilesWithConflictGroupOfCharacter(EPerceptionCharacterType::SensedCharacter))
        .Then(UAIEventResponse_SwitchState(GameplayTag::AIState_Conflict_Warning_Trespassing, EPerceptionCharacterType::AffectedCharacter, false));
    
    default Rules.Add(GameplayTag::AIEvent_ConflictAssessment)
        .EventDoesNotHaveTag(GameplayTag::AIConflictAssessment_FightingConflict)
        .EventDoesNotHaveTag(GameplayTag::AIConflictAssessment_AlliedEnforcerPresent)
        .EventHasTag(GameplayTag::AIConflictAssessment_CombatFavorableForAllies)
        .EventHasTag(GameplayTag::AIState_Conflict_Warning_NotWelcomeHere)
        .RequireFalse(
            Assessed::IsTrainingFight |
            Assessed::IsPettyFight
        )
        .Then(UAIEventResponse_SynchHostilesWithConflictGroupOfCharacter(EPerceptionCharacterType::SensedCharacter))
        .Then(UAIEventResponse_SwitchState(GameplayTag::AIState_Conflict_Warning_NotWelcomeHere, EPerceptionCharacterType::AffectedCharacter, false));
    
    default Rules.Add(GameplayTag::AIEvent_ConflictAssessment)
        .EventDoesNotHaveTag(GameplayTag::AIConflictAssessment_FightingConflict)
        .EventDoesNotHaveTag(GameplayTag::AIConflictAssessment_AlliedEnforcerPresent)
        .EventHasTag(GameplayTag::AIConflictAssessment_CombatFavorableForAllies)
        .EventHasTag(GameplayTag::AIState_Conflict_Warning_Interaction)
        .RequireFalse(
            Assessed::IsTrainingFight |
            Assessed::IsPettyFight
        )
        .Then(UAIEventResponse_SynchHostilesWithConflictGroupOfCharacter(EPerceptionCharacterType::SensedCharacter))
        .Then(UAIEventResponse_SwitchState(GameplayTag::AIState_Conflict_Warning_Interaction, EPerceptionCharacterType::AffectedCharacter, false));

    default Rules.Add(GameplayTag::AIEvent_ConflictAssessment)
        .EventDoesNotHaveTag(GameplayTag::AIConflictAssessment_FightingConflict)
        .EventDoesNotHaveTag(GameplayTag::AIConflictAssessment_AlliedEnforcerPresent)
        .EventHasTag(GameplayTag::AIConflictAssessment_CombatFavorableForAllies)
        .EventHasTag(GameplayTag::AIState_Conflict_Warning_Lockpicking)
        .RequireFalse(
            Assessed::IsTrainingFight |
            Assessed::IsPettyFight
        )
        .Then(UAIEventResponse_SynchHostilesWithConflictGroupOfCharacter(EPerceptionCharacterType::SensedCharacter))
        .Then(UAIEventResponse_SwitchState(GameplayTag::AIState_Conflict_Warning_Lockpicking, EPerceptionCharacterType::AffectedCharacter, false));
    
    default Rules.Add(GameplayTag::AIEvent_ConflictAssessment)
        .EventDoesNotHaveTag(GameplayTag::AIConflictAssessment_FightingConflict)
        .EventDoesNotHaveTag(GameplayTag::AIConflictAssessment_AlliedEnforcerPresent)
        .EventHasTag(GameplayTag::AIConflictAssessment_CombatFavorableForAllies)
        .EventHasTag(GameplayTag::AIState_Conflict_Warning_Theft)
        .RequireFalse(
            Assessed::IsTrainingFight |
            Assessed::IsPettyFight
        )
        .Then(UAIEventResponse_SynchHostilesWithConflictGroupOfCharacter(EPerceptionCharacterType::SensedCharacter))
        .Then(UAIEventResponse_SwitchState(GameplayTag::AIState_Conflict_Warning_Theft, EPerceptionCharacterType::AffectedCharacter, false));
    
    default Rules.Add(GameplayTag::AIEvent_ConflictAssessment)
        .EventDoesNotHaveTag(GameplayTag::AIConflictAssessment_FightingConflict)
        .EventDoesNotHaveTag(GameplayTag::AIConflictAssessment_AlliedEnforcerPresent)
        .EventHasTag(GameplayTag::AIConflictAssessment_CombatFavorableForAllies)
        .EventHasTag(GameplayTag::AIState_Conflict_Warning_Pickpocket)
        .RequireFalse(
            Assessed::IsTrainingFight |
            Assessed::IsPettyFight
        )
        .Then(UAIEventResponse_SynchHostilesWithConflictGroupOfCharacter(EPerceptionCharacterType::SensedCharacter))
        .Then(UAIEventResponse_SwitchState(GameplayTag::AIState_Conflict_Warning_Pickpocket, EPerceptionCharacterType::AffectedCharacter, false));
    
    default Rules.Add(GameplayTag::AIEvent_ConflictAssessment)
        .EventDoesNotHaveTag(GameplayTag::AIConflictAssessment_FightingConflict)
        .EventDoesNotHaveTag(GameplayTag::AIConflictAssessment_AlliedEnforcerPresent)
        .EventHasTag(GameplayTag::AIConflictAssessment_CombatFavorableForAllies)
        .EventHasTag(GameplayTag::AIState_Conflict_Warning_Threat)
        .RequireFalse(
            Assessed::IsTrainingFight |
            Assessed::IsPettyFight
        )
        .Then(UAIEventResponse_SynchHostilesWithConflictGroupOfCharacter(EPerceptionCharacterType::SensedCharacter))
        .Then(UAIEventResponse_SwitchState(GameplayTag::AIState_Conflict_Warning_Threat, EPerceptionCharacterType::AffectedCharacter, false));
}