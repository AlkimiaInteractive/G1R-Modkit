
UCLASS()
class UAIAgentConfig_Goblin_Warrior : UAIAgentConfig_Goblin
{
	default m_CharacterDefinition = UCharacterDefinition_Creature_Goblin_Warrior::StaticClass();
	default m_AnimConfig = UAnimConfig_Goblin_Warrior::StaticClass();
	default m_SpawnSettings.MaxSignificanceRadius = 10000.f;
}

UCLASS()
class AGoblinWarrior : AGoblin
{

}