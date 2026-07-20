
UCLASS()
class UAIAgentConfig_Skeleton_Mage : UAIAgentConfig
{
	default m_CharacterDefinition = UCharacterDefinition_Creature_Skeleton_Mage::StaticClass();
	default m_LocomotionConfig = ULocomotionConfig_SkeletonMage::StaticClass();
	default m_AnimConfig = UAnimConfig_Skeleton_Mage::StaticClass();
	default m_SpawnSettings.MaxSignificanceRadius = 10000.f;
	
	default m_NavigationConfig = UAIAgentConfig_Navigation_Skeleton_Mage::StaticClass();


	default m_CharacterEffectComponentsConfig = UDefaultCharacterEffectComponentsConfig::StaticClass();
}

UCLASS()
class UAIAgentConfig_Skeleton_Mage1 : UAIAgentConfig_Skeleton_Mage
{
	default m_CharacterDefinition = UCharacterDefinition_Creature_Skeleton_Mage1::StaticClass();
}

UCLASS()
class UAIAgentConfig_Skeleton_Mage2 : UAIAgentConfig_Skeleton_Mage
{
	default m_CharacterDefinition = UCharacterDefinition_Creature_Skeleton_Mage2::StaticClass();
}

UCLASS()
class UAIAgentConfig_Skeleton_Mage3 : UAIAgentConfig_Skeleton_Mage
{
	default m_CharacterDefinition = UCharacterDefinition_Creature_Skeleton_Mage3::StaticClass();
}

UCLASS()
class UAIAgentConfig_Skeleton_Mage4 : UAIAgentConfig_Skeleton_Mage
{
	default m_CharacterDefinition = UCharacterDefinition_Creature_Skeleton_Mage4::StaticClass();
}

UCLASS()
class UAIAgentConfig_Skeleton_Mage5 : UAIAgentConfig_Skeleton_Mage
{
	default m_CharacterDefinition = UCharacterDefinition_Creature_Skeleton_Mage5::StaticClass();
}

UCLASS()
class ASkeletonMage : AAIAgentCharacter
{
	default AutoPossessAI = EAutoPossessAI::PlacedInWorldOrSpawned;
	default AIControllerClass = AGothicAIController::StaticClass();

	UPROPERTY(DefaultComponent)
	USkeletonMageSummonManagerComponent m_SummonManagerComponent;

	UPROPERTY(DefaultComponent)
	USkeletonMageTeleportComponent m_TeleportComponent;
}