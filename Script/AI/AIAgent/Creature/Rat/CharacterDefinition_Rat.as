
UCLASS()
class UCharacterDefinition_Creature_Rat : UCharacterDefinition_Creature
{
	default m_CharacterType = GameplayTag::AIAgent_Creature_Rat;
    default m_Species = GameplayTag::Species_Creature_Rat;
    
    default SetAttributeValue("AttributeSet_LevelProgression.XPKillOrDefeatBounty", 10);

    default m_AbilitiesEffect = UGE_Rat_AI::StaticClass();
    default m_OnPlayerEffect = UGE_Rat_Player::StaticClass();
}