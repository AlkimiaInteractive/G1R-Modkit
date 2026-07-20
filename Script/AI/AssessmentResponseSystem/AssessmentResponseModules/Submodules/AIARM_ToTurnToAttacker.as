UCLASS(Abstract)
class UAIARM_TurnToAttacker_Base : UAIAssessmentResponseModule
{
    default BlockIfHasAnyOwnedTags.AddTag(GameplayTag::AIState_Conflict_Combat);
    default BlockIfHasAnyOwnedTags.AddTag(GameplayTag::AIState_Conflict_TurnToAttacker);
    default BlockIfHasAnyOwnedTags.AddTag(GameplayTag::Debuff_Fear);
    default BlockIfHasAnyOwnedTags.AddTag(GameplayTag::Debuff_Sleep);
    default BlockIfHasAnyOwnedTags.AddTag(GameplayTag::Debuff_Charm);
    default BlockIfHasAnyOwnedTags.AddTag(GameplayTag::AIState_Conflict_Fear);
    default BlockIfHasAnyOwnedTags.AddTag(GameplayTag::AIState_Conflict_Flee);
    default BlockIfHasAnyOwnedTags.AddTag(GameplayTag::AIState_Conflict_Disengage);
    default BlockIfHasAnyOwnedTags.AddTag(GameplayTag::AIState_MagicSleep);
    default BlockIfHasAnyOwnedTags.AddTag(GameplayTag::AIState_Charmed);
    default BlockIfHasAnyOwnedTags.AddTag(GameplayTag::Debuff_Paralyzed);
    default BlockIfHasAnyOwnedTags.AddTag(GameplayTag::Debuff_Defeated);
    default BlockIfHasAnyOwnedTags.AddTag(GameplayTag::State_Defeated);

    default SubModules.Add(UAIARM_TurnToAttacker_FromDamagedSelf);
    default SubModules.Add(UAIARM_TurnToAttacker_ToDamagedSelf);
}

class UAIARM_TurnToAttacker_FromDamagedSelf : UAIAssessmentResponseModule
{
    default RequireAnyOwnedTags.AddTag(GameplayTag::AIState_Conflict_ReactToTakingDamage);

    default Rules.Add(GameplayTag::AIEvent_Sensed_Hit)
        .RequireFalse(
            Assessed::AwareOfInstigator
        )
        .Then(UAIEventResponse_SwitchState(GameplayTag::AIState_Conflict_TurnToAttacker, EPerceptionCharacterType::Instigator));
}

class UAIARM_TurnToAttacker_ToDamagedSelf : UAIAssessmentResponseModule
{
    default BlockIfHasAnyOwnedTags.AddTag(GameplayTag::AIState_Conflict_ReactToTakingDamage);

    default Rules.Add(GameplayTag::AIEvent_Sensed_Hit)
        .RequireTrue(
            Assessed::AffectedIsSelf
        )
        .RequireFalse(
            Assessed::AwareOfInstigator
        )
        .Then(UAIEventResponse_SwitchState(GameplayTag::AIState_Conflict_ReactToTakingDamage, EPerceptionCharacterType::Instigator));
}

class UAIARM_TurnToAttacker : UAIARM_TurnToAttacker_Base
{
    default BlockIfHasAnyOwnedTags.AddTag(GameplayTag::Combat_TestCharacterSimple);
    
    default BlockIfAssessedHasAnyOwnedTags.AddTag(GameplayTag::State_IgnorePerceptions);
 
    ///// AFFECTED WAS FRIENDLY

    // Turn to attacker of friendly when out of combat
    default Rules.Add(GameplayTag::AIEvent_Seen_AttackHit_OnOther)
        .RequireTrue(
            Assessed::AffectedWasFriendly
        )
        .RequireFalse(
            Assessed::AwareOfInstigator |
            Assessed::AffectedIsSelf |
            Assessed::SelfIsTrainingWithInstigator |
            Assessed::SelfIsTrainingWithAffected |
            Assessed::AffectedIsTrainingWithInstigator
        )
        .Then(UAIEventResponse_SwitchState(GameplayTag::AIState_Conflict_TurnToAttacker, EPerceptionCharacterType::Instigator));

