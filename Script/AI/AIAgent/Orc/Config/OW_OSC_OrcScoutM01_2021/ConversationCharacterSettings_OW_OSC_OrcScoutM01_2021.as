UCLASS()
class UConversationCharacterSettings_Ambient_OW_OSC_OrcScoutM01_2021: UConversationCharacterSettings
{
    default ForCharacter = n"OW_OSC_OrcScoutM01_2021";
    default VoiceTypeSubsets.Add(FVoiceTypeSubset(GameplayTag::VoiceType_G1R_Voice19_OrcM));
    default IncludeTopicsOf.Add(n"Generic_AboutCamp_OW_ORC");
}
