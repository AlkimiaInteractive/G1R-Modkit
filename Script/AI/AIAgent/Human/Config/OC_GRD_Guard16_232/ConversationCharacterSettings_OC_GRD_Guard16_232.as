UCLASS()
class UConversationCharacterSettings_Ambient_OC_GRD_Guard16_232: UConversationCharacterSettings
{
    default ForCharacter = n"OC_GRD_Guard16_232";
    default VoiceTypeSubsets.Add(FVoiceTypeSubset(GameplayTag::VoiceType_G1R_Voice33));
    default IncludeTopicsOf.Add(n"Generic_AboutCamp_OC_GRD");
    default IncludeTopicsOf.Add(n"Generic_FindNPC");
    default IncludeTopicsOf.Add(n"Generic_PayFine");
}
