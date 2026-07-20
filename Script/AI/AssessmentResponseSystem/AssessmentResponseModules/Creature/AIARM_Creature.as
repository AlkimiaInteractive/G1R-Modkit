class UAIARM_Creature : UAIARM_General_Base
{
    default SubModules.Add(UAIARM_ParalyzedEffects);
    default SubModules.Add(UAIARM_FearEffects);
        
    default SubModules.Add(UAIARM_Creature_ActiveResponse);
}    

class UAIARM_Creature_ActiveResponse : UAIARM_MainActiveResponse_Base
{
    default SubModules.Add(UAIARM_Creature_TestSimple);
    default SubModules.Add(UAIARM_Creature_Main);
    default SubModules.Add(UAIARM_ToFollowCharacter);
}

class UAIARM_Creature_TestSimple : UAIAssessmentResponseModule
{
    default RequireAnyOwnedTags.AddTag(GameplayTag::Combat_TestCharacterSimple);

    default SubModules.Add(UAIARM_TestCharacterSimple);
}

class UAIARM_Creature_Main : UAIAssessmentResponseModule
{
    default BlockIfAssessedHasAnyOwnedTags.AddTag(GameplayTag::Combat_TestCharacterSimple);

    // NOTE: Priority based on Order
    default SubModules.Add(UAIARM_TransformationPerceived);

    default SubModules.Add(UAIARM_Disengage);
    default SubModules.Add(UAIARM_Creature_AlwaysActive);
    default SubModules.Add(UAIARM_EndSearchOrCombat_Coward);

    default SubModules.Add(UAIARM_Creature_DialogueForceCombat);
    default SubModules.Add(UAIARM_DialogueMakeEnemy);
    default SubModules.Add(UAIARM_DialogueForceSightPerception);
    default SubModules.Add(UAIARM_DialogueForceHearingPerception);

    default SubModules.Add(UAIARM_Creature_JoinWarning);
    default SubModules.Add(UAIARM_Creature_JoinFriendlyOrProtectedInCombat);
    default SubModules.Add(UAIARM_Creature_ToInvestigateIdentifiedSound);
    default SubModules.Add(UAIARM_Creature_TurnToAttacker);
    default SubModules.Add(UAIARM_Creature_ToCombat);
    default SubModules.Add(UAIARM_Creature_ToWarning);

    default SubModules.Add(UAIARM_Creature_Search);
    default SubModules.Add(UAIARM_Creature_GetItem);

    default SubModules.Add(UAIARM_ReactToDefeatedCharacter_NotConflict);
    default SubModules.Add(UAIARM_ReactToDefeatedCharacter_Search);
    default SubModules.Add(UAIARM_Creature_ReactToCarcass_NotConflict);
    default SubModules.Add(UAIARM_Creature_ReactToCarcass_Search);
}


class UAIARM_Creature_AlwaysActive : UAIAssessmentResponseModule
{
    default BlockIfHasAnyOwnedTags.AddTag(GameplayTag::State_Ambush);
    
    default Rules.Add(GameplayTag::AIEvent_Seen_Enemy)
        .RequireTrue(
            Assessed::SensedIsPredator
        )
        .RequireFalse(
            Assessed::GroupCombatIsFavorableForAllies
        )
        .Then(UAIEventResponse_SwitchState(GameplayTag::AIState_Conflict_Flee_Predator, EPerceptionCharacterType::SensedCharacter));    

    default Rules.Add(GameplayTag::AIEvent_Smelled_Predator)
        .RequireTrue(
            Assessed::SensedIsPredator
        )
        .RequireFalse(
            Assessed::GroupCombatIsFavorableForAllies
        )
        .Then(UAIEventResponse_SwitchState(GameplayTag::AIState_Conflict_Flee_Predator, EPerceptionCharacterType::SensedCharacter));

