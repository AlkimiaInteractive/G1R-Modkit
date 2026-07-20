UCLASS()
class UConversationCharacterSettings_Ambient_NC_SLD_Mercenary01_702: UConversationCharacterSettings
{
    default ForCharacter = n"NC_SLD_Mercenary01_702";
    default VoiceTypeSubsets.Add(FVoiceTypeSubset(GameplayTag::VoiceType_G1R_Voice49));
    default IncludeTopicsOf.Add(n"Generic_AboutCamp_NC_SLD");
    default IncludeTopicsOf.Add(n"Generic_FindNPC");
    default IncludeTopicsOf.Add(n"Generic_PayFine");
}
