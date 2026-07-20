UCLASS()
class UConversationCharacterSettings_Ambient_NC_SLD_Mercenary10_725: UConversationCharacterSettings
{
    default ForCharacter = n"NC_SLD_Mercenary10_725";
    default VoiceTypeSubsets.Add(FVoiceTypeSubset(GameplayTag::VoiceType_G1R_Voice40));
    default IncludeTopicsOf.Add(n"Generic_AboutCamp_NC_SLD");
    default IncludeTopicsOf.Add(n"Generic_FindNPC");
    default IncludeTopicsOf.Add(n"Generic_PayFine");
}
