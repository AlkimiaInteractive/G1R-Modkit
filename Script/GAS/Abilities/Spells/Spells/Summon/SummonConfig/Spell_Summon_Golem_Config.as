class USpell_Summon_Golem_Config : USpell_Summon_Config_Base
{
    FAISpawnData spawn_character;
    default spawn_character.m_SpawnAIAgentDefinition = USpawnAIAgentDefinition_GolemStone_Summoned;
    default spawn_character.m_Amount = 1;
    default spawn_character.m_DailyRoutine = UAIState_DailyRoutine_FollowOwner::StaticClass();
    default m_CharactersToSpawn.Add(spawn_character);
}