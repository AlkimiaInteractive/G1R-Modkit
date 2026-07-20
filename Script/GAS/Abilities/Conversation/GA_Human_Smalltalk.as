class UGA_Human_Smalltalk : UGameplayAbilitySmalltalk
{
    default GreetingVoicelineTag = FGameplayTag::Empty; // GameplayTag::Sound_Voice_Address_Call;

    default RequiredRelationship.Add(ERelationship::Neutral);
    default RequiredRelationship.Add(ERelationship::Friend);

    default BlockSmalltalkForOwnedTags.AddTag(GameplayTag::Smalltalk_Blocked);
    default BlockSmalltalkForOwnedTags.AddTag(GameplayTag::State_Conversation);
    default BlockSmalltalkForOwnedTags.AddTag(GameplayTag::State_AmbientConversation);
    default BlockSmalltalkForOwnedTags.AddTag(GameplayTag::State_Combat);
    default BlockSmalltalkForOwnedTags.AddTag(GameplayTag::AIState_Conflict);
    default BlockSmalltalkForOwnedTags.AddTag(GameplayTag::AIState_MagicSleep);
    default BlockSmalltalkForOwnedTags.AddTag(GameplayTag::AIState_Wait);
    default BlockSmalltalkForOwnedTags.AddTag(GameplayTag::Action_Ambient_Eat);
    default BlockSmalltalkForOwnedTags.AddTag(GameplayTag::Action_Ambient_Drink);
    default BlockSmalltalkForOwnedTags.AddTag(GameplayTag::Action_Ambient_WomanDance);
    default BlockSmalltalkForOwnedTags.AddTag(GameplayTag::Action_Ambient_Disturb);
    default BlockSmalltalkForOwnedTags.AddTag(GameplayTag::Action_Ambient_Sleep);
    default BlockSmalltalkForOwnedTags.AddTag(GameplayTag::Action_Ambient_Shout);
    default BlockSmalltalkForOwnedTags.AddTag(GameplayTag::Action_Ambient_InExtremoConcert);
    default BlockSmalltalkForOwnedTags.AddTag(GameplayTag::Action_Ambient_PlayTune);
   
    
    default AllowSmalltalkForOwnedTags.AddTag(GameplayTag::Smalltalk_Offering);

    default AvailableSmalltalkTopics.AddTag(GameplayTag::Sound_Voice_Conversation_SmallTalk);

    default MinSecondsBetweenSentences = 1.0f;
    default SecondsBetweenSentencesVariance = 3.0f;

    default CurrentSubtopicMultiplicator = 3.0f;
    default CurrentTopicMultiplicator = 5.0f;

    default MaxTopicAge = 20.0f;
    default SubTopicImportance = 0.5f;

    default TalkLoudness = EPerceptionNoiseLoudness::Moderate;

}