    default Rules.Add(GameplayTag::AIEvent_Sensed_OtherKilled)
        .RequireTrue(
            Assessed::AffectedWasFriendly
        )
        .RequireFalse(
            Assessed::GroupCombatIsFavorableForAllies
        )
        .Then(UAIEventResponse_SwitchState(GameplayTag::AIState_Conflict_Flee_Predator, EPerceptionCharacterType::Instigator));
}

class UAIARM_Creature_ToCombat : UAIAssessmentResponseModule
{
    default BlockIfHasAnyOwnedTags.AddTag(GameplayTag::AIState_Conflict_Combat);
    default BlockIfHasAnyOwnedTags.AddTag(GameplayTag::Debuff_Fear);
    default BlockIfHasAnyOwnedTags.AddTag(GameplayTag::AIState_Conflict_Flee);
    default BlockIfHasAnyOwnedTags.AddTag(GameplayTag::AIState_Conflict_Flee_Predator);
    default BlockIfHasAnyOwnedTags.AddTag(GameplayTag::AIState_Conflict_Disengage);

    default BlockIfAssessedHasAnyOwnedTags.AddTag(GameplayTag::State_Perceptions_GetIgnored);

    default SubModules.Add(UAIARM_Creature_ToCombat_AttackOnOther);
    default SubModules.Add(UAIARM_Creature_ToCombat_OnSight);
    default SubModules.Add(UAIARM_Creature_ToCombat_FromDamagedSelf);
    default SubModules.Add(UAIARM_Creature_ToCombat_ToDamagedSelf);

    default Rules.Add(GameplayTag::AIEvent_Sensed_AmbushTarget)
        .RequireTrue(
            Assessed::GroupCombatIsFavorableForAllies |
            Assessed::IsSensedInSameTerritoryAsCharacter
        )
        .Then(UAIEventResponse_LeavePartyOf(EPerceptionCharacterType::SensedCharacter))
        .Then(UAIEventResponse_AddEnemyModifier(EPerceptionCharacterType::SensedCharacter))
        .Then(UAIEventResponse_SwitchState(GameplayTag::AIState_Conflict_Combat, EPerceptionCharacterType::SensedCharacter)
                .AddContextTag(GameplayTag::Action_Taunt));
    
    default Rules.Add(GameplayTag::AIEvent_Sensed_AmbushStarted)
        .RequireTrue(
            Assessed::GroupCombatIsFavorableForAllies |
            Assessed::IsSensedInSameTerritoryAsCharacter
        )
        .Then(UAIEventResponse_LeavePartyOf(EPerceptionCharacterType::Instigator))
        .Then(UAIEventResponse_AddEnemyModifier(EPerceptionCharacterType::Instigator))
        .Then(UAIEventResponse_SwitchState(GameplayTag::AIState_Conflict_Combat, EPerceptionCharacterType::Instigator));

    // Start fight with weapon    
    
    default Rules.Add(GameplayTag::AIEvent_Seen_Attacker)
        .RequireTrue(
            Assessed::AffectedIsSelf
        )
        .Then(UAIEventResponse_AddEnemyModifier(EPerceptionCharacterType::Instigator))
        .Then(UAIEventResponse_SwitchState(GameplayTag::AIState_Conflict_Combat, EPerceptionCharacterType::Instigator));
}

class UAIARM_Creature_ToCombat_OnSight : UAIAssessmentResponseModule
{
    default BlockIfHasAnyOwnedTags.AddTag(GameplayTag::State_Ambush);

    default Rules.Add(GameplayTag::AIEvent_Seen_Enemy)
        .RequireFalse(
            Assessed::SensedIsPredator
        )
        .RequireTrue(
            Assessed::IsSensedInSameTerritoryAsCharacter |
            Assessed::SensedWasEnemy
        )
        .Then(UAIEventResponse_LeavePartyOf(EPerceptionCharacterType::Instigator))
        .Then(UAIEventResponse_SwitchState(GameplayTag::AIState_Conflict_Combat, EPerceptionCharacterType::SensedCharacter)
                .AddContextTag(GameplayTag::Action_Taunt));
    
