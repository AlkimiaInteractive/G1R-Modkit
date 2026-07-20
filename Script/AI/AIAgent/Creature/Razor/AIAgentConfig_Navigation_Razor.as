UCLASS()
class UNavigationAreaFilter_Razor : UNavigationAreaFilter_Creature
{
    default SetEnteringCostWater(100.0f);
}

UCLASS()
class UAIAgentConfig_Navigation_Razor : UAIAgentConfig_Navigation_Creature
{
    default m_NavigationQueryFilter = UNavigationAreaFilter_Razor::StaticClass();

    default m_PreferedNavigationType = ENavigationType::Walk;
    default m_NavDataTags.Add(ENavigationType::Walk, ENavigationAgent::LargeCreatue_NavMesh);
    default m_NavDataTags.Add(ENavigationType::Swim, ENavigationAgent::LargeCreatue_NavMesh);
}