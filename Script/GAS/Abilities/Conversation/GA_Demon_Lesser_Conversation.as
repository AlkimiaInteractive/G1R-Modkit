class UGA_Demon_Lesser_Conversation : UGameplayAbilityConversationV2
{
    default CooldownGameplayEffectClass = UGE_Conversation_Cooldown;
    
    default PreferredDistanceToTarget = 300.0f;
    default MaxAllowedDistanceFromPreferred = 10.0f;

    default HeyYouVoicelineTag = GameplayTag::Sound_Voice_Address_Call;
    default NotNowVoicelineTag = GameplayTag::Sound_Voice_Reaction_General_NotNow;

    default AllowedAIStateTags.AddTag(GameplayTag::AIState_DailyRoutine);
    default AllowedAIStateTags.AddTag(GameplayTag::AIState_Wait_BlockedPath);
    default AllowedAIStateTags.AddTag(GameplayTag::AIState_Conversation);
    default AllowedAIStateTags.AddTag(GameplayTag::AIState_Wait_WaryOfPerceivedNearbyCharacter);
    default AllowedAIStateTags.AddTag(GameplayTag::AIState_Follow);

    default AllowedInteractions.AddTag(GameplayTag::Action_Interact_Sit);
}

class UGA_Demon_Lesser_Conversation_withUI : UGameplayAbilityConversationV2
{
    default PreferredDistanceToTarget = 300.0f;
    default MaxAllowedDistanceFromPreferred = 10.0f;
}

class UGA_Demon_Lesser_ForceConversation : UGameplayAbilityForceConversation
{    
    default ForceRangeTypeValues.Add(EConversationForceRangeType::CloseRange, 300.0f);
    default ForceRangeTypeValues.Add(EConversationForceRangeType::DefaultRange, 500.0f);
    default ForceRangeTypeValues.Add(EConversationForceRangeType::FarRange, 750.0f);
    default ForceRangeTypeValues.Add(EConversationForceRangeType::SurroundingRange, 500.0f);

    default ForceRangeTypeSenses.Add(EConversationForceRangeType::CloseRange, EConversationForceSense::See);
    default ForceRangeTypeSenses.Add(EConversationForceRangeType::DefaultRange, EConversationForceSense::See);
    default ForceRangeTypeSenses.Add(EConversationForceRangeType::FarRange, EConversationForceSense::See);
    default ForceRangeTypeSenses.Add(EConversationForceRangeType::SurroundingRange, EConversationForceSense::Any);
}