
UCLASS()
class UAIAgentConfig_Goblin_Green : UAIAgentConfig_Goblin
{
	default m_CharacterDefinition = UCharacterDefinition_Creature_Goblin_Green::StaticClass();
	default m_AnimConfig = UAnimConfig_Goblin_Green::StaticClass();
	default m_SpawnSettings.MaxSignificanceRadius = 10000.f;
}

UCLASS()
class UAIAgentConfig_Goblin_Green_Club : UAIAgentConfig_Goblin_Green
{
	default m_CharacterDefinition = UCharacterDefinition_Creature_Goblin_Green_Club::StaticClass();
	default m_SpawnSettings.MaxSignificanceRadius = 10000.f;
}

UCLASS()
class UAIAgentConfig_Goblin_Green_Torch : UAIAgentConfig_Goblin_Green
{
	default m_CharacterDefinition = UCharacterDefinition_Creature_Goblin_Green_Torch::StaticClass();
	default m_SpawnSettings.MaxSignificanceRadius = 10000.f;
}

UCLASS()
class UAIAgentConfig_Goblin_Black_Torch : UAIAgentConfig_Goblin_Green
{
	default m_CharacterDefinition = UCharacterDefinition_Creature_Goblin_Black_Torch::StaticClass();
	default m_SpawnSettings.MaxSignificanceRadius = 10000.f;
}

UCLASS()
class UAIAgentConfig_Goblin_Green_Sword : UAIAgentConfig_Goblin_Green
{
	default m_CharacterDefinition = UCharacterDefinition_Creature_Goblin_Green_Sword::StaticClass();
	default m_SpawnSettings.MaxSignificanceRadius = 10000.f;
}

UCLASS()
class AGoblinGreen : AGoblin
{

}