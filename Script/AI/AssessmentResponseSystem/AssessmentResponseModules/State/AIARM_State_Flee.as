class UAIARM_State_FleeUnreachableEnemy : UAIAssessmentResponseModule
{
    default SubModules.Add(UAIARM_State_EndFlee);

    // default Rules.Add(GameplayTag::AIEvent_Seen_Enemy)
    //     .RequireFalse(
    //         Assessed::SensedIsReachable
    //     )
    //     .Then(UAIEventResponse_NoStateSwitch());
    
    default Rules.Add(GameplayTag::AIEvent_Seen_Enemy)
        .RequireTrue(
            Assessed::SensedIsReachable |
            Assessed::SensedWasEnemy
        )
        .RequireFalse(
            Assessed::SensedIsStrongerThanSelf
        )
        .Then(UAIEventResponse_LeavePartyOf(EPerceptionCharacterType::SensedCharacter))
        .Then(UAIEventResponse_SwitchState(GameplayTag::AIState_Conflict_Combat, EPerceptionCharacterType::SensedCharacter));
}

class UAIARM_State_EndFlee : UAIAssessmentResponseModule
{
    default SubModules.Add(UAIARM_State_Flee_OnHitToCombat);

    default Rules.Add(GameplayTag::AIEvent_State_Done)
        .Then(UAIEventResponse_SwitchState(GameplayTag::AIState_AssessGoToDailyRoutine, EPerceptionCharacterType::None));
}

// Only leave flee for combat when truly stuck. Do not switch on hit/incoming attack so creatures with space to run keep fleeing.
class UAIARM_State_Flee_OnHitToCombat : UAIAssessmentResponseModule
{
    default BlockIfHasAnyOwnedTags.AddTag(GameplayTag::Species_Creature_Scavenger_Adult_Rideable);
    
    default RequireAnyOwnedTags.AddTag(GameplayTag::AIState_Conflict_Flee);
    default RequireAnyOwnedTags.AddTag(GameplayTag::AIState_Conflict_Flee_Predator);

    default Rules.Add(GameplayTag::AIEvent_Sensed_Hit)
        .RequireTrue(Assessed::AffectedIsSelf)
        .Then(UAIEventResponse_NoStateSwitch());

    default Rules.Add(GameplayTag::AIEvent_FleeStuck)
        .Then(UAIEventResponse_AddEnemyModifier(EPerceptionCharacterType::Instigator))
        .Then(UAIEventResponse_LeavePartyOf(EPerceptionCharacterType::Instigator))
        .Then(UAIEventResponse_SwitchState(GameplayTag::AIState_Conflict_Combat, EPerceptionCharacterType::Instigator));
}