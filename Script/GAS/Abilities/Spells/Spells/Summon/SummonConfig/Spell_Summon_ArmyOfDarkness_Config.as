class USpell_Summon_ArmyOfDarkness_Config : USpell_Summon_Config_Base
{
    FAISpawnData spawn_character;
    //skeletons
    default spawn_character.m_SpawnAIAgentDefinition = USpawnAIAgentDefinition_Skeleton_Summon::StaticClass();
    default spawn_character.m_Amount = 6;
    default spawn_character.m_DailyRoutine = UAIState_DailyRoutine_FollowOwner::StaticClass();
    default m_CharactersToSpawn.Add(spawn_character);

    //warrior skeletons (stronger than skeletons)
    default spawn_character.m_SpawnAIAgentDefinition = USpawnAIAgentDefinition_SkeletonWarrior_Summon::StaticClass();
    default spawn_character.m_Amount = 3;
    default spawn_character.m_DailyRoutine = UAIState_DailyRoutine_FollowOwner::StaticClass();
    default m_CharactersToSpawn.Add(spawn_character);
}