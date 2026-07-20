UCLASS()
class UConversationCharacterSettings_Ambient_OW_OWR_OrcWarriorM06_2015: UConversationCharacterSettings
{
    default ForCharacter = n"OW_OWR_OrcWarriorM06_2015";
    default VoiceTypeSubsets.Add(FVoiceTypeSubset(GameplayTag::VoiceType_G1R_Voice19_OrcM));
    default IncludeTopicsOf.Add(n"Generic_AboutCamp_OW_ORC");
}
