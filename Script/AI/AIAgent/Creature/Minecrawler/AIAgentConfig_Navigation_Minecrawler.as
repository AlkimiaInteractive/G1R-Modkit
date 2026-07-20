UCLASS()
class UNavigationAreaFilter_Minecrawler : UNavigationAreaFilter_Creature
{
    default ExcludeWaterArea();
}

UCLASS()
class UAIAgentConfig_Navigation_Minecrawler_Mid : UAIAgentConfig_Navigation_Creature
{
	default m_NavigationQueryFilter = UNavigationAreaFilter_Minecrawler::StaticClass();

    default m_PreferedNavigationType = ENavigationType::Walk;
    default m_NavDataTags.Add(ENavigationType::Walk, ENavigationAgent::Human_NavMesh);
}

UCLASS()
class UAIAgentConfig_Navigation_Minecrawler_Large : UAIAgentConfig_Navigation_Creature
{
	default m_NavigationQueryFilter = UNavigationAreaFilter_Minecrawler::StaticClass();

    default m_PreferedNavigationType = ENavigationType::Walk;
    default m_NavDataTags.Add(ENavigationType::Walk, ENavigationAgent::LargeCreatue_NavMesh);
}