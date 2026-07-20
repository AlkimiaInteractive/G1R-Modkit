UCLASS()
class UConversationCharacterSettings_Ambient_OW_OWR_OrcFighterM04_2007: UConversationCharacterSettings
{
    default ForCharacter = n"OW_OWR_OrcFighterM04_2007";
    default VoiceTypeSubsets.Add(FVoiceTypeSubset(GameplayTag::VoiceType_G1R_Voice19_OrcM));
    default IncludeTopicsOf.Add(n"Generic_AboutCamp_OW_ORC");
}
