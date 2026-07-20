UCLASS()
class UAIAgentConfig_ShadowBeast : UAIAgentConfig
{
	default m_CharacterDefinition = UCharacterDefinition_Creature_ShadowBeast::StaticClass();
	default m_LocomotionConfig = ULocomotionConfig_ShadowBeast::StaticClass();
	default m_AnimConfig = UAnimConfig_ShadowBeast::StaticClass();
	default m_SpawnSettings.MaxSignificanceRadius = 10000.f;
	

	default m_NavigationConfig = UAIAgentConfig_Navigation_ShadowBeast::StaticClass();

	default m_CharacterEffectComponentsConfig = UDefaultCharacterEffectComponentsConfig::StaticClass();
}

UCLASS()
class UAIAgentConfig_ShadowBeast_Prime : UAIAgentConfig_ShadowBeast
{
	default m_CharacterDefinition = UCharacterDefinition_Creature_ShadowBeast_Prime::StaticClass();
}

UCLASS()
class UAIAgentConfig_ShadowBeast_Cave : UAIAgentConfig_ShadowBeast
{
	default m_CharacterDefinition = UCharacterDefinition_Creature_ShadowBeast_Cave::StaticClass();
}

UCLASS()
class UAIAgentConfig_ShadowBeast_Forest : UAIAgentConfig_ShadowBeast
{
	default m_CharacterDefinition = UCharacterDefinition_Creature_ShadowBeast_Forest::StaticClass();
}

UCLASS()
class UAIAgentConfig_ShadowBeast_Frost : UAIAgentConfig_ShadowBeast
{
	default m_CharacterDefinition = UCharacterDefinition_Creature_ShadowBeast_Frost::StaticClass();

}

UCLASS()
class AShadowBeast : AAIAgentCharacter
{

}