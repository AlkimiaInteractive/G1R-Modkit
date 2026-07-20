UCLASS()
class UConversationCharacterSettings_Ambient_OC_VLK_Digger04_504: UConversationCharacterSettings
{
    default ForCharacter = n"OC_VLK_Digger04_504";
    default VoiceTypeSubsets.Add(FVoiceTypeSubset(GameplayTag::VoiceType_G1R_Voice31));
    default VoiceTypeSubsets.Add(FVoiceTypeSubset(GameplayTag::VoiceType_G1R_Voice70_Crowd02));
    default IncludeTopicsOf.Add(n"Generic_AboutCamp_OC_VLK");
    default IncludeTopicsOf.Add(n"Generic_OC_Quest_RankUpGuard");
}
