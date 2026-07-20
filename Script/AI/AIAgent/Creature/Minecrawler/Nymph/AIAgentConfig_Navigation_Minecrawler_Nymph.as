UCLASS()
class UAIAgentConfig_Navigation_Minecrawler_Nymph : UAIAgentConfig_Navigation_Creature
{
	default m_NavigationQueryFilter = UNavigationAreaFilter_Minecrawler::StaticClass();

    default m_PreferedNavigationType = ENavigationType::Walk;
    default m_NavDataTags.Add(ENavigationType::Walk, ENavigationAgent::Human_NavMesh);
}