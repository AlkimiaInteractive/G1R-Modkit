class UGA_Orc_Conversation : UGameplayAbilityConversationV2
{
    default CooldownGameplayEffectClass = UGE_Conversation_Cooldown;

    default PreferredDistanceToTarget = 165.0f;
    default MaxAllowedDistanceFromPreferred = 10.0f;

    default HeyYouVoicelineTag = GameplayTag::Sound_Voice_Address_Call;
    default NotNowVoicelineTag = GameplayTag::Sound_Voice_Reaction_General_NotNow;

    default AllowedAIStateTags.AddTag(GameplayTag::AIState_DailyRoutine);
    default AllowedAIStateTags.AddTag(GameplayTag::AIState_Wait_BlockedPath);
    default AllowedAIStateTags.AddTag(GameplayTag::AIState_Conversation);
    default AllowedAIStateTags.AddTag(GameplayTag::AIState_Wait_WaryOfPerceivedNearbyCharacter);
    default AllowedAIStateTags.AddTag(GameplayTag::AIState_Follow);

    default AllowedInteractions.AddTag(GameplayTag::Action_Interact_Sit);

    default AllowedInteractionsNotFromBehind.AddTag(GameplayTag::Action_Ambient_GuardPassage);
    default AllowedInteractionsNotFromBehind.AddTag(GameplayTag::Action_Ambient_StandAround);
    default AllowedInteractionsNotFromBehind.AddTag(GameplayTag::Action_Ambient_GuardWatch);
    default AllowedInteractionsNotFromBehind.AddTag(GameplayTag::Action_Ambient_Eat);
    default AllowedInteractionsNotFromBehind.AddTag(GameplayTag::Action_Ambient_SowRice);
    default AllowedInteractionsNotFromBehind.AddTag(GameplayTag::Action_Ambient_Practice1HSword);
    default AllowedInteractionsNotFromBehind.AddTag(GameplayTag::Action_Ambient_Drink);
    default AllowedInteractionsNotFromBehind.AddTag(GameplayTag::Action_Ambient_Eat_Bowl);
    default AllowedInteractionsNotFromBehind.AddTag(GameplayTag::Action_Ambient_SmashFood_Standing);
    default AllowedInteractionsNotFromBehind.AddTag(GameplayTag::Action_Ambient_Leatherworking);
    default AllowedInteractionsNotFromBehind.AddTag(GameplayTag::Action_Ambient_Campfire);

    // default AllowInstantCancelInteractions.AddTag(GameplayTag::Action_Ambient_GuardPassage);
    // default AllowInstantCancelInteractions.AddTag(GameplayTag::Action_Ambient_GuardWatch);
    default AllowInstantCancelInteractions.AddTag(GameplayTag::Action_Ambient_StandAround);
    default AllowInstantCancelInteractions.AddTag(GameplayTag::Action_Smalltalk);
    // default AllowInstantCancelInteractions.AddTag(GameplayTag::Action_Ambient_Eat);
    // default AllowInstantCancelInteractions.AddTag(GameplayTag::Action_Ambient_Eat_Bowl);
    // default AllowInstantCancelInteractions.AddTag(GameplayTag::Action_Ambient_Drink);
    // default AllowInstantCancelInteractions.AddTag(GameplayTag::Action_Ambient_Dance);
    // default AllowInstantCancelInteractions.AddTag(GameplayTag::Action_Ambient_SmashFood_Standing);
    // default AllowInstantCancelInteractions.AddTag(GameplayTag::Action_Ambient_Leatherworking);
    default AllowInstantCancelInteractions.AddTag(GameplayTag::Action_Ambient_PotionAlchemy);
    // default AllowInstantCancelInteractions.AddTag(GameplayTag::Action_Ambient_PotionAlchemyFemale);
    // default AllowInstantCancelInteractions.AddTag(GameplayTag::Action_Crafting_Cook);
    // default AllowInstantCancelInteractions.AddTag(GameplayTag::Action_Ambient_Practice1HSword);
    // default AllowInstantCancelInteractions.AddTag(GameplayTag::Action_Ambient_SowRice);
    default AllowInstantCancelInteractions.AddTag(GameplayTag::Action_Ambient_Campfire);
}

class UGA_Orc_ForceConversation : UGameplayAbilityForceConversation
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

class UGA_Orc_ForceConversation_Varrag : UGameplayAbilityForceConversation
{
    default ForceRangeTypeValues.Add(EConversationForceRangeType::CloseRange, 600.0f);
    default ForceRangeTypeValues.Add(EConversationForceRangeType::DefaultRange, 1000.0f);
    default ForceRangeTypeValues.Add(EConversationForceRangeType::FarRange, 1500.0f);
    default ForceRangeTypeValues.Add(EConversationForceRangeType::SurroundingRange, 2000.0f);

    default ForceRangeTypeSenses.Add(EConversationForceRangeType::CloseRange, EConversationForceSense::Any);
    default ForceRangeTypeSenses.Add(EConversationForceRangeType::DefaultRange, EConversationForceSense::Any);
    default ForceRangeTypeSenses.Add(EConversationForceRangeType::FarRange, EConversationForceSense::Any);
    default ForceRangeTypeSenses.Add(EConversationForceRangeType::SurroundingRange, EConversationForceSense::Any);
}

class UGA_Orc_Conversation_Ambient : UGameplayAbilityAmbientConversation
{
}