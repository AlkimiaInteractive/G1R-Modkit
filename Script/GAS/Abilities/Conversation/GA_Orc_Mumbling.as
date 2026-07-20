class UGA_Orc_Mumble : UGameplayAbilityMumble
{
    default BlockMumblingForOwnedTags.AddTag(GameplayTag::State_Conversation);
    default BlockMumblingForOwnedTags.AddTag(GameplayTag::State_AmbientConversation);
    default BlockMumblingForOwnedTags.AddTag(GameplayTag::State_Combat);
    default BlockMumblingForOwnedTags.AddTag(GameplayTag::State_Smalltalk);
    default BlockMumblingForOwnedTags.AddTag(GameplayTag::State_Quiet);
    default BlockMumblingForOwnedTags.AddTag(GameplayTag::State_Controlled);
    default BlockMumblingForOwnedTags.AddTag(GameplayTag::State_Dead);
    default BlockMumblingForOwnedTags.AddTag(GameplayTag::State_Defeated);
    default BlockMumblingForOwnedTags.AddTag(GameplayTag::State_NeverMumble);
    default BlockMumblingForOwnedTags.AddTag(GameplayTag::Debuff_Paralyzed);
    default BlockMumblingForOwnedTags.AddTag(GameplayTag::Action_Ambient_Preach);
    default BlockMumblingForOwnedTags.AddTag(GameplayTag::Action_Ambient_Drink);
    default BlockMumblingForOwnedTags.AddTag(GameplayTag::Action_Ambient_Eat);
    default BlockMumblingForOwnedTags.AddTag(GameplayTag::Action_Ambient_Shout);
    default BlockMumblingForOwnedTags.AddTag(GameplayTag::Action_Ambient_InExtremoConcert);

    //default BlockMumblingForOwnedTags.AddTag(GameplayTag::Action_Crafting);

    default AvailableMumbleTopics.AddTag(GameplayTag::Sound_Voice_Conversation_DailyRoutine_Mumble);
    default AvailableMumbleTopics.AddTag(GameplayTag::Sound_Voice_Conversation_DailyRoutine_Work);
    default AvailableMumbleTopics.AddTag(GameplayTag::Sound_Voice_Conversation_DailyRoutine_Patrol);
    default AvailableMumbleTopics.AddTag(GameplayTag::Sound_Voice_Conversation_DailyRoutine_Complaint);
    default AvailableMumbleTopics.AddTag(GameplayTag::Sound_Voice_Conversation_DailyRoutine_Music);
    default AvailableMumbleTopics.AddTag(GameplayTag::Sound_Voice_Conversation_DailyRoutine_Meditation);
    default MinSecondsBetweenSentences = 30.0f;
    default SecondsBetweenSentencesVariance = 15.0f;
}