UCLASS()
class UNavigationAreaFilter_Snapper : UNavigationAreaFilter_Creature
{
    default SetEnteringCostWater(100.0f);
}

UCLASS()
class UAIAgentConfig_Navigation_Snapper : UAIAgentConfig_Navigation_Creature
{
    default m_NavigationQueryFilter = UNavigationAreaFilter_Snapper::StaticClass();

    default m_PreferedNavigationType = ENavigationType::Walk;
    default m_NavDataTags.Add(ENavigationType::Walk, ENavigationAgent::Human_NavMesh);
    default m_NavDataTags.Add(ENavigationType::Swim, ENavigationAgent::Human_NavMesh);
}