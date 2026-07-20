UCLASS()
class UAIARM_TestCharacterSimple : UAIAssessmentResponseModule
{
    default SubModules.Add(UAIARM_TestCharacterSimple_ToCombat);

    default Rules.Add(GameplayTag::AIEvent_Sensed_Defeated)
        .RequireTrue(
            Assessed::AffectedIsSelf | 
            Assessed::InstigatorWasEnemy)
        .RequireFalse(
            Assessed::SelfIsTrainingWithAffected |
            Assessed::InstigatorIsStrongerThanSelf |
            Assessed::IsPettyFight |
            Assessed::IsTrainingFight
        )
        .Then(UAIEventResponse_VoiceReaction(GameplayTag::Sound_Voice_Reaction_Combat_Beaten_YoullBeSorryForThis, EPerceptionCharacterType::Instigator, false));
}

UCLASS()
class UAIARM_TestCharacterSimple_ToCombat : UAIAssessmentResponseModule
{
    default BlockIfHasAnyOwnedTags.AddTag(GameplayTag::AIState_Conflict_Combat);

    default Rules.Add(GameplayTag::AIEvent_Seen_Player)
        .Then(UAIEventResponse_AddEnemyModifier(EPerceptionCharacterType::SensedCharacter))
        .Then(UAIEventResponse_LeavePartyOf(EPerceptionCharacterType::SensedCharacter))
        .Then(UAIEventResponse_SwitchState(GameplayTag::AIState_Conflict_Combat, EPerceptionCharacterType::SensedCharacter));
    
    default Rules.Add(GameplayTag::AIEvent_Seen_Enemy)
        .Then(UAIEventResponse_LeavePartyOf(EPerceptionCharacterType::SensedCharacter))
        .Then(UAIEventResponse_SwitchState(GameplayTag::AIState_Conflict_Combat, EPerceptionCharacterType::SensedCharacter));
}

UCLASS()
class UAIARM_CombatAnimationTesting : UAIAssessmentResponseModule
{
    default BlockIfHasAnyOwnedTags.AddTag(GameplayTag::AIState_Conflict_Combat);

    default Rules.Add(GameplayTag::AIEvent_Seen_Player)
        .Then(UAIEventResponse_AddEnemyModifier(EPerceptionCharacterType::SensedCharacter))
        .Then(UAIEventResponse_LeavePartyOf(EPerceptionCharacterType::SensedCharacter))
        .Then(UAIEventResponse_SwitchState(GameplayTag::AIState_Conflict_Combat, EPerceptionCharacterType::SensedCharacter));
    
    default Rules.Add(GameplayTag::AIEvent_Seen_Enemy)
        .Then(UAIEventResponse_LeavePartyOf(EPerceptionCharacterType::SensedCharacter))
        .Then(UAIEventResponse_SwitchState(GameplayTag::AIState_Conflict_Combat, EPerceptionCharacterType::SensedCharacter));
}