UCLASS()
class UAIAgentConfig_SH_Zombie_01 : UAIAgentConfig_Zombie
{
	default m_CharacterDefinition = UCharacterDefinition_SH_Zombie_01::StaticClass();
	default m_NavigationConfig = UAIAgentConfig_Navigation_Zombie::StaticClass();
}

UCLASS()
class UAIAgentConfig_Navigation_ZombieBoss : UAIAgentConfig_Navigation_Creature
{
    //default m_NavigationQueryFilter = UNavigationAreaFilter_Zombie::StaticClass();
	default m_NavigationQueryFilter = UNavigationAreaFilter_BossArena;
   
    default m_PreferedNavigationType = ENavigationType::Walk;
    default m_NavDataTags.Add(ENavigationType::Walk, ENavigationAgent::Human_NavMesh);
    default m_NavDataTags.Add(ENavigationType::Swim, ENavigationAgent::Human_NavMesh);
}