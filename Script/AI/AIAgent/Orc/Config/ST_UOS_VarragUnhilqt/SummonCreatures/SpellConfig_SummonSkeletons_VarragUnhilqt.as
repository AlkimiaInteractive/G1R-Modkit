UCLASS()
class USpellConfig_SummonSkeletons_VarragUnhilqt : UGenericSummonCreatureByTime
{
    default m_SpawnPeriodTime = 5.f;
    default m_MaxSpawnCount = 5.f;

	//default m_CharacterToSpawn.m_SpawnAIAgentDefinition = USpawnAIAgentDefinition_GolemIce::StaticClass();
    default m_CharacterToSpawn.m_SpawnAIAgentDefinition = USpawnAIAgentDefinition_VUnhilqtSkeleton::StaticClass();
    //default m_CharacterToSpawn.m_DailyRoutine = UAIState_DailyRoutine_FollowOwner::StaticClass();

    default m_SummonedEffect = UGE_Summoned_Skeletons_Unhilqt::StaticClass();

}
