UCLASS()
class UConversationCharacterSettings_Ambient_NC_SLD_Mercenary08_720: UConversationCharacterSettings
{
    default ForCharacter = n"NC_SLD_Mercenary08_720";
    default VoiceTypeSubsets.Add(FVoiceTypeSubset(GameplayTag::VoiceType_G1R_Voice39));
    default IncludeTopicsOf.Add(n"Generic_AboutCamp_NC_SLD");
    default IncludeTopicsOf.Add(n"Generic_FindNPC");
    default IncludeTopicsOf.Add(n"Generic_PayFine");
}
