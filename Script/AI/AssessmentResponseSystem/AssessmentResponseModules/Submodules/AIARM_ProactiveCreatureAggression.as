class UAIARM_ProactiveCreatureAggression : UAIAssessmentResponseModule
{
    default RequireAssessedToHaveAllOwnedTags.AddTag(GameplayTag::Species_Creature);

    default Rules.Add(GameplayTag::AIEvent_Sensed_ThreateningCharacter)
        .Then(UAIEventResponse_ForceAwarenessOfCharacter(EPerceptionSense::See, EPerceptionCharacterType::SensedCharacter));
    
    default Rules.Add(GameplayTag::AIEvent_Seen_Hostile_Enter_WarningRange)
        .Then(UAIEventResponse_ForceAwarenessOfCharacter(EPerceptionSense::See, EPerceptionCharacterType::SensedCharacter))
        .Then(UAIEventResponse_AddEnemyModifier(EPerceptionCharacterType::SensedCharacter))
        .Then(UAIEventResponse_AddLootModifier(EPerceptionCharacterType::SensedCharacter))
        .Then(UAIEventResponse_SwitchState(GameplayTag::AIState_Conflict_Combat, EPerceptionCharacterType::SensedCharacter));
}