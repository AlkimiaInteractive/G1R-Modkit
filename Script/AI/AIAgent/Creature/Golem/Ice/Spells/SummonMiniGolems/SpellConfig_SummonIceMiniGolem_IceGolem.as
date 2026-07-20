UCLASS()
class USummonIceMiniGolem_IceGolem_SpellConfig : UGenericSummonCreatureByHealth
{
    default m_SpellTargetType = ESpellTargetType::Area;
    default m_SpellManaUsage = ESpellManaUsage::Normal;
	default m_SpawnLocationSocket = n"jawSocket";
   
	
	//default m_CharacterToSpawn.m_SpawnAIAgentDefinition = USpawnAIAgentDefinition_GolemIce::StaticClass();
    default m_CharacterToSpawn.m_SpawnAIAgentDefinition = USpawnAIAgentDefinition_Mini_GolemIce::StaticClass();
    //default m_CharacterToSpawn.m_DailyRoutine = UAIState_DailyRoutine_FollowOwner::StaticClass();


    UPROPERTY(EditAnywhere, BlueprintReadWrite)
	float m_MinSummonDistance = 500.0f;

	UPROPERTY(EditAnywhere, BlueprintReadWrite)
	float m_MaxSummonDistance = 1000.0f;

	UPROPERTY(EditAnywhere, BlueprintReadWrite)
	float m_AngleInterval = 60.0f;

	UPROPERTY(EditAnywhere, BlueprintReadWrite)
	float m_DistanceInterval = 100.0f;

	UPROPERTY(EditAnywhere, BlueprintReadWrite)
	float m_SpawnAttemptRadius = 50.0f;

	UPROPERTY(EditAnywhere, BlueprintReadWrite)
	int m_CreatureSpawnAttempts = 10;

	//We can spawn minigolem rocks while the health is upper at x percentage
	default m_SpawnCreatureHealthPercentageUpper = 0.60f;

	//We can activate minigolem rocks when the health is below at x percentage
	default m_ActivateCreatureHealthPercentageBelow = 0.55f;

	default m_MaxSpawnCount = 5;

	default m_SummonedEffect = UGE_Summoned_IceGolem::StaticClass();
}
