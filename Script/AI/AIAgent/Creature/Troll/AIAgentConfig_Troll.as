UCLASS()
class UAIAgentConfig_Troll : UAIAgentConfig
{
	default m_CharacterDefinition = UCharacterDefinition_Creature_Troll::StaticClass();
	default m_LocomotionConfig = ULocomotionConfig_Troll::StaticClass();
	default m_AnimConfig = UAnimConfig_Troll::StaticClass();
	default m_SpawnSettings.MaxSignificanceRadius = 10000.f;
	default m_NavigationConfig = UAIAgentConfig_Navigation_Troll::StaticClass();
	
	default m_CharacterEffectComponentsConfig = UDefaultCharacterEffectComponentsConfig::StaticClass();
}

UCLASS()
class ATroll : AAIAgentCharacter
{
	default DefaultAIAgentConfig = UAIAgentConfig_Troll::StaticClass();

	UPROPERTY(BlueprintReadWrite, VisibleAnywhere)
	AGothicCharacter m_SelectedProjectileCharacter;

	UPROPERTY()
	FGameplayTag m_BindGoblinTag = GameplayTag::State_Goblin_BindedToTroll;

	UFUNCTION()
	void BindGoblin(AGoblin InGoblin)
	{
		if(m_SelectedProjectileCharacter != nullptr)
			ReleaseBindedGoblin();
		//activate ability in goblin;
		m_SelectedProjectileCharacter = InGoblin;
		AddTagToSelectedCharacter(true);
	}

	void AddTagToSelectedCharacter(bool AddTag)
	{
		if(m_SelectedProjectileCharacter == nullptr)
			return;
		if(AddTag)
			m_SelectedProjectileCharacter.GetGothicAbilitySystemComponent().AddTag(m_BindGoblinTag);
		else
			m_SelectedProjectileCharacter.GetGothicAbilitySystemComponent().RemoveTag(m_BindGoblinTag);
	}

	UFUNCTION()
	void ReleaseBindedGoblin()
	{
		AddTagToSelectedCharacter(false);
		m_SelectedProjectileCharacter = nullptr;
	}
}