
UCLASS()
class UCharacterDefinition_Creature_TheSleeper : UCharacterDefinition_Creature
{
	default m_CharacterType = GameplayTag::AIAgent_Creature_TheSleeper;
    default m_Species = GameplayTag::Species_Creature_Sleeper;

    default m_AbilitiesEffect = UGE_TheSleeper_AI::StaticClass();
    default m_OnPlayerEffect = UGE_TheSleeper_Player::StaticClass();
}