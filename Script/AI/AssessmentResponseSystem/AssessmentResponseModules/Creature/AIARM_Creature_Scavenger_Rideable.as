class UAIARM_Creature_Scavenger_Rideable : UAIAssessmentResponseModule
{
    default SubModules.Add(UAIARM_ParalyzedEffects);
    default SubModules.Add(UAIARM_FearEffects);
        
    default SubModules.Add(UAIARM_Creature_TestSimple);
    default SubModules.Add(UAIARM_Creature_Main_Scavenger_Rideable);
}


class UAIARM_Creature_Main_Scavenger_Rideable : UAIAssessmentResponseModule
{
    default BlockIfAssessedHasAnyOwnedTags.AddTag(GameplayTag::Combat_TestCharacterSimple);

    default SubModules.Add(UAIARM_Creature_AlwaysActive);
    default SubModules.Add(UAIARM_EndSearchOrCombat_Coward);
    default SubModules.Add(UAIARM_Creature_ToInvestigateIdentifiedSound);
    default SubModules.Add(UAIARM_Creature_TurnToAttacker);

    default SubModules.Add(UAIARM_Creature_Flee_Scavenger_Rideable);

    default SubModules.Add(UAIARM_Creature_Search);
    default SubModules.Add(UAIARM_Creature_GetItem);
    default SubModules.Add(UAIARM_ReactToDefeatedCharacter_NotConflict);
    default SubModules.Add(UAIARM_ReactToDefeatedCharacter_Search);
    default SubModules.Add(UAIARM_Creature_ReactToCarcass_NotConflict);
    default SubModules.Add(UAIARM_Creature_ReactToCarcass_Search);
}

class UAIARM_Creature_Flee_Scavenger_Rideable : UAIAssessmentResponseModule
{
    default BlockIfHasAnyOwnedTags.AddTag(GameplayTag::AIState_Conflict_Combat);
    default BlockIfHasAnyOwnedTags.AddTag(GameplayTag::Debuff_Fear);
    default BlockIfHasAnyOwnedTags.AddTag(GameplayTag::AIState_Conflict_Flee);

    // Start fight with weapon
    default Rules.Add(GameplayTag::AIEvent_Sensed_Hit_OnSelf)
        .RequireTrue(
            Assessed::AwareOfInstigator
        )
        .Then(UAIEventResponse_AddEnemyModifier(EPerceptionCharacterType::Instigator))
        .Then(UAIEventResponse_LeavePartyOf(EPerceptionCharacterType::Instigator))
        .Then(UAIEventResponse_SwitchState(GameplayTag::AIState_Conflict_Fear, EPerceptionCharacterType::Instigator));

    default Rules.Add(GameplayTag::AIEvent_Seen_Enemy)
        .RequireTrue(
            Assessed::SensedWasEnemy
        )
        .Then(UAIEventResponse_LeavePartyOf(EPerceptionCharacterType::Instigator))
        .Then(UAIEventResponse_SwitchState(GameplayTag::AIState_Conflict_Fear, EPerceptionCharacterType::SensedCharacter));

   // default Rules.Add(GameplayTag::AIEvent_Seen_AttackHit_OnOther)
   //     .RequireTrue(
   //         Assessed::AwareOfInstigator |
   //         Assessed::AffectedWasFriendly
   //     )
   //     .Then(UAIEventResponse_AddEnemyModifier(EPerceptionCharacterType::Instigator))
   //     .Then(UAIEventResponse_SwitchState(GameplayTag::AIState_Conflict_Fear, EPerceptionCharacterType::Instigator));
//
   // default Rules.Add(GameplayTag::AIEvent_Seen_Attacker)
   //     .RequireTrue(
   //         Assessed::AffectedWasFriendly
   //     )
   //     .RequireFalse(
   //         Assessed::AffectedIsSelf
   //     )
   //     .Then(UAIEventResponse_AddEnemyModifier(EPerceptionCharacterType::Instigator))
   //     .Then(UAIEventResponse_SwitchState(GameplayTag::AIState_Conflict_Fear, EPerceptionCharacterType::Instigator));
}