    default Rules.Add(GameplayTag::AIEvent_Seen_AttackHit_OnOther)
        .RequireTrue(
            Assessed::AffectedWasFriendly |
            Assessed::SelfIsTrainingWithInstigator |
            Assessed::SelfIsTrainingWithAffected |
            Assessed::AffectedIsTrainingWithInstigator
        )
        .RequireFalse(
            Assessed::AwareOfInstigator |
            Assessed::AffectedIsSelf
        )
        .Then(UAIEventResponse_SwitchState(GameplayTag::AIState_Conflict_TurnToAttacker, EPerceptionCharacterType::Instigator));

    default Rules.Add(GameplayTag::AIEvent_Seen_AttackHit_OnOther)
        .RequireTrue(
            Assessed::AffectedWasFriendly |
            Assessed::SelfIsTrainingWithInstigator |
            Assessed::IsIntentionalAttack
        )
        .RequireFalse(
            Assessed::AwareOfInstigator |
            Assessed::AffectedIsSelf |
            Assessed::SelfIsTrainingWithAffected |
            Assessed::AffectedIsTrainingWithInstigator
        )
        .Then(UAIEventResponse_SwitchState(GameplayTag::AIState_Conflict_TurnToAttacker, EPerceptionCharacterType::Instigator));

    default Rules.Add(GameplayTag::AIEvent_Seen_AttackHit_OnOther)
        .RequireTrue(
            Assessed::AffectedWasFriendly |
            Assessed::SelfIsTrainingWithInstigator |
            Assessed::IsTooManyUnintentionalHits
        )
        .RequireFalse(
            Assessed::AwareOfInstigator |
            Assessed::AffectedIsSelf |
            Assessed::SelfIsTrainingWithAffected |
            Assessed::AffectedIsTrainingWithInstigator
        )
        .Then(UAIEventResponse_SwitchState(GameplayTag::AIState_Conflict_TurnToAttacker, EPerceptionCharacterType::Instigator));

    ///// AFFECTED HAS PROTECTED_FROM_NON_FRIENDLIES
    
    // Turn to attacker of friendly when out of combat
    default Rules.Add(GameplayTag::AIEvent_Seen_AttackHit_OnOther)
        .RequireTrue(
            Assessed::AffectedIsProtected
        )
        .RequireFalse(
            Assessed::AwareOfInstigator |
            Assessed::AffectedIsSelf |
            Assessed::SelfIsTrainingWithInstigator |
            Assessed::SelfIsTrainingWithAffected |
            Assessed::AffectedIsTrainingWithInstigator
        )
        .Then(UAIEventResponse_SwitchState(GameplayTag::AIState_Conflict_TurnToAttacker, EPerceptionCharacterType::Instigator));

    default Rules.Add(GameplayTag::AIEvent_Seen_AttackHit_OnOther)
        .RequireTrue(
            Assessed::AffectedIsProtected |
            Assessed::SelfIsTrainingWithInstigator |
            Assessed::SelfIsTrainingWithAffected |
            Assessed::AffectedIsTrainingWithInstigator
        )
        .RequireFalse(
            Assessed::AwareOfInstigator |
            Assessed::AffectedIsSelf
        )
        .Then(UAIEventResponse_SwitchState(GameplayTag::AIState_Conflict_TurnToAttacker, EPerceptionCharacterType::Instigator));

    default Rules.Add(GameplayTag::AIEvent_Seen_AttackHit_OnOther)
        .RequireTrue(
            Assessed::AffectedIsProtected |
            Assessed::SelfIsTrainingWithInstigator |
            Assessed::IsIntentionalAttack
        )
        .RequireFalse(
            Assessed::AwareOfInstigator |
            Assessed::AffectedIsSelf |
            Assessed::SelfIsTrainingWithAffected |
            Assessed::AffectedIsTrainingWithInstigator
        )
        .Then(UAIEventResponse_SwitchState(GameplayTag::AIState_Conflict_TurnToAttacker, EPerceptionCharacterType::Instigator));

    default Rules.Add(GameplayTag::AIEvent_Seen_AttackHit_OnOther)
        .RequireTrue(
            Assessed::AffectedIsProtected |
            Assessed::SelfIsTrainingWithInstigator |
            Assessed::IsTooManyUnintentionalHits
        )
        .RequireFalse(
            Assessed::AwareOfInstigator |
            Assessed::AffectedIsSelf |
            Assessed::SelfIsTrainingWithAffected |
            Assessed::AffectedIsTrainingWithInstigator
        )
        .Then(UAIEventResponse_SwitchState(GameplayTag::AIState_Conflict_TurnToAttacker, EPerceptionCharacterType::Instigator));
}