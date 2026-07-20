class USpell_Summon_Skeletons_Config : USpell_Summon_Config_Base
{
    FAISpawnData spawn_character;
    default spawn_character.m_SpawnAIAgentDefinition = USpawnAIAgentDefinition_Skeleton_Summon::StaticClass();
    default spawn_character.m_Amount = 2;
    default spawn_character.m_DailyRoutine = UAIState_DailyRoutine_FollowOwner::StaticClass();
    default m_CharactersToSpawn.Add(spawn_character);

    default spawn_character.m_SpawnAIAgentDefinition = USpawnAIAgentDefinition_SkeletonWarrior_Summon::StaticClass();
    default spawn_character.m_Amount = 1;
    default spawn_character.m_DailyRoutine = UAIState_DailyRoutine_FollowOwner::StaticClass();
    default m_CharactersToSpawn.Add(spawn_character);
}