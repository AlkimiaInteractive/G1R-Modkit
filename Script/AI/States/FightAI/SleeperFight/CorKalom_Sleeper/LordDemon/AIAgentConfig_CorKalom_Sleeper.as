
UCLASS()
class UAIAgentConfig_CorKalomDemon : UAIAgentConfig
{
	default m_CharacterDefinition = UCharacterDefinition_Creature_CorKalomDemon_Sleeper::StaticClass();
	default m_LocomotionConfig = ULocomotionConfig_Demon::StaticClass();
	default m_AnimConfig = UAnimConfig_CorKalomDemon_Sleeper::StaticClass();
	

	default m_NavigationConfig = UAIAgentConfig_Navigation_Demon::StaticClass();
	
	default m_CharacterEffectComponentsConfig = UDefaultCharacterEffectComponentsConfig::StaticClass();
	default m_SpawnSettings.MaxSignificanceRadius = 10000.f;
}

UCLASS()
class ALordDemon : AAIAgentCharacterDemonBase //AAIAgentCharacterDemonBase//AAIAgentCharacter
{
	default DefaultAIAgentConfig = UAIAgentConfig_CorKalomDemon::StaticClass();

	UFUNCTION(NetMulticast, BlueprintEvent, BlueprintCallable)
	void UpdatePyrolaserLength(float ZAxisLength)
	{

	}

	UFUNCTION(NetMulticast, BlueprintEvent)
	void ActivatePyrolaserVisuals()
	{

	}

	UFUNCTION(NetMulticast, BlueprintEvent)
	void DeactivatePyrolaserVisuals()
	{

	}
}