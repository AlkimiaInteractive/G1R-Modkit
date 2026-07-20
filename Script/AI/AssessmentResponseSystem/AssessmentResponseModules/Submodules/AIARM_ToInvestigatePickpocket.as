class UAIARM_Human_ToInvestigatePickpocket : UAIAssessmentResponseModule
{
    default BlockIfHasAnyOwnedTags.AddTag(GameplayTag::AIState_Conflict_InvestigatePickpocket);
    default BlockIfHasAnyOwnedTags.AddTag(GameplayTag::AIState_Conflict_Combat);
    default BlockIfHasAnyOwnedTags.AddTag(GameplayTag::Debuff_Fear);
    default BlockIfHasAnyOwnedTags.AddTag(GameplayTag::AIState_Conflict_Flee);
    default BlockIfHasAnyOwnedTags.AddTag(GameplayTag::AIState_Guide);

    // default Rules.Add(GameplayTag::AIEvent_Heard_Pickpocket)
    //     .RequireFalse(
    //         Assessed::HasSensedDrawnThreateningWeapon |
    //         Assessed::IsSensedDrawingOrUndrawingWeapon |
    //         Assessed::IsInPartyWithSensedCharacter
    //     )
    //     .Then(UAIEventResponse_VoiceReaction(GameplayTag::Sound_Voice_Reaction_Crime_Pickpocketing_Heard, EPerceptionCharacterType::None))
    //     .Then(UAIEventResponse_SwitchState(GameplayTag::AIState_Wait_WaryOfPerceivedNearbyCharacter, EPerceptionCharacterType::SensedCharacter));

    default Rules.Add(GameplayTag::AIEvent_Sensed_Pickpocketing_Failed_OnSelf)
        .Then(UAIEventResponse_VoiceReaction(GameplayTag::Sound_Voice_Address_Vocative_Angry, EPerceptionCharacterType::None))
        .Then(UAIEventResponse_SwitchState(GameplayTag::AIState_Conflict_InvestigatePickpocket_AttemptFailed, EPerceptionCharacterType::SensedCharacter));

    default Rules.Add(GameplayTag::AIEvent_Heard_Alert_Pickpocket)
        .RequireTrue(
            Assessed::AffectedIsSelf
        )
        .Then(UAIEventResponse_VoiceReaction(GameplayTag::Sound_Voice_Reaction_Interjection_Suspect, EPerceptionCharacterType::Instigator))
        .Then(UAIEventResponse_SwitchState(GameplayTag::AIState_Conflict_InvestigatePickpocket_AttemptSucceeded, EPerceptionCharacterType::Instigator));
}