    default Rules.Add(GameplayTag::AIEvent_Seen_Enemy)
        .RequireTrue(
            Assessed::SensedIsPredator |
            Assessed::GroupCombatIsFavorableForAllies |
            Assessed::IsSensedInSameTerritoryAsCharacter
        )
        .Then(UAIEventResponse_LeavePartyOf(EPerceptionCharacterType::Instigator))
        .Then(UAIEventResponse_SwitchState(GameplayTag::AIState_Conflict_Combat, EPerceptionCharacterType::SensedCharacter)
                .AddContextTag(GameplayTag::Action_Taunt));
}

class UAIARM_Creature_ToCombat_AttackOnOther : UAIAssessmentResponseModule
{
    default BlockIfHasAnyOwnedTags.AddTag(GameplayTag::State_Ambush);

    default Rules.Add(GameplayTag::AIEvent_Sensed_Hit)
        .RequireTrue(
            Assessed::AffectedWasFriendly |
            Assessed::IsIntentionalAttack |
            Assessed::InstigatorIsWithWeapon |
            Assessed::IsInstigatorInSameTerritoryAsCharacter |
            Assessed::AwareOfInstigator
        )
        .RequireFalse(
            Assessed::AffectedIsSelf |
            Assessed::AffectedIsTrainingWithInstigator |
            Assessed::IsPettyFight |
            Assessed::IsTrainingFight
        )
        .Then(UAIEventResponse_AddEnemyModifier(EPerceptionCharacterType::Instigator))
        .Then(UAIEventResponse_LeavePartyOf(EPerceptionCharacterType::Instigator))
        .Then(UAIEventResponse_SwitchState(GameplayTag::AIState_Conflict_Combat, EPerceptionCharacterType::Instigator));

    default Rules.Add(GameplayTag::AIEvent_Seen_AttackHit_OnOther)
        .RequireTrue(
            Assessed::AwareOfInstigator |
            Assessed::AffectedWasFriendly |
            Assessed::IsInstigatorInSameTerritoryAsCharacter
        )
        .Then(UAIEventResponse_AddEnemyModifier(EPerceptionCharacterType::Instigator))
        .Then(UAIEventResponse_SwitchState(GameplayTag::AIState_Conflict_Combat, EPerceptionCharacterType::Instigator));

    default Rules.Add(GameplayTag::AIEvent_Seen_Attacker)
        .RequireTrue(
            Assessed::AffectedWasFriendly
        )
        .RequireFalse(
            Assessed::AffectedIsSelf
        )
        .Then(UAIEventResponse_AddEnemyModifier(EPerceptionCharacterType::Instigator))
        .Then(UAIEventResponse_SwitchState(GameplayTag::AIState_Conflict_Combat, EPerceptionCharacterType::Instigator));
}

class UAIARM_Creature_ToCombat_FromDamagedSelf : UAIAssessmentResponseModule
{
    default RequireAnyOwnedTags.AddTag(GameplayTag::AIState_Conflict_ReactToTakingDamage);
    default BlockIfHasAnyOwnedTags.AddTag(GameplayTag::AIState_Conflict_Flee);
    default BlockIfHasAnyOwnedTags.AddTag(GameplayTag::AIState_Conflict_Flee_Predator);

    // Start fight with weapon
    default Rules.Add(GameplayTag::AIEvent_Sensed_Hit)
        .RequireTrue(
            Assessed::IsIntentionalAttack |
            Assessed::AwareOfInstigator | 
            Assessed::IsInstigatorInSameTerritoryAsCharacter
        )
        .RequireFalse(
            Assessed::SelfIsTrainingWithInstigator |
            Assessed::IsPettyFight |
            Assessed::IsTrainingFight
        )
        .Then(UAIEventResponse_AddEnemyModifier(EPerceptionCharacterType::Instigator))
        .Then(UAIEventResponse_LeavePartyOf(EPerceptionCharacterType::Instigator))
        .Then(UAIEventResponse_SwitchState(GameplayTag::AIState_Conflict_Combat, EPerceptionCharacterType::Instigator));

