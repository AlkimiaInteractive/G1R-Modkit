UCLASS()
class UGothicCharacterPersonality_Mud : UGothicCharacterPersonality
{
    default OwnedPersonalityTags.AddTag(GameplayTag::Character_Personality_Coward);
    default OwnedPersonalityTags.AddTag(GameplayTag::Character_Personality_Oblivious);
    default OwnedPersonalityTags.AddTag(GameplayTag::Character_Personality_Outcast_All);
}