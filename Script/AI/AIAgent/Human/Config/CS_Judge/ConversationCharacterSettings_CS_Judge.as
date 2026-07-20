UCLASS()
class UConversationCharacterSettings_Ambient_CS_Judge: UConversationCharacterSettings
{
    default ForCharacter = n"CS_Judge";
    default VoiceTypeSubsets.Add(FVoiceTypeSubset(GameplayTag::VoiceType_G1_Voice13));
}