    // Start fight on incoming attack
    default Rules.Add(GameplayTag::AIEvent_Seen_IncomingAttack_OnSelf)
        .RequireTrue(
            Assessed::IsIntentionalAttack |
            Assessed::IsInstigatorInSameTerritoryAsCharacter
        )
        .RequireFalse(
            Assessed::SelfIsTrainingWithInstigator |
            Assessed::IsPettyFight |
            Assessed::IsTrainingFight
        )
        .Then(UAIEventResponse_AddEnemyModifier(EPerceptionCharacterType::Instigator))
        .Then(UAIEventResponse_LeavePartyOf(EPerceptionCharacterType::Instigator))
        .Then(UAIEventResponse_SwitchState(GameplayTag::AIState_Conflict_Combat, EPerceptionCharacterType::Instigator));

    default Rules.Add(GameplayTag::AIEvent_Seen_IncomingAttack_OnSelf)
        .RequireFalse(
            Assessed::IsInPartyWithInstigator
        )
        .RequireTrue(
            Assessed::IsInstigatorInSameTerritoryAsCharacter
        )
        .Then(UAIEventResponse_SwitchState(GameplayTag::AIState_Conflict_Combat, EPerceptionCharacterType::Instigator));
}

class UAIARM_Creature_ToCombat_ToDamagedSelf : UAIAssessmentResponseModule
{
    default BlockIfHasAnyOwnedTags.AddTag(GameplayTag::AIState_Conflict_ReactToTakingDamage);
    default BlockIfHasAnyOwnedTags.AddTag(GameplayTag::AIState_Conflict_Flee);
    default BlockIfHasAnyOwnedTags.AddTag(GameplayTag::AIState_Conflict_Flee_Predator);

    // Start fight with weapon
    default Rules.Add(GameplayTag::AIEvent_Sensed_Hit)
        .RequireTrue(
            Assessed::AffectedIsSelf
        )
        .RequireFalse(
            Assessed::SelfIsTrainingWithInstigator |
            Assessed::IsPettyFight |
            Assessed::IsTrainingFight
        )
        .Then(UAIEventResponse_SwitchState(GameplayTag::AIState_Conflict_ReactToTakingDamage, EPerceptionCharacterType::None));

    // Start fight on incoming attack
    default Rules.Add(GameplayTag::AIEvent_Seen_IncomingAttack_OnSelf)
        .RequireTrue(
            Assessed::IsIntentionalAttack |
            Assessed::InstigatorIsWithWeapon
        )
        .RequireFalse(
            Assessed::SelfIsTrainingWithInstigator |
            Assessed::IsPettyFight |
            Assessed::IsTrainingFight
        )
        .Then(UAIEventResponse_SwitchState(GameplayTag::AIState_Conflict_ReactToTakingDamage, EPerceptionCharacterType::None));

    default Rules.Add(GameplayTag::AIEvent_Seen_IncomingAttack_OnSelf)
        .RequireFalse(
            Assessed::IsInPartyWithInstigator
        )
        .Then(UAIEventResponse_SwitchState(GameplayTag::AIState_Conflict_ReactToTakingDamage, EPerceptionCharacterType::None));
}

