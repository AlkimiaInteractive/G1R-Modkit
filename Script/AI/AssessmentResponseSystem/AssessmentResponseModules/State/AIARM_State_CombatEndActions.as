class UAIARM_State_CombatEndActions : UAIAssessmentResponseModule
{
    default RequiredOwnedTags.AddTag(GameplayTag::AIState_Conflict_CombatEndActions);

    default Rules.Add(GameplayTag::AIEvent_State_Done)
        .EventHasTag(GameplayTag::VoicelineContext_ForgetFight)
        .Then(UAIEventResponse_VoiceReaction(GameplayTag::Sound_Voice_Reaction_Combat_End_LetsForgetOurLittleFight, EPerceptionCharacterType::AffectedCharacter));
    
    default Rules.Add(GameplayTag::AIEvent_State_Done)
        .EventHasTag(GameplayTag::VoicelineContext_ForgiveThisTime)
        .Then(UAIEventResponse_VoiceReaction(GameplayTag::Sound_Voice_Reaction_Combat_End_ForgiveThisTime, EPerceptionCharacterType::AffectedCharacter));
    
    default Rules.Add(GameplayTag::AIEvent_State_Done)
        .EventHasTag(GameplayTag::VoicelineContext_Death)
        .Then(UAIEventResponse_VoiceReaction(GameplayTag::Sound_Voice_Reaction_Combat_End_Death, EPerceptionCharacterType::AffectedCharacter));
    
    default Rules.Add(GameplayTag::AIEvent_State_Done)
        .EventHasTag(GameplayTag::VoicelineContext_RanAway)
        .Then(UAIEventResponse_VoiceReaction(GameplayTag::Sound_Voice_Reaction_Combat_End_RunCoward, EPerceptionCharacterType::AffectedCharacter));

    default Rules.Add(GameplayTag::AIEvent_State_Done)
        .Then(UAIEventResponse_SwitchState(GameplayTag::AIState_AssessGoToDailyRoutine, EPerceptionCharacterType::None));
}