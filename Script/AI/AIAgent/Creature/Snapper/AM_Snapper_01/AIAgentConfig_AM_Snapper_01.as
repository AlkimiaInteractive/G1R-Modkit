
UCLASS()
class UAIAgentConfig_AM_Snapper_01 : UAIAgentConfig_Snapper
{
	default m_CharacterDefinition = UCharacterDefinition_AM_Snapper_01::StaticClass();
	default m_SpawnSettings.MaxSignificanceRadius = 10000.f;
}