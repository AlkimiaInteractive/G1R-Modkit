class UAIARM_State_Wait : UAIAssessmentResponseModule
{
    default Rules.Add(GameplayTag::AIEvent_State_Done)
        .Then(UAIEventResponse_SwitchState(GameplayTag::AIState_AssessGoToDailyRoutine, EPerceptionCharacterType::None)
            .AddContextTag(GameplayTag::Action_Ambient_Dismiss));
}