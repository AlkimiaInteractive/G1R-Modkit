UCLASS()
class UConversationCharacterSettings_Ambient_OC_VLK_Digger32_554: UConversationCharacterSettings
{
    default ForCharacter = n"OC_VLK_Digger32_554";
    default VoiceTypeSubsets.Add(FVoiceTypeSubset(GameplayTag::VoiceType_G1R_Voice32));
    default VoiceTypeSubsets.Add(FVoiceTypeSubset(GameplayTag::VoiceType_G1R_Voice69_Crowd01));
    default IncludeTopicsOf.Add(n"Generic_AboutCamp_OC_VLK");
    default IncludeTopicsOf.Add(n"Generic_OC_Quest_RankUpGuard");
}
