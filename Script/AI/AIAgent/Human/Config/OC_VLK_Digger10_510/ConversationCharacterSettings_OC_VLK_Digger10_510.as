UCLASS()
class UConversationCharacterSettings_Ambient_OC_VLK_Digger10_510: UConversationCharacterSettings
{
    default ForCharacter = n"OC_VLK_Digger10_510";
    default VoiceTypeSubsets.Add(FVoiceTypeSubset(GameplayTag::VoiceType_G1R_Voice37));
    default VoiceTypeSubsets.Add(FVoiceTypeSubset(GameplayTag::VoiceType_G1R_Voice70_Crowd02));
    default IncludeTopicsOf.Add(n"Generic_AboutCamp_OC_VLK");
    default IncludeTopicsOf.Add(n"Generic_OC_Quest_RankUpGuard");
}
