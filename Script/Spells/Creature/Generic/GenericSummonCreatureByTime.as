UCLASS()
class UGenericSummonCreatureByTime : UGenericSummonCreature
{
    UPROPERTY()
	float m_SpawnPeriodTime = 5.f;
    default m_MaxSpawnCount = 5.f;
}

