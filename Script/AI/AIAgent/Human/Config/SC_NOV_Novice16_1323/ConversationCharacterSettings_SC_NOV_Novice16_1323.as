UCLASS()
class UConversationCharacterSettings_Ambient_SC_NOV_Novice16_1323: UConversationCharacterSettings
{
    default ForCharacter = n"SC_NOV_Novice16_1323";
    default VoiceTypeSubsets.Add(FVoiceTypeSubset(GameplayTag::VoiceType_G1R_Voice40));
    default VoiceTypeSubsets.Add(FVoiceTypeSubset(GameplayTag::VoiceType_G1R_Voice72_AfterRitual01));
    default IncludeTopicsOf.Add(n"Generic_AboutCamp_SC_NOV");
    default IncludeTopicsOf.Add(n"Generic_FindNPC");
}
