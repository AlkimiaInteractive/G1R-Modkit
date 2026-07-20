UCLASS()
class USpellConfig_SummonFireDemons_VarragKasorg : UGenericSummonCreatureByHealth
{

	//default m_CharacterToSpawn.m_SpawnAIAgentDefinition = USpawnAIAgentDefinition_GolemIce::StaticClass();
    default m_CharacterToSpawn.m_SpawnAIAgentDefinition = USpawnAIAgentDefinition_DemonLesser_VKasorg::StaticClass();
    //default m_CharacterToSpawn.m_DailyRoutine = UAIState_DailyRoutine_FollowOwner::StaticClass();

	default m_ActivateCreatureHealthPercentageBelow = 0.6f;
	default m_SummonedEffect = UGE_Summoned_FireDemon_Kasorg::StaticClass();
}
