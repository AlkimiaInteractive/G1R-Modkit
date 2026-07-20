
UCLASS()
class UAIAgentConfig_Demon_Fire : UAIAgentConfig
{
	default m_CharacterDefinition = UCharacterDefinition_Creature_Demon_Fire::StaticClass();
	default m_LocomotionConfig = ULocomotionConfig_Demon::StaticClass();
	default m_AnimConfig = UAnimConfig_Demon_Fire::StaticClass();
	



	default m_NavigationConfig = UAIAgentConfig_Navigation_Demon::StaticClass();
	
	default m_CharacterEffectComponentsConfig = UDefaultCharacterEffectComponentsConfig::StaticClass();
}

UCLASS()
class AAIAgentCharacterDemonBase : AAIAgentCharacter
{

	UPROPERTY()
	UDemonAreaRegisterComponent m_DemonAreaRegisterComponent;

	UFUNCTION(BlueprintOverride)
	void BeginPlay()
	{
		m_DemonAreaRegisterComponent = UDemonAreaRegisterComponent::GetOrCreate(this);
	}


	// UDemonAreaRegisterComponent GetDemonAreaRegisterComponent()
	// {
	// 	if(m_DemonAreaRegisterComponent == nullptr)
	// 		m_DemonAreaRegisterComponent = UDemonAreaRegisterComponent::GetOrCreate(this);
	// 	return m_DemonAreaRegisterComponent;
	// }

	// bool CanSpawnArea(EDemonAreaTypes DemonAreaType)
	// {
	// 	return GetDemonAreaRegisterComponent().CanSpawnArea(DemonAreaType);
	// }

}

UCLASS()
class ADemonFire : AAIAgentCharacterDemonBase//AAIAgentCharacterFireDemon
{
	default DefaultAIAgentConfig = UAIAgentConfig_Demon_Fire::StaticClass();
}