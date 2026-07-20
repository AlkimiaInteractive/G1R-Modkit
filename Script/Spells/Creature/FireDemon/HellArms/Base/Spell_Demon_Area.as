UCLASS()
class UDemonAreaBaseSpellConfig : USpellConfig
{
	default m_SpawnLocationSocket = n"weapon_r";

	UPROPERTY(EditAnywhere, BlueprintReadWrite)
	float m_MaxPredictionDistance = 300.f;
	UPROPERTY(EditAnywhere, BlueprintReadWrite)
	float m_MaxDistanceToAreaDetection = 2500.f;

	UPROPERTY(EditAnywhere, BlueprintReadWrite)
	float m_MinFloorHeight = -200.f;
	UPROPERTY(EditAnywhere, BlueprintReadWrite)
	float m_MaxFloorHeight = 50.f;

	UPROPERTY(EditAnywhere, BlueprintReadWrite)
	float m_AreaRadius = 1000.f;
	UPROPERTY(EditAnywhere, BlueprintReadWrite)
	float m_LifeSpan = 15.f;

	UPROPERTY(EditAnywhere)
    float m_MinAttackTime = 0.2f;

    UPROPERTY(EditAnywhere)
    float m_MaxAttackTime = 1.f;

	UPROPERTY(EditAnywhere, BlueprintReadWrite)
	FVector m_HitBoxDamageActorSpawnExtent = FVector(200.f, 200.f, 50.f);
	UPROPERTY(EditAnywhere, BlueprintReadWrite)
	float m_SpawnRationTime = 1.5f;
	UPROPERTY(EditAnywhere, BlueprintReadWrite)
	float m_SpawnRatioTimeVariace = 1.5f;
	UPROPERTY(EditAnywhere, BlueprintReadWrite)
	bool m_SpawnLoop = true;



	UPROPERTY(EditAnywhere, BlueprintReadWrite)
	bool m_EnableDebugLines = true;
}

UCLASS()
class UFirewallAreaBaseSpellConfig : UDemonAreaBaseSpellConfig
{
	
	UPROPERTY(EditAnywhere)
	float m_ExtraAreaIncrement = 115.f;
}