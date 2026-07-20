UCLASS()
class UAIARM_SleeperDream : UAIAssessmentResponseModule
{
    default SubModules.Add(UAIARM_SleeperDream_ToCombat);

    default Rules.Add(GameplayTag::AIEvent_Sensed_Hit_OnSelf)
        .Then(UAIEventResponse_VoiceReaction(GameplayTag::Sound_Voice_Reaction_Noise_Damage));
}

UCLASS()
class UAIARM_SleeperDream_ToCombat : UAIAssessmentResponseModule
{
    default BlockIfHasAnyOwnedTags.AddTag(GameplayTag::AIState_Conflict_Combat);
    
    default Rules.Add(GameplayTag::AIEvent_Seen_Enemy)
        .Then(UAIEventResponse_LeavePartyOf(EPerceptionCharacterType::SensedCharacter))
        .Then(UAIEventResponse_SwitchState(GameplayTag::AIState_Conflict_Combat, EPerceptionCharacterType::SensedCharacter));

    default Rules.Add(GameplayTag::AIEvent_StartRealFight_Weapon_ToDeath)
        .Then(UAIEventResponse_ForceAwarenessOfCharacter(EPerceptionSense::See, EPerceptionCharacterType::SensedCharacter))
        .Then(UAIEventResponse_AddEnemyModifier(EPerceptionCharacterType::SensedCharacter))
        .Then(UAIEventResponse_LeavePartyOf(EPerceptionCharacterType::SensedCharacter))
        .Then(UAIEventResponse_SwitchState(GameplayTag::AIState_Conflict_Combat, EPerceptionCharacterType::SensedCharacter, b_TargetIsPriority = true));
}