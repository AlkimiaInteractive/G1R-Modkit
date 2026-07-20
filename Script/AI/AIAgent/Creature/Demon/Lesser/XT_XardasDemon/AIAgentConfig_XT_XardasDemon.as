
UCLASS()
class UAIAgentConfig_XT_XardasDemon : UAIAgentConfig_Demon_Lesser
{
	default m_CharacterDefinition = UCharacterDefinition_Creature_XT_XardasDemon::StaticClass();
	default m_CharacterDefaultInteraction = UDefaultCharacterInteraction::StaticClass();
}