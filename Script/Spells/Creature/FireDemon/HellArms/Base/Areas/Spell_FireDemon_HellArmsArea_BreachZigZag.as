UCLASS()
class UHellArmsAreaBreachZigZagSpellConfig : UDemonAreaBaseSpellConfig
{
	default m_LifeSpan = 3.f;

	default m_AreaRadius = 2000.f;

	default m_HitBoxDamageActorSpawnExtent = FVector(50.f, 50.f, 50.f);

	//This spell has not predicted distance, the arms spawn under the player
	default m_MaxPredictionDistance = 0.f;

	default m_MinAttackTime = 0.2f;

    default m_MaxAttackTime = 0.2f;

	UPROPERTY(EditAnywhere)
	float m_SpawnCubeMovementSpeed = 550.0f;

	UPROPERTY(EditAnywhere)
    float m_MinDistanceToTarget = 2.f;
}

UCLASS()
class UHellArmsAreaBreachZigZagSpellConfig_Fire : UDemonAreaBaseSpellConfig
{
	default m_LifeSpan = 5.f; //5.f;

	default m_AreaRadius = 1000.f; //2000.f;

	default m_HitBoxDamageActorSpawnExtent = FVector(50.f, 50.f, 50.f);

	//This spell has not predicted distance, the arms spawn under the player
	default m_MaxPredictionDistance = 0.f;

	default m_MinAttackTime = 0.1f;

    default m_MaxAttackTime = 0.2f;

	UPROPERTY(EditAnywhere)
	float m_SpawnCubeMovementSpeed = 300.0f; //550.f;

	UPROPERTY(EditAnywhere)
    float m_MinDistanceToTarget = 2.f;
}