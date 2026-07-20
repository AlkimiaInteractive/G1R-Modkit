class UAIARM_State_MagicSleep : UAIAssessmentResponseModule
{
    default Rules.Add(GameplayTag::AIEvent_SpellEffect_Sleep_Ended_OnSelf)
        .Then(UAIEventResponse_VoiceReaction(GameplayTag::Sound_Voice_Reaction_Sleep_Awake));
}