class UAIARM_Creature_ToWarning : UAIAssessmentResponseModule
{
    default BlockIfHasAnyOwnedTags.AddTag(GameplayTag::AIState_Conflict_Warning);
    default BlockIfHasAnyOwnedTags.AddTag(GameplayTag::AIState_Conflict_Combat);
    default BlockIfHasAnyOwnedTags.AddTag(GameplayTag::Debuff_Fear);
    default BlockIfHasAnyOwnedTags.AddTag(GameplayTag::AIState_Conflict_Flee);
    default BlockIfHasAnyOwnedTags.AddTag(GameplayTag::AIState_Conflict_Disengage);
    default BlockIfHasAnyOwnedTags.AddTag(GameplayTag::AIState_Conflict_TurnToAttacker);
    default BlockIfHasAnyOwnedTags.AddTag(GameplayTag::State_Ambush);

    default BlockIfAssessedHasAnyOwnedTags.AddTag(GameplayTag::State_Perceptions_GetIgnored);

    default Rules.Add(GameplayTag::AIEvent_Seen_Hostile_Enter_WarningRange)
        .RequireTrue(
            Assessed::IsSensedInSameTerritoryAsCharacter
        )
        .Then(UAIEventResponse_SwitchState(GameplayTag::AIState_Conflict_Warning_Threat, EPerceptionCharacterType::SensedCharacter));

}

class UAIARM_Creature_Search : UAIAssessmentResponseModule
{
    default BlockIfHasAnyOwnedTags.AddTag(GameplayTag::AIState_Conflict_Warning);
    default BlockIfHasAnyOwnedTags.AddTag(GameplayTag::AIState_Conflict_Combat);
    default BlockIfHasAnyOwnedTags.AddTag(GameplayTag::Debuff_Fear);
    default BlockIfHasAnyOwnedTags.AddTag(GameplayTag::AIState_Conflict_Flee);
    default BlockIfHasAnyOwnedTags.AddTag(GameplayTag::AIState_Conflict_Disengage);
    default BlockIfHasAnyOwnedTags.AddTag(GameplayTag::State_Ambush);

    default BlockIfAssessedHasAnyOwnedTags.AddTag(GameplayTag::State_Perceptions_GetIgnored);

    default Rules.Add(GameplayTag::AIEvent_Smelled_Character)
        .RequireTrue(
            Assessed::IsSensedInSameTerritoryAsCharacter
        )
        .Then(UAIEventResponse_SwitchStateWithConflictType(GameplayTag::AIState_Conflict_IdentifySmell, EPerceptionCharacterType::SensedCharacter, EConflictType::None));
}

class UAIARM_Creature_GetItem : UAIAssessmentResponseModule
{
    default BlockIfHasAnyOwnedTags.AddTag(GameplayTag::AIState_Conflict_Combat);
    default BlockIfHasAnyOwnedTags.AddTag(GameplayTag::Debuff_Fear);
    default BlockIfHasAnyOwnedTags.AddTag(GameplayTag::AIState_Conflict_Flee);
    default BlockIfHasAnyOwnedTags.AddTag(GameplayTag::AIState_Conflict_Disengage);
    default BlockIfHasAnyOwnedTags.AddTag(GameplayTag::State_CantBeDistracted);
    default BlockIfHasAnyOwnedTags.AddTag(GameplayTag::State_Ambush);

    default SubModules.Add(UAIARM_Creature_GetItem_Identify);

    default Rules.Add(GameplayTag::AIEvent_Seen_Meatbug)
        .Then(UAIEventResponse_SwitchState(GameplayTag::AIState_InteractWithItem_Meatbug, EPerceptionCharacterType::None));

    default Rules.Add(GameplayTag::AIEvent_Seen_Item_Food)
        .Then(UAIEventResponse_SwitchState(GameplayTag::AIState_InteractWithItem_Eat, EPerceptionCharacterType::None));
    
    default Rules.Add(GameplayTag::AIEvent_Seen_Item_Valuable)
        .Then(UAIEventResponse_SwitchState(GameplayTag::AIState_InteractWithItem_PickUp, EPerceptionCharacterType::None));
}

class UAIARM_Creature_GetItem_Identify : UAIAssessmentResponseModule
{
    default BlockIfHasAnyOwnedTags.AddTag(GameplayTag::AIState_InteractWithItem);

