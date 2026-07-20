class UAIARM_State_AssessGoToDailyRoutine : UAIAssessmentResponseModule
{
    default RequiredOwnedTags.AddTag(GameplayTag::AIState_AssessGoToDailyRoutine);

    default Rules.Add(GameplayTag::AIEvent_State_Done)
        .Then(UAIEventResponse_RemoveAllEnemyModifiers())
        .Then(UAIEventResponse_SwitchState(GameplayTag::AIState_DailyRoutine, EPerceptionCharacterType::None));

    default Rules.Add(GameplayTag::AIEvent_Heard_Pouch)
        .Then(UAIEventResponse_VoiceReaction(GameplayTag::AIState_Conflict_InvestigatePouch_Heard));
}