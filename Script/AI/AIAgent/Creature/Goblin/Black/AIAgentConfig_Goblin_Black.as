
UCLASS()
class UAIAgentConfig_Goblin_Black : UAIAgentConfig_Goblin
{
	default m_CharacterDefinition = UCharacterDefinition_Creature_Goblin_Black_Mace::StaticClass();
	default m_AnimConfig = UAnimConfig_Goblin_Black::StaticClass();

	default m_SpawnSettings.MaxSignificanceRadius = 10000.f;
}


UCLASS()
class AGoblinBlack : AGoblin
{

}