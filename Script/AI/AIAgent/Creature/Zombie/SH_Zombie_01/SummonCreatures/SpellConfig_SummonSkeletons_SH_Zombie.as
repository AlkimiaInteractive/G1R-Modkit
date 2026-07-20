UCLASS()
class USpellConfig_SummonSkeletons_SH_Zombie : UGenericSummonCreatureByTime
{
    default m_SpawnPeriodTime = 7.f;
    default m_MaxSpawnCount = 4.f;

	//default m_CharacterToSpawn.m_SpawnAIAgentDefinition = USpawnAIAgentDefinition_GolemIce::StaticClass();
    default m_CharacterToSpawn.m_SpawnAIAgentDefinition = USpawnAIAgentDefinition_SH_Zombie_Skeleton::StaticClass();
    //default m_CharacterToSpawn.m_DailyRoutine = UAIState_DailyRoutine_FollowOwner::StaticClass();

    default m_SummonedEffect = UGE_Summoned_Skeletons_SH_Zombie::StaticClass();

}