    default Rules.Add(GameplayTag::AIEvent_Smelled_Item_Food)
        .Then(UAIEventResponse_SwitchState(GameplayTag::AIState_IdentifySmell, EPerceptionCharacterType::None));
    
    default Rules.Add(GameplayTag::AIEvent_Heard_Noise_Item)
        .Then(UAIEventResponse_SwitchState(GameplayTag::AIState_InvestigateSound_Item, EPerceptionCharacterType::None));
}

class UAIARM_Creature_ToInvestigateIdentifiedSound : UAIAssessmentResponseModule
{
    default BlockIfHasAnyOwnedTags.AddTag(GameplayTag::AIState_Conflict_Combat);
    default BlockIfHasAnyOwnedTags.AddTag(GameplayTag::AIState_Conflict_Warning);
    default BlockIfHasAnyOwnedTags.AddTag(GameplayTag::Debuff_Fear);
    default BlockIfHasAnyOwnedTags.AddTag(GameplayTag::AIState_Conflict_Flee);
    default BlockIfHasAnyOwnedTags.AddTag(GameplayTag::AIState_Conflict_Disengage);
    default BlockIfHasAnyOwnedTags.AddTag(GameplayTag::AIState_Conflict_Search);
    default BlockIfHasAnyOwnedTags.AddTag(GameplayTag::AIState_Conflict_InvestigateIdentifiedSound);
    default BlockIfHasAnyOwnedTags.AddTag(GameplayTag::State_Ambush);

    default Rules.Add(GameplayTag::AIEvent_Heard_Enemy)
        .RequireTrue(
            Assessed::IsSensedInSameTerritoryAsCharacter
        )
        .Then(UAIEventResponse_SwitchStateWithConflictType(GameplayTag::AIState_Conflict_InvestigateIdentifiedSound, EPerceptionCharacterType::SensedCharacter, EConflictType::None));

    default Rules.Add(GameplayTag::AIEvent_Heard_Hostile)
        .RequireTrue(
            Assessed::IsSensedInSameTerritoryAsCharacter
        )
        .Then(UAIEventResponse_SwitchStateWithConflictType(GameplayTag::AIState_Conflict_InvestigateIdentifiedSound, EPerceptionCharacterType::SensedCharacter, EConflictType::None));
}

class UAIARM_Creature_TurnToAttacker : UAIARM_TurnToAttacker_Base
{
    default BlockIfHasAnyOwnedTags.AddTag(GameplayTag::AIState_Conflict_Flee);
    default BlockIfHasAnyOwnedTags.AddTag(GameplayTag::AIState_Conflict_Flee_Predator);

    default SubModules.Add(UAIARM_Creature_ToTurnToAttacker_AffectedIsOther);
    default SubModules.Add(UAIARM_Creature_ToTurnToAttacker_FromDamagedSelf);
    default SubModules.Add(UAIARM_Creature_ToTurnToAttacker_ToDamagedSelf);
}

class UAIARM_Creature_ToTurnToAttacker_AffectedIsOther : UAIAssessmentResponseModule
{
    default BlockIfHasAnyOwnedTags.AddTag(GameplayTag::State_Ambush);

    default Rules.Add(GameplayTag::AIEvent_Sensed_Hit)
        .RequireTrue(
            Assessed::AffectedWasFriendly |
            Assessed::IsInstigatorInSameTerritoryAsCharacter
        )
        .RequireFalse(
            Assessed::AwareOfInstigator |
            Assessed::AffectedIsSelf
        )
        .Then(UAIEventResponse_SwitchState(GameplayTag::AIState_Conflict_TurnToAttacker, EPerceptionCharacterType::Instigator));

