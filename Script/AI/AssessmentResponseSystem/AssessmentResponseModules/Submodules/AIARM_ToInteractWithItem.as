/** Food / valuable pickup; blocked during warning so theft warning owns the item queue. */
class UAIARM_ToInteractWithItem : UAIAssessmentResponseModule
{
    default BlockIfHasAnyOwnedTags.AddTag(GameplayTag::AIState_Conflict_Combat);
    default BlockIfHasAnyOwnedTags.AddTag(GameplayTag::Debuff_Fear);
    default BlockIfHasAnyOwnedTags.AddTag(GameplayTag::AIState_Conflict_Flee);
    default BlockIfHasAnyOwnedTags.AddTag(GameplayTag::AIState_Conflict_Disengage);
    default BlockIfHasAnyOwnedTags.AddTag(GameplayTag::State_CantBeDistracted);
    default BlockIfHasAnyOwnedTags.AddTag(GameplayTag::AIState_Conflict_Warning);

    default Rules.Add(GameplayTag::AIEvent_Seen_Item_Food)
        .Then(UAIEventResponse_VoiceReaction(GameplayTag::Sound_Voice_Reaction_Interjection_Happy))
        .Then(UAIEventResponse_SwitchState(GameplayTag::AIState_InteractWithItem_PickUpAndConsume, EPerceptionCharacterType::None));
    
    default Rules.Add(GameplayTag::AIEvent_Seen_Item_Valuable)
        .Then(UAIEventResponse_VoiceReaction(GameplayTag::Sound_Voice_Reaction_Interjection_Happy))
        .Then(UAIEventResponse_SwitchState(GameplayTag::AIState_InteractWithItem_PickUp, EPerceptionCharacterType::None));
}

class UAIARM_ToCrushMeatbug : UAIAssessmentResponseModule
{
    default BlockIfHasAnyOwnedTags.AddTag(GameplayTag::AIState_Conflict_Combat);
    default BlockIfHasAnyOwnedTags.AddTag(GameplayTag::Debuff_Fear);
    default BlockIfHasAnyOwnedTags.AddTag(GameplayTag::AIState_Conflict_Flee);
    default BlockIfHasAnyOwnedTags.AddTag(GameplayTag::AIState_Conflict_Disengage);
    default RequiredOwnedTags.AddTag(GameplayTag::State_CantBeDistracted);

    default Rules.Add(GameplayTag::AIEvent_Seen_Meatbug)
        .Then(UAIEventResponse_VoiceReaction(GameplayTag::Sound_Voice_Reaction_Interjection_Angry))
        .Then(UAIEventResponse_SwitchState(GameplayTag::AIState_InteractWithItem_Meatbug, EPerceptionCharacterType::None));
}