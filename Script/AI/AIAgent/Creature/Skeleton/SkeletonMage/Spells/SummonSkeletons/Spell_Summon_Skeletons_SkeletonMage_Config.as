class USpell_Summon_Skeletons_SkeletonMage_Config : USpell_Summon_Skeletons_Config
{
    default m_CharactersToSpawn.Empty();
    default spawn_character.m_SpawnAIAgentDefinition = USpawnAIAgentDefinition_SkMageSummonedSkeleton::StaticClass();
    default spawn_character.m_Amount = 3;
    default spawn_character.m_DailyRoutine = UAIState_DailyRoutine_FollowOwner::StaticClass();
    default m_CharactersToSpawn.Add(spawn_character);
}