    default Rules.Add(GameplayTag::AIEvent_Sensed_Hit)
        .RequireTrue(
            Assessed::InstigatorWasEnemy |
            Assessed::IsInstigatorInSameTerritoryAsCharacter
        )
        .RequireFalse(
            Assessed::AwareOfInstigator |
            Assessed::AffectedIsSelf
        )
        .Then(UAIEventResponse_SwitchState(GameplayTag::AIState_Conflict_TurnToAttacker, EPerceptionCharacterType::Instigator));
}

class UAIARM_Creature_ToTurnToAttacker_FromDamagedSelf : UAIAssessmentResponseModule
{
    default RequiredOwnedTags.AddTag(GameplayTag::AIState_Conflict_ReactToTakingDamage);

    default Rules.Add(GameplayTag::AIEvent_Sensed_Hit)
        .RequireTrue(
            Assessed::IsInstigatorInSameTerritoryAsCharacter
        )
        .RequireFalse(
            Assessed::AwareOfInstigator
        )
        .Then(UAIEventResponse_SwitchState(GameplayTag::AIState_Conflict_TurnToAttacker, EPerceptionCharacterType::Instigator));
   
    default Rules.Add(GameplayTag::AIEvent_Sensed_Hit)
        .RequireTrue(
            Assessed::AwareOfInstigator
        )
        .RequireFalse(
              Assessed::IsInstigatorInSameTerritoryAsCharacter
        )
        .Then(UAIEventResponse_SwitchState(GameplayTag::AIState_Conflict_TurnToAttacker, EPerceptionCharacterType::Instigator));
}

class UAIARM_Creature_ToTurnToAttacker_ToDamagedSelf : UAIAssessmentResponseModule
{
    default BlockIfHasAnyOwnedTags.AddTag(GameplayTag::AIState_Conflict_ReactToTakingDamage);
    default BlockIfHasAnyOwnedTags.AddTag(GameplayTag::AIState_Conflict_Combat);
    default BlockIfHasAnyOwnedTags.AddTag(GameplayTag::AIState_Conflict_Flee);
    default BlockIfHasAnyOwnedTags.AddTag(GameplayTag::AIState_Conflict_Flee_Predator);

    default Rules.Add(GameplayTag::AIEvent_Sensed_Hit)
        .RequireTrue(
            Assessed::AffectedIsSelf
        )
        .Then(UAIEventResponse_SwitchState(GameplayTag::AIState_Conflict_ReactToTakingDamage, EPerceptionCharacterType::Instigator));
}


class UAIARM_Creature_JoinWarning : UAIAssessmentResponseModule
{
    default BlockIfHasAnyOwnedTags.AddTag(GameplayTag::AIState_Conflict);
    default BlockIfHasAnyOwnedTags.AddTag(GameplayTag::State_Ambush);

    default Rules.Add(GameplayTag::AIEvent_Sensed_Warning)
        .RequireTrue(
            Assessed::SensedWasEnemy |
            Assessed::IsSensedInSameTerritoryAsCharacter
        )
        .Then(UAIEventResponse_SwitchStateWithConflictType(GameplayTag::AIState_Conflict_InvestigateIdentifiedSound, EPerceptionCharacterType::SensedCharactersTarget, EConflictType::None));
    
    default Rules.Add(GameplayTag::AIEvent_Sensed_Warning)
        .RequireTrue(
            Assessed::SensedWasHostile |
            Assessed::IsSensedInSameTerritoryAsCharacter
        )
        .Then(UAIEventResponse_SwitchStateWithConflictType(GameplayTag::AIState_Conflict_InvestigateIdentifiedSound, EPerceptionCharacterType::SensedCharactersTarget, EConflictType::None));
    
    default Rules.Add(GameplayTag::AIEvent_Sensed_Warning)
        .RequireTrue(
            Assessed::SensedIsFriendly |
            Assessed::IsSensedInSameTerritoryAsCharacter
        )
        .Then(UAIEventResponse_SynchronizeAwareness(EPerceptionCharacterType::SensedCharacter));
}