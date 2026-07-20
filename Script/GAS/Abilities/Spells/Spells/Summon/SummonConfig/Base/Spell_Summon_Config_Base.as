class USpell_Summon_Config_Base
{
    UPROPERTY(EditAnywhere, BlueprintReadWrite)
	float m_MinSummonDistance = 250.0f;

	UPROPERTY(EditAnywhere, BlueprintReadWrite)
	float m_MaxSummonDistance = 500.0f;

	UPROPERTY(EditAnywhere, BlueprintReadWrite)
	float m_AngleInterval = 60.0f;

	UPROPERTY(EditAnywhere, BlueprintReadWrite)
	float m_DistanceInterval = 100.0f;

	UPROPERTY(EditAnywhere, BlueprintReadWrite)
	float m_SpawnAttemptRadius = 50.0f;

	UPROPERTY(EditAnywhere, BlueprintReadWrite)
	int m_CreatureSpawnAttempts = 10;

	UPROPERTY(EditAnywhere, BlueprintReadWrite)
    float m_MinSummonDelay = 0.1f;
    UPROPERTY(EditAnywhere, BlueprintReadWrite)
    float m_MaxSummonDelay = 0.1f;

	UPROPERTY(EditAnywhere, BlueprintReadWrite)
	TArray<FAISpawnData> m_CharactersToSpawn;
}