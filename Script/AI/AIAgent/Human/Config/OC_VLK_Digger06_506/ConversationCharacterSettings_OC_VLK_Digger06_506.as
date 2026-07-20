UCLASS()
class UConversationCharacterSettings_Ambient_OC_VLK_Digger06_506: UConversationCharacterSettings
{
    default ForCharacter = n"OC_VLK_Digger06_506";
    default VoiceTypeSubsets.Add(FVoiceTypeSubset(GameplayTag::VoiceType_G1R_Voice33));
    default VoiceTypeSubsets.Add(FVoiceTypeSubset(GameplayTag::VoiceType_G1R_Voice71_Crowd03));
    default IncludeTopicsOf.Add(n"Generic_AboutCamp_OC_VLK");
    default IncludeTopicsOf.Add(n"Generic_OC_Quest_RankUpGuard");
}
