UCLASS()
class UConversationCharacterSettings_Ambient_NC_SLD_Orik_701: UConversationCharacterSettings
{
    default ForCharacter = n"NC_SLD_Orik_701";
    default VoiceTypeSubsets.Add(FVoiceTypeSubset(GameplayTag::VoiceType_G1R_Voice43));
    default IncludeTopicsOf.Add(n"Generic_AboutCamp_NC_SLD");
    default IncludeTopicsOf.Add(n"Generic_FindNPC");
}
