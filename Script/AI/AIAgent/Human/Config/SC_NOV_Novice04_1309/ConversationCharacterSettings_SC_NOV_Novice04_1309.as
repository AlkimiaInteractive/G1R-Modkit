UCLASS()
class UConversationCharacterSettings_Ambient_SC_NOV_Novice04_1309: UConversationCharacterSettings
{
    default ForCharacter = n"SC_NOV_Novice04_1309";
    default VoiceTypeSubsets.Add(FVoiceTypeSubset(GameplayTag::VoiceType_G1R_Voice48));
    default VoiceTypeSubsets.Add(FVoiceTypeSubset(GameplayTag::VoiceType_G1R_Voice75_AfterRitual04));
    default IncludeTopicsOf.Add(n"Generic_AboutCamp_SC_NOV");
    default IncludeTopicsOf.Add(n"Generic_FindNPC");
}
