UCLASS()
class UAIAgentConfig_Skeleton : UAIAgentConfig
{
	default m_CharacterDefinition = UCharacterDefinition_Creature_Skeleton::StaticClass();

	default m_LocomotionConfig = ULocomotionConfig_Skeleton::StaticClass();
	default m_AnimConfig = UAnimConfig_Skeleton::StaticClass();
	default m_SpawnSettings.MaxSignificanceRadius = 10000.f;
	default m_NavigationConfig = UAIAgentConfig_Navigation_Skeleton::StaticClass();


	default m_CharacterEffectComponentsConfig = UDefaultCharacterEffectComponentsConfig::StaticClass();
}

UCLASS()
class UAIAgentConfig_Skeleton_Summon : UAIAgentConfig
{
	default m_CharacterDefinition = UCharacterDefinition_Creature_Skeleton_Summon::StaticClass();

	default m_LocomotionConfig = ULocomotionConfig_Skeleton::StaticClass();
	default m_AnimConfig = UAnimConfig_Skeleton::StaticClass();
	default m_SpawnSettings.MaxSignificanceRadius = 10000.f;
	default m_NavigationConfig = UAIAgentConfig_Navigation_Skeleton::StaticClass();


	default m_CharacterEffectComponentsConfig = UDefaultCharacterEffectComponentsConfig::StaticClass();
}

UCLASS()
class UAIAgentConfig_Skeleton_XardasServant : UAIAgentConfig_Skeleton
{
	default m_CharacterDefinition = UCharacterDefinition_Creature_Skeleton_XardasServant::StaticClass();
}

UCLASS()
class UAIAgentConfig_SkMageSummonedSkeleton : UAIAgentConfig_Skeleton
{
	default m_CharacterDefinition = UCharacterDefinition_Creature_SkMageSummonedSkeleton::StaticClass();
}

UCLASS()
class UAIAgentConfig_SkeletonVUnhilqt : UAIAgentConfig_Skeleton_Warrior
{
	default m_CharacterDefinition = UCharacterDefinition_Creature_VUnhilqtSkeleton::StaticClass();
}

UCLASS()
class UAIAgentConfig_Skeleton_SH_Zombie : UAIAgentConfig_Skeleton
{
	default m_CharacterDefinition = UCharacterDefinition_Creature_SH_ZombieSkeleton::StaticClass();
	default m_NavigationConfig = UAIAgentConfig_Navigation_ZombieBoss::StaticClass();
}


UCLASS()
class ASkeletonHuman : AAIAgentCharacter
{
	default AutoPossessAI = EAutoPossessAI::PlacedInWorldOrSpawned;
	default AIControllerClass = AGothicAIController::StaticClass();
}

class ASkeleton_XardasSleeper : ASkeletonHuman
{

	UPROPERTY(DefaultComponent)
	UXardasSleeperSkeletonsSummonedComponent m_SummonedComponent;

	UFUNCTION(BlueprintEvent)
	void SetChained(bool value)
	{

	}

	UFUNCTION(BlueprintCallable)
	int GetSpawnPoseIndex()
	{
		TArray<AMinionSpotManager> outActors;
		GetAllActorsOfClass(AMinionSpotManager::StaticClass(), outActors);
		if(outActors.IsEmpty())
			return 0;
		return outActors[0].GetSpawnPoseIndex(Cast<AGothicNPCState>(GetCharacterState()));